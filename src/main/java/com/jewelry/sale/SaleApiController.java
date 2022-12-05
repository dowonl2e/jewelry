package com.jewelry.sale;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jewelry.exception.ErrorCode;
import com.jewelry.sale.domain.SaleTO;
import com.jewelry.sale.service.SaleService;
import com.jewelry.user.domain.CustomUserDetails;

@RestController
@RequestMapping("/api/sale")
public class SaleApiController {

	@Autowired
	private SaleService saleService;
	
	
	@Autowired
	private HttpSession session;
	
	
	@GetMapping("/list")
	public Map<String, Object> list(final SaleTO to){
		return saleService.findAllSale(to);
	}
	
	@PatchMapping("/sales/remove")
	public ResponseEntity<Object> ordersRemove(final SaleTO to){
		to.setUpdt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		String result = saleService.updateSalesToDelete(to);

		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}
	
}
