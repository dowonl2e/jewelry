package com.jewelry.repair;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/repair")
public class RepairPageController {
	
	@GetMapping("/list")
	public String list(ModelMap model) {
		return "repair/repairList";
	}

	@GetMapping("/popup/write")
	public String repairWritePopup(ModelMap model) {
		return "repair/popup/repairWrite";
	}

	@GetMapping("/popup/{repairno}")
	public String repairViewPopup(@PathVariable final Long repairno, ModelMap model) {
		model.addAttribute("repairno", repairno);
		return "repair/popup/repairView";
	}

	@GetMapping("/popup/modify/{repairno}")
	public String repairModifyPopup(@PathVariable final Long repairno, ModelMap model) {
		model.addAttribute("repairno", repairno);
		return "repair/popup/repairModify";
	}
}
