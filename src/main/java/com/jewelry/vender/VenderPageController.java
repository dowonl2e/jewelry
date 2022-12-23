package com.jewelry.vender;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[] {"MT","VT"}, 2));
		return "vender/venderList";
	}
	
	@GetMapping("/popup/write") 															//등록
	public String writePopup(Model model) {
		model.addAttribute("mtlist", codeService.findAllByUpCdId("MT", 2));
		model.addAttribute("vtlist", codeService.findAllByUpCdId("VT", 2));
		return "vender/popup/venderWrite";
	}

	@GetMapping("/popup/{venderno}") 													//뷰
	public String viewPopup(@PathVariable final Long venderno, Model model) {
		model.addAttribute("venderno", venderno);
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[] {"MT","VT"}, 2));
		return "vender/popup/venderView";
	}
	
	@GetMapping("/popup/modify/{venderno}") 									//수정
	public String modifyPopup(@PathVariable final Long venderno, Model model) {
		model.addAttribute("venderno", venderno);
		model.addAttribute("mtlist", codeService.findAllByUpCdId("MT", 2));
		model.addAttribute("vtlist", codeService.findAllByUpCdId("VT", 2));
		return "vender/popup/venderModify";
	}
	
	@GetMapping("/pay/list")
	public String payList(Model model) {
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[] {"ST"}, 2));
		return "vender/venderPayList";
	}

	@GetMapping("/popup/pay/write")
	public String writePayPopup(Model model) {
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		return "vender/popup/venderPayWrite";
	}

	@GetMapping("/popup/pay/{payNo}")
	public String viewPayPopup(@PathVariable final Long payNo, ModelMap model) {
		model.addAttribute("payNo", payNo);
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[] {"ST"}, 2));
		return "vender/popup/venderPayView";
	}
	
	@GetMapping("/popup/pay/modify/{payNo}")
	public String modifyPayPopup(@PathVariable final Long payNo, Model model) {
		model.addAttribute("payNo", payNo);
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		return "vender/popup/venderPayModify";
	}
	
	
	
	
	
	
	
	
	
	//작업 겹치기 방지 줄---------------------------------------------------------------
	@GetMapping("/popup/list")
	public String listPopup(Model model) {
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[] {"MT","VT"}, 2));
		return "vender/popup/venderList";
	}
}
