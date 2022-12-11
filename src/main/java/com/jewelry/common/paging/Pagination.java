package com.jewelry.common.paging;

public class Pagination {
	
	/** 현재 페이지 */
	private int currentpage;
	
	/** 페이지당 출력할 데이터 개수 */
	private int recordcount;
	
	/** 화면 하단에 출력할 페이지 사이즈 */
	private int pagesize;
	
	/** 전체 데이터 개수 */
	private int totalcount;

	/** 전체 페이지 개수 */
	private int totalpage;

	/** 페이지 리스트의 첫 페이지 번호 */
	private int firstpage;

	/** 페이지 리스트의 마지막 페이지 번호 */
	private int lastpage;

	/** SQL의 조건절에 사용되는 첫 RNUM */
	private int firstrecordindex;

	/** SQL의 조건절에 사용되는 마지막 RNUM */
	private int lastrecordindex;

	/** 이전 페이지 존재 여부 */
	private boolean hasprevpage;

	/** 다음 페이지 존재 여부 */
	private boolean hasnextpage;
	
	private int startpage;
	private int endpage;
	
	public Pagination() {
		this.currentpage = 1;
		this.recordcount = 20;
		this.pagesize = 10;
	}
	
	public int getStartpage() {
		return this.startpage;
	}
	public int getEndpage() {
		return this.endpage;
	}
	public int getCurrentpage() {
		return currentpage;
	}

	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}

	public int getRecordcount() {
		return recordcount;
	}

	public void setRecordcount(int recordcount) {
		this.recordcount = recordcount;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	
	public int getTotalcount() {
		return totalcount;
	}

	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
		if (totalcount > 0)
			calculation();
	}

	public int getTotalpage() {
		return totalpage;
	}

	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}

	public int getFirstpage() {
		return firstpage;
	}

	public void setFirstpage(int firstpage) {
		this.firstpage = firstpage;
	}

	public int getLastpage() {
		return lastpage;
	}

	public void setLastpage(int lastpage) {
		this.lastpage = lastpage;
	}

	public int getFirstrecordindex() {
		return firstrecordindex;
	}

	public void setFirstrecordindex(int firstrecordindex) {
		this.firstrecordindex = firstrecordindex;
	}

	public int getLastrecordindex() {
		return lastrecordindex;
	}

	public void setLastrecordindex(int lastrecordindex) {
		this.lastrecordindex = lastrecordindex;
	}
	public boolean getHasprevpage() {
		return this.hasprevpage;
	}

	public void setHasprevpage(boolean hasprevpage) {
		this.hasprevpage = hasprevpage;
	}

	public boolean getHasnextpage() {
		return this.hasnextpage;
	}

	public void setHasnextpage(boolean hasnextpage) {
		this.hasnextpage = hasnextpage;
	}
	
	private void calculation() {
		/* 전체 페이지 수 (현재 페이지 번호가 전체 페이지 수보다 크면 현재 페이지 번호에 전체 페이지 수를 저장) */
		totalpage = ((totalcount - 1) / recordcount) + 1;
		if (currentpage > totalpage) {
			this.currentpage = totalpage;
		}

//		pagesize = (int) Math.ceil(totalcount / (double) recordcount);
//		System.out.println("개수 : " + totalcount + ", " + recordcount + ", " + pagesize + ", " + totalpage);
		/* 페이지 리스트의 첫 페이지 번호 */
		firstpage = ((currentpage - 1) / pagesize) * pagesize + 1;

		/* 페이지 리스트의 마지막 페이지 번호 (마지막 페이지가 전체 페이지 수보다 크면 마지막 페이지에 전체 페이지 수를 저장) */
		lastpage = firstpage + pagesize - 1;
		if (lastpage > totalpage) {
			lastpage = totalpage;
		}
		
		//시작 페이지 인덱스
		this.startpage = (int)(currentpage%pagesize == 0 ? currentpage-1 : currentpage)/pagesize * pagesize;
		
		//종료 페이지 인덱스
		this.endpage = startpage + pagesize;
		this.endpage = endpage > totalpage ? totalpage : endpage;

		/* SQL의 조건절에 사용되는 첫 RNUM */
		firstrecordindex = (currentpage - 1) * recordcount;

		/* SQL의 조건절에 사용되는 마지막 RNUM */
		lastrecordindex = currentpage * recordcount;

		/* 이전 페이지 존재 여부 */
		hasprevpage = firstpage != 1;

		/* 다음 페이지 존재 여부 */
		hasnextpage = (lastpage * recordcount) < totalcount;
	}

	
}
