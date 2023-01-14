package com.jewelry.cash.domain;

import java.util.List;

import com.jewelry.common.domain.CommonVO;

public class CashVO extends CommonVO {

	private List<CashVO> list;
	
	private Long cashno;
	private String regdt;
	private String regday;
	private String storecd;
	private String cashtypecd;
	private String cashtypecd2;
	private String bankbookcd;
	private Long venderno;
	private String vendernm;
	private String historydesc;
	private String materialcd;
	private Double weightgram;
	private Integer quantity;
	private Integer unitprice;
	
	private Integer statsord;
	private String statscd;
	private Integer befYesterdayPrice;
	private Integer yesterdayprice;
	private Integer todayprice;
	
	public List<CashVO> getList() {
		return list;
	}
	public void setList(List<CashVO> list) {
		this.list = list;
	}
	public Long getCashno() {
		return cashno;
	}
	public void setCashno(Long cashno) {
		this.cashno = cashno;
	}
	public String getRegdt() {
		return regdt;
	}
	public void setRegdt(String regdt) {
		this.regdt = regdt;
	}
	public String getStorecd() {
		return storecd;
	}
	public void setStorecd(String storecd) {
		this.storecd = storecd;
	}
	public String getCashtypecd() {
		return cashtypecd;
	}
	public void setCashtypecd(String cashtypecd) {
		this.cashtypecd = cashtypecd;
	}
	public String getCashtypecd2() {
		return cashtypecd2;
	}
	public void setCashtypecd2(String cashtypecd2) {
		this.cashtypecd2 = cashtypecd2;
	}
	public String getBankbookcd() {
		return bankbookcd;
	}
	public void setBankbookcd(String bankbookcd) {
		this.bankbookcd = bankbookcd;
	}
	public Long getVenderno() {
		return venderno;
	}
	public void setVenderno(Long venderno) {
		this.venderno = venderno;
	}
	public String getVendernm() {
		return vendernm;
	}
	public void setVendernm(String vendernm) {
		this.vendernm = vendernm;
	}
	public String getHistorydesc() {
		return historydesc;
	}
	public void setHistorydesc(String historydesc) {
		this.historydesc = historydesc;
	}
	public String getMaterialcd() {
		return materialcd;
	}
	public void setMaterialcd(String materialcd) {
		this.materialcd = materialcd;
	}
	public Double getWeightgram() {
		return weightgram;
	}
	public void setWeightgram(Double weightgram) {
		this.weightgram = weightgram;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(Integer unitprice) {
		this.unitprice = unitprice;
	}
	public String getRegday() {
		return regday;
	}
	public void setRegday(String regday) {
		this.regday = regday;
	}
	public Integer getStatsord() {
		return statsord;
	}
	public void setStatsord(Integer statsord) {
		this.statsord = statsord;
	}
	public String getStatscd() {
		return statscd;
	}
	public void setStatscd(String statscd) {
		this.statscd = statscd;
	}
	public Integer getYesterdayprice() {
		return yesterdayprice;
	}
	public void setYesterdayprice(Integer yesterdayprice) {
		this.yesterdayprice = yesterdayprice;
	}
	public Integer getTodayprice() {
		return todayprice;
	}
	public void setTodayprice(Integer todayprice) {
		this.todayprice = todayprice;
	}
	public Integer getBefYesterdayPrice() {
		return befYesterdayPrice;
	}
	public void setBefYesterdayPrice(Integer befYesterdayPrice) {
		this.befYesterdayPrice = befYesterdayPrice;
	}
	
}
