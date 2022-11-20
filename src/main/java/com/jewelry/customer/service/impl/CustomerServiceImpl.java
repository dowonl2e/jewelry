package com.jewelry.customer.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jewelry.customer.domain.CustomerTO;
import com.jewelry.customer.domain.CustomerVO;
import com.jewelry.customer.mapper.CustomerMapper;
import com.jewelry.customer.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerMapper customerMapper;
	
	@Override
	public Map<String, Object> findAllCustomer(CustomerTO to) {
		Map<String, Object> response = new HashMap<>();

		to.setTotalcount(customerMapper.selectCustomerListCount(to));
		response.put("list", customerMapper.selectCustomerList(to));
		response.put("params", to);
		
		return response;
	}

	@Override
	public CustomerVO findCustomerByNo(Long customerno) {
		return customerMapper.selectCustomer(customerno);
	}

	@Override
	public String insertCustomer(CustomerTO to) {
		return customerMapper.insertCustomer(to) > 0 ? "success" : "fail";
	}

	@Override
	public String updateCustomer(CustomerTO to) {
		return customerMapper.updateCustomer(to) > 0 ? "success" : "fail";
	}

	@Override
	public String updateCustomerToDelete(CustomerTO to) {
		return customerMapper.updateCustomerToDelete(to) > 0 ? "success" : "fail";
	}

}
