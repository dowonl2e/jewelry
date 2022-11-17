package com.jewelry.catalog.domain;

public class StoneTO {
	
	private Long stone_no;
	private Long catalog_no;
	private String stone_type_cd;
	private String stone_nm;
	private Integer bead_cnt;
	private String purchase_price;
	private String stone_desc;
	private String inpt_id;
	private String updt_id;
	
	public Long getStone_no() {
		return stone_no;
	}
	public void setStone_no(Long stone_no) {
		this.stone_no = stone_no;
	}
	public Long getCatalog_no() {
		return catalog_no;
	}
	public void setCatalog_no(Long catalog_no) {
		this.catalog_no = catalog_no;
	}
	public String getStone_type_cd() {
		return stone_type_cd;
	}
	public void setStone_type_cd(String stone_type_cd) {
		this.stone_type_cd = stone_type_cd;
	}
	public String getStone_nm() {
		return stone_nm;
	}
	public void setStone_nm(String stone_nm) {
		this.stone_nm = stone_nm;
	}
	public Integer getBead_cnt() {
		return bead_cnt;
	}
	public void setBead_cnt(Integer bead_cnt) {
		this.bead_cnt = bead_cnt;
	}
	public String getPurchase_price() {
		return purchase_price;
	}
	public void setPurchase_price(String purchase_price) {
		this.purchase_price = purchase_price;
	}
	public String getStone_desc() {
		return stone_desc;
	}
	public void setStone_desc(String stone_desc) {
		this.stone_desc = stone_desc;
	}
	public String getInpt_id() {
		return inpt_id;
	}
	public void setInpt_id(String inpt_id) {
		this.inpt_id = inpt_id;
	}
	public String getUpdt_id() {
		return updt_id;
	}
	public void setUpdt_id(String updt_id) {
		this.updt_id = updt_id;
	}
	
}
