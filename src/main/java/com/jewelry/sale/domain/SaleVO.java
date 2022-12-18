package com.jewelry.sale.domain;

import java.util.List;

import com.jewelry.common.domain.CommonVO;

public class SaleVO extends CommonVO {
	
	private List<SaleVO> list;
	
	private String storecd;
	private String saledt;
	private String saleday;
	private String saletype;
	private String saletype2;
	private Long customerno;
	private String customernm;
	private Long saleno;
	private Long catalogno;
	private String modelid;
	private Integer realpchgoldprice;
	private Double perweightgram;
	private String materialcd;
	private String saledesc;
	private String mainstonetype;
	private String substonetype;
	private String quantity;
	private Integer purchaseprice;
	private Integer consumerprice;
	private Integer saleprice;
	private String recpaytypecd;
	private Integer cardprice;
	private Integer cashprice;
	private Integer maintprice;
	private Integer pntprice;
	private Integer etcprice;
	private Integer accupnt;
	
	private Integer salemonth;
	
	public List<SaleVO> getList() {
		return list;
	}
	public void setList(List<SaleVO> list) {
		this.list = list;
	}
	public String getStorecd() {
		return storecd;
	}
	public void setStorecd(String storecd) {
		this.storecd = storecd;
	}
	public String getSaledt() {
		return saledt;
	}
	public void setSaledt(String saledt) {
		this.saledt = saledt;
	}
	public String getSaletype() {
		return saletype;
	}
	public void setSaletype(String saletype) {
		this.saletype = saletype;
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
	public Long getSaleno() {
		return saleno;
	}
	public void setSaleno(Long saleno) {
		this.saleno = saleno;
	}
	public Long getCatalogno() {
		return catalogno;
	}
	public void setCatalogno(Long catalogno) {
		this.catalogno = catalogno;
	}
	public String getModelid() {
		return modelid;
	}
	public void setModelid(String modelid) {
		this.modelid = modelid;
	}
	public String getMaterialcd() {
		return materialcd;
	}
	public void setMaterialcd(String materialcd) {
		this.materialcd = materialcd;
	}
	public String getSaledesc() {
		return saledesc;
	}
	public void setSaledesc(String saledesc) {
		this.saledesc = saledesc;
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
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public Integer getPurchaseprice() {
		return purchaseprice;
	}
	public void setPurchaseprice(Integer purchaseprice) {
		this.purchaseprice = purchaseprice;
	}
	public Integer getConsumerprice() {
		return consumerprice;
	}
	public void setConsumerprice(Integer consumerprice) {
		this.consumerprice = consumerprice;
	}
	public Integer getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(Integer saleprice) {
		this.saleprice = saleprice;
	}
	public Integer getCashprice() {
		return cashprice;
	}
	public void setCashprice(Integer cashprice) {
		this.cashprice = cashprice;
	}
	public Integer getMaintprice() {
		return maintprice;
	}
	public void setMaintprice(Integer maintprice) {
		this.maintprice = maintprice;
	}
	public Integer getPntprice() {
		return pntprice;
	}
	public void setPntprice(Integer pntprice) {
		this.pntprice = pntprice;
	}
	public Integer getEtcprice() {
		return etcprice;
	}
	public void setEtcprice(Integer etcprice) {
		this.etcprice = etcprice;
	}
	public Integer getAccupnt() {
		return accupnt;
	}
	public void setAccupnt(Integer accupnt) {
		this.accupnt = accupnt;
	}
	public String getSaleday() {
		return saleday;
	}
	public void setSaleday(String saleday) {
		this.saleday = saleday;
	}
	public String getSaletype2() {
		return saletype2;
	}
	public void setSaletype2(String saletype2) {
		this.saletype2 = saletype2;
	}
	public String getRecpaytypecd() {
		return recpaytypecd;
	}
	public void setRecpaytypecd(String recpaytypecd) {
		this.recpaytypecd = recpaytypecd;
	}
	public Integer getCardprice() {
		return cardprice;
	}
	public void setCardprice(Integer cardprice) {
		this.cardprice = cardprice;
	}
	public Integer getRealpchgoldprice() {
		return realpchgoldprice;
	}
	public void setRealpchgoldprice(Integer realpchgoldprice) {
		this.realpchgoldprice = realpchgoldprice;
	}
	public Double getPerweightgram() {
		return perweightgram;
	}
	public void setPerweightgram(Double perweightgram) {
		this.perweightgram = perweightgram;
	}
	public Integer getSalemonth() {
		return salemonth;
	}
	public void setSalemonth(Integer salemonth) {
		this.salemonth = salemonth;
	}
	
	
}
