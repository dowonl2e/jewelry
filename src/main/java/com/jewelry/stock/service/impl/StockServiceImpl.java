package com.jewelry.stock.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import com.jewelry.file.domain.FileTO;
import com.jewelry.file.domain.FileVO;
import com.jewelry.file.mapper.FileMapper;
import com.jewelry.file.service.AmazonS3Service;
import com.jewelry.order.domain.OrderTO;
import com.jewelry.order.mapper.OrderMapper;
import com.jewelry.stock.domain.StockTO;
import com.jewelry.stock.domain.StockVO;
import com.jewelry.stock.mapper.StockMapper;
import com.jewelry.stock.service.StockService;
import com.jewelry.util.Utils;
import com.jewelry.vender.domain.VenderVO;
import com.jewelry.vender.mapper.VenderMapper;

@Service
public class StockServiceImpl implements StockService {
	
	@Autowired
	private StockMapper stockMapper;

	@Autowired
	private AmazonS3Service amazonS3Service;
	
	@Autowired
	private FileMapper fileMapper;

	@Autowired
	private VenderMapper venderMapper;
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Transactional(readOnly = true)
	@Override
	public Map<String, Object> findAllStock(StockTO to) {
		Map<String, Object> response = new HashMap<>();

		to.setTotalcount(stockMapper.selectStockListCount(to));
		response.put("list", stockMapper.selectStockList(to));
		response.put("params", to);
		
		return response;
	}

	@Transactional(readOnly = true)
	@Override
	public List<StockVO> findAllPrevStock() {
		return stockMapper.selectPrevStockList();
	}

	@Transactional(readOnly = true)
	@Override
	public StockVO findStockByNo(Long stockno) {
		StockVO vo = stockMapper.selectStock(stockno);
		if(vo != null) 
			vo.setFilelist(fileMapper.selectFileListByRefInfo(new FileTO(stockno, "STOCK")));
		return vo;
	}
	
	@Transactional(readOnly = true)
	@Override
	public StockVO findStockCustomerByNo(Long stockno) {
		return stockMapper.selectStockCustomer(stockno);
	}

	@Transactional
	@Override
	public String insertStock(StockTO to) {
		String result = "fail";
		try {
			int rescnt = 0;
			Long[] catalog_no_arr = to.getCatalog_no_arr();
			Integer[] quantity_arr = to.getQuantity_arr();
			if(catalog_no_arr != null && catalog_no_arr.length > 0 && quantity_arr != null && quantity_arr.length > 0) {
				FileTO fileto = amazonS3Service.upload(to.getStockfile(), "stock", "STOCK");
				
				String[] model_id_arr = to.getModel_id_arr();
				Long[] vender_no_arr = to.getVender_no_arr();
				String[] vender_nm_arr = to.getVender_nm_arr();
				String[] mateial_cd_arr = to.getMaterial_cd_arr();
				String[] color_cd_arr = to.getColor_cd_arr();
				String[] main_stone_type_arr = to.getMain_stone_type_arr();
				String[] sub_stone_type_arr = to.getSub_stone_type_arr();
				String[] size_arr = to.getSize_arr();
				String[] stock_desc_arr = to.getStock_desc_arr();

				Double[] per_weight_gram_arr = to.getPer_weight_gram_arr();
				Integer[] per_price_basic_arr = to.getPer_price_basic_arr();
				Integer[] per_price_add_arr = to.getPer_price_add_arr();
				Integer[] per_price_main_arr = to.getPer_price_main_arr();
				Integer[] per_price_sub_arr = to.getPer_price_sub_arr();
				Integer[] multiple_cnt_arr = to.getMultiple_cnt_arr();

				for(int i = 0 ; i < catalog_no_arr.length ; i++) {
					Long catalogno = catalog_no_arr[i];
					if(catalogno != null && catalogno > 0) {

						to.setCatalog_no(catalogno);
						to.setModel_id(model_id_arr[i]);
						to.setVender_no(vender_no_arr[i]);
						to.setVender_nm(vender_nm_arr[i]);
						to.setMaterial_cd(mateial_cd_arr[i]);
						to.setColor_cd(color_cd_arr[i]);
						to.setMain_stone_type(main_stone_type_arr[i]);
						to.setSub_stone_type(sub_stone_type_arr[i]);
						to.setSize(size_arr[i]);
						to.setStock_desc(stock_desc_arr[i]);
						to.setQuantity(1);
						to.setPer_weight_gram(per_weight_gram_arr[i]);
						to.setPer_price_basic(per_price_basic_arr[i]);
						to.setPer_price_add(per_price_add_arr[i]);
						to.setPer_price_main(per_price_main_arr[i]);
						to.setPer_price_sub(per_price_sub_arr[i]);
						to.setMultiple_cnt(multiple_cnt_arr[i]);
						
						int quantity = quantity_arr[i] == null ? 0 : quantity_arr[i];
						for(int j = 0 ; j < quantity ; j++){
							int res = stockMapper.insertStock(to);
							if(res > 0) {
								if(!ObjectUtils.isEmpty(fileto.getOrigin_nm())) {
									fileto.setInpt_id(to.getInpt_id());
									fileto.setRef_no(to.getStock_no());
									fileMapper.insertFile(fileto);
								}
							}
							rescnt += res;
						}
					}
				}
			}
			result = rescnt > 0 ? "success" : "fail";
		}
		catch(Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = "fail";
		}
		return result;
	}

