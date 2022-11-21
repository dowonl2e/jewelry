package com.jewelry.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.order.domain.OrderTO;
import com.jewelry.order.domain.OrderVO;

@Mapper
public interface OrderMapper {
	
	int selectOrderListCount(OrderTO to);
	
	List<OrderVO> selectOrderList(OrderTO to);
	
	int insertOrder(OrderTO to) throws Exception;
	
	OrderVO selectOrder(Long orderno);
	
	int updateOrder(OrderTO to) throws Exception;
	
	int updateOrdersStatus(OrderTO to) throws Exception;
	
	int updateOrdersToDelete(OrderTO to) throws Exception;
	
	int updateOrdersCustomer(OrderTO to) throws Exception;

	int updateOrdersVender(OrderTO to) throws Exception;

	int updateOrderToDelete(OrderTO to) throws Exception;
	
}
