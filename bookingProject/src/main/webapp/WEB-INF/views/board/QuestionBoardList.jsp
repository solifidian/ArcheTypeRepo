<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>

<!-- 문서 유형 : 현재 웹 문서가 어떤 HTML 버전에 맞게 작성되었는지를 알려준다. -->

<!--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
     "http://www.w3.org/TR/html4/loose.dtd">
     DTD 선언문이 HTML 페이지의 가장 첫 라인에 명시되어야 웹 브라우저가 HTML 버전을 인식.
     HTML태그나 CSS를 해당 버전에 맞도록 처리하므로 웹 표준 준수를 위하여 반드시 명시되어야 한다.-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<link rel="shortcut icon" href="../../image/icon.png" />
<link rel="apple-touch-icon" href="../../image/icon.png" />		

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script src="/resources/include/js/listCommon.js"></script>
<script src="/resources/include/js/common.js"></script>
<title>문의 게시판</title>
</head>
<style>
		#pageSizeChange{width:110px; }
		.contentBtn{text-align:center;}
		.selectSize{width:90px; height:35px;}
		.dateSize{width:150px;}
		.search_div{display: table; margin:auto;}
		#keyword{width: 400px;}
		.searchBox{ background: #F0F0E9;border: medium none;color: #B2B2B2;font-family: 'roboto';
    				font-size: 12px;font-weight: 300; height: 35px;outline: medium none;
    				padding-left: 10px; width: 155px;
    				background-image:url(/resources/images/home/searchicon.png);
    				background-repeat: no-repeat; background-position: 380px;}
/*페이징 버튼 부분*/
		#boardPage{text-align:center;}
		.paginate{width : 100%; height:20px; text-align:center; vertical-align:top;}
		.paginate span .textAn{vertical-align:bottom;}
		.paginate a.on{color:#FF3300;}
		
</style>
<script type="text/javascript">
	$(function(){
	  /* 검색 후 검색 대상과 검색 단어 출력 */
		var searchMode = "<c:out value='${listData.searchMode}'/>";
		var searchDateMode = "<c:out value='${listData.searchDateMode}'/>"
		if(searchMode != ''){
			$("#searchMode").val(searchMode);
		}
		if(searchDateMode != ''){
			$("#searchDateMode").val(searchDateMode);
		}		
		
		
		//글쓰기버튼 클릭 이벤트
		$("#InsertFormBtn").click(function(){
			location.href="/board/boardInsertForm.do";
		});
		
		//제목 클릭시 상세 페이지 이동을 위한 처리 이벤트
		$(".goDetail").click(function(){
			var bd_post_no = $(this).parents("tr").attr("data-num");
			$("#bd_post_no").val(bd_post_no);
			console.log("글번호 :"+bd_post_no);
			
			//상세페이지로 이동하기 위해 form 추가(id=detailForm)
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/board/boardDetail.do"		
				
			});
			
			$("#detailForm").submit();
			
		});	
		
		
		
	 	//검색창 숨겨놓기
	 	$("#searchDate, #searchCategory, #searchHead").hide();
	 	//일자검색 선택했을때 키워드창 숨기고 날짜검색 보여주기
	 	$("#searchMode").change(function(){
	 	var sm = $("#searchMode").val();
	 	if(sm == "bd_editdate" ||  sm =="bd_category" || sm =="bd_head"){
	 			$("#keyword").hide();			
	 		switch(true){	 		 	
		 	case ( sm == "bd_editdate"):
			 		$("#searchDate").show();
		 			$("#searchCategory, #searchHead").hide();
		 		break;		 	
		 	case ( sm =="bd_category"):	 			
		 		$("#searchCategory").show();	
		 		$("#searchDate,#searchHead").hide();
		 		break;
		 	
		 	case ( sm =="bd_head"):
	 			$("#searchHead").show();	
		 		$("#searchDate, #searchCategory").hide();
		 		break;
			 }
	 	}else{
	 		$("#keyword").show();
	 		$("#searchDate, #searchCategory, #searchHead").hide();
	 	}
	 	
	 	});
	 	
	 	
 		 //검색버튼 클릭시 유효성 체크
		$("#searchKeywordBtn").click(function(){
		/* 	var sm = $("#searchMode").val();
			 if(sm !="allSch"){
				 if(sm =="bd_editdate"){
						if(!chkSubmit($('#searchStartDate'),"시작날짜를 ")) return;
				 		 else if(!chkSubmit($('#searchEndDate'), "종료날짜를 ")) return;
				 }else if(sm !="bd_category" && sm != "bd_head"){
				 		if(!chkSubmit($('#keyword'), "검색어를 ")) return;	
				 }
			 }else{ } */
	         	var inputKw = $("#keyword").val();
	          	var category = $("#bd_category").val();
	          	var head = $("#bd_head").val();
	          	$("#realKw").val(inputKw+category+head); 
	                 	
				
				$("#searchForm").submit();
				$("#page").val(1);
			
		});
		 
	
	
		
	});/* 최상위 종료  */
	
