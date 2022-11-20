package com.jewelry.stock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jewelry.stock.service.StockService;

@RestController
@RequestMapping("/api/stock")
public class StockApiController {
	
	@Autowired
	private StockService stockService;
	
	
}
