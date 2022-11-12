package com.jewelry.customer.domain;

import com.jewelry.common.domain.CommonTO;

public class CustomerTO extends CommonTO {
	
	private Long customer_no;
	private String store_cd;
	private String contract_cd;
	private String zipcode;
	private String address1;
	private String address2;
	private String etc;
	private String contractor_nm;
	private String contractor_gen;
	private String contractor_cel;
	private String contractor_birth;
	private String contractor_lunar;
	private String contractor_email;
    private String del_yn;
	private String reg_dt;
	
	public Long getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(Long customer_no) {
		this.customer_no = customer_no;
	}
	public String getStore_cd() {
		return store_cd;
	}
	public void setStore_cd(String store_cd) {
		this.store_cd = store_cd;
	}
	public String getContract_cd() {
		return contract_cd;
	}
	public void setContract_cd(String contract_cd) {
		this.contract_cd = contract_cd;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getContractor_nm() {
		return contractor_nm;
	}
	public void setContractor_nm(String contractor_nm) {
		this.contractor_nm = contractor_nm;
	}
	public String getContractor_gen() {
		return contractor_gen;
	}
	public void setContractor_gen(String contractor_gen) {
		this.contractor_gen = contractor_gen;
	}
	public String getContractor_cel() {
		return contractor_cel;
	}
	public void setContractor_cel(String contractor_cel) {
		this.contractor_cel = contractor_cel;
	}
	public String getContractor_birth() {
		return contractor_birth;
	}
	public void setContractor_birth(String contractor_birth) {
		this.contractor_birth = contractor_birth;
	}
	public String getContractor_lunar() {
		return contractor_lunar;
	}
	public void setContractor_lunar(String contractor_lunar) {
		this.contractor_lunar = contractor_lunar;
	}
	public String getContractor_email() {
		return contractor_email;
	}
	public void setContractor_email(String contractor_email) {
		this.contractor_email = contractor_email;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	
}
