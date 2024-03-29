package com.jewelry.cash;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jewelry.cms.code.service.CodeService;
import com.jewelry.util.Utils;

@Controller
@RequestMapping("/cash")
public class CashPageController {

	@Autowired
	private CodeService codeService;
	
	@GetMapping("/list")
	public String list(ModelMap model) {
		model.addAttribute("rslist", codeService.findAllByUpCdId("RS", 2));
		model.addAttribute("rslist2", codeService.findAllByUpCdId(new String[]{"RS01", "RS02"}, 3));
		model.addAttribute("btlist", codeService.findAllByUpCdId("BT", 2));
		model.addAttribute("smlist", codeService.findAllByUpCdId("SM", 2));
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[] {"SM", "ST", "RS", "BT"}, 2));
		model.addAttribute("cdmapper2", codeService.findAllByUpCdId(new String[] {"RS01", "RS02"}, 3));
		model.addAttribute("today", Utils.getTodayDateFormat("yyyy-MM-dd"));
		return "cash/cashList";
	}
	
	@GetMapping("/popup/write")
	public String writePopup(ModelMap model) {
		model.addAttribute("rslist", codeService.findAllByUpCdId("RS", 2));
		model.addAttribute("rslist2", codeService.findAllByUpCdId(new String[]{"RS01", "RS02"}, 3));
		model.addAttribute("btlist", codeService.findAllByUpCdId("BT", 2));
		model.addAttribute("smlist", codeService.findAllByUpCdId("SM", 2));
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		return "cash/popup/cashWrite";
	}

	@GetMapping("/popup/{cashno}")
	public String viewPopup(@PathVariable final Long cashno, ModelMap model) {
		model.addAttribute("cashno", cashno);
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[] {"SM", "ST", "RS", "BT"}, 2));
		model.addAttribute("cdmapper2", codeService.findAllByUpCdId(new String[] {"RS01", "RS02"}, 3));
		return "cash/popup/cashView";
	}
	
	@GetMapping("/popup/modify/{cashno}")
	public String modifyPopup(@PathVariable final Long cashno, ModelMap model) {
		model.addAttribute("cashno", cashno);
		model.addAttribute("rslist", codeService.findAllByUpCdId("RS", 2));
		model.addAttribute("rslist2", codeService.findAllByUpCdId(new String[]{"RS01", "RS02"}, 3));
		model.addAttribute("btlist", codeService.findAllByUpCdId("BT", 2));
		model.addAttribute("smlist", codeService.findAllByUpCdId("SM", 2));
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		return "cash/popup/cashModify";
	}
}
