package com.jewelry.repair;

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
import com.jewelry.repair.domain.RepairTO;
import com.jewelry.repair.domain.RepairVO;
import com.jewelry.repair.service.RepairService;
import com.jewelry.user.domain.CustomUserDetails;

@RestController
@RequestMapping("/api/repair")
public class RepairApiController {
	
	@Autowired
	private RepairService repairService;
	
	@Autowired
    private HttpSession session;
	
	@GetMapping("/list")
	public Map<String, Object> list(final RepairTO to){
		return repairService.findAllRepair(to);
	}
	
	@PostMapping("/write")
	public ResponseEntity<Object> write(final RepairTO to,
			@RequestPart(value = "file", required = false) MultipartFile file){
		to.setRepairfile(file);
		to.setInpt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		String result = repairService.insertRepair(to);

		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}
	
	@GetMapping("/{repairno}")
	public RepairVO repair(@PathVariable final Long repairno){
		return repairService.findRepair(repairno);
	}
	
	@PatchMapping("/modify/{repairno}")
	public ResponseEntity<Object> modify(@PathVariable final Long repairno, RepairTO to,
			@RequestPart(value = "file", required = false) MultipartFile file){
		String userid = ((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername();
		to.setRepairfile(file);
		to.setRepair_no(repairno);
		to.setInpt_id(userid);
		to.setUpdt_id(userid);
		String result = repairService.updateRepair(to);

		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}

	@PatchMapping("/repairs/remove")
	public ResponseEntity<Object> repairsRemove(final RepairTO to){
		to.setUpdt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		String result = repairService.updateRepairsToDelete(to);

		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}
	
	@PatchMapping("/repairs/complete")
	public ResponseEntity<Object> repairscomplete(final RepairTO to){
		to.setUpdt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		String result = repairService.updateRepairsToComplete(to);

		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}
}
