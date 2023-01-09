package com.jewelry.cms.auth;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class AuthPageController {

	@GetMapping("/manager/list")
	public String list() {
		return "cms/auth/managerList";
	}
	
}