	@Transactional
	@Override
	public String updateStock(StockTO to) {
		String result = "success";
		try {
			Long[] catalog_no_arr = to.getCatalog_no_arr();
			Integer[] quantity_arr = to.getQuantity_arr();
			if(catalog_no_arr != null && catalog_no_arr.length > 0 && quantity_arr != null && quantity_arr.length > 0) {
				FileTO fileto = amazonS3Service.upload(to.getStockfile(), "stock", "STOCK");
				
				String[] model_id_arr = to.getModel_id_arr();
				Long[] vender_no_arr = to.getVender_no_arr();
				String[] vender_nm_arr = to.getVender_nm_arr();
				String[] mateial_cd_arr = to.getMaterial_cd_arr();
				String[] color_cd_arr = to.getColor_cd_arr();
				String[] main_stone_type_arr = to.getMain_stone_type_arr();
				String[] sub_stone_type_arr = to.getSub_stone_type_arr();
				String[] size_arr = to.getSize_arr();
				String[] stock_desc_arr = to.getStock_desc_arr();

				Double[] per_weight_gram_arr = to.getPer_weight_gram_arr();
				Integer[] per_price_basic_arr = to.getPer_price_basic_arr();
				Integer[] per_price_add_arr = to.getPer_price_add_arr();
				Integer[] per_price_main_arr = to.getPer_price_main_arr();
				Integer[] per_price_sub_arr = to.getPer_price_sub_arr();
				Integer[] multiple_cnt_arr = to.getMultiple_cnt_arr();


				//첫번째꺼 업데이트
				to.setCatalog_no(catalog_no_arr[0]);
				to.setModel_id(model_id_arr[0]);
				to.setVender_no(vender_no_arr[0]);
				to.setVender_nm(vender_nm_arr[0]);
				to.setMaterial_cd(mateial_cd_arr[0]);
				to.setColor_cd(color_cd_arr[0]);
				to.setMain_stone_type(main_stone_type_arr[0]);
				to.setSub_stone_type(sub_stone_type_arr[0]);
				to.setSize(size_arr[0]);
				to.setStock_desc(stock_desc_arr[0]);
				to.setQuantity(1);
				to.setPer_weight_gram(per_weight_gram_arr[0]);
				to.setPer_price_basic(per_price_basic_arr[0]);
				to.setPer_price_add(per_price_add_arr[0]);
				to.setPer_price_main(per_price_main_arr[0]);
				to.setPer_price_sub(per_price_sub_arr[0]);
				to.setMultiple_cnt(multiple_cnt_arr[0]);
				stockMapper.updateStock(to);
				
				if(!ObjectUtils.isEmpty(fileto.getOrigin_nm())) {
					fileto.setUpdt_id(to.getUpdt_id());
					fileto.setRef_no(to.getStock_no());
					fileMapper.updateFileToDeleteWithRef(fileto);
					
					fileto.setInpt_id(to.getInpt_id());
					fileMapper.insertFile(fileto);
				}
				
				boolean multiInsertCheck = false;
				for(int idx = 1 ; idx < catalog_no_arr.length ; idx++) {
					if(catalog_no_arr[idx] != null && catalog_no_arr[idx] > 0) {
						multiInsertCheck = true;
						break;
					}
				}

				if(multiInsertCheck == true || quantity_arr[0] > 1) {
					if(ObjectUtils.isEmpty(fileto.getOrigin_nm())) {
						FileVO filevo = fileMapper.selectFileByRefInfo(new FileTO(to.getStock_no(), "STOCK", 1));
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
					
					//나머지 재고 추가
					for(int i = 0 ; i < catalog_no_arr.length ; i++) {
						Long catalogno = catalog_no_arr[i];
						if(catalogno != null && catalogno > 0) {
						
							to.setCatalog_no(catalogno);
							to.setModel_id(model_id_arr[i]);
							to.setVender_no(vender_no_arr[i]);
							to.setVender_nm(vender_nm_arr[i]);
							to.setMaterial_cd(mateial_cd_arr[i]);
							to.setColor_cd(color_cd_arr[i]);
							to.setMain_stone_type(main_stone_type_arr[i]);
							to.setSub_stone_type(sub_stone_type_arr[i]);
							to.setSize(size_arr[i]);
							to.setStock_desc(stock_desc_arr[i]);
							to.setQuantity(1);
							to.setPer_weight_gram(per_weight_gram_arr[i]);
							to.setPer_price_basic(per_price_basic_arr[i]);
							to.setPer_price_add(per_price_add_arr[i]);
							to.setPer_price_main(per_price_main_arr[i]);
							to.setPer_price_sub(per_price_sub_arr[i]);
							to.setMultiple_cnt(multiple_cnt_arr[i]);
							
							int quantity = quantity_arr[i] == null ? 0 : quantity_arr[i];
							if(i == 0)
								quantity = quantity <= 1 ? 0 : (quantity-1);
							
							for(int j = 0 ; j < quantity ; j++){
								int res = stockMapper.insertStock(to);
								if(res > 0) {
									if(!ObjectUtils.isEmpty(fileto.getOrigin_nm())) {
										fileto.setInpt_id(to.getInpt_id());
										fileto.setRef_no(to.getStock_no());
										fileMapper.insertFile(fileto);
									}
								}
							}
						}
					}
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = "fail";
		}
		return result;
	}

	@Transactional
	@Override
	public String updateStockToDelete(StockTO to) {
		int res = 0;
		try {
			res = stockMapper.updateStockToDelete(to);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return res > 0 ? "success" : "fail";
	}

	@Transactional
	@Override
	public String updateStocksToDelete(StockTO to) {
		String result = "success";
		try {
			Long[] stock_no_arr = to.getStock_no_arr();
			if(stock_no_arr != null && stock_no_arr.length > 0) {
				int res = stockMapper.updateStocksToDelete(to);
				result = res > 0 ? "success" : "fail";
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
	public String updateStocksToSale(StockTO to) {
		String result = "success";
		try {
			Long[] stock_no_arr = to.getStock_no_arr();
			if(stock_no_arr != null && stock_no_arr.length > 0) {
				int res = stockMapper.updateStocksToSale(to);
				result = res > 0 ? "success" : "fail";
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
	public String updateStocksRegDate(StockTO to) {
		String result = "success";
		try {
			Long[] stock_no_arr = to.getStock_no_arr();
			if(stock_no_arr != null && stock_no_arr.length > 0) {
				int res = stockMapper.updateStocksRegDate(to);
				result = res > 0 ? "success" : "fail";
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
	public String updateStocksType(StockTO to) {
		String result = "success";
		try {
			Long[] stock_no_arr = to.getStock_no_arr();
			if(stock_no_arr != null && stock_no_arr.length > 0) {
				int res = stockMapper.updateStocksType(to);
				result = res > 0 ? "success" : "fail";
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
	public String updateStocksVender(StockTO to) {
		String result = "success";
		try {
			Long[] stock_no_arr = to.getStock_no_arr();
			if(stock_no_arr != null && stock_no_arr.length > 0) {
				VenderVO vendervo = venderMapper.selectVender(to.getVender_no());
				if(vendervo != null)
					to.setVender_nm(vendervo.getVendernm());
				
				int res = stockMapper.updateStocksVender(to);
				result = res > 0 ? "success" : "fail";
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
	public Map<String, Object> findAllAccumulationStock(StockTO to) {
		Map<String, Object> response = new HashMap<>();

		to.setTotalcount(stockMapper.selectAccumulationStockCount(to));
		response.put("list", stockMapper.selectAccumulationStock(to));
		response.put("params", to);
		
		return response;
	}

	@Transactional
	@Override
	public String insertCustomerOrder(StockTO to) {
		String result = "success";
		try {
			Long[] stock_no_arr = to.getStock_no_arr();
			if(stock_no_arr != null && stock_no_arr.length > 0) {
				int res = stockMapper.updateStocksOrder(to);
				if(res > 0) {
					List<StockVO> stockList = stockMapper.selectStockListByNos(to);
					if(stockList != null && stockList.size() > 0) {
						OrderTO orderto = new OrderTO();
						orderto.setInpt_id(to.getInpt_id());
						orderto.setOrder_type("CUSTOMER");
						orderto.setOrder_step("B");
						for(StockVO stockvo : stockList) {
							orderto.setStock_no(stockvo.getStockno());
							orderto.setStore_cd(stockvo.getStorecd());
							orderto.setReceipt_dt(Utils.getTodayDateFormat("yyyy-MM-dd"));
							orderto.setExpected_ord_dt(Utils.getTodayDateFormat("yyyy-MM-dd"));
							orderto.setCustomer_no(to.getCustomer_no());
							orderto.setCustomer_nm(to.getCustomer_nm());
							orderto.setCustomer_cel(to.getCustomer_cel());
							orderto.setCatalog_no(stockvo.getCatalogno());
							orderto.setModel_id(stockvo.getModelid());
							orderto.setVender_no(stockvo.getVenderno());
							orderto.setVender_nm(stockvo.getVendernm());
							orderto.setMaterial_cd(stockvo.getMaterialcd());
							orderto.setColor_cd(stockvo.getColorcd());
							orderto.setQuantity(1);
							orderto.setMain_stone_type(stockvo.getMainstonetype());
							orderto.setSub_stone_type(stockvo.getSubstonetype());
							orderto.setSize(stockvo.getSize());
							orderto.setOrder_desc(stockvo.getStockdesc());
							int orderRes = orderMapper.insertOrder(orderto);
							if(orderRes > 0) {
								Long orderno = orderto.getOrder_no();
								if(orderno != null && orderno > 0) {
									FileVO filevo = fileMapper.selectFileByRefInfo(new FileTO(stockvo.getStockno(), "STOCK", 1));
									if(filevo != null) {
										FileTO fileto = new FileTO();
										fileto.setInpt_id(to.getInpt_id());
										fileto.setRef_no(orderno);
										fileto.setRef_info("ORDER");
										fileto.setFile_path(filevo.getFilepath());
										fileto.setFile_nm(filevo.getFilenm());
										fileto.setOrigin_nm(filevo.getOriginnm());
										fileto.setFile_ord(1);
										fileto.setFile_ext(filevo.getFileext());
										fileto.setFile_size(filevo.getFilesize());
										fileto.setVersion_id(filevo.getVersionid());
										fileMapper.insertFile(fileto);
									}
								}
							}
						}
					}
				}
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
	public String insertOrdersToStock(StockTO to, OrderTO orderto) {
		String result = "fail";
		try {
			int rescnt = 0;

			Long[] catalog_no_arr = to.getCatalog_no_arr();
			Integer[] quantity_arr = to.getQuantity_arr();
			if(catalog_no_arr != null && catalog_no_arr.length > 0 && quantity_arr != null && quantity_arr.length > 0) {
				FileTO fileto = amazonS3Service.upload(to.getStockfile(), "stock", "STOCK");
				
				
				String[] model_id_arr = to.getModel_id_arr();
				Long[] vender_no_arr = to.getVender_no_arr();
				String[] vender_nm_arr = to.getVender_nm_arr();
				String[] mateial_cd_arr = to.getMaterial_cd_arr();
				String[] color_cd_arr = to.getColor_cd_arr();
				String[] main_stone_type_arr = to.getMain_stone_type_arr();
				String[] sub_stone_type_arr = to.getSub_stone_type_arr();
				String[] size_arr = to.getSize_arr();
				String[] stock_desc_arr = to.getStock_desc_arr();

				Double[] per_weight_gram_arr = to.getPer_weight_gram_arr();
				Integer[] per_price_basic_arr = to.getPer_price_basic_arr();
				Integer[] per_price_add_arr = to.getPer_price_add_arr();
				Integer[] per_price_main_arr = to.getPer_price_main_arr();
				Integer[] per_price_sub_arr = to.getPer_price_sub_arr();
				Integer[] multiple_cnt_arr = to.getMultiple_cnt_arr();

				to.setStock_type_cd("OC03");
				for(int i = 0 ; i < catalog_no_arr.length ; i++) {
					Long catalogno = catalog_no_arr[i];
					if(catalogno != null && catalogno > 0) {

						to.setCatalog_no(catalogno);
						to.setModel_id(model_id_arr[i]);
						to.setVender_no(vender_no_arr[i]);
						to.setVender_nm(vender_nm_arr[i]);
						to.setMaterial_cd(mateial_cd_arr[i]);
						to.setColor_cd(color_cd_arr[i]);
						to.setMain_stone_type(main_stone_type_arr[i]);
						to.setSub_stone_type(sub_stone_type_arr[i]);
						to.setSize(size_arr[i]);
						to.setStock_desc(stock_desc_arr[i]);
						to.setQuantity(1);
						to.setPer_weight_gram(per_weight_gram_arr[i]);
						to.setPer_price_basic(per_price_basic_arr[i]);
						to.setPer_price_add(per_price_add_arr[i]);
						to.setPer_price_main(per_price_main_arr[i]);
						to.setPer_price_sub(per_price_sub_arr[i]);
						to.setMultiple_cnt(multiple_cnt_arr[i]);
						
						int quantity = quantity_arr[i] == null ? 0 : quantity_arr[i];
						for(int j = 0 ; j < quantity ; j++){
							int res = stockMapper.insertStock(to);
							if(res > 0) {
								if(!ObjectUtils.isEmpty(fileto.getOrigin_nm())) {
									fileto.setInpt_id(to.getInpt_id());
									fileto.setRef_no(to.getStock_no());
									fileMapper.insertFile(fileto);
								}
							}
							rescnt += res;
						}
					}
				}

				orderto.setOrder_step("C");
				orderMapper.updateOrdersStatus(orderto);
			}
			result = rescnt > 0 ? "success" : "fail";
		}
		catch(Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = "fail";
		}
		return result;
	}

	@Override
	public Map<String, Object> isSameCustomer(String stocksno) {
		Map<String, Object> map = new HashMap<>();
		if(ObjectUtils.isEmpty(stocksno)) {
			map.put("result", "fail");
			map.put("message", "판매할 재고를 선택해주세요.");
		}
		else {
			Long[] stockNoArr = Arrays.stream(stocksno.split(","))
						                .map(String::trim)
						                .map(Long::valueOf)
						                .toArray(Long[]::new);
			
			StockTO to = new StockTO();
			to.setStock_no_arr(stockNoArr);
			List<StockVO> list = stockMapper.selectStockListByStockNos(to);
			if(CollectionUtils.isEmpty(list)) {
				map.put("result", "fail");
				map.put("message", "재고내역이 없습니다.");
			}
			else {
				int i = 0, orderCnt = 0, stockCnt = 0;
				
				Long customerNo = list.get(0).getCustomerno() == null ? (long)0 : list.get(0).getCustomerno();
				String customerNm = ObjectUtils.isEmpty(list.get(0).getCustomernm()) ? "" : list.get(0).getCustomernm();
				
				boolean isDupType = false, isNotSameCustomer = false;
				for(StockVO tempvo : list) {
					if(!ObjectUtils.isEmpty(tempvo.getStocktypecd())) {
						if(ObjectUtils.nullSafeEquals(tempvo.getStocktypecd(), "OC03"))
							orderCnt++;
						if(ObjectUtils.nullSafeEquals(tempvo.getStocktypecd(), "OC01"))
							stockCnt++;
						
						if(orderCnt > 0 && stockCnt > 0) {
							isDupType = true;
							break;
						}
					}
					if(i > 0 && list.get(i).getCustomerno() != null
							&& list.get(i).getCustomerno() > 0
							&& customerNo != list.get(i).getCustomerno()) {
						isNotSameCustomer = true;
						break;
					}
					i++;
				}
				if(isDupType) {
					map.put("result", "fail");
					map.put("message", "주문재고와 일반재고는 별도로 판매 가능합니다.");
				}
				else {
					if(isNotSameCustomer) {
						map.put("result", "fail");
						map.put("message", "주문재고는 동일 고객의 재고만 판매 가능합니다.");
					}
					else {
						map.put("result", "success");
						map.put("customerno", customerNo);
						map.put("customernm", customerNm);
					}
				}
			}
		}
		return map;
	}
}