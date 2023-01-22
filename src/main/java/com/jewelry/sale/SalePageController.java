package com.jewelry.sale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jewelry.cms.code.service.CodeService;
import com.jewelry.util.Utils;

@Controller
@RequestMapping("/sale")
public class SalePageController {

	@Autowired
	private CodeService codeService;
	
	@GetMapping("/list")
	public String list(ModelMap model) {
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("smlist", codeService.findAllByUpCdId("SM", 2));
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[]{"ST","SM","PT"}, 2));
		model.addAttribute("today", Utils.getTodayDateFormat("yyyy-MM-dd"));
		return "sale/saleList";
	}
	
	@GetMapping("/popup/customer/list")
	public String customerList(@RequestParam(value = "salesno") String salesno, ModelMap model) {
		model.addAttribute("salesno", salesno);
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[] {"ST","CT"}, 2));
		return "sale/popup/saleCustomerList";
	}

	@GetMapping("/popup/date/modify")
	public String saleDataModify(@RequestParam(value = "salesno") String salesno, ModelMap model) {
		model.addAttribute("salesno", salesno);
		return "sale/popup/saleDateModify";
	}
	
}
