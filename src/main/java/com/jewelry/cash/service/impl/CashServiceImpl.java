package com.jewelry.cash.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;

import com.jewelry.cash.domain.CashTO;
import com.jewelry.cash.domain.CashVO;
import com.jewelry.cash.mapper.CashMapper;
import com.jewelry.cash.service.CashService;
import com.jewelry.util.Utils;

@Service
public class CashServiceImpl implements CashService {

	@Autowired
	private CashMapper cashMapper;

	@Transactional(readOnly = true)
	@Override
	public Map<String, Object> findAllCash(CashTO to) {
		Map<String, Object> response = new HashMap<>();

		to.setTotalcount(cashMapper.selectCashListCount(to));
		response.put("list", cashMapper.selectCashList(to));
		
		to.setToday(ObjectUtils.isEmpty(to.getSearcheddt()) ? Utils.getTodayDateFormat("yyyy-MM-dd") : to.getSearcheddt());
		to.setYesterday(Utils.getDateCalDateFormat(to.getToday(), "yyyy-MM-dd", -1));
		to.setBefYesterday(Utils.getDateCalDateFormat(to.getYesterday(), "yyyy-MM-dd", -1));
		
		List<CashVO> statsList = cashMapper.selectCashStatsList(to);
		statsList = statsList == null ? new ArrayList<>() : statsList;
		
		List<CashVO> matStatsList = cashMapper.selectCashMaterialStatsList(to);
		if(!CollectionUtils.isEmpty(matStatsList))
			for(CashVO item : matStatsList) statsList.add(item);
		
		response.put("statslist", statsList);
		response.put("params", to);
		response.put("today", to.getToday());
		response.put("yesterday", to.getYesterday());
		
		return response;
	}

	@Transactional(readOnly = true)
	@Override
	public CashVO findCash(Long cashno) {
		return cashMapper.selectCash(cashno);
	}

	@Override
	public String insertCash(CashTO to) {
		String result = "fail";
		try {
			int resultCnt = 0;
			String[] cash_type_cd_arr = to.getCash_type_cd_arr();
			if(cash_type_cd_arr != null && cash_type_cd_arr.length > 0) {
				String[] cash_type_cd2_arr = to.getCash_type_cd2_arr();
				String[] bankbook_cd_arr = to.getBankbook_cd_arr();
				String[] vender_nm_arr = to.getVender_nm_arr();
				String[] history_desc_arr = to.getHistory_desc_arr();
				String[] material_cd_arr = to.getMaterial_cd_arr();
				Double[] weight_gram_arr = to.getWeight_gram_arr();
				Integer[] quantity_arr = to.getQuantity_arr();
				Integer[] unit_price_arr = to.getUnit_price_arr();
				
				for(int i = 0 ; i < cash_type_cd_arr.length ; i++) {
					if(!ObjectUtils.isEmpty(cash_type_cd_arr[i])) {
						to.setCash_type_cd(cash_type_cd_arr[i]);
						to.setCash_type_cd2(cash_type_cd2_arr[i]);
						to.setBankbook_cd(bankbook_cd_arr[i]);
						to.setVender_nm(vender_nm_arr[i]);
						to.setHistory_desc(history_desc_arr[i]);
						to.setMaterial_cd(material_cd_arr[i]);
						to.setWeight_gram(weight_gram_arr[i]);
						to.setUnit_price(unit_price_arr[i]);
						to.setQuantity(1);
						
						int quantity = quantity_arr[i] == null ? 0 : quantity_arr[i];
						for(int j = 0 ; j < quantity ; j++)
							resultCnt += cashMapper.insertCash(to);
					}
				}
			}
			result = resultCnt > 0 ? "success" : "fail";
		}
		catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = "fail";
		}
		return result;
	}
	
	@Override
	public String updateCash(CashTO to) {
		String result = "fail";
		try {
			int resultCnt = 0;
			String[] cash_type_cd_arr = to.getCash_type_cd_arr();
			if(cash_type_cd_arr != null && cash_type_cd_arr.length > 0) {
				String[] cash_type_cd2_arr = to.getCash_type_cd2_arr();
				String[] bankbook_cd_arr = to.getBankbook_cd_arr();
				String[] vender_nm_arr = to.getVender_nm_arr();
				String[] history_desc_arr = to.getHistory_desc_arr();
				String[] material_cd_arr = to.getMaterial_cd_arr();
				Double[] weight_gram_arr = to.getWeight_gram_arr();
				Integer[] quantity_arr = to.getQuantity_arr();
				Integer[] unit_price_arr = to.getUnit_price_arr();
				
				to.setCash_type_cd(cash_type_cd_arr[0]);
				to.setCash_type_cd2(cash_type_cd2_arr[0]);
				to.setBankbook_cd(bankbook_cd_arr[0]);
				to.setVender_nm(vender_nm_arr[0]);
				to.setHistory_desc(history_desc_arr[0]);
				to.setMaterial_cd(material_cd_arr[0]);
				to.setWeight_gram(weight_gram_arr[0]);
				to.setUnit_price(unit_price_arr[0]);
				to.setQuantity(1);
				resultCnt += cashMapper.updateCash(to);
				
				for(int i = 0 ; i < cash_type_cd_arr.length ; i++) {
					if(!ObjectUtils.isEmpty(cash_type_cd_arr[i])) {
						to.setCash_type_cd(cash_type_cd_arr[i]);
						to.setCash_type_cd2(cash_type_cd2_arr[i]);
						to.setBankbook_cd(bankbook_cd_arr[i]);
						to.setVender_nm(vender_nm_arr[i]);
						to.setHistory_desc(history_desc_arr[i]);
						to.setMaterial_cd(material_cd_arr[i]);
						to.setWeight_gram(weight_gram_arr[i]);
						to.setUnit_price(unit_price_arr[i]);
						to.setQuantity(1);
						
						
						boolean multiInsertCheck = false;
						for(int idx = 1 ; idx < cash_type_cd_arr.length ; idx++) {
							if(cash_type_cd_arr[idx] != null) {
								multiInsertCheck = true;
								break;
							}
						}
						
						if((quantity_arr[0] != null && quantity_arr[0] > 1) || multiInsertCheck == true) {
							int quantity = quantity_arr[i] == null ? 0 : quantity_arr[i];
							if(i == 0)
								quantity = quantity <= 1 ? 0 : (quantity-1);
							
							for(int j = 0 ; j < quantity ; j++)
								resultCnt += cashMapper.insertCash(to);
						}
					}
				}
			}
			
			result = resultCnt > 0 ? "success" : "fail";
		}
		catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = "fail";
		}
		return result;
	}

	@Override
	public String updateCashesToDelete(CashTO to) {
		String result = "fail";
		try {
			if(to.getCash_no_arr() != null && to.getCash_no_arr().length > 0)
				result = cashMapper.updateCashesToDelete(to) > 0 ? "success" : "fail";
		}
		catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = "fail";
		}
		return result;
	}
}
