package com.jewelry.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jewelry.cms.code.service.CodeService;
import com.jewelry.stock.service.StockService;
import com.jewelry.util.Utils;

@Controller
@RequestMapping("/order")
public class OrderPageController {

	@Autowired
	private CodeService codeService;
	
	@Autowired
	private StockService stockService;
	
	@GetMapping("/list")
	public String list(ModelMap model) {
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("smlist", codeService.findAllByUpCdId("SM", 2));
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[]{"ST","SM","SC"}, 2));
		return "order/orderList";
	}
	
	//고객 제품
	@GetMapping("/popup/customer/write")
	public String writeCustomerPopup(ModelMap model) {
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("smlist", codeService.findAllByUpCdId("SM", 2));
		model.addAttribute("sclist", codeService.findAllByUpCdId("SC", 2));
		model.addAttribute("today", Utils.getTodayDateFormat("yyyy-MM-dd"));
		return "order/popup/customer/orderWrite";
	}

	@GetMapping("/popup/customer/{orderno}")
	public String viewCustomerPopup(@PathVariable final Long orderno, ModelMap model) {
		model.addAttribute("orderno", orderno);
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[] {"ST","SM","SC"}, 2));
		return "order/popup/customer/orderView";
	}
	
	@GetMapping("/popup/customer/modify/{orderno}")
	public String modifyCustomerPopup(@PathVariable final Long orderno, ModelMap model) {
		model.addAttribute("orderno", orderno);
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("smlist", codeService.findAllByUpCdId("SM", 2));
		model.addAttribute("sclist", codeService.findAllByUpCdId("SC", 2));
		return "order/popup/customer/orderModify";
	}

	//기성품
	@GetMapping("/popup/read-made/write")
	public String writeReadMadePopup(ModelMap model) {
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("smlist", codeService.findAllByUpCdId("SM", 2));
		model.addAttribute("sclist", codeService.findAllByUpCdId("SC", 2));
		model.addAttribute("today", Utils.getTodayDateFormat("yyyy-MM-dd"));
		return "order/popup/read-made/orderWrite";
	}

	@GetMapping("/popup/read-made/{orderno}")
	public String viewPopup(@PathVariable final Long orderno, ModelMap model) {
		model.addAttribute("orderno", orderno);
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[] {"ST","SM","SC"}, 2));
		return "order/popup/read-made/orderView";
	}
	
	@GetMapping("/popup/read-made/modify/{orderno}")
	public String modifyPopup(@PathVariable final Long orderno, ModelMap model) {
		model.addAttribute("orderno", orderno);
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("smlist", codeService.findAllByUpCdId("SM", 2));
		model.addAttribute("sclist", codeService.findAllByUpCdId("SC", 2));
		return "order/popup/read-made/orderModify";
	}

	@GetMapping("/popup/step/modify")
	public String stepPopup(@RequestParam(value = "ordersno") String ordersno, ModelMap model) {
		model.addAttribute("ordersno", ordersno);
		return "order/popup/orderStepModify";
	}

	@GetMapping("/schedule/list")
	public String scheduleList(ModelMap model) {
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("smlist", codeService.findAllByUpCdId("SM", 2));
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[]{"ST", "SM", "SC"}, 2));
		return "order/orderScheduleList";
	}
	
	@GetMapping("/stocked/list")
	public String stockedList(ModelMap model) {
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("smlist", codeService.findAllByUpCdId("SM", 2));
		model.addAttribute("cdmapper", codeService.findAllByUpCdId(new String[]{"ST", "SM", "SC"}, 2));
		return "order/orderStockedList";
	}

	@GetMapping("/popup/customer/modify")
	public String customerModifyPopup(@RequestParam(value = "ordersno") String ordersno, ModelMap model) {
		model.addAttribute("ordersno", ordersno);
		return "order/popup/orderCustomerModify";
	}
	
	@GetMapping("/popup/vender/modify")
	public String venderModifyPopup(@RequestParam(value = "ordersno") String ordersno, ModelMap model) {
		model.addAttribute("ordersno", ordersno);
		return "order/popup/orderVenderModify";
	}

	@GetMapping("/popup/orders/stock/write")
	public String stocksWritePopup(@RequestParam(value = "ordersno") String ordersno, ModelMap model) {
		model.addAttribute("stlist", codeService.findAllByUpCdId("ST", 2));
		model.addAttribute("smlist", codeService.findAllByUpCdId("SM", 2));
		model.addAttribute("sclist", codeService.findAllByUpCdId("SC", 2));
		model.addAttribute("oclist", codeService.findAllByUpCdId("OC", 2));
		model.addAttribute("prevstocklist", stockService.findAllPrevStock());
		model.addAttribute("ordersno", ordersno);
		return "order/popup/ordersStockWrite";
	}
}
