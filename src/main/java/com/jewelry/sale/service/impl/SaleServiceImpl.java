package com.jewelry.sale.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.jewelry.sale.domain.SaleTO;
import com.jewelry.sale.mapper.SaleMapper;
import com.jewelry.sale.service.SaleService;

@Service
public class SaleServiceImpl implements SaleService {

	@Autowired
	private SaleMapper saleMapper;

	@Transactional(readOnly = true)
	@Override
	public Map<String, Object> findAllSale(SaleTO to) {
		Map<String, Object> response = new HashMap<>();
		to.setTotalcount(saleMapper.selectSaleListCount(to));
		response.put("list", saleMapper.selectSaleList(to));
		response.put("params", to);
		
		return response;
	}

	@Transactional
	@Override
	public String updateSalesToDelete(SaleTO to) {
		String result = "fail";
		try {
			
		}
		catch(Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = "fail";
		}
		return result;
	}
	
	
}
