package com.jewelry.vender;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jewelry.cms.code.service.CodeService;

@Controller
@RequestMapping("/vender")
public class VenderPageController {

	@Autowired
	private CodeService codeService;
	
	@GetMapping("/list")
	public String list() {
		return "vender/venderList"; //이거 왜하는건지 봐야함
	}
}
