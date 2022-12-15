package com.jewelry.order.domain;

import org.springframework.web.multipart.MultipartFile;

import com.jewelry.common.domain.CommonTO;

public class OrderTO extends CommonTO {

	private Long order_no;
	private String store_cd;
	private String receipt_dt;
	private String expected_ord_dt;
	private Long customer_no;
	private String customer_nm;
	private String customer_cel;
	private String del_yn;
	private Long catalog_no;
	private String model_id;
	private Long vender_no;
	private String vender_nm;
	private String serial_id;
	private String material_cd;
	private String color_cd;
	private Integer quantity;
	private String main_stone_type;
	private String sub_stone_type;
	private String size;
	private String order_desc;
	private String order_type;
	private String order_step;
	private Long stock_no;

	private MultipartFile orderfile;
	
	private String[] serial_id_arr;
	private Long[] catalog_no_arr;
	private String[] model_id_arr;
	private Long[] vender_no_arr;
	private String[] vender_nm_arr;
	private String[] material_cd_arr;
	private String[] color_cd_arr;
	private Integer[] quantity_arr;
	private String[] main_stone_type_arr;
	private String[] sub_stone_type_arr;
	private String[] size_arr;
	private String[] order_desc_arr;
	
	private String searchstore;
	private String searchmaterial;
	private String searchstep;
	
	private Long[] order_no_arr;
		
	public Long getOrder_no() {
		return order_no;
	}
	public void setOrder_no(Long order_no) {
		this.order_no = order_no;
	}
	public String getStore_cd() {
		return store_cd;
	}
	public void setStore_cd(String store_cd) {
		this.store_cd = store_cd;
	}
	public String getReceipt_dt() {
		return receipt_dt;
	}
	public void setReceipt_dt(String receipt_dt) {
		this.receipt_dt = receipt_dt;
	}
	public String getExpected_ord_dt() {
		return expected_ord_dt;
	}
	public void setExpected_ord_dt(String expected_ord_dt) {
		this.expected_ord_dt = expected_ord_dt;
	}
	public Long getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(Long customer_no) {
		this.customer_no = customer_no;
	}
	public String getCustomer_nm() {
		return customer_nm;
	}
	public void setCustomer_nm(String customer_nm) {
		this.customer_nm = customer_nm;
	}
	public String getCustomer_cel() {
		return customer_cel;
	}
	public void setCustomer_cel(String customer_cel) {
		this.customer_cel = customer_cel;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String[] getSerial_id_arr() {
		return serial_id_arr;
	}
	public void setSerial_id_arr(String[] serial_id_arr) {
		this.serial_id_arr = serial_id_arr;
	}
	public Long[] getCatalog_no_arr() {
		return catalog_no_arr;
	}
	public void setCatalog_no_arr(Long[] catalog_no_arr) {
		this.catalog_no_arr = catalog_no_arr;
	}
	public Long[] getVender_no_arr() {
		return vender_no_arr;
	}
	public void setVender_no_arr(Long[] vender_no_arr) {
		this.vender_no_arr = vender_no_arr;
	}
	public String[] getMaterial_cd_arr() {
		return material_cd_arr;
	}
	public void setMaterial_cd_arr(String[] material_cd_arr) {
		this.material_cd_arr = material_cd_arr;
	}
	public String[] getColor_cd_arr() {
		return color_cd_arr;
	}
	public void setColor_cd_arr(String[] color_cd_arr) {
		this.color_cd_arr = color_cd_arr;
	}
	public Integer[] getQuantity_arr() {
		return quantity_arr;
	}
	public void setQuantity_arr(Integer[] quantity_arr) {
		this.quantity_arr = quantity_arr;
	}
	public String[] getMain_stone_type_arr() {
		return main_stone_type_arr;
	}
	public void setMain_stone_type_arr(String[] main_stone_type_arr) {
		this.main_stone_type_arr = main_stone_type_arr;
	}
	public String[] getSub_stone_type_arr() {
		return sub_stone_type_arr;
	}
	public void setSub_stone_type_arr(String[] sub_stone_type_arr) {
		this.sub_stone_type_arr = sub_stone_type_arr;
	}
	public String[] getSize_arr() {
		return size_arr;
	}
	public void setSize_arr(String[] size_arr) {
		this.size_arr = size_arr;
	}
	public String[] getOrder_desc_arr() {
		return order_desc_arr;
	}
	public void setOrder_desc_arr(String[] order_desc_arr) {
		this.order_desc_arr = order_desc_arr;
	}
	public String getSearchstore() {
		return searchstore;
	}
	public void setSearchstore(String searchstore) {
		this.searchstore = searchstore;
	}
	public String getSearchmaterial() {
		return searchmaterial;
	}
	public void setSearchmaterial(String searchmaterial) {
		this.searchmaterial = searchmaterial;
	}
	public String getSearchstep() {
		return searchstep;
	}
	public void setSearchstep(String searchstep) {
		this.searchstep = searchstep;
	}
	public MultipartFile getOrderfile() {
		return orderfile;
	}
	public void setOrderfile(MultipartFile orderfile) {
		this.orderfile = orderfile;
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
	public String getSerial_id() {
		return serial_id;
	}
	public void setSerial_id(String serial_id) {
		this.serial_id = serial_id;
	}
	public String getMaterial_cd() {
		return material_cd;
	}
	public void setMaterial_cd(String material_cd) {
		this.material_cd = material_cd;
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
	public String[] getModel_id_arr() {
		return model_id_arr;
	}
	public void setModel_id_arr(String[] model_id_arr) {
		this.model_id_arr = model_id_arr;
	}
	public String[] getVender_nm_arr() {
		return vender_nm_arr;
	}
	public void setVender_nm_arr(String[] vender_nm_arr) {
		this.vender_nm_arr = vender_nm_arr;
	}
	public String getModel_id() {
		return model_id;
	}
	public void setModel_id(String model_id) {
		this.model_id = model_id;
	}
	public String getVender_nm() {
		return vender_nm;
	}
	public void setVender_nm(String vender_nm) {
		this.vender_nm = vender_nm;
	}
	public String getOrder_type() {
		return order_type;
	}
	public void setOrder_type(String order_type) {
		this.order_type = order_type;
	}
	public String getOrder_step() {
		return order_step;
	}
	public void setOrder_step(String order_step) {
		this.order_step = order_step;
	}
	public Long[] getOrder_no_arr() {
		return order_no_arr;
	}
	public void setOrder_no_arr(Long[] order_no_arr) {
		this.order_no_arr = order_no_arr;
	}
	public Long getStock_no() {
		return stock_no;
	}
	public void setStock_no(Long stock_no) {
		this.stock_no = stock_no;
	}
	
}
