package com.jewelry.vender.domain;

import java.util.List;

import com.jewelry.common.domain.CommonVO;

public class VenderVO extends CommonVO {

	private List<VenderVO> list;
	
	private Long venderno;
	private String vendernm;
	private String businessnm;
	private String agentcel;
	private String vatcd;
	private String meltcd;
	private String etc;
	private String commerce;
	private String venderfax;
	private String vendercel1;
	private String vendercel2;
	private String managernm;
	private String managercel;
	private String manageremail;
	private String delyn;
	
	
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
	public String getInptdt() {
		return inptdt;
	}
	public void setInptdt(String inptdt) {
		this.inptdt = inptdt;
	}
	private String inptdt;
	
	public List<VenderVO> getList() {
		return list;
	}
	public void setList(List<VenderVO> list) {
		this.list = list;
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
	public String getBusinessnm() {
		return businessnm;
	}
	public void setBusinessnm(String businessnm) {
		this.businessnm = businessnm;
	}
	public String getAgentcel() {
		return agentcel;
	}
	public void setAgentcel(String agentcel) {
		this.agentcel = agentcel;
	}
	public String getVatcd() {
		return vatcd;
	}
	public void setVatcd(String vatcd) {
		this.vatcd = vatcd;
	}
	public String getMeltcd() {
		return meltcd;
	}
	public void setMeltcd(String meltcd) {
		this.meltcd = meltcd;
	}
	public String getVenderfax() {
		return venderfax;
	}
	public void setVenderfax(String venderfax) {
		this.venderfax = venderfax;
	}
	public String getVendercel1() {
		return vendercel1;
	}
	public void setVendercel1(String vendercel1) {
		this.vendercel1 = vendercel1;
	}
	public String getVendercel2() {
		return vendercel2;
	}
	public void setVendercel2(String vendercel2) {
		this.vendercel2 = vendercel2;
	}
	public String getManagernm() {
		return managernm;
	}
	public void setManagernm(String managernm) {
		this.managernm = managernm;
	}
	public String getManagercel() {
		return managercel;
	}
	public void setManagercel(String managercel) {
		this.managercel = managercel;
	}
	public String getManageremail() {
		return manageremail;
	}
	public void setManageremail(String manageremail) {
		this.manageremail = manageremail;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
}
