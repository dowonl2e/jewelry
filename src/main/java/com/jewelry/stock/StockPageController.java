package com.jewelry.stock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jewelry.cms.code.service.CodeService;
import com.jewelry.stock.service.StockService;

@Controller
@RequestMapping("/stock")
public class StockPageController {

	@Autowired
	private CodeService codeService;
	
	@Autowired
	private StockService stockService;

	@GetMapping("/list")
	public String list(ModelMap model) {
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("smlist", codeService.findAllByUpCdId("SM", 2));
		model.addAttribute("oclist", codeService.findAllByUpCdId("OC", 2));
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[]{"ST","SM","SC","OC"}, 2));
		return "stock/stockList";
	}

	@GetMapping("/popup/write")
	public String stockWritePopup(ModelMap model) {
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("smlist", codeService.findAllByUpCdId("SM", 2));
		model.addAttribute("sclist", codeService.findAllByUpCdId("SC", 2));
		model.addAttribute("oclist", codeService.findAllByUpCdId("OC", 2));
		model.addAttribute("prevstocklist", stockService.findAllPrevStock());
		return "stock/popup/stockWrite";
	}

	@GetMapping("/popup/{stockno}")
	public String stockViewPopup(@PathVariable final Long stockno, ModelMap model) {
		model.addAttribute("stockno", stockno);
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[]{"ST","SM","SC","OC"}, 2));
		return "stock/popup/stockView";
	}

	@GetMapping("/popup/modify/{stockno}")
	public String stockModifyPopup(@PathVariable final Long stockno, ModelMap model) {
		model.addAttribute("stockno", stockno);
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("smlist", codeService.findAllByUpCdId("SM", 2));
		model.addAttribute("sclist", codeService.findAllByUpCdId("SC", 2));
		model.addAttribute("oclist", codeService.findAllByUpCdId("OC", 2));
		model.addAttribute("prevstocklist", stockService.findAllPrevStock());
		return "stock/popup/stockModify";
	}
	
	@GetMapping("/accumulation/list")
	public String listAll(ModelMap model) {
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("smlist", codeService.findAllByUpCdId("SM", 2));
		model.addAttribute("oclist", codeService.findAllByUpCdId("OC", 2));
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[]{"ST","SM","SC","OC"}, 2));
		return "stock/stockAccumulationList";
	}

	@GetMapping("/popup/reg-date/modify")
	public String stockRegDateModifyPopup(@RequestParam(value = "stocksno") String stocksno, ModelMap model) {
		model.addAttribute("stocksno", stocksno);
		return "stock/popup/stockRegDateModify";
	}

	@GetMapping("/popup/type/modify")
	public String stockTypeModifyPopup(@RequestParam(value = "stocksno") String stocksno, ModelMap model) {
		model.addAttribute("stocksno", stocksno);
		model.addAttribute("oclist", codeService.findAllByUpCdId("OC", 2));
		return "stock/popup/stockTypeModify";
	}
	
	@GetMapping("/popup/vender/modify")
	public String venderModifyPopup(@RequestParam(value = "stocksno") String stocksno, ModelMap model) {
		model.addAttribute("stocksno", stocksno);
		return "stock/popup/stockVenderModify";
	}
	
	@GetMapping("/popup/customer/order")
	public String stockCustomerOrderPopup(@RequestParam(value = "stocksno") String stocksno, ModelMap model) {
		model.addAttribute("stocksno", stocksno);
		model.addAttribute("cdmapper", codeService.findAllByUpCdId("CT", 2));
		return "stock/popup/stockCustomerOrder";
	}	

	@GetMapping("/popup/sale")
	public String stockSalePopup(@RequestParam(value = "stocksno") String stocksno, ModelMap model) {
		model.addAttribute("stocksno", stocksno);
		model.addAttribute("ptlist", codeService.findAllByUpCdId("PT", 2));
		return "stock/popup/stockSale";
	}
	
}
