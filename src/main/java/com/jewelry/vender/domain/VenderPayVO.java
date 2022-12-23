package com.jewelry.vender.domain;

import java.util.List;

import com.jewelry.common.domain.CommonVO;

public class VenderPayVO extends CommonVO {

	private List<VenderPayVO> list;
	
	private Long payNo;
	private Long venderNo;
	private String venderNm;
	private String regDt;
	private String storeCd;
	private Double exptGoldGram;
	private Integer exptPayPrice;
	private Double prgGoldGram;
	private Integer prgPayPrice;
	private String payEtc;
	
	public List<VenderPayVO> getList() {
		return list;
	}
	public void setList(List<VenderPayVO> list) {
		this.list = list;
	}
	public Long getPayNo() {
		return payNo;
	}
	public void setPayNo(Long payNo) {
		this.payNo = payNo;
	}
	public Long getVenderNo() {
		return venderNo;
	}
	public void setVenderNo(Long venderNo) {
		this.venderNo = venderNo;
	}
	public String getVenderNm() {
		return venderNm;
	}
	public void setVenderNm(String venderNm) {
		this.venderNm = venderNm;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getStoreCd() {
		return storeCd;
	}
	public void setStoreCd(String storeCd) {
		this.storeCd = storeCd;
	}
	public Double getExptGoldGram() {
		return exptGoldGram;
	}
	public void setExptGoldGram(Double exptGoldGram) {
		this.exptGoldGram = exptGoldGram;
	}
	public Integer getExptPayPrice() {
		return exptPayPrice;
	}
	public void setExptPayPrice(Integer exptPayPrice) {
		this.exptPayPrice = exptPayPrice;
	}
	public Double getPrgGoldGram() {
		return prgGoldGram;
	}
	public void setPrgGoldGram(Double prgGoldGram) {
		this.prgGoldGram = prgGoldGram;
	}
	public Integer getPrgPayPrice() {
		return prgPayPrice;
	}
	public void setPrgPayPrice(Integer prgPayPrice) {
		this.prgPayPrice = prgPayPrice;
	}
	public String getPayEtc() {
		return payEtc;
	}
	public void setPayEtc(String payEtc) {
		this.payEtc = payEtc;
	}
	
	
	
}
