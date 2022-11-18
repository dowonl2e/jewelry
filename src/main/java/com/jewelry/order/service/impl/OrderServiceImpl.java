package com.jewelry.order.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jewelry.order.domain.OrderTO;
import com.jewelry.order.domain.OrderVO;
import com.jewelry.order.mapper.OrderMapper;
import com.jewelry.order.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	@Override
	public Map<String, Object> findAllOrder(OrderTO to) {
		Map<String, Object> response = new HashMap<>();

		int totalcount = orderMapper.selectOrderListCount(to);
		List<OrderVO> list = orderMapper.selectOrderList(to);

		to.setTotalcount(totalcount);
		
		response.put("params", to);
		response.put("list", list);
		
		return response;
	}
	
	@Override
	public String insertOrder(OrderTO to) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public String updateOrder(OrderTO to) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public String updateOrderToDelete(OrderTO to) {
		// TODO Auto-generated method stub
		return null;
	}
}
