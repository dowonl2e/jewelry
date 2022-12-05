package com.jewelry.cash.service;

import java.util.Map;

import com.jewelry.cash.domain.CashTO;
import com.jewelry.cash.domain.CashVO;

public interface CashService {

	Map<String, Object> findAllCash(CashTO to);
	
	CashVO findCash(Long cashno);
	
	String insertCash(CashTO to);
	
	String updateCash(CashTO to);
	
	String updateCashesToDelete(CashTO to);

}
