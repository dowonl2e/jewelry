package com.jewelry.cms.code;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/code")
public class CodePageController {
	
	@GetMapping("/list")
	public String list() {
		return "cms/code/codeList";
	}
	
	@GetMapping("/write")
	public String write() {
		return "cms/code/codeWrite";
	}
	
	@GetMapping("/modify/{cdid}")
	public String modify(@PathVariable final String cdid, Model model){
		model.addAttribute("cdid", cdid);
		return "cms/code/codeModify";
	}

}
