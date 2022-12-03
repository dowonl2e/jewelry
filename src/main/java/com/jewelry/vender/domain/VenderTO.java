package com.jewelry.vender.domain;

import com.jewelry.common.domain.CommonTO;

public class VenderTO extends CommonTO {
	private Long vender_no;
	private String vender_nm;
	private String business_nm;
	private String agent_cel;
	private String vat_cd;
	private String melt_cd;
	private String vender_fax;
	private String vender_cel1;
	private String vender_cel2;
	private String manager_nm;
	private String manager_cel;
	private String manager_email;
	private String etc;
	private String del_yn;
	private String inpt_dt;
	private String commerce;
	
	private Long[] vender_no_arr;
	
	public Long[] getVender_no_arr() {
		return vender_no_arr;
	}
	public void setVender_no_arr(Long[] vender_no_arr) {
		this.vender_no_arr = vender_no_arr;
	}
	public String getCommerce() {
		return commerce;
	}
	public void setCommerce(String commerce) {
		this.commerce = commerce;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getInpt_dt() {
		return inpt_dt;
	}
	public void setInpt_dt(String inpt_dt) {
		this.inpt_dt = inpt_dt;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
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
	public String getBusiness_nm() {
		return business_nm;
	}
	public void setBusiness_nm(String business_nm) {
		this.business_nm = business_nm;
	}
	public String getAgent_cel() {
		return agent_cel;
	}
	public void setAgent_cel(String agent_cel) {
		this.agent_cel = agent_cel;
	}
	public String getVat_cd() {
		return vat_cd;
	}
	public void setVat_cd(String vat_cd) {
		this.vat_cd = vat_cd;
	}
	public String getMelt_cd() {
		return melt_cd;
	}
	public void setMelt_cd(String melt_cd) {
		this.melt_cd = melt_cd;
	}
	public String getVender_fax() {
		return vender_fax;
	}
	public void setVender_fax(String vender_fax) {
		this.vender_fax = vender_fax;
	}
	public String getVender_cel1() {
		return vender_cel1;
	}
	public void setVender_cel1(String vender_cel1) {
		this.vender_cel1 = vender_cel1;
	}
	public String getVender_cel2() {
		return vender_cel2;
	}
	public void setVender_cel2(String vender_cel2) {
		this.vender_cel2 = vender_cel2;
	}
	public String getManager_nm() {
		return manager_nm;
	}
	public void setManager_nm(String manager_nm) {
		this.manager_nm = manager_nm;
	}
	public String getManager_cel() {
		return manager_cel;
	}
	public void setManager_cel(String manager_cel) {
		this.manager_cel = manager_cel;
	}
	public String getManager_email() {
		return manager_email;
	}
	public void setManager_email(String manager_email) {
		this.manager_email = manager_email;
	}
}
