package com.jewelry.customer.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.customer.domain.CustomerTO;
import com.jewelry.customer.domain.CustomerVO;

@Mapper
public interface CustomerMapper {
	
	int selectCustomerListCount(CustomerTO to);
	
	List<CustomerVO> selectCustomerList(CustomerTO to);
	
	CustomerVO selectCustomer(Long customerno);
	
	int insertCustomer(CustomerTO to) throws Exception;

	int updateCustomer(CustomerTO to) throws Exception;

	int updateCustomerToDelete(CustomerTO to) throws Exception;

}
