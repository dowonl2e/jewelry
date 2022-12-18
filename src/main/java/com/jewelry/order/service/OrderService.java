package com.jewelry.order.service;

import java.util.Map;

import com.jewelry.order.domain.OrderTO;
import com.jewelry.order.domain.OrderVO;

public interface OrderService {
	
	Map<String, Object> findAllOrder(OrderTO to);
	
	String insertOrder(OrderTO to);
	
	OrderVO findOrderByNo(Long orderno);
	
	String updateOrder(OrderTO to);
	
	String updateOrdersStep(OrderTO to);
	
	String updateOrdersToDelete(OrderTO to);

	String updateOrdersCustomer(OrderTO to);

	String updateOrdersVender(OrderTO to);

	String updateOrderToDelete(OrderTO to);
	
	Map<String, Object> findAllOrdersNo(OrderTO to);
	
	Map<String, Object> findAllCustomerOrder(OrderTO to);

	
	/**
	 * 2022-12-09 dwlee
	 * 주문이력 재고등록 기능 수정으로 StockService로 이동
	 */
//	String insertOrdersToStock(OrderTO to);
}
