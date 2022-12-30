package com.jewelry.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jewelry.user.domain.CustomUserDetails;

@Controller
@RequestMapping("/member")
public class MemberPageController {

	@Autowired
	private HttpSession session;
	
	@GetMapping("/profile")
	public String profile(ModelMap model) {
		model.addAttribute("userid", ((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		return "member/memberProfile";
	}
	
	@GetMapping("/profile/modify")
	public String profileModify(ModelMap model) {
		model.addAttribute("userid", ((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		return "member/memberProfileModify";
	}
}
