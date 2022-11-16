package com.jewelry.catalog;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.jewelry.catalog.domain.CatalogTO;
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
		to.setModel_id("1");
		to.setCatalogfile(file);
		to.setInpt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		String result = catalogService.insertCatalog(to);

		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}
}
