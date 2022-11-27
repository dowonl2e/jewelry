package com.jewelry.sale.service;

import java.util.Map;

import com.jewelry.sale.domain.SaleTO;

public interface SaleService {

	Map<String, Object> findAllSale(SaleTO to);
	
}
