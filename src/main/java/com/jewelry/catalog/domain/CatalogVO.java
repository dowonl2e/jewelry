package com.jewelry.catalog.domain;

import java.util.List;

import com.jewelry.common.domain.CommonVO;

public class CatalogVO extends CommonVO {

	private List<CatalogVO> list;
	
	private Long catalogno;
	private Long venderid;
	private String modelid;
	private String modelnm;
	private String stddmaterialcd;
	private String stddweightcd;
	private String stddsize;
	private String odrnotice;
	private String regdt;
	private String delyn;

	private String vendernm;

	public List<CatalogVO> getList() {
		return list;
	}
	public void setList(List<CatalogVO> list) {
		this.list = list;
	}
	public Long getCatalogno() {
		return catalogno;
	}
	public void setCatalogno(Long catalogno) {
		this.catalogno = catalogno;
	}
	public Long getVenderid() {
		return venderid;
	}
	public void setVenderid(Long venderid) {
		this.venderid = venderid;
	}
	public String getModelid() {
		return modelid;
	}
	public void setModelid(String modelid) {
		this.modelid = modelid;
	}
	public String getModelnm() {
		return modelnm;
	}
	public void setModelnm(String modelnm) {
		this.modelnm = modelnm;
	}
	public String getStddmaterialcd() {
		return stddmaterialcd;
	}
	public void setStddmaterialcd(String stddmaterialcd) {
		this.stddmaterialcd = stddmaterialcd;
	}
	public String getStddweightcd() {
		return stddweightcd;
	}
	public void setStddweightcd(String stddweightcd) {
		this.stddweightcd = stddweightcd;
	}
	public String getStddsize() {
		return stddsize;
	}
	public void setStddsize(String stddsize) {
		this.stddsize = stddsize;
	}
	public String getOdrnotice() {
		return odrnotice;
	}
	public void setOdrnotice(String odrnotice) {
		this.odrnotice = odrnotice;
	}
	public String getRegdt() {
		return regdt;
	}
	public void setRegdt(String regdt) {
		this.regdt = regdt;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public String getVendernm() {
		return vendernm;
	}
	public void setVendernm(String vendernm) {
		this.vendernm = vendernm;
	}
	
	
}
