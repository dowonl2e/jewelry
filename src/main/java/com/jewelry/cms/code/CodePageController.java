package com.jewelry.cms.code;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	@GetMapping("/modify")
	public String modify() {
		return "cms/code/codeModify";
	}
	
	@PostMapping("/register")
	public String register(@ModelAttribute CodeTO to, final MultipartFile[] files, Model model){
		
		String result = codeService.insertCode(to);
		
		return "";
	}
	
	@PostMapping("modify")
	public String modify(@ModelAttribute CodeTO to, final MultipartFile[] files, Model model){
		
		String result = codeService.updateCode(to);
		
		return "";
	}
	
	@PostMapping("remove")
	public String remove(@ModelAttribute CodeTO to, final MultipartFile[] files, Model model){
		
		String result = codeService.deleteCode(to);
		
		return "";
	}
}
