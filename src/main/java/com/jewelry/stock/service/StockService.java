package com.jewelry.stock.service;

import java.util.List;
import java.util.Map;

import com.jewelry.stock.domain.StockTO;
import com.jewelry.stock.domain.StockVO;

public interface StockService {
	
	Map<String, Object> findAllStock(StockTO to);
	
	List<StockVO> findAllPrevStock();
	
	StockVO findStockByNo(Long stockno);
	
	String insertStock(StockTO to);
	
	String updateStock(StockTO to);
	
	String updateStockToDelete(StockTO to);
}
