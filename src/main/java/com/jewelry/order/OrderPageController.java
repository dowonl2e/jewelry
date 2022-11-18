package com.jewelry.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jewelry.cms.code.service.CodeService;

@Controller
@RequestMapping("/order")
public class OrderPageController {

	@Autowired
	private CodeService codeService;
	
	@GetMapping("/list")
	public String list(ModelMap model) {
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("smlist", codeService.findAllByUpCdId("SM", 2));
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[]{"SM", "SC"}, 2));
		return "order/orderList";
	}
	
	//고객 제품
	@GetMapping("/popup/customer/write")
	public String writeCustomerPopup() {
		return "order/popup/customer/orderWrite";
	}

	@GetMapping("/popup/customer/{orderno}")
	public String viewCustomerPopup(@PathVariable final Long orderno, ModelMap model) {
		model.addAttribute("orderno", orderno);
		return "order/popup/customer/orderView";
	}
	
	@GetMapping("/popup/customer/modify/{orderno}")
	public String modifyCustomerPopup(@PathVariable final Long orderno, ModelMap model) {
		model.addAttribute("orderno", orderno);
		return "order/popup/customer/orderModify";
	}

	//기성품
	@GetMapping("/popup/read-made/write")
	public String writeReadMadePopup() {
		return "order/popup/read-made/orderWrite";
	}

	@GetMapping("/popup/read-made/{orderno}")
	public String viewPopup(@PathVariable final Long orderno, ModelMap model) {
		model.addAttribute("orderno", orderno);
		return "order/popup/read-made/orderView";
	}
	
	@GetMapping("/popup/read-made/modify/{orderno}")
	public String modifyPopup(@PathVariable final Long orderno, ModelMap model) {
		model.addAttribute("orderno", orderno);
		return "order/popup/read-made/orderModify";
	}
	
}
