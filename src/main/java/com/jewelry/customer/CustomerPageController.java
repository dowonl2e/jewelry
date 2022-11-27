package com.jewelry.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jewelry.cms.code.service.CodeService;

@Controller
@RequestMapping("/customer")
public class CustomerPageController {
	
	@Autowired
	private CodeService codeService;
	
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("codelist", codeService.findAllByUpCdId(new String[] {"ST","CT"}, 2));
		return "customer/customerList";
	}
	
	@GetMapping("/popup/write")
	public String writePopup(Model model) {
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("ctlist", codeService.findAllByUpCdId("CT", 2));
		return "customer/popup/customerWrite";
	}

	@GetMapping("/popup/{customerno}")
	public String viewPopup(@PathVariable final Long customerno, Model model) {
		model.addAttribute("customerno", customerno);
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[] {"ST","CT"}, 2));
		return "customer/popup/customerView";
	}
	
	@GetMapping("/popup/modify/{customerno}")
	public String modifyPopup(@PathVariable final Long customerno, Model model) {
		model.addAttribute("customerno", customerno);
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("ctlist", codeService.findAllByUpCdId("CT", 2));
		return "customer/popup/customerModify";
	}

	@GetMapping("/popup/list")
	public String listPopup(Model model) {
		model.addAttribute("codelist", codeService.findAllByUpCdId(new String[] {"ST","CT"}, 2));
		return "customer/popup/customerList";
	}
}
