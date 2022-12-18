package com.jewelry.stock.domain;

import java.util.List;

import com.jewelry.common.domain.CommonVO;
import com.jewelry.file.domain.FileVO;

public class StockVO extends CommonVO {

	private List<StockVO> list;
	
	private Long stockno;
	private String regdt;
	private String stocktypecd;
	private String storecd;
	private Double realpchgoldprice;
	private Long catalogno;
	private String modelid;
	private Long venderno;
	private String vendernm;
	private String materialcd;
	private String colorcd;
	private String mainstonetype;
	private String substonetype;
	private String size;
	private String stockdesc;
	private Integer quantity;
	private Double perweightgram;
	private Integer perpricebasic;
	private Integer perpriceadd;
	private Integer perpricemain;
	private Integer perpricesub;
	private Integer perpricegoldreal;
	private Integer multiplecnt;
	private String origintype;
	private String delyn;
	private String saleyn;
	
	private Long customerno;
	private String customernm;

	private Integer stockcnt;
	
	private List<FileVO> filelist;

	public List<StockVO> getList() {
		return list;
	}

	public void setList(List<StockVO> list) {
		this.list = list;
	}

	public Long getStockno() {
		return stockno;
	}

	public void setStockno(Long stockno) {
		this.stockno = stockno;
	}

	public String getRegdt() {
		return regdt;
	}

	public void setRegdt(String regdt) {
		this.regdt = regdt;
	}

	public String getStocktypecd() {
		return stocktypecd;
	}

	public void setStocktypecd(String stocktypecd) {
		this.stocktypecd = stocktypecd;
	}

	public String getStorecd() {
		return storecd;
	}

	public void setStorecd(String storecd) {
		this.storecd = storecd;
	}

	public Double getRealpchgoldprice() {
		return realpchgoldprice;
	}

	public void setRealpchgoldprice(Double realpchgoldprice) {
		this.realpchgoldprice = realpchgoldprice;
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

	public String getStockdesc() {
		return stockdesc;
	}

	public void setStockdesc(String stockdesc) {
		this.stockdesc = stockdesc;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getPerweightgram() {
		return perweightgram;
	}

	public void setPerweightgram(Double perweightgram) {
		this.perweightgram = perweightgram;
	}

	public Integer getPerpricebasic() {
		return perpricebasic;
	}

	public void setPerpricebasic(Integer perpricebasic) {
		this.perpricebasic = perpricebasic;
	}

	public Integer getPerpriceadd() {
		return perpriceadd;
	}

	public void setPerpriceadd(Integer perpriceadd) {
		this.perpriceadd = perpriceadd;
	}

	public Integer getPerpricemain() {
		return perpricemain;
	}

	public void setPerpricemain(Integer perpricemain) {
		this.perpricemain = perpricemain;
	}

	public Integer getPerpricesub() {
		return perpricesub;
	}

	public void setPerpricesub(Integer perpricesub) {
		this.perpricesub = perpricesub;
	}

	public Integer getPerpricegoldreal() {
		return perpricegoldreal;
	}

	public void setPerpricegoldreal(Integer perpricegoldreal) {
		this.perpricegoldreal = perpricegoldreal;
	}
	
	public Integer getMultiplecnt() {
		return multiplecnt;
	}

	public void setMultiplecnt(Integer multiplecnt) {
		this.multiplecnt = multiplecnt;
	}

	public String getOrigintype() {
		return origintype;
	}

	public void setOrigintype(String origintype) {
		this.origintype = origintype;
	}

	public String getDelyn() {
		return delyn;
	}

	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}

	public List<FileVO> getFilelist() {
		return filelist;
	}

	public void setFilelist(List<FileVO> filelist) {
		this.filelist = filelist;
	}

	public String getSaleyn() {
		return saleyn;
	}

	public void setSaleyn(String saleyn) {
		this.saleyn = saleyn;
	}

	public Integer getStockcnt() {
		return stockcnt;
	}

	public void setStockcnt(Integer stockcnt) {
		this.stockcnt = stockcnt;
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
	
	
}
