package com.jewelry.customer.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jewelry.cms.code.domain.CodeTO;
import com.jewelry.cms.code.domain.CodeVO;
import com.jewelry.cms.code.mapper.CodeMapper;
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

		int totalcount = customerMapper.selectCustomerListCount(to);
		List<CustomerVO> list = customerMapper.selectCustomerList(to);
		
		to.setTotalcount(totalcount);

		response.put("params", to);
		response.put("list", list);
		
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
