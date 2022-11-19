package com.jewelry.order.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.ObjectUtils;

import com.jewelry.catalog.domain.CatalogVO;
import com.jewelry.file.domain.FileTO;
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

		int totalcount = orderMapper.selectOrderListCount(to);
		List<OrderVO> list = orderMapper.selectOrderList(to);

		to.setTotalcount(totalcount);
		
		response.put("params", to);
		response.put("list", list);
		
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
			vo.setFilelist(fileMapper.selectFileListByRefInfo(new FileTO(orderno, "CAT")));
		}
		
		return vo;
	}
	
	@Transactional
	@Override
	public String updateOrder(OrderTO to) {
		String result = "success";
		try {
			
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
