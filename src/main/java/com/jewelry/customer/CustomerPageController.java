package com.jewelry.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jewelry.cms.code.service.CodeService;

@Controller
@RequestMapping("/customer")
public class CustomerPageController {
	
	@Autowired
	private CodeService codeService;
	
	@GetMapping("/list")
	public String list() {
		return "customer/customerList";
	}
	
	@GetMapping("/popup/write")
	public String writePopup(Model model) {
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("ctlist", codeService.findAllByUpCdId("CT", 2));
		return "customer/popup/customerWrite";
	}
}
