package com.jewelry.cash.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.jewelry.cash.domain.CashTO;
import com.jewelry.cash.domain.CashVO;
import com.jewelry.cash.mapper.CashMapper;
import com.jewelry.cash.service.CashService;

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
		response.put("params", to);
		
		return response;
	}

	@Transactional(readOnly = true)
	@Override
	public CashVO findCash(Long cashno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insertCash(CashTO to) {
		String result = "fail";
		try {
			
		}
		catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = "fail";
		}
		return result;
	}
}
