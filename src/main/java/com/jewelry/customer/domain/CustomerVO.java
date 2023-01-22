package com.jewelry.customer.domain;

import java.util.List;
import java.util.Map;

import com.jewelry.common.domain.CommonVO;

public class CustomerVO extends CommonVO {
	
	private List<CustomerVO> list;
	
	private Long customerno;
	private String storecd;
	private String storenm;
	private String contractcd;
	private String contractnm;
	private String zipcode;
	private String address1;
	private String address2;
	private String etc;
	private String contractornm;
	private String contractorgen;
	private String contractorcel;
	private String contractorbirth;
	private String contractorlunar;
	private String contractoremail;
    private String delyn;
	private String regdt;
	
	private Integer ordercnt;
	private Integer repaircnt;
	private Integer reservecnt;
	private Integer saleCnt;
	private Integer saleprice;
	
	private Map<String, String> codemap;
	
	
	public List<CustomerVO> getList() {
		return list;
	}
	public void setList(List<CustomerVO> list) {
		this.list = list;
	}
	public Long getCustomerno() {
		return customerno;
	}
	public void setCustomerno(Long customerno) {
		this.customerno = customerno;
	}
	public String getStorecd() {
		return storecd;
	}
	public void setStorecd(String storecd) {
		this.storecd = storecd;
	}
	public String getStorenm() {
		return storenm;
	}
	public void setStorenm(String storenm) {
		this.storenm = storenm;
	}
	public String getContractcd() {
		return contractcd;
	}
	public void setContractcd(String contractcd) {
		this.contractcd = contractcd;
	}
	public String getContractnm() {
		return contractnm;
	}
	public void setContractnm(String contractnm) {
		this.contractnm = contractnm;
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
	public String getContractornm() {
		return contractornm;
	}
	public void setContractornm(String contractornm) {
		this.contractornm = contractornm;
	}
	public String getContractorgen() {
		return contractorgen;
	}
	public void setContractorgen(String contractorgen) {
		this.contractorgen = contractorgen;
	}
	public String getContractorcel() {
		return contractorcel;
	}
	public void setContractorcel(String contractorcel) {
		this.contractorcel = contractorcel;
	}
	public String getContractorbirth() {
		return contractorbirth;
	}
	public void setContractorbirth(String contractorbirth) {
		this.contractorbirth = contractorbirth;
	}
	public String getContractorlunar() {
		return contractorlunar;
	}
	public void setContractorlunar(String contractorlunar) {
		this.contractorlunar = contractorlunar;
	}
	public String getContractoremail() {
		return contractoremail;
	}
	public void setContractoremail(String contractoremail) {
		this.contractoremail = contractoremail;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public String getRegdt() {
		return regdt;
	}
	public void setRegdt(String regdt) {
		this.regdt = regdt;
	}
	public Map<String, String> getCodemap() {
		return codemap;
	}
	public void setCodemap(Map<String, String> codemap) {
		this.codemap = codemap;
	}
	public Integer getOrdercnt() {
		return ordercnt;
	}
	public void setOrdercnt(Integer ordercnt) {
		this.ordercnt = ordercnt;
	}
	public Integer getRepaircnt() {
		return repaircnt;
	}
	public void setRepaircnt(Integer repaircnt) {
		this.repaircnt = repaircnt;
	}
	public Integer getReservecnt() {
		return reservecnt;
	}
	public void setReservecnt(Integer reservecnt) {
		this.reservecnt = reservecnt;
	}
	public Integer getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(Integer saleprice) {
		this.saleprice = saleprice;
	}
	public Integer getSaleCnt() {
		return saleCnt;
	}
	public void setSaleCnt(Integer saleCnt) {
		this.saleCnt = saleCnt;
	}
}
