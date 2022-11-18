package com.jewelry.order.service;

import java.util.Map;

import com.jewelry.order.domain.OrderTO;

public interface OrderService {
	
	Map<String, Object> findAllOrder(OrderTO to);
	
	String insertOrder(OrderTO to);
	
	String updateOrder(OrderTO to);
	
	String updateOrderToDelete(OrderTO to);
	
}
