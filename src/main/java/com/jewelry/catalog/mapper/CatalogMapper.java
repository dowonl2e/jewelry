package com.jewelry.catalog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.catalog.domain.CatalogTO;
import com.jewelry.catalog.domain.CatalogVO;
import com.jewelry.catalog.domain.StoneTO;
import com.jewelry.catalog.domain.StoneVO;

@Mapper
public interface CatalogMapper {
	
	Integer selectCatalogListCount(CatalogTO to);
	
	List<CatalogVO> selectCatalogList(CatalogTO to);
	
	CatalogVO selectCatalog(Long catalogno);

	List<StoneVO> selectStoneListByCatalogNo(Long catalogno);

	int insertCatalog(CatalogTO to) throws Exception;
	
	int insertStone(List<StoneTO> list) throws Exception;
	
	int deleteStone(Long catalogno) throws Exception;
	
	int updateCatalog(CatalogTO to) throws Exception;
	
	int updateCatalogDelete(Long catalogid) throws Exception;
	
	int updateCatalogsToDelete(CatalogTO to) throws Exception;
}
