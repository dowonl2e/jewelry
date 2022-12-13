package com.jewelry.stock.domain;

import org.springframework.web.multipart.MultipartFile;

import com.jewelry.common.domain.CommonTO;

public class StockTO extends CommonTO {
	
	private Long stock_no;
	private String reg_dt;
	private String stock_type_cd;
	private String store_cd;
	private Integer real_pch_gold_price;
	private Long catalog_no;
	private String model_id;
	private Long vender_no;
	private String vender_nm;
	private String material_cd;
	private String color_cd;
	private String main_stone_type;
	private String sub_stone_type;
	private String size;
	private String stock_desc;
	private Integer quantity;
	private Double per_weight_gram;
	private Integer per_price_basic;
	private Integer per_price_add;
	private Integer per_price_main;
	private Integer per_price_sub;
	private Integer per_price_gold_real;
	private Integer multiple_cnt;
	private String origin_type;
	private String del_yn;
	private String sale_yn;
	private Integer sale_price;
	private String rec_pay_type_cd;
	private Integer card_price;
	private Integer cash_price;
	private Integer maint_price;
	private Integer etc_price;
	private Integer pnt_price;
	private Integer accu_pnt;
	
	private MultipartFile stockfile;
	
	private Long[] stock_no_arr;
	
	private Long[] catalog_no_arr;
	private String[] model_id_arr;
	private Long[] vender_no_arr;
	private String[] vender_nm_arr;
	private String[] material_cd_arr;
	private String[] color_cd_arr;
	private String[] main_stone_type_arr;
	private String[] sub_stone_type_arr;
	private String[] size_arr;
	private String[] stock_desc_arr;
	private Integer[] quantity_arr;
	private Double[] per_weight_gram_arr;
	private Integer[] per_price_basic_arr;
	private Integer[] per_price_add_arr;
	private Integer[] per_price_main_arr;
	private Integer[] per_price_sub_arr;
	private Integer[] per_price_gold_real_arr;
	private Integer[] multiple_cnt_arr;
	
	private String searchstore;
	private String searchmaterial;
	private String searchstocktype;
	
	//고객 주문
	private Long customer_no;
	private String customer_nm;
	private String customer_cel;
	
	private String sale_dt;
	
	public Long getStock_no() {
		return stock_no;
	}

