package com.jewelry.order.domain;

public class OrderCatalogVO {
	
	private Long ordercatno;
	private Long orderno;
	private Long catalogno;
	private Long venderno;
	private String serialid;
	private String mateialcd;
	private String colorcd;
	private Integer quantity;
	private String mainstonetype;
	private String substonetype;
	private String size;
	private String orderdesc;

	private String vendernm;
	private String ordertype;
	private String storecd;
	private String receiptdt;
	private String expectedorddt;
	private Long customerno;
	private String customernm;
	private String customercel;
	
	public Long getOrdercatno() {
		return ordercatno;
	}
	public void setOrdercatno(Long ordercatno) {
		this.ordercatno = ordercatno;
	}
	public Long getOrderno() {
		return orderno;
	}
	public void setOrderno(Long orderno) {
		this.orderno = orderno;
	}
	public Long getCatalogno() {
		return catalogno;
	}
	public void setCatalogno(Long catalogno) {
		this.catalogno = catalogno;
	}
	public Long getVenderno() {
		return venderno;
	}
	public void setVenderno(Long venderno) {
		this.venderno = venderno;
	}
	public String getSerialid() {
		return serialid;
	}
	public void setSerialid(String serialid) {
		this.serialid = serialid;
	}
	public String getMateialcd() {
		return mateialcd;
	}
	public void setMateialcd(String mateialcd) {
		this.mateialcd = mateialcd;
	}
	public String getColorcd() {
		return colorcd;
	}
	public void setColorcd(String colorcd) {
		this.colorcd = colorcd;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getMainstonetype() {
		return mainstonetype;
	}
	public void setMainstonetype(String mainstonetype) {
		this.mainstonetype = mainstonetype;
	}
	public String getSubstonetype() {
		return substonetype;
	}
	public void setSubstonetype(String substonetype) {
		this.substonetype = substonetype;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getOrderdesc() {
		return orderdesc;
	}
	public void setOrderdesc(String orderdesc) {
		this.orderdesc = orderdesc;
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
	public String getOrdertype() {
		return ordertype;
	}
	public void setOrdertype(String ordertype) {
		this.ordertype = ordertype;
	}
	public String getVendernm() {
		return vendernm;
	}
	public void setVendernm(String vendernm) {
		this.vendernm = vendernm;
	}
	
}
