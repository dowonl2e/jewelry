package com.jewelry.stock.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.ObjectUtils;

import com.jewelry.file.domain.FileTO;
import com.jewelry.file.mapper.FileMapper;
import com.jewelry.file.service.AmazonS3Service;
import com.jewelry.stock.domain.StockTO;
import com.jewelry.stock.domain.StockVO;
import com.jewelry.stock.mapper.StockMapper;
import com.jewelry.stock.service.StockService;

@Service
public class StockServiceImpl implements StockService {
	
	@Autowired
	private StockMapper stockMapper;

	@Autowired
	private AmazonS3Service amazonS3Service;
	
	@Autowired
	private FileMapper fileMapper;

	
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
		return stockMapper.selectStock(stockno);
	}

	@Transactional
	@Override
	public String insertStock(StockTO to) {
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
				Integer[] per_price_gold_real_arr = to.getPer_price_gold_real_arr();
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
						to.setPer_price_gold_real(per_price_gold_real_arr[i]);
						to.setMultiple_cnt(multiple_cnt_arr[i]);
						
						int quantity = quantity_arr[i];
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
			int res = stockMapper.updateStock(to);
			if(res > 0) {

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
	
}
