package com.jewelry.catalog;

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

import com.jewelry.catalog.domain.CatalogTO;
import com.jewelry.catalog.domain.CatalogVO;
import com.jewelry.catalog.service.CatalogService;
import com.jewelry.exception.ErrorCode;
import com.jewelry.user.domain.CustomUserDetails;

@RestController
@RequestMapping("/api/catalog")
public class CatalogApiController {

	@Autowired
	private CatalogService catalogService;
	
	@Autowired
    private HttpSession session;
	
	@GetMapping("/list")
	public Map<String, Object> list(final CatalogTO to){
		return catalogService.findAllCatalog(to);
	}
	
	@PostMapping("/write")
	public ResponseEntity<Object> write(final CatalogTO to,
			@RequestPart(value = "file", required = false) MultipartFile file){
		to.setVender_no((long)1);
		to.setCatalogfile(file);
		to.setInpt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		String result = catalogService.insertCatalog(to);

		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}

	@GetMapping("/{catalogno}")
	public CatalogVO catalog(@PathVariable final Long catalogno){
		return catalogService.findCatalogByNo(catalogno);
	}
	

	@PatchMapping("/modify/{catalogno}")
	public ResponseEntity<Object> modify(@PathVariable final Long catalogno, CatalogTO to,
			@RequestPart(value = "file", required = false) MultipartFile file){
		String userid = ((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername();
		to.setVender_no((long)1);
		to.setCatalogfile(file);
		to.setCatalog_no(catalogno);
		to.setInpt_id(userid);
		to.setUpdt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		String result = catalogService.updateCatalog(to);

		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}
}
