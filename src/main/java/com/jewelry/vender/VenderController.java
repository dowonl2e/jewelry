package com.jewelry.vender;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

import com.jewelry.user.service.UserService;

public class VenderController {
	@Autowired
	private UserService userService;
	
	@GetMapping("/vender")
	public String signin() {
		return "vender";
	}
}
