package com.jewelry.customer;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jewelry.customer.domain.CustomerTO;
import com.jewelry.customer.service.CustomerService;

@RestController
@RequestMapping("/api/customer")
public class CustomerApiController {
	
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("/list")
	public Map<String, Object> findAll(final CustomerTO to){
		return customerService.findAllCustomer(to);
	}
	
}
