package com.jewelry.vender.domain;

import com.jewelry.common.domain.CommonTO;

public class VenderPayTO extends CommonTO {

	private Long pay_no;
	private Long vender_no;
	private String reg_dt;
	private String store_cd;
	private String expt_gold_gram;
	private String expt_pay_price;
	private String prg_gold_gram;
	private String prg_pay_price;
	private String pay_etc;

	private Long[] pay_no_arr;

	private String searchstore;

	public Long getPay_no() {
		return pay_no;
	}

	public void setPay_no(Long pay_no) {
		this.pay_no = pay_no;
	}

	public Long getVender_no() {
		return vender_no;
	}

	public void setVender_no(Long vender_no) {
		this.vender_no = vender_no;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getStore_cd() {
		return store_cd;
	}

	public void setStore_cd(String store_cd) {
		this.store_cd = store_cd;
	}

	public String getExpt_gold_gram() {
		return expt_gold_gram;
	}

	public void setExpt_gold_gram(String expt_gold_gram) {
		this.expt_gold_gram = expt_gold_gram;
	}

	public String getExpt_pay_price() {
		return expt_pay_price;
	}

	public void setExpt_pay_price(String expt_pay_price) {
		this.expt_pay_price = expt_pay_price;
	}

	public String getPrg_gold_gram() {
		return prg_gold_gram;
	}

	public void setPrg_gold_gram(String prg_gold_gram) {
		this.prg_gold_gram = prg_gold_gram;
	}

	public String getPrg_pay_price() {
		return prg_pay_price;
	}

	public void setPrg_pay_price(String prg_pay_price) {
		this.prg_pay_price = prg_pay_price;
	}

	public String getPay_etc() {
		return pay_etc;
	}

	public void setPay_etc(String pay_etc) {
		this.pay_etc = pay_etc;
	}

	public Long[] getPay_no_arr() {
		return pay_no_arr;
	}

	public void setPay_no_arr(Long[] pay_no_arr) {
		this.pay_no_arr = pay_no_arr;
	}

	public String getSearchstore() {
		return searchstore;
	}

	public void setSearchstore(String searchstore) {
		this.searchstore = searchstore;
	}
	
	
}
