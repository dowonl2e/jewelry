package com.jewelry.order.domain;

import java.util.List;

import com.jewelry.common.domain.CommonVO;
import com.jewelry.file.domain.FileVO;

public class OrderVO extends CommonVO {
	
	private List<OrderVO> list;
	
	private Long orderno;
	private String storecd;
	private String receiptdt;
	private String expectedorddt;
	private Long customerno;
	private String customernm;
	private String customercel;
	private Long catalogno;
	private String modelid;
	private Long venderno;
	private String vendernm;
	private String serialid;
	private String materialcd;
	private String colorcd;
	private Integer quantity;
	private String mainstonetype;
	private String substonetype;
	private String size;
	private String orderdesc;
	private String ordertype;
	private String orderstep;
	private String delyn;
	
	private Long fileno;
	private String filepath;
	private String filenm;
	private String originnm;
	private Integer fileord;
	private String fileext;
	private Long filesize;
	private String versionid;
	
	private Integer ordermonth;
	private Integer ordercnt;
	
	
	private List<OrderCatalogVO> ordercataloglist;
	
	private List<FileVO> filelist;

	public List<OrderVO> getList() {
		return list;
	}

	public void setList(List<OrderVO> list) {
		this.list = list;
	}

	public Long getOrderno() {
		return orderno;
	}

	public void setOrderno(Long orderno) {
		this.orderno = orderno;
	}

	public String getStorecd() {
		return storecd;
	}

	public void setStorecd(String storecd) {
		this.storecd = storecd;
	}

	public String getReceiptdt() {
		return receiptdt;
	}

	public void setReceiptdt(String receiptdt) {
		this.receiptdt = receiptdt;
	}

	public String getExpectedorddt() {
		return expectedorddt;
	}

	public void setExpectedorddt(String expectedorddt) {
		this.expectedorddt = expectedorddt;
	}

	public Long getCustomerno() {
		return customerno;
	}

	public void setCustomerno(Long customerno) {
		this.customerno = customerno;
	}

	public String getCustomernm() {
		return customernm;
	}

	public void setCustomernm(String customernm) {
		this.customernm = customernm;
	}

	public String getCustomercel() {
		return customercel;
	}

	public void setCustomercel(String customercel) {
		this.customercel = customercel;
	}

	public Long getCatalogno() {
		return catalogno;
	}

	public void setCatalogno(Long catalogno) {
		this.catalogno = catalogno;
	}

	public String getModelid() {
		return modelid;
	}

	public void setModelid(String modelid) {
		this.modelid = modelid;
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

	public String getSerialid() {
		return serialid;
	}

	public void setSerialid(String serialid) {
		this.serialid = serialid;
	}

	public String getMaterialcd() {
		return materialcd;
	}

	public void setMaterialcd(String materialcd) {
		this.materialcd = materialcd;
	}

	public String getColorcd() {
		return colorcd;
	}

	public void setColorcd(String colorcd) {
		this.colorcd = colorcd;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getMainstonetype() {
		return mainstonetype;
	}

	public void setMainstonetype(String mainstonetype) {
		this.mainstonetype = mainstonetype;
	}

	public String getSubstonetype() {
		return substonetype;
	}

	public void setSubstonetype(String substonetype) {
		this.substonetype = substonetype;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getOrderdesc() {
		return orderdesc;
	}

	public void setOrderdesc(String orderdesc) {
		this.orderdesc = orderdesc;
	}

	public String getOrdertype() {
		return ordertype;
	}

	public void setOrdertype(String ordertype) {
		this.ordertype = ordertype;
	}

	public String getOrderstep() {
		return orderstep;
	}

	public void setOrderstep(String orderstep) {
		this.orderstep = orderstep;
	}

	public String getDelyn() {
		return delyn;
	}

	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}

	public List<OrderCatalogVO> getOrdercataloglist() {
		return ordercataloglist;
	}

	public void setOrdercataloglist(List<OrderCatalogVO> ordercataloglist) {
		this.ordercataloglist = ordercataloglist;
	}

	public List<FileVO> getFilelist() {
		return filelist;
	}

	public void setFilelist(List<FileVO> filelist) {
		this.filelist = filelist;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getFilenm() {
		return filenm;
	}

	public void setFilenm(String filenm) {
		this.filenm = filenm;
	}

	public String getOriginnm() {
		return originnm;
	}

	public void setOriginnm(String originnm) {
		this.originnm = originnm;
	}

	public Long getFileno() {
		return fileno;
	}

	public void setFileno(Long fileno) {
		this.fileno = fileno;
	}

	public Integer getFileord() {
		return fileord;
	}

	public void setFileord(Integer fileord) {
		this.fileord = fileord;
	}

	public String getFileext() {
		return fileext;
	}

	public void setFileext(String fileext) {
		this.fileext = fileext;
	}

	public Long getFilesize() {
		return filesize;
	}

	public void setFilesize(Long filesize) {
		this.filesize = filesize;
	}

	public String getVersionid() {
		return versionid;
	}

	public void setVersionid(String versionid) {
		this.versionid = versionid;
	}

	public Integer getOrdermonth() {
		return ordermonth;
	}

	public void setOrdermonth(Integer ordermonth) {
		this.ordermonth = ordermonth;
	}

	public Integer getOrdercnt() {
		return ordercnt;
	}

	public void setOrdercnt(Integer ordercnt) {
		this.ordercnt = ordercnt;
	}
	
}
