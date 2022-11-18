package com.jewelry.order.domain;

public class OrderCatalogTO {

	private Long order_cat_no;
	private Long order_no;
	private Long catalog_no;
	private Long vender_no;
	private String serial_id;
	private String mateial_cd;
	private String color_cd;
	private Integer quantity;
	private String main_stone_type;
	private String sub_stone_type;
	private String size;
	private String order_desc;
	private String inpt_id;
	private String updt_id;
	
	public Long getOrder_cat_no() {
		return order_cat_no;
	}
	public void setOrder_cat_no(Long order_cat_no) {
		this.order_cat_no = order_cat_no;
	}
	public String getSerial_id() {
		return serial_id;
	}
	public void setSerial_id(String serial_id) {
		this.serial_id = serial_id;
	}
	public Long getOrder_no() {
		return order_no;
	}
	public void setOrder_no(Long order_no) {
		this.order_no = order_no;
	}
	public Long getCatalog_no() {
		return catalog_no;
	}
	public void setCatalog_no(Long catalog_no) {
		this.catalog_no = catalog_no;
	}
	public Long getVender_no() {
		return vender_no;
	}
	public void setVender_no(Long vender_no) {
		this.vender_no = vender_no;
	}
	public String getMateial_cd() {
		return mateial_cd;
	}
	public void setMateial_cd(String mateial_cd) {
		this.mateial_cd = mateial_cd;
	}
	public String getColor_cd() {
		return color_cd;
	}
	public void setColor_cd(String color_cd) {
		this.color_cd = color_cd;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getMain_stone_type() {
		return main_stone_type;
	}
	public void setMain_stone_type(String main_stone_type) {
		this.main_stone_type = main_stone_type;
	}
	public String getSub_stone_type() {
		return sub_stone_type;
	}
	public void setSub_stone_type(String sub_stone_type) {
		this.sub_stone_type = sub_stone_type;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getOrder_desc() {
		return order_desc;
	}
	public void setOrder_desc(String order_desc) {
		this.order_desc = order_desc;
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
