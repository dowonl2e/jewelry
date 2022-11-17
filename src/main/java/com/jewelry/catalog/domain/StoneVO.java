package com.jewelry.catalog.domain;

public class StoneVO {
	
	private Long stoneno;
	private Long catalogno;
	private String stonetypecd;
	private String stonenm;
	private Integer beadcnt;
	private String purchaseprice;
	private String stonedesc;
	
	public Long getStoneno() {
		return stoneno;
	}
	public void setStoneno(Long stoneno) {
		this.stoneno = stoneno;
	}
	public Long getCatalogno() {
		return catalogno;
	}
	public void setCatalogno(Long catalogno) {
		this.catalogno = catalogno;
	}
	public String getStonetypecd() {
		return stonetypecd;
	}
	public void setStonetypecd(String stonetypecd) {
		this.stonetypecd = stonetypecd;
	}
	public String getStonenm() {
		return stonenm;
	}
	public void setStonenm(String stonenm) {
		this.stonenm = stonenm;
	}
	public Integer getBeadcnt() {
		return beadcnt;
	}
	public void setBeadcnt(Integer beadcnt) {
		this.beadcnt = beadcnt;
	}
	public String getPurchaseprice() {
		return purchaseprice;
	}
	public void setPurchaseprice(String purchaseprice) {
		this.purchaseprice = purchaseprice;
	}
	public String getStonedesc() {
		return stonedesc;
	}
	public void setStonedesc(String stonedesc) {
		this.stonedesc = stonedesc;
	}
	
	
}
