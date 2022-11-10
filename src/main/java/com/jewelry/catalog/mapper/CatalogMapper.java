package com.jewelry.catalog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.catalog.domain.CatalogTO;
import com.jewelry.catalog.domain.CatalogVO;

@Mapper
public interface CatalogMapper {
	
	Integer selectCatalogListCount(CatalogTO to);
	
	List<CatalogVO> selectCatalogList(CatalogTO to);
	
	CatalogVO selectCatalog(Long catalogid);
	
	int insertCode(CatalogTO to);
	
	int updateCode(CatalogTO to);
	
	int updateCatalogDelete(Long catalogid);
}