</script>
<body>
<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<div class="left-sidebar">
					<h2>문의게시판</h2>
					<div class="panel-group category-products" id="accordian"><!-- 카테고리  -->
					
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordian" href="#bookAndPeople">
										<span class="badge pull-right"><i class="fa fa-plus"></i></span>
										1:1문의
									</a>
								</h4>
							</div><!--class: panel-heading끝  -->
							<div id="bookAndPeople" class="panel-collapse collapse">
								<div class="panel-body">
										<ul>
											<li><a href="">비밀글로 문의하기 </a></li>																			
										</ul>
								</div><!--class: panel-body끝  -->
							</div><!-- id:review 끝 -->				
						</div><!--class: panel panel-default 끝  -->
						
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordian" href="#powerBook">
										<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											자주묻는질문
									</a>
								</h4>
							</div><!--class: panel-heading끝  -->
							<div id="powerBook" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="/book/bookFAQ.do">FAQ </a></li>
																		
										</ul>
									</div><!--class: panel-body끝  -->
							</div><!-- id:review 끝 -->							
						</div><!--class: panel panel-default 끝  -->
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordian" href="#event">
										<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											이벤트
									</a>
								</h4>
							</div><!--class: panel-heading끝  -->
							<div id="event" class="panel-collapse collapse">
								<div class="panel-body">
									<ul>
										<li><a href="">진행중인 이벤트 </a></li>
										<li><a href="">완료된 이벤트 </a></li>										
									</ul>
								</div><!--class: panel-body끝  -->
							</div><!-- id:review 끝 -->
						</div><!--class: panel panel-default 끝  -->	
						

						
<!--현재 하는 이벤트 이미지 첨부  -->
						<div class="shipping text-center"><!--이벤트-->
								<img src="/resources/images/home/shipping.jpg" alt="" />
						</div><!--/이벤트-->
													
					</div><!--/카테고리 class: panel-group category-products  -->
				</div><!--/class:  left-sidebar -->	
			</div><!--/class: col-sm-3  -->
			
			<div class="col-sm-9">
				<div class="blog-post-area">
					<h2 class="title text-center">문의 게시판</h2>
<!--	================ 리스트 시작 ======================  -->
<!-- ============페이지 네비게이션 시작 ==================-->
            <div class="">
	         	<div class="navbar-right">
	         		페이지당 표시 건 수
	         		<select name="pageSizeChange" id="pageSizeChange" >
	         		    <option value="">선택하세요</option>   				         			
	         			<option value="1">1</option>
	         			<option value="2">2</option>
	         			<option value="5">5</option>
	         			<option value="10">10</option>
	         			<option value="30">30</option>
	         		</select>건
	         	&nbsp;&nbsp;/&nbsp;총 레코드수 : ${total}건
	         	</div>            
	            
	            
	            <div class="paginationBar text-center paginate" id="boardPage">
	            	<tag:PagingBar page="${data.page}" searchTotal="${data.searchTotal}" pageSize="${data.pageSize}"/>
	            </div>            
            
         	 </div>
<!-- ============페이지 네비게이션 종료 ================== -->

<!--  	================= 상세 페이지 이동을 위한 form ==========-->
						<form name="detailForm" id="detailForm">
							<input type="hidden" name="bd_post_no" id="bd_post_no" value="">
							<input type ="hidden" name="bd_forum_no" id="bd_forum_no" value="2">					
						</form>

						<div id="boardList">
						<table summary="게시판 리스트" class="table table-hover">					
							<thead>
								<tr>								
									<th data-value="bd_post_no" class="orderth">글번호
										<c:choose>
											<c:when test="${data.orderTarget=='bd_post_no' and data.orderDirection=='ASC'}">▲</c:when>
											<c:when test="${data.orderTarget=='bd_post_no' and data.orderDirection=='DESC'}">▼</c:when>
											<c:otherwise>▲</c:otherwise>
										</c:choose>
									</th>
									<th data-value="bd_category" class="orderth">분류</th>
									<th data-value="bd_head" class="orderth">말머리</th>
									<th data-value="bd_title" class="orderth">글제목</th>
									<th data-value="bd_writer" class="orderth borcle" >작성자</th>
									<th data-value="bd_editdate" class="orderth">작성일
										<c:choose>
											<c:when test="${data.orderTarget=='bd_editdate' and data.orderDirection=='ASC'}">▲</c:when>
											<c:when test="${data.orderTarget=='bd_editdate' and data.orderDirection=='DESC'}">▼</c:when>
											<c:otherwise>▲</c:otherwise>
										</c:choose>
									</th>
									<th data-value="bd_readcnt" class="orderth">조회수
										<c:choose>
											<c:when test="${data.orderTarget=='bd_readcnt' and data.orderDirection=='ASC'}">▲</c:when>
											<c:when test="${data.orderTarget=='bd_readcnt' and data.orderDirection=='DESC'}">▼</c:when>
											<c:otherwise>▲</c:otherwise>
										</c:choose>
									</th>
									<th data-value="bd_score" class="orderth">추천수
										<c:choose>
											<c:when test="${data.orderTarget=='bd_score' and data.orderDirection=='ASC'}">▲</c:when>
											<c:when test="${data.orderTarget=='bd_score' and data.orderDirection=='DESC'}">▼</c:when>
											<c:otherwise>▲</c:otherwise>
										</c:choose>
									</th>
