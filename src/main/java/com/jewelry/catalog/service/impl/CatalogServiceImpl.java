package com.jewelry.catalog.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jewelry.catalog.domain.CatalogTO;
import com.jewelry.catalog.domain.CatalogVO;
import com.jewelry.catalog.mapper.CatalogMapper;
import com.jewelry.catalog.service.CatalogService;

@Service
public class CatalogServiceImpl implements CatalogService {

	@Autowired
	private CatalogMapper catalogMapper;
	
	@Override
	public Map<String, Object> findAllCatalog(CatalogTO to) {
		Map<String, Object> response = new HashMap<>();

		int totalcount = catalogMapper.selectCatalogListCount(to);
		List<CatalogVO> list = catalogMapper.selectCatalogList(to);

		to.setTotalcount(totalcount);
		
		response.put("params", to);
		response.put("list", list);
		
		return response;
	}

	@Override
	public CatalogVO findCatalogById(Long catalogid) {
		return null;
	}

	@Override
	public String insertCatalog(CatalogTO to) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updateCatalog(CatalogTO to) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updateCatalogToDelete(String cdid) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
