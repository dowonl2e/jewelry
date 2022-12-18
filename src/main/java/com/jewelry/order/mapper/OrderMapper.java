package com.jewelry.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.main.domain.MainTO;
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
	
	List<OrderVO> selectOrderListWithNo(OrderTO to);

	List<OrderVO> selectOrderListByOrdersNo(OrderTO to);
	
	int updateOrdersSaleDate(OrderTO to) throws Exception;

	int selectCustomerOrderListCount(OrderTO to);
	
	List<OrderVO> selectCustomerOrderList(OrderTO to);
	
	/**
	 * 메인화면 - 재질별 주문 수
	 * @param to
	 * @return
	 */
	List<OrderVO> selectNumOfOrdersPerMaterial(MainTO to);

}
