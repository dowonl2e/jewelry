package com.jewelry.sale.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.sale.domain.SaleTO;
import com.jewelry.sale.domain.SaleVO;

@Mapper
public interface SaleMapper {
	
	int selectSaleListCount(SaleTO to);
	
	List<SaleVO> selectSaleList(SaleTO to);
}
