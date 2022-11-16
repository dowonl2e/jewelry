package com.jewelry.catalog;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jewelry.cms.code.service.CodeService;

@Controller
@RequestMapping("/catalog")
public class CatalogPageController {

	@Autowired
	private CodeService codeService;
	
	@GetMapping("list")
	public String list() {
		return "catalog/catalogList";
	}
	
	@GetMapping("/popup/write")
	public String popupWrite(ModelMap model) {
		model.addAttribute("smlist", codeService.findAllByUpCdId("SM", 2));
		model.addAttribute("sclist", codeService.findAllByUpCdId("SC", 2));
		model.addAttribute("ttlist", codeService.findAllByUpCdId("TT", 2));
		return "catalog/popup/catalogWrite";
	}
	

	@GetMapping("/popup/{catalogno}")
	public String popupWrite(@PathVariable final Long catalogno, ModelMap model) {
		model.addAttribute("catalogno", catalogno);
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[] {"SM","CD","TT"}, 2));
		return "catalog/popup/catalogView";
	}
}
