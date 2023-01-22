package com.jewelry.order;

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
	
	@PatchMapping("/modify/{orderno}")
	public ResponseEntity<Object> modify(@PathVariable final Long orderno, final OrderTO to,
			@RequestPart(value = "file", required = false) MultipartFile file){
		String userid = ((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername();
		to.setOrder_no(orderno);
		to.setOrderfile(file);
		to.setInpt_id(userid);
		to.setUpdt_id(userid);
		String result = orderService.updateOrder(to);

		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}
	
	@PatchMapping("/step/modify")
	public ResponseEntity<Object> stepModify(final OrderTO to){
		to.setUpdt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		String result = orderService.updateOrdersStep(to);

		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}

	@PatchMapping("/orders/remove")
	public ResponseEntity<Object> ordersRemove(final OrderTO to){
		to.setUpdt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		String result = orderService.updateOrdersToDelete(to);

		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}
	
	@GetMapping("/schedule/list")
	public Map<String, Object> scheduleList(final OrderTO to){
		to.setOrder_step("A");
		return orderService.findAllOrder(to);
	}

	@GetMapping("/stocked/list")
	public Map<String, Object> stockedList(final OrderTO to){
		to.setOrder_step("B");
		return orderService.findAllOrder(to);
	}

	@PatchMapping("/customer/modify")
	public ResponseEntity<Object> customerModify(final OrderTO to){
		to.setUpdt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		String result = orderService.updateOrdersCustomer(to);

		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}	

	@PatchMapping("/vender/modify")
	public ResponseEntity<Object> venderModify(final OrderTO to){
		to.setUpdt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		String result = orderService.updateOrdersVender(to);

		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}

	@PostMapping("/list/nos")
	public Map<String, Object> listByOrdersNo(final OrderTO to){
		return orderService.findAllOrdersNo(to);
	}
	
	@GetMapping("/customer/list/{customerno}")
	public Map<String, Object> orderCustomerList(@PathVariable("customerno") final Long customerno, final OrderTO to){
		to.setCustomer_no(customerno);
		return orderService.findAllCustomerOrder(to);
	}

	@GetMapping("/customer/list/{customerno}/{orderstep}")
	public Map<String, Object> orderCustomerList(@PathVariable("customerno") final Long customerno, @PathVariable("orderstep") final String orderstep, final OrderTO to){
		to.setOrder_step(orderstep);
		to.setCustomer_no(customerno);
		return orderService.findAllCustomerOrder(to);
	}

}
