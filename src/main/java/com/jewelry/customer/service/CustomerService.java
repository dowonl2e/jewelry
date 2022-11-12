package com.jewelry.customer.service;

import java.util.Map;

import com.jewelry.customer.domain.CustomerTO;
import com.jewelry.customer.domain.CustomerVO;

public interface CustomerService {
	
	Map<String, Object> findAllCustomer(CustomerTO to);
	
	CustomerVO findCustomerByNo(Long customerno);
	
	String insertCustomer(CustomerTO to);
	
	String updateCustomer(CustomerTO to);
	
	String updateCustomerToDelete(CustomerTO to);
	
}
