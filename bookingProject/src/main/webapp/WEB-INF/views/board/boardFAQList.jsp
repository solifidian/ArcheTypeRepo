<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | E-Shopper</title>
  
	<script type="text/javascript">
	var id="${sessionScope.memSession.m_id}";
	 if(id=="")id=0;
	$(function(){
		$("#BtnForm").hide();
		if(id =="admin"){
			$("#BtnForm").show();
		}
		//글쓰기버튼 클릭 이벤트
		$("#InsertFormBtn").click(function(){
			location.href="/board/boardFAQInsertForm.do";
		});	
		
		//제목 클릭시 상세 페이지 이동을 위한 처리 이벤트
		$(".goDetail").click(function(){
			var bd_post_no = $(this).parents("tr").attr("data-num");
			$("#bd_post_no").val(bd_post_no);
			console.log("글번호 :"+bd_post_no);
			
			//상세페이지로 이동하기 위해 form 추가(id=detailForm)
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/board/boardFAQDetail.do"		
				
			});
			
			$("#detailForm").submit();
			
		});	
	});
	</script>
 


</head><!--/head-->

<body>
	
	
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>FAQ</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">국내도서관련</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">국외도서관련</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">반품/교환/환불</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">주문/결제</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">회원관련</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">배송관련</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">중분류7</a></h4>
								</div>
							</div>
						</div><!--/category-products-->
					
					</div>
				</div>
				
				
				
				
<!--========================== FAQ 시작  ======================================-->

						
				<style>
					.tett {background-color:pink;
					}
					
				</style>
				<div class="col-sm-9 padding-right tett">
				
				
				<!--  	================= 상세 페이지 이동을 위한 form ==========-->
				<form name="detailForm" id="detailForm">
							<input type="hidden" name="bd_post_no" id="bd_post_no">							
						</form>
					
					
				<!-- paging form -->
				<%-- 	<form id="searchForm" method="get" action="/member/memberMypage.do">

						<input type="hidden" name="page" id="page" value="${listData.page}"/>
		          		<input type="hidden" name="pageSize" id="pageSize" value="${listData.pageSize}"/>
		          		
		          		<!-- 리스트 사이즈 제어 기본 value = 8 -->
		          		<input type="hidden" name="listSize" id="listSize" value="8"/>
		          		
		          		
					</form>
				<!------------ 페이징 ---------------->						
					<div class="row">
			         	페이지당 표시 건 수
			         	<select class="" name="pageSizeChange" id="pageSizeChange" >
			         		<option value="5">5</option>
			         		<option value="10">10</option>
			         		<option value="30">30</option>
			         	</select>
			         <div class="paginationBar text-center" >
	            		<tag:PagingBar page="${listData.page}" searchTotal="${listData.searchTotal}" pageSize="${listData.pageSize}"/>
	            	</div> --%>
			        
				<table class="table table-striped">
					<colgroup>
						<col width="30%" />
						<col width="70%" />
					</colgroup>
				  <thead>
				    <tr>
				      <th>글번호</th>
				      <th>글 제목</th>
				    </tr>
				  </thead>
				  <tbody id="list">
				<!-- ======= 데이터 출력 ====== -->
						<c:choose>
							<c:when test="${not empty faqList}" >
								<c:forEach var="faqList" items="${faqList}">
									<tr class="tac" data-num="${faqList.fnq_no}">
										<td>${faqList.fnq_no}</td>
										<td>${faqList.fnq_title}</td>
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
				<form id="BtnForm">
					<input type="button" id="InsertFormBtn" value="글쓰기">
				</form>
					</div>
=======
 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | E-Shopper</title>
  

 


</head><!--/head-->

<body>
	
	
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>FAQ</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">국내도서관련</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">국외도서관련</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">반품/교환/환불</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">주문/결제</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">회원관련</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">배송관련</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">중분류7</a></h4>
								</div>
							</div>
						</div><!--/category-products-->
					
					</div>
				</div>
				
				
				
				
				<!-- FAQ 시작  -->
				<style>
					.tett {background-color:pink;
					height:700px;}
				</style>
				<div class="col-sm-9 padding-right tett">
					
