package com.jewelry.catalog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.catalog.domain.CatalogTO;
import com.jewelry.catalog.domain.CatalogVO;
import com.jewelry.catalog.domain.StoneTO;

@Mapper
public interface CatalogMapper {
	
	Integer selectCatalogListCount(CatalogTO to);
	
	List<CatalogVO> selectCatalogList(CatalogTO to);
	
	CatalogVO selectCatalog(Long catalogid);
	
	int insertCatalog(CatalogTO to) throws Exception;
	
	int insertStone(List<StoneTO> list) throws Exception;
	
	int updateCatalog(CatalogTO to);
	
	int updateCatalogDelete(Long catalogid);
}
