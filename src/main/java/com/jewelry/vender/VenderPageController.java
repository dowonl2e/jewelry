package com.jewelry.vender;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jewelry.cms.code.service.CodeService;

@Controller
@RequestMapping("/vender")
public class VenderPageController {
	
	@Autowired
	private CodeService codeService;
	
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("codelist", codeService.findAllByUpCdId(new String[] {"ST","CT"}, 2));
		return "vender/venderList";
	}
	
	@GetMapping("/popup/write")
	public String writePopup(Model model) {
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("ctlist", codeService.findAllByUpCdId("CT", 2));
		return "vender/popup/venderWrite";
	}

	@GetMapping("/popup/view/{venderno}")
	public String viewPopup(@PathVariable final Long venderno, Model model) {
		model.addAttribute("venderno", venderno);
		model.addAttribute("cdlist", codeService.findAllByUpCdId(new String[] {"ST","CT"}, 2));
		return "vender/popup/venderView";
	}
	
	@GetMapping("/popup/modify/{venderno}")
	public String modifyPopup(@PathVariable final Long venderno, Model model) {
		model.addAttribute("venderno", venderno);
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("ctlist", codeService.findAllByUpCdId("CT", 2));
		return "vender/popup/venderModfiy";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	//작업 겹치기 방지 줄---------------------------------------------------------------
	@GetMapping("/popup/list")
	public String listPopup(Model model) {
		model.addAttribute("codelist", codeService.findAllByUpCdId(new String[] {"ST","CT"}, 2));
		return "vender/popup/venderList";
	}
}
