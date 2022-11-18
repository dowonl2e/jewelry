package com.jewelry.order.domain;

import java.util.List;

import com.jewelry.common.domain.CommonVO;
import com.jewelry.file.domain.FileVO;

public class OrderVO extends CommonVO {
	
	private List<OrderVO> list;
	
	private Long orderno;
	private String storecd;
	private String receiptdt;
	private String expectedorddt;
	private Long customerno;
	private String customernm;
	private String customercel;
	private String delyn;
	
	private List<OrderCatalogVO> ordercataloglist;
	
	private List<FileVO> filelist;

	public List<OrderVO> getList() {
		return list;
	}

	public void setList(List<OrderVO> list) {
		this.list = list;
	}

	public Long getOrderno() {
		return orderno;
	}

	public void setOrderno(Long orderno) {
		this.orderno = orderno;
	}

	public String getStorecd() {
		return storecd;
	}

	public void setStorecd(String storecd) {
		this.storecd = storecd;
	}

	public String getReceiptdt() {
		return receiptdt;
	}

	public void setReceiptdt(String receiptdt) {
		this.receiptdt = receiptdt;
	}

	public String getExpectedorddt() {
		return expectedorddt;
	}

	public void setExpectedorddt(String expectedorddt) {
		this.expectedorddt = expectedorddt;
	}

	public Long getCustomerno() {
		return customerno;
	}

	public void setCustomerno(Long customerno) {
		this.customerno = customerno;
	}

	public String getCustomernm() {
		return customernm;
	}

	public void setCustomernm(String customernm) {
		this.customernm = customernm;
	}

	public String getCustomercel() {
		return customercel;
	}

	public void setCustomercel(String customercel) {
		this.customercel = customercel;
	}

	public String getDelyn() {
		return delyn;
	}

	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}

	public List<OrderCatalogVO> getOrdercataloglist() {
		return ordercataloglist;
	}

	public void setOrdercataloglist(List<OrderCatalogVO> ordercataloglist) {
		this.ordercataloglist = ordercataloglist;
	}

	public List<FileVO> getFilelist() {
		return filelist;
	}

	public void setFilelist(List<FileVO> filelist) {
		this.filelist = filelist;
	}
	
}
