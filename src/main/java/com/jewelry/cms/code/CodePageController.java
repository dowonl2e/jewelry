package com.jewelry.cms.code;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jewelry.cms.code.domain.CodeTO;
import com.jewelry.cms.code.service.CodeService;

@Controller
@RequestMapping("/code")
public class CodePageController {

	@Autowired
	private CodeService codeService;
	
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

	@GetMapping("/view/{num}")
	public String boardView(@PathVariable final Long num, Model model) {
		model.addAttribute("num", num);
		return "board/view";
	}
	
}
