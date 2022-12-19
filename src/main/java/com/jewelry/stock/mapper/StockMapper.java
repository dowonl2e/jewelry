package com.jewelry.stock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.main.domain.MainTO;
import com.jewelry.stock.domain.StockTO;
import com.jewelry.stock.domain.StockVO;

@Mapper
public interface StockMapper {
	
	int selectStockListCount(StockTO to);
	
	List<StockVO> selectStockList(StockTO to);
	
	List<StockVO> selectPrevStockList();

	int insertStock(StockTO to) throws Exception;
		
	StockVO selectStock(Long stockno);
	
	StockVO selectStockCustomer(Long stockno);
	
	int updateStock(StockTO to) throws Exception;

	int updateStockToDelete(StockTO to) throws Exception;
	
	int updateStocksToDelete(StockTO to) throws Exception;
	
	int updateStocksToSale(StockTO to) throws Exception;
	
	int updateStocksRegDate(StockTO to) throws Exception;
	
	int updateStocksType(StockTO to) throws Exception;
	
	int updateStocksVender(StockTO to) throws Exception;

	int selectAccumulationStockCount(StockTO to);
	
	List<StockVO> selectAccumulationStock(StockTO to);
	
	int updateStocksOrder(StockTO to) throws Exception;
	
	List<StockVO> selectStockListByNos(StockTO to);
	
	int updateStocksCustomer(StockTO to) throws Exception;

	int updateStocksSaleDate(StockTO to) throws Exception;
	
	List<StockVO> selectStockListByStockNos(StockTO to);

	/**
	 * 메인화면 - 재질별 현 재고현황
	 * @param to
	 * @return
	 */
	List<StockVO> selectNumOfStocksPerMaterial(MainTO to);
	

}
