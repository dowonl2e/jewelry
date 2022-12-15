package com.jewelry.sale.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.jewelry.order.domain.OrderTO;
import com.jewelry.order.mapper.OrderMapper;
import com.jewelry.sale.domain.SaleTO;
import com.jewelry.sale.mapper.SaleMapper;
import com.jewelry.sale.service.SaleService;
import com.jewelry.stock.domain.StockTO;
import com.jewelry.stock.mapper.StockMapper;

@Service
public class SaleServiceImpl implements SaleService {

	@Autowired
	private SaleMapper saleMapper;

	@Autowired
	private StockMapper stockMapper;

	@Autowired
	private OrderMapper orderMapper;
	
	@Transactional(readOnly = true)
	@Override
	public Map<String, Object> findAllSale(SaleTO to) {
		Map<String, Object> response = new HashMap<>();
		to.setTotalcount(saleMapper.selectSaleListCount(to));
		response.put("list", saleMapper.selectSaleList(to));
		response.put("params", to);
		
		return response;
	}

	@Transactional
	@Override
	public String updateSalesToStock(SaleTO to) {
		String result = "fail";
		try {
			
			if(to.getSale_no_arr() != null && to.getSale_no_arr().length > 0)
				return saleMapper.updateSalesToStock(to) > 0 ? "success" : "fail";
			
		}
		catch(Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = "fail";
		}
		return result;
	}
	
	@Transactional
	@Override
	public String updateSalesCustomer(SaleTO to) {
		String result = "fail";
		try {
			
			int res = 0;
			if(to.getSale_arr() != null && to.getSale_arr().length > 0) {
				List<Long> stockNoList = new ArrayList<>();
				List<Long> orderNoList = new ArrayList<>();
				
				for(String sale : to.getSale_arr()) {
					String[] sales = sale.split("_");
					if(sales.length == 2) {
						if(sales[1].equals("STOCK")) stockNoList.add(Long.parseLong(sales[0]));
						if(sales[1].equals("ORDER")) orderNoList.add(Long.parseLong(sales[0]));
					}
				}
				
				if(stockNoList.size() > 0) {
					StockTO stockto = new StockTO();
					stockto.setStock_no_arr(stockNoList.toArray(Long[]::new));
					stockto.setCustomer_no(to.getCustomer_no());
					stockto.setCustomer_nm(to.getCustomer_nm());
					stockto.setUpdt_id(to.getUpdt_id());
					res += stockMapper.updateStocksCustomer(stockto);
				}
				
				if(orderNoList.size() > 0) {
					OrderTO orderto = new OrderTO();
					orderto.setOrder_no_arr(orderNoList.toArray(Long[]::new));
					orderto.setCustomer_no(to.getCustomer_no());
					orderto.setCustomer_nm(to.getCustomer_nm());
					orderto.setCustomer_cel(to.getCustomer_cel());
					orderto.setUpdt_id(to.getUpdt_id());
					res += orderMapper.updateOrdersCustomer(orderto);
				}
				
			}
			return res > 0 ? "success" : "fail";
			
		}
		catch(Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = "fail";
		}
		return result;
	}
	
	@Transactional
	@Override
	public String updateSalesDate(SaleTO to) {
		String result = "fail";
		try {
			
			int res = 0;
			if(to.getSale_arr() != null && to.getSale_arr().length > 0) {
				List<Long> stockNoList = new ArrayList<>();
				List<Long> orderNoList = new ArrayList<>();
				
				for(String sale : to.getSale_arr()) {
					String[] sales = sale.split("_");
					if(sales.length == 2) {
						if(sales[1].equals("STOCK")) stockNoList.add(Long.parseLong(sales[0]));
						if(sales[1].equals("ORDER")) orderNoList.add(Long.parseLong(sales[0]));
					}
				}
				
				if(stockNoList.size() > 0) {
					StockTO stockto = new StockTO();
					stockto.setStock_no_arr(stockNoList.toArray(Long[]::new));
					stockto.setSale_dt(to.getSale_dt());
					stockto.setUpdt_id(to.getUpdt_id());
					res += stockMapper.updateStocksSaleDate(stockto);
				}
				
				if(orderNoList.size() > 0) {
					OrderTO orderto = new OrderTO();
					orderto.setOrder_no_arr(orderNoList.toArray(Long[]::new));
					orderto.setReceipt_dt(to.getSale_dt());
					orderto.setUpdt_id(to.getUpdt_id());
					res += orderMapper.updateOrdersSaleDate(orderto);
				}
				
			}
			return res > 0 ? "success" : "fail";
			
		}
		catch(Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = "fail";
		}
		return result;
	}
}
