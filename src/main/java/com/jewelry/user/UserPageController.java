package com.jewelry.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jewelry.user.domain.CustomUserDetails;

@Controller
@RequestMapping("/user")
public class UserPageController {
	
	@GetMapping("/list")
	public String list() {
		return "user/userList";
	}

	@GetMapping("/write")
	public String write() {
		return "user/userWrite";
	}

	@GetMapping("/{userid}")
	public String view(@PathVariable final String userid, ModelMap model) {
		model.addAttribute("userid", userid);
		return "user/userView";
	}

	@GetMapping("/modify/{userid}")
	public String modify(@PathVariable final String userid, ModelMap model) {
		model.addAttribute("userid", userid);
		return "user/userModify";
	}
	
}
