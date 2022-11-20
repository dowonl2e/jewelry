package com.jewelry.stock.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.jewelry.stock.domain.StockTO;
import com.jewelry.stock.domain.StockVO;
import com.jewelry.stock.mapper.StockMapper;
import com.jewelry.stock.service.StockService;

@Service
public class StockServiceImpl implements StockService {
	
	@Autowired
	private StockMapper stockMapper;

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
	public StockVO findStockByNo(Long stockno) {
		return stockMapper.selectStock(stockno);
	}

	@Transactional
	@Override
	public String insertStock(StockTO to) {
		String result = "success";
		try {
			int res = stockMapper.insertStock(to);
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
