package com.jewelry.customer;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jewelry.customer.domain.CustomerTO;
import com.jewelry.customer.service.CustomerService;
import com.jewelry.exception.ErrorCode;
import com.jewelry.user.domain.CustomUserDetails;

@RestController
@RequestMapping("/api/customer")
public class CustomerApiController {
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping("/list")
	public Map<String, Object> findAll(final CustomerTO to){
		return customerService.findAllCustomer(to);
	}
	
	@PostMapping("/write")
	public ResponseEntity<Object> write(@RequestBody final CustomerTO to) {
		to.setInpt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		String result = customerService.insertCustomer(to);
		
		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return  new ResponseEntity<>(response.getStatus());
	}
	
}
