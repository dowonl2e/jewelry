package com.jewelry.order.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.ObjectUtils;

import com.jewelry.file.domain.FileTO;
import com.jewelry.file.domain.FileVO;
import com.jewelry.file.mapper.FileMapper;
import com.jewelry.file.service.AmazonS3Service;
import com.jewelry.order.domain.OrderTO;
import com.jewelry.order.domain.OrderVO;
import com.jewelry.order.mapper.OrderMapper;
import com.jewelry.order.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private FileMapper fileMapper;
	
	@Autowired
	private AmazonS3Service amazonS3Service;

	@Transactional(readOnly = true)
	@Override
	public Map<String, Object> findAllOrder(OrderTO to) {
		Map<String, Object> response = new HashMap<>();

		to.setTotalcount(orderMapper.selectOrderListCount(to));
		response.put("list", orderMapper.selectOrderList(to));
		response.put("params", to);
		
		return response;
	}
	
	@Transactional
	@Override
	public String insertOrder(OrderTO to) {
		String result = "success";
		try {

			Long[] catalog_no_arr = to.getCatalog_no_arr();
			Integer[] quantity_arr = to.getQuantity_arr();
			if(catalog_no_arr != null && catalog_no_arr.length > 0 && quantity_arr != null && quantity_arr.length > 0) {
				FileTO fileto = amazonS3Service.upload(to.getOrderfile(), "order", "ORD");

				String[] serial_id_arr = to.getSerial_id_arr();
				String[] model_id_arr = to.getModel_id_arr();
				Long[] vender_no_arr = to.getVender_no_arr();
				String[] vender_nm_arr = to.getVender_nm_arr();
				String[] mateial_cd_arr = to.getMaterial_cd_arr();
				String[] color_cd_arr = to.getColor_cd_arr();
				String[] main_stone_type_arr = to.getMain_stone_type_arr();
				String[] sub_stone_type_arr = to.getSub_stone_type_arr();
				String[] size_arr = to.getSize_arr();
				String[] order_desc_arr = to.getOrder_desc_arr();
				
				for(int i = 0 ; i < catalog_no_arr.length ; i++) {
					Long catalogno = catalog_no_arr[i];
					if(catalogno != null && catalogno > 0) {
						to.setSerial_id(serial_id_arr[i]);
						to.setCatalog_no(catalogno);
						to.setModel_id(model_id_arr[i]);
						to.setVender_no(vender_no_arr[i]);
						to.setVender_nm(vender_nm_arr[i]);
						to.setMaterial_cd(mateial_cd_arr[i]);
						to.setColor_cd(color_cd_arr[i]);
						to.setMain_stone_type(main_stone_type_arr[i]);
						to.setSub_stone_type(sub_stone_type_arr[i]);
						to.setSize(size_arr[i]);
						to.setOrder_desc(order_desc_arr[i]);
						
						int quantity = quantity_arr[i];
						for(int j = 0 ; j < quantity ; j++){
							to.setQuantity(1);
							int res = orderMapper.insertOrder(to);
							if(res > 0) {
								Long orderno = to.getOrder_no();
								
								if(!ObjectUtils.isEmpty(fileto.getOrigin_nm())) {
									fileto.setInpt_id(to.getInpt_id());
									fileto.setRef_no(orderno);
									fileMapper.insertFile(fileto);
								}
							}
						}
					}
				}
				result = "success";
			}
			else {
				result = "fail";
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = "fail";
		}

		return result;
	}
	
	@Transactional(readOnly = true)
	@Override
	public OrderVO findOrderByNo(Long orderno) {
		OrderVO vo = orderMapper.selectOrder(orderno);
		
		if(vo != null) {
			vo.setFilelist(fileMapper.selectFileListByRefInfo(new FileTO(orderno, "ORD")));
		}
		
		return vo;
	}
	
	@Transactional
	@Override
	public String updateOrder(OrderTO to) {
		String result = "success";
		try {
			Long[] catalog_no_arr = to.getCatalog_no_arr();
			Integer[] quantity_arr = to.getQuantity_arr();
			if(catalog_no_arr != null && catalog_no_arr.length > 0 && quantity_arr != null && quantity_arr.length > 0) {
				FileTO fileto = amazonS3Service.upload(to.getOrderfile(), "order", "ORD");
				
				String[] serial_id_arr = to.getSerial_id_arr();
				String[] model_id_arr = to.getModel_id_arr();
				Long[] vender_no_arr = to.getVender_no_arr();
				String[] vender_nm_arr = to.getVender_nm_arr();
				String[] mateial_cd_arr = to.getMaterial_cd_arr();
				String[] color_cd_arr = to.getColor_cd_arr();
				String[] main_stone_type_arr = to.getMain_stone_type_arr();
				String[] sub_stone_type_arr = to.getSub_stone_type_arr();
				String[] size_arr = to.getSize_arr();
				String[] order_desc_arr = to.getOrder_desc_arr();
				
				//첫번째꺼 업데이트
				to.setSerial_id(serial_id_arr[0]);
				to.setCatalog_no(catalog_no_arr[0]);
				to.setModel_id(model_id_arr[0]);
				to.setVender_no(vender_no_arr[0]);
				to.setVender_nm(vender_nm_arr[0]);
				to.setMaterial_cd(mateial_cd_arr[0]);
				to.setColor_cd(color_cd_arr[0]);
				to.setQuantity(1);
				to.setMain_stone_type(main_stone_type_arr[0]);
				to.setSub_stone_type(sub_stone_type_arr[0]);
				to.setSize(size_arr[0]);
				to.setOrder_desc(order_desc_arr[0]);
				orderMapper.updateOrder(to);
				
				boolean multiInsertCheck = false;
				for(int idx = 1 ; idx < catalog_no_arr.length ; idx++) {
					if(catalog_no_arr[idx] != null && catalog_no_arr[idx] > 0) {
						multiInsertCheck = true;
						break;
					}
				}
				
				if(multiInsertCheck == true || quantity_arr[0] > 1) {
					if(ObjectUtils.isEmpty(fileto.getOrigin_nm())) {
						FileVO filevo = fileMapper.selectFileByRefInfo(new FileTO(to.getOrder_no(), "ORD", 1));
						if(filevo != null) {
							fileto.setRef_info(filevo.getRefinfo());
							fileto.setFile_path(filevo.getFilepath());
							fileto.setOrigin_nm(filevo.getOriginnm());
							fileto.setFile_nm(filevo.getFilenm());
							fileto.setFile_ext(filevo.getFileext());
							fileto.setFile_ord(filevo.getFileord());
							fileto.setFile_size(filevo.getFilesize());
						}
					}
					
					//나머지 주문 추가
					for(int i = 0 ; i < catalog_no_arr.length ; i++) {
						Long catalogno = catalog_no_arr[i];
						if(catalogno != null && catalogno > 0) {
							to.setSerial_id(serial_id_arr[i]);
							to.setCatalog_no(catalogno);
							to.setModel_id(model_id_arr[i]);
							to.setVender_no(vender_no_arr[i]);
							to.setVender_nm(vender_nm_arr[i]);
							to.setMaterial_cd(mateial_cd_arr[i]);
							to.setColor_cd(color_cd_arr[i]);
							to.setMain_stone_type(main_stone_type_arr[i]);
							to.setSub_stone_type(sub_stone_type_arr[i]);
							to.setSize(size_arr[i]);
							to.setOrder_desc(order_desc_arr[i]);
							
							int quantity = quantity_arr[i];
							if(i == 0) {
								quantity = quantity <= 1 ? 0 : (quantity-1);
							}
							
							for(int j = 0 ; j < quantity ; j++){
								to.setQuantity(1);
								int res = orderMapper.insertOrder(to);
								if(res > 0) {
									Long orderno = to.getOrder_no();
									
									if(!ObjectUtils.isEmpty(fileto.getOrigin_nm())) {
										fileto.setInpt_id(to.getInpt_id());
										fileto.setRef_no(orderno);
										fileMapper.insertFile(fileto);
									}
								}
							}
						}
					}
				}
				result = "success";
			}
			else {
				result = "fail";
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = "fail";
		}

		return result;
	}

	@Transactional
	@Override
	public String updateOrdersStep(OrderTO to) {
		String result = "success";
		try {
			Long[] order_no_arr = to.getOrder_no_arr();
			if(order_no_arr != null && order_no_arr.length > 0) {
				orderMapper.updateOrdersStatus(to);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = "fail";
		}

		return result;
	}

	@Transactional
	@Override
	public String updateOrdersDelete(OrderTO to) {
		String result = "success";
		try {
			Long[] order_no_arr = to.getOrder_no_arr();
			if(order_no_arr != null && order_no_arr.length > 0) {
				orderMapper.updateOrdersDelete(to);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = "fail";
		}

		return result;
	}

	@Override
	public String updateOrderToDelete(OrderTO to) {
		// TODO Auto-generated method stub
		return null;
	}
}
