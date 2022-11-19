package com.jewelry.order;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.jewelry.exception.ErrorCode;
import com.jewelry.order.domain.OrderTO;
import com.jewelry.order.domain.OrderVO;
import com.jewelry.order.service.OrderService;
import com.jewelry.user.domain.CustomUserDetails;

@RestController
@RequestMapping("/api/order")
public class OrderApiController {
	
	@Autowired
	private OrderService orderService;

	@Autowired
    private HttpSession session;
	
	@GetMapping("/list")
	public Map<String, Object> list(final OrderTO to){
		return orderService.findAllOrder(to);
	}
	
	@PostMapping("/write")
	public ResponseEntity<Object> write(final OrderTO to,
			@RequestPart(value = "file", required = false) MultipartFile file){
		to.setOrderfile(file);
		to.setInpt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		String result = orderService.insertOrder(to);

		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}
	
	@GetMapping("/{orderno}")
	public OrderVO order(@PathVariable final Long orderno){
		return orderService.findOrderByNo(orderno);
	}
}
