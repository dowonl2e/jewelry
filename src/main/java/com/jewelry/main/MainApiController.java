package com.jewelry.main;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jewelry.main.domain.MainTO;
import com.jewelry.main.service.MainService;

@RestController
@RequestMapping("/api/main")
public class MainApiController {
	
	@Autowired
	private MainService mainService;
	
	@GetMapping("/stats/all")
	public Map<String, Object> statsAll(final MainTO to){
		return mainService.findAllStats(to);
	}
	
	@GetMapping("/monthly/sale/price")
	public Map<String, Object> salePriceStats(final MainTO to){
		return mainService.findMonthlySalePrice(to);
	}

	@GetMapping("/material/orders")
	public Map<String, Object> materialOrdersStats(final MainTO to){
		return mainService.findMaterialOrders(to);
	}

	@GetMapping("/material/stocks")
	public Map<String, Object> materialStocksStats(final MainTO to){
		return mainService.findMaterialStocks(to);
	}
	
}