<script type="text/javascript">

	 function FaqToggleDetail ( id ){

		var latestToggleObj = null;

		var oObj = document.getElementById( id );	




		if( this.latestToggleObj != null ){

			this.latestToggleObj.className = (this.latestToggleObj.className + " none");

		}

		if( this.latestToggleObj == oObj ){

			this.latestToggleObj = null;

			return;

		}

		this.latestToggleObj = null;




		if( oObj.className.indexOf( "none" ) != -1 ){

			oObj.className = oObj.className.replace( "none", "" );			

		}else{

			oObj.className = (oObj.className + " none");

		}

		this.latestToggleObj = oObj;

	 }

</script>






<style>

.none{ display:none; }

.pointer{ cursor:pointer; }

</style>






<p>질문게시판입니다.</p>
 <table cellspacing="0" class="article-list">

<col width="30px">

<col>

<col width="60px" >

<col width="80px" >

<col width="50px" >

<col width="50px" >




<tr>

<th>No2</th>

<th>제 목</th>

<th>작성자</th>

<th>작성일</th>

<th>조회</th>

<th>추천</th>

</tr>

<tr align="center" class="pointer" onclick="FaqToggleDetail( 'row_1' )">

	<td>1</td>

	<td>

	<span id="td_row_1">'javascript typeof'에 해당되는 글 1건</span></td>

	<td>게시판 만들기</td>

	<td>2009/12/04</td>

	<td>2321</td>

	<td>123</td>

</tr>

<tr class="none" id="row_1">

	<td colspan="6" style="border:1px solid #000000;">

	'javascript typeof'에 해당되는 글 1건. 2009/12/04 typeof · WEB/자바스크립트2009/12/04 12:41 ... FAQ (검색결과: 건) ... 이전 1 다음» ... 계층형 게시판 만들기 (9) ...

	<td>

</tr>




<tr align="center" class="pointer" onclick="FaqToggleDetail( 'row_2' )">

	<td>2</td>

	<td>

	<span id="td_row_2">PHPSchool 의 Tip&Tech 란에서 퍼온것을 미리</span></td>

	<td>URL 숨기기</td>

	<td>2009/12/04</td>

	<td>2321</td>

	<td>123</td>

</tr>

<tr class="none" id="row_2">

	<td colspan="6" style="border:1px solid #000000;">

박스의 비밀. 이 글은 PHPSchool 의 Tip&Tech 란에서 퍼온것을 미리 밝혀둡니다. ... 웹플레이어의 경우 자바스크립트로 현재 플레이되는 곡에 대한 정보를 ..... URL 숨기기용 플레이어에 곡전달하는 파일 샘플 

	<td>

</tr>




<tr align="center" class="pointer" onclick="FaqToggleDetail( 'row_3' )">

	<td>3</td>

	<td>

	<span id="td_row_3">Web Controls 1.0에도 집중</span></td>

	<td>URL 숨기기</td>

	<td>2009/12/04</td>

	<td>2321</td>

	<td>123</td>

</tr>

<tr class="none" id="row_3">

	<td colspan="6" style="border:1px solid #000000;">

	이전에는 Web Forms 2.0과 Web Controls 1.0에도 집중했었습니다. .... 사양은 사용자-에이전트-특화요소를 강조하거나 숨기는 등 변경하는 .... 많은 기능은 자바스크립트를 사용하여 대체하여 구현 12할 수 ..... 클보 게시판 최신글

	<td>

</tr>




<tr align="center" class="pointer" onclick="FaqToggleDetail( 'row_4' )">

	<td>4</td>

	<td>

	<span id="td_row_4">JAVA프로그래머를 위해</span></td>

	<td>URL 숨기기</td>

	<td>2009/12/04</td>

	<td>2321</td>

	<td>123</td>

</tr>

<tr class="none" id="row_4">

	<td colspan="6" style="border:1px solid #000000;">

	들어가는 글 :: "시작하는 JAVA프로그래머를 위해" (특히 비 전공자분들 ... 김상욱의 LIVECONNECTION :: 애플릿과 자바스크립트와의 통신강좌 ..... JSP FAQ

	<td>

</tr>

</table>
					
					
>>>>>>> branch 'master' of https://github.com/jiyong45/ArcheTypeRepo.git
				</div>
			</div>
		</div>
	</section>
	
	
	

</body>
</html>