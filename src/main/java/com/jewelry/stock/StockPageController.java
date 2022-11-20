package com.jewelry.stock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jewelry.cms.code.service.CodeService;

@Controller
@RequestMapping("/stock")
public class StockPageController {

	@Autowired
	private CodeService codeService;
	
	@GetMapping("/list")
	public String list(ModelMap model) {
		return "stock/stockList";
	}

	@GetMapping("/popup/write")
	public String stockWritePopup(ModelMap model) {
		return "stock/popup/stockWrite";
	}

	@GetMapping("/popup/{stockno}")
	public String stockViewPopup(@PathVariable final Long stockno, ModelMap model) {
		model.addAttribute("stockno", stockno);
		return "stock/popup/stockView";
	}

	@GetMapping("/popup/modify/{stockno}")
	public String stockModifyPopup(@PathVariable final Long stockno, ModelMap model) {
		model.addAttribute("stockno", stockno);
		return "stock/popup/stockModify";
	}
}
