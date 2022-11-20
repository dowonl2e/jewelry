package com.jewelry.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.order.domain.OrderTO;
import com.jewelry.order.domain.OrderVO;

@Mapper
public interface OrderMapper {
	
	int selectOrderListCount(OrderTO to);
	
	List<OrderVO> selectOrderList(OrderTO to);
	
	int insertOrder(OrderTO to);
	
	OrderVO selectOrder(Long orderno);
	
	int updateOrder(OrderTO to);
	
	int updateOrdersStatus(OrderTO to);
	
	int updateOrdersDelete(OrderTO to);
	
	int updateOrderToDelete(OrderTO to);
	
}