<!-- 비밀글이 필요한 게시판에서는 열어서 사용하면 됌 
									<th>공개여부</th>-->
								</tr>
							</thead>
							<tbody id="list">
							<!-- ======= 데이터 출력 ====== -->
							<c:choose>
								<c:when test="${not empty boardList}" >
									<c:forEach var="board" items="${boardList}">
										<tr class="tac" data-num="${board.bd_post_no}">
											<td>${board.bd_post_no}</td>
											<td>${board.bd_category}</td>
											<td>${board.bd_head}</td>
											<td class="goDetail tal">${board.bd_title}(${board.bd_rcount})</td>
											<td class="name">${board.bd_writer}</td>
											<td>${board.bd_update}</td>
											<td>${board.bd_readcnt}</td>
											<td>${board.bd_score}</td>	
<%-- 비밀글:										<td>${board.bd_status}</td>		 --%>								
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="8" class="tac">등록된 게시물이 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						</div><!--/id="boardList" -->
<!-- ============== 리스트 종료 ========== -->
<!-- ======== 글쓰기 버튼 출력 시작 ========== -->
		<div class="contentBtn">
			<input type="button" value="글쓰기" class="btn btn-primary" id="InsertFormBtn">
		</div>
		<br><br>
<!-- ============글쓰기 버튼 출력 종료 ================== -->

<br><br>
<!-- ============검색 ================== -->
<!-- 전체 리스트 제어 폼 -->
			<div class="search_div">
          	<form class="navbar-form navbar-left" id="searchForm" method="get" action="/board/boardList.do">
          	          			
	          		<!-- 페이지 정렬을 위한 hidden input들 -->
	          		<input type="hidden" name="page" id="page" value="${data.page}"/>
	          		<input type="hidden" name="pageSize" id="pageSize" value="${data.pageSize}"/>
	          		
	          		<!-- 리스트 사이즈 제어 기본 value = 8 -->
	          		<input type="hidden" name="listSize" id="listSize" value="8"/>
	          		
	          		<!-- 정렬 제어를 위한 파라메터 -->
	          		<input type="hidden" name="orderTarget" id="orderTarget" value="${data.orderTarget}"/>
	          		<input type="hidden" name="orderDirection" id="orderDirection" value="${data.orderDirection}"/>
	          		
	          		<!-- 키워드 검색값을 위한 파라메터 -->	      
	          		<input type="hidden" name="keyword" id="realKw" value="${data.keyword}" />
	 
	          		<!-- 키워드 검색 -->	          		
	          		<h2 class="title text-center">검색</h2>
        		      	<select name="searchMode" id="searchMode" class="selectSize">
			      			<option value="allSch">전체</option>
			      			<option value="bd_post_no">글번호</option>
			      			<option value="bd_category">카테고리</option>
			      			<option value="bd_head">말머리</option>
			      			<option value="bd_title">글제목</option>
			      			<option value="bd_writer">작성자</option>
			      			<option value="bd_content">글내용</option>
			      			<option value="bd_editdate">작성일</option>			  
		   		   		</select>		   		 		
						<input class="searchBox" type="text" id="keyword" />
			      	
			      	<!--카테고리 검색  -->
			        <span id="searchCategory">
			        	<select id="bd_category" class="form-control" required="required" >			        		
							<option value="">-----</option>
							<option value="이슈" >이슈</option>
							<option value="칼럼">칼럼</option>
							<option value="파워북로거">파워북로거</option>
							<option value="베스트북로거">베스트북로거</option>
							<option value="이벤트">진행중인이벤트</option>								
						</select>				
			        </span>
			
			        <!--말머리검색  -->
			        <span id="searchHead">			        
						<select id="bd_head" class="form-control" required="required" >
							<option value="">-----</option>
							<option value="all">전체</option>
							<option value="리뷰">리뷰</option>
							<option value="비평">비평</option>
							<option value="사담">사담</option>
							<option value="기타">기타</option>								
						</select>
			        </span>	
			        			
			
      		  		<!-- 일자 검색 -->
		      		<span id="searchDate">
		          		<select class="selectSize form-control" name="searchDateMode" id="searchDateMode">
			      			 <option value="bd_editdate">작성일</option>
			      		</select>
			      		 : 
			          	<input type="date" class="form-control dateSize" name="searchStartDate" id="searchStartDate" value="${data.searchStartDate}"> ~ 
			          	<input type="date" class="form-control dateSize" name="searchEndDate" id="searchEndDate" value="${data.searchEndDate}">
			        </span>
			        
			        
			        
			        <button type="button" id="searchKeywordBtn" class="btn btn-warning">검색</button>	  	
		    
	          	</form>
				</div>

<br><br>

				</div><!-- /class="blsog-post-area" -->
			</div><!--/ class="col-sm-9" -->
			
			
		</div><!--/ class: row -->
	</div><!--/ class: container  -->
</section>

</body>
</html>