package com.jewelry.stock.service;

import java.util.List;
import java.util.Map;

import com.jewelry.order.domain.OrderTO;
import com.jewelry.stock.domain.StockTO;
import com.jewelry.stock.domain.StockVO;

public interface StockService {
	
	Map<String, Object> findAllStock(StockTO to);
	
	List<StockVO> findAllPrevStock();
	
	StockVO findStockByNo(Long stockno);
	
	StockVO findStockCustomerByNo(Long stockno);
	
	String insertStock(StockTO to);
	
	String updateStock(StockTO to);
	
	String updateStockToDelete(StockTO to);
	
	String updateStocksToDelete(StockTO to);
	
	String updateStocksToSale(StockTO to);
	
	String updateStocksRegDate(StockTO to);
	
	String updateStocksType(StockTO to);
	
	String updateStocksVender(StockTO to);
	
	Map<String, Object> findAllAccumulationStock(StockTO to);

	String insertCustomerOrder(StockTO to);
	
	String insertOrdersToStock(StockTO to, OrderTO orderto);
	
	Map<String, Object> isSameCustomer(String stocksno);
}