	public void setStock_no(Long stock_no) {
		this.stock_no = stock_no;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getStock_type_cd() {
		return stock_type_cd;
	}

	public void setStock_type_cd(String stock_type_cd) {
		this.stock_type_cd = stock_type_cd;
	}

	public String getStore_cd() {
		return store_cd;
	}

	public void setStore_cd(String store_cd) {
		this.store_cd = store_cd;
	}

	public Integer getReal_pch_gold_price() {
		return real_pch_gold_price;
	}

	public void setReal_pch_gold_price(Integer real_pch_gold_price) {
		this.real_pch_gold_price = real_pch_gold_price;
	}

	public Long getCatalog_no() {
		return catalog_no;
	}

	public void setCatalog_no(Long catalog_no) {
		this.catalog_no = catalog_no;
	}

	public String getModel_id() {
		return model_id;
	}

	public void setModel_id(String model_id) {
		this.model_id = model_id;
	}

	public Long getVender_no() {
		return vender_no;
	}

	public void setVender_no(Long vender_no) {
		this.vender_no = vender_no;
	}

	public String getVender_nm() {
		return vender_nm;
	}

	public void setVender_nm(String vender_nm) {
		this.vender_nm = vender_nm;
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

	public String getStock_desc() {
		return stock_desc;
	}

	public void setStock_desc(String stock_desc) {
		this.stock_desc = stock_desc;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getPer_weight_gram() {
		return per_weight_gram;
	}

	public void setPer_weight_gram(Double per_weight_gram) {
		this.per_weight_gram = per_weight_gram;
	}

	public Integer getPer_price_basic() {
		return per_price_basic;
	}

	public void setPer_price_basic(Integer per_price_basic) {
		this.per_price_basic = per_price_basic;
	}

	public Integer getPer_price_add() {
		return per_price_add;
	}

	public void setPer_price_add(Integer per_price_add) {
		this.per_price_add = per_price_add;
	}

	public Integer getPer_price_main() {
		return per_price_main;
	}

	public void setPer_price_main(Integer per_price_main) {
		this.per_price_main = per_price_main;
	}

	public Integer getPer_price_sub() {
		return per_price_sub;
	}

	public void setPer_price_sub(Integer per_price_sub) {
		this.per_price_sub = per_price_sub;
	}

	public Integer getPer_price_gold_real() {
		return per_price_gold_real;
	}

	public void setPer_price_gold_real(Integer per_price_gold_real) {
		this.per_price_gold_real = per_price_gold_real;
	}
	
	public Integer getMultiple_cnt() {
		return multiple_cnt;
	}

	public void setMultiple_cnt(Integer multiple_cnt) {
		this.multiple_cnt = multiple_cnt;
	}

	public Integer[] getMultiple_cnt_arr() {
		return multiple_cnt_arr;
	}

	public void setMultiple_cnt_arr(Integer[] multiple_cnt_arr) {
		this.multiple_cnt_arr = multiple_cnt_arr;
	}

	public String getOrigin_type() {
		return origin_type;
	}

	public void setOrigin_type(String origin_type) {
		this.origin_type = origin_type;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public String getSale_yn() {
		return sale_yn;
	}

	public void setSale_yn(String sale_yn) {
		this.sale_yn = sale_yn;
	}

	public MultipartFile getStockfile() {
		return stockfile;
	}

	public void setStockfile(MultipartFile stockfile) {
		this.stockfile = stockfile;
	}

	public Long[] getStock_no_arr() {
		return stock_no_arr;
	}

	public void setStock_no_arr(Long[] stock_no_arr) {
		this.stock_no_arr = stock_no_arr;
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

	public String getSearchstocktype() {
		return searchstocktype;
	}

	public void setSearchstocktype(String searchstocktype) {
		this.searchstocktype = searchstocktype;
	}

	public Long[] getCatalog_no_arr() {
		return catalog_no_arr;
	}

	public void setCatalog_no_arr(Long[] catalog_no_arr) {
		this.catalog_no_arr = catalog_no_arr;
	}

	public String[] getModel_id_arr() {
		return model_id_arr;
	}

	public void setModel_id_arr(String[] model_id_arr) {
		this.model_id_arr = model_id_arr;
	}

	public Long[] getVender_no_arr() {
		return vender_no_arr;
	}

	public void setVender_no_arr(Long[] vender_no_arr) {
		this.vender_no_arr = vender_no_arr;
	}

	public String[] getVender_nm_arr() {
		return vender_nm_arr;
	}

	public void setVender_nm_arr(String[] vender_nm_arr) {
		this.vender_nm_arr = vender_nm_arr;
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

	public String[] getStock_desc_arr() {
		return stock_desc_arr;
	}

	public void setStock_desc_arr(String[] stock_desc_arr) {
		this.stock_desc_arr = stock_desc_arr;
	}

	public Integer[] getQuantity_arr() {
		return quantity_arr;
	}

	public void setQuantity_arr(Integer[] quantity_arr) {
		this.quantity_arr = quantity_arr;
	}

	public Double[] getPer_weight_gram_arr() {
		return per_weight_gram_arr;
	}

	public void setPer_weight_gram_arr(Double[] per_weight_gram_arr) {
		this.per_weight_gram_arr = per_weight_gram_arr;
	}

	public Integer[] getPer_price_basic_arr() {
		return per_price_basic_arr;
	}

	public void setPer_price_basic_arr(Integer[] per_price_basic_arr) {
		this.per_price_basic_arr = per_price_basic_arr;
	}

	public Integer[] getPer_price_add_arr() {
		return per_price_add_arr;
	}

	public void setPer_price_add_arr(Integer[] per_price_add_arr) {
		this.per_price_add_arr = per_price_add_arr;
	}

	public Integer[] getPer_price_main_arr() {
		return per_price_main_arr;
	}

	public void setPer_price_main_arr(Integer[] per_price_main_arr) {
		this.per_price_main_arr = per_price_main_arr;
	}

	public Integer[] getPer_price_sub_arr() {
		return per_price_sub_arr;
	}

	public void setPer_price_sub_arr(Integer[] per_price_sub_arr) {
		this.per_price_sub_arr = per_price_sub_arr;
	}

	public Integer[] getPer_price_gold_real_arr() {
		return per_price_gold_real_arr;
	}

	public void setPer_price_gold_real_arr(Integer[] per_price_gold_real_arr) {
		this.per_price_gold_real_arr = per_price_gold_real_arr;
	}

	public Integer getSale_price() {
		return sale_price;
	}

	public void setSale_price(Integer sale_price) {
		this.sale_price = sale_price;
	}

	public Integer getCash_price() {
		return cash_price;
	}

	public void setCash_price(Integer cash_price) {
		this.cash_price = cash_price;
	}

	public Integer getMaint_price() {
		return maint_price;
	}

	public void setMaint_price(Integer maint_price) {
		this.maint_price = maint_price;
	}

	public Integer getPnt_price() {
		return pnt_price;
	}

	public void setPnt_price(Integer pnt_price) {
		this.pnt_price = pnt_price;
	}

	public Integer getAccu_pnt() {
		return accu_pnt;
	}

	public void setAccu_pnt(Integer accu_pnt) {
		this.accu_pnt = accu_pnt;
	}

	public String getRec_pay_type_cd() {
		return rec_pay_type_cd;
	}

	public void setRec_pay_type_cd(String rec_pay_type_cd) {
		this.rec_pay_type_cd = rec_pay_type_cd;
	}

	public Integer getCard_price() {
		return card_price;
	}

	public void setCard_price(Integer card_price) {
		this.card_price = card_price;
	}

	public Integer getEtc_price() {
		return etc_price;
	}

	public void setEtc_price(Integer etc_price) {
		this.etc_price = etc_price;
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

	public String getSale_dt() {
		return sale_dt;
	}

	public void setSale_dt(String sale_dt) {
		this.sale_dt = sale_dt;
	}
	
}
