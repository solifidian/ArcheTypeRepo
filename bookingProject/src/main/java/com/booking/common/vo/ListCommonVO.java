package com.booking.common.vo;

public class ListCommonVO {
	
	private int searchTotal; //검색 결과 건 수
	
	private String page; // 현재 페이지
	private String pageSize; // 페이지에 표시할 게시물 수
	
	private String searchMode; // 검색 대상
	private String keyword; // 검색 단어
	
	private String searchDateMode; // 일자 검색 대상
	private String searchStartDate; // 일자 검색 시작일
	private String searchEndDate; // 일자 검색 종료일
	
	private String orderDirection; // 결과 정렬 방향
	private String orderTarget; // 결과 정렬 기준
	
	private int searchStartRow; // 화면에 표시할 1행의 행 번호
	private int searchEndRow; // 화면에 표시할 마지막 행의 행 번호
	
	
	public int getSearchTotal() {
		return searchTotal;
	}
	public void setSearchTotal(int searchTotal) {
		this.searchTotal = searchTotal;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getPageSize() {
		return pageSize;
	}
	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}
	public int getSearchStartRow() {
		return searchStartRow;
	}
	public void setSearchStartRow(int searchStartRow) {
		this.searchStartRow = searchStartRow;
	}
	public int getSearchEndRow() {
		return searchEndRow;
	}
	public void setSearchEndRow(int searchEndRow) {
		this.searchEndRow = searchEndRow;
	}
	public String getSearchStartDate() {
		return searchStartDate;
	}
	public void setSearchStartDate(String searchStartDate) {
		this.searchStartDate = searchStartDate;
	}
	public String getSearchEndDate() {
		return searchEndDate;
	}
	public void setSearchEndDate(String searchEndDate) {
		this.searchEndDate = searchEndDate;
	}
	public String getSearchMode() {
		return searchMode;
	}
	public void setSearchMode(String searchMode) {
		this.searchMode = searchMode;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getOrderDirection() {
		return orderDirection;
	}
	public void setOrderDirection(String orderDirection) {
		this.orderDirection = orderDirection;
	}
	public String getOrderTarget() {
		return orderTarget;
	}
	public void setOrderTarget(String orderTarget) {
		this.orderTarget = orderTarget;
	}
	public String getSearchDateMode() {
		return searchDateMode;
	}
	public void setSearchDateMode(String searchDateMode) {
		this.searchDateMode = searchDateMode;
	}
	
	
	
}
