package com.jewelry.catalog.service;

import java.util.Map;

import com.jewelry.catalog.domain.CatalogTO;
import com.jewelry.catalog.domain.CatalogVO;

public interface CatalogService {
	
	Map<String, Object> findAllCatalog(CatalogTO to);
		
	CatalogVO findCatalogById(Long catalogid);
	
	String insertCatalog(CatalogTO to);
	
	String updateCatalog(CatalogTO to);
	
	String updateCatalogToDelete(String cdid);
}
