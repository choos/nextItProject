package com.zero.common.vo;

import java.io.Serializable;

public class PagingVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int curPage;							//현재 페이지 번호
	int rowSizePerPage;		//한 페이지당 레코드 수
	int firstRow;						//시작 레코드    번호
	int lastRow;						//마지막 레토드 번호 
	int totalRowCount;			//총 레코드 건수
	int totalPageCount;			//총 페이지 건수
	
	int pageSize;		//페이지 리스트에 게시되는 페이지 건수
	int firstPage;	//시작 페이지 블럭
	int lastPage;	//마지막 페이지 블럭
	
	
	public void setting() {
		if(curPage<1) curPage=1;
		if (rowSizePerPage<1) rowSizePerPage=12;
		if(pageSize<1) pageSize=5;
		
		firstRow = (curPage-1)*rowSizePerPage+1; 
		lastRow = curPage*rowSizePerPage;
		totalPageCount = (totalRowCount-1)/rowSizePerPage+1;
		//firstPage, lastPage 계산	
		firstPage = ((curPage-1)/pageSize)*pageSize + 1;
		lastPage = firstPage + pageSize - 1 ;
		if(lastPage>totalPageCount) {
			lastPage=totalPageCount;
		}
	}

	
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public void setRowSizePerPage(int rowSizepPerPage) {
		this.rowSizePerPage = rowSizepPerPage;
	}
	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}
	public void setLastRow(int lastRow) {
		this.lastRow = lastRow;
	}
	public void setTotalRowCount(int totalRowCount) {
		this.totalRowCount = totalRowCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	public int getCurPage() {
		return curPage;
	}
	public int getRowSizePerPage() {
		return rowSizePerPage;
	}
	public int getFirstRow() {
		return firstRow;
	}
	public int getLastRow() {
		return lastRow;
	}
	public int getTotalRowCount() {
		return totalRowCount;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getFirstPage() {
		return firstPage;
	}


	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}


	public int getLastPage() {
		return lastPage;
	}


	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	
}
