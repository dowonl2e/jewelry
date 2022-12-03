package com.jewelry.vender;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jewelry.exception.ErrorCode;
import com.jewelry.user.domain.CustomUserDetails;
import com.jewelry.vender.domain.VenderTO;
import com.jewelry.vender.domain.VenderVO;
import com.jewelry.vender.service.VenderService;

@RestController
@RequestMapping("/api/vender")
public class VenderApiController {
	
	@Autowired
	private VenderService venderService;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping("/list")
	public Map<String, Object> findAll(final VenderTO to){
		return venderService.findAllVender(to);
	}
	
	@PostMapping("/write")
	public ResponseEntity<Object> write(@RequestBody final VenderTO to) { //이쪽으로온 json 데이터 형식을 to에 넣어줌 requestbody
		to.setInpt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		String result = venderService.insertVender(to);
		
		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}

	@GetMapping("/{venderno}")
	public VenderVO findVenderByNo(@PathVariable final Long venderno) { 
		return venderService.findVenderByNo(venderno);
	}
	
	@PatchMapping("/{venderno}") // URL에 있는 {venderno} 을 아래의 넣기 위해 @PathVariable 을 쓴다.
	public ResponseEntity<Object> modify(@PathVariable final Long venderno, @RequestBody final VenderTO to) { 
		to.setVender_no(venderno);
		to.setUpdt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		String result = venderService.updateVender(to);
		
		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}
	
	@PatchMapping("/venders/remove")
	public ResponseEntity<Object> venderRemove(final VenderTO to){ //파라미터로
		to.setUpdt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		String result = venderService.updateVenderToDelete(to);
		
		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL; //에러코드를 반환
		return  new ResponseEntity<>(response.getStatus());
	}

	
}
