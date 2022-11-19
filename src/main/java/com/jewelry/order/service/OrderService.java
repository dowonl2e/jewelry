package com.jewelry.order.service;

import java.util.Map;

import com.jewelry.order.domain.OrderTO;
import com.jewelry.order.domain.OrderVO;

public interface OrderService {
	
	Map<String, Object> findAllOrder(OrderTO to);
	
	String insertOrder(OrderTO to);
	
	OrderVO findOrderByNo(Long orderno);
	
	String updateOrder(OrderTO to);
	
	String updateOrderToDelete(OrderTO to);
	
}
