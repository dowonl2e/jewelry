package com.jewelry.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
public class CustomerPageController {
	
	@GetMapping("/list")
	public String list() {
		return "customer/customerList";
	}

}
