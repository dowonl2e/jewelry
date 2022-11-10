package com.jewelry.catalog;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jewelry.catalog.domain.CatalogTO;
import com.jewelry.catalog.service.CatalogService;

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
}
