package com.jewelry.stock;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.jewelry.exception.ErrorCode;
import com.jewelry.stock.domain.StockTO;
import com.jewelry.stock.domain.StockVO;
import com.jewelry.stock.service.StockService;
import com.jewelry.user.domain.CustomUserDetails;

@RestController
@RequestMapping("/api/stock")
public class StockApiController {
	
	@Autowired
	private StockService stockService;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping("/list")
	public Map<String, Object> list(final StockTO to){
		return stockService.findAllStock(to);
	}
	
	@PostMapping("/write")
	public ResponseEntity<Object> write(final StockTO to,
			@RequestPart(value = "file", required = false) MultipartFile file){
		to.setStockfile(file);
		to.setInpt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		String result = stockService.insertStock(to);

		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}

	@GetMapping("/{stockno}")
	public StockVO order(@PathVariable final Long stockno){
		return stockService.findStockByNo(stockno);
	}

	@PatchMapping("/modify/{stockno}")
	public ResponseEntity<Object> modify(@PathVariable final Long stockno, final StockTO to,
			@RequestPart(value = "file", required = false) MultipartFile file){
		String username = ((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername();
		to.setStock_no(stockno);
		to.setStockfile(file);
		to.setInpt_id(username);
		to.setUpdt_id(username);
		String result = stockService.updateStock(to);

		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}
}
