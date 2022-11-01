package com.jewelry.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.jewelry.user.domain.UserTO;
import com.jewelry.user.service.UserService;

@Controller
public class UserController {

//	@Autowired
//	private UserService userService;
	
	@GetMapping("/signin")
	public String signin() {
		return "user/signin";
	}
	
//	@GetMapping("/signup")
//	public String signup() throws Exception {
//		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//		UserTO to = new UserTO();
//		to.setUser_id("admin");
//		to.setUser_pwd(passwordEncoder.encode("!@#qwe"));
//		to.setUser_name("관리자");
//		to.setUse_yn("Y");
//		to.setUser_role("ADMIN");
//		userService.addUser(to);
//		return "user/signin";
//	}
}
