package com.jewelry.sale;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jewelry.sale.domain.SaleTO;
import com.jewelry.sale.service.SaleService;

@RestController
@RequestMapping("/api/sale")
public class SaleApiController {

	@Autowired
	private SaleService saleService;
	
	@GetMapping("/list")
	public Map<String, Object> list(final SaleTO to){
		return saleService.findAllSale(to);
	}
	
}
