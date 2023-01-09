package com.jewelry.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.jewelry.cms.code.service.CodeService;
import com.jewelry.util.Utils;

@Controller
public class MainPageController {
	
	@Autowired
	private CodeService codeService;
	
	@GetMapping("/main")
	public String main(ModelMap model) {
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[] {"SM"}, 2));
		model.addAttribute("nowYear", Utils.getTodayDateFormat("yyyy"));
		return "main/index";
	}
	
}
