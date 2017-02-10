package com.booking.common.paging;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class PagingBarTag extends TagSupport{

	/*************************************
	 * @param page			현제 페이지 번호
	 * @param searchTotal	전체 조회된 row 수
	 * @param listSize		페이지 네비게이터에 표시되는 페이지 버튼 수
	 * @param pageSize		페이지에 보여주는 레코드 수
	 **************************************/
	
	private int page = 1;
	private int searchTotal = 1;
	private int listSize = 3;
	private int pageSize = 10;
	
	@Override
	public int doStartTag() throws JspException{
		try{
			pageContext.getOut().println(pagingBarStr());
		}catch(IOException ioe){
			ioe.printStackTrace();
		}
		
		return super.doStartTag();
	}
	
	public void setPage(int page) {
		this.page = page;
	}

	public void setSearchTotal(int searchTotal) {
		this.searchTotal = searchTotal;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String pagingBarStr(){
		String str = "";
		StringBuffer sb = new StringBuffer();
		
		
		if(page < 1){
			page = 1;
		}
		if(searchTotal < 1){
			return "";
		}
		
		/* 네비게이터 페이지 번호 선택기 준비 */
		//첫번째 번호
		int currentFirst = ((page-1)/listSize)*listSize+1;
		//마지막 번호
		int currentLast = ((page-1)/listSize)*listSize+listSize;

		/* 전체 페이지에 필요한 네비게이터 번호 확인*/
		int lastPage = 1;
		lastPage = (searchTotal/pageSize);
		if(searchTotal%pageSize != 0){
			lastPage++;
		}
		
		/* currentLast가 실제 마지막장 번호보다 클 경우 lastPage로 치환*/
		currentLast = (currentLast>lastPage) ? lastPage:currentLast;
		
		System.out.println(lastPage);
		
		sb.append("<ui class='pagination'>");
			/* first, prev 버튼 생성*/
			if(page > 1){
				sb.append("<li><a href='javascript:goPage(1);'>");
				sb.append("<<</a></li>");
				sb.append("<li><a href='javascript:goPage("+(page-1)+");'>");
				sb.append("<</a></li>");
			}
			
			for(int i = currentFirst; i <= lastPage && i < currentFirst + listSize && i <= currentLast; i++){
				if(page == i){
					sb.append("<li class='active'><a href='javascript:;'>"+i+"</a></li>");
				}else{
					sb.append("<li><a href='javascript:goPage("+i+");'>"+i+"</a></li>");
				}
			}
			
			/* next, end 버튼 생성*/
			if(page < lastPage){
				sb.append("<li><a href='javascript:goPage("+(page+1)+");'>");
				sb.append("></a></li>");
	
				sb.append("<li><a href='javascript:goPage("+lastPage+");'>");
				sb.append(">></a></li>");
			}
		sb.append("</div>");
		
		str = sb.toString();
		
		return str;
	}
}
