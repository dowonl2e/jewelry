package com.jewelry.main.service;

import java.util.Map;

import com.jewelry.main.domain.MainTO;

public interface MainService {

	Map<String, Object> findAllStats(MainTO to);
	
	Map<String, Object> findMonthlySalePrice(MainTO to);
	
	Map<String, Object> findMaterialOrders(MainTO to);
	
	Map<String, Object> findMaterialStocks(MainTO to);
}

