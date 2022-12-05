package com.jewelry.catalog.service;

import java.util.Map;

import com.jewelry.catalog.domain.CatalogTO;
import com.jewelry.catalog.domain.CatalogVO;
import com.jewelry.repair.domain.RepairTO;

public interface CatalogService {
	
	Map<String, Object> findAllCatalog(CatalogTO to);
		
	CatalogVO findCatalogByNo(Long catalogno);
	
	String insertCatalog(CatalogTO to);
	
	String updateCatalog(CatalogTO to);
	
	String updateCatalogToDelete(String cdid);
	
	String updateCatalogsToDelete(CatalogTO to);
	
}
