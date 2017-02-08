<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

	



	<script type="text/javascript" src="/resources/include/js/listCommon.js"></script>
 	<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var searchMode = "<c:out value='${listData.searchMode}'/>";
			/* if(searchMode == '' || searchMode == 'purchaseTable'){
				$(".purchaseTable form").attr("id","searchForm");	
				$(".purchaseTable").show();
				$(".deliveryTable").hide();
			}
			else if(searchMode == 'deliveryTable'){
				$(".deliveryTable form").attr("id","searchForm");
				$(".purchaseTable").hide();
				$(".deliveryTable").show();				
			} */
			
			
			
			//상세보기 버튼 클릭시 상세modal페이지 이동
      		$(".goDetail").click(function(){
      			$('#mtable > tbody:last').html("");
      			var p_no = $(this).parents("tr").attr("data-num");
      			alert(p_no);
      			$("#p_no").val(p_no);
      			console.log("주문번호 : "+p_no);
      			 $.ajax({
		             url: "/member/boots_view.do",
		             type: "POST",
		 			 data : $('#detailForm').serialize(),
		             success: function(data){
							$(data).each(function(){
								var b_title = this.b_title;
								var b_author = this.b_author
								var p_amount = this.p_amount;
								addNewItem(b_title, b_author, p_amount);
							});
		             },
		             error: function(data){
		            	 alert("fail");
		             }
		        });
      			
      		});
			
      		//배송추적 클릭시 이동
      		$(".goDelivery").click(function(){      			
      			var site = $(this).parents("tr").attr("data-num");
      			alert(site);
      			console.log("web site : "+site);
      			// 택배회사 주소 넣기
      			window.open("http://"+site);
      		});
		});
		
		//modal 
		function addNewItem(b_title,b_author, p_amount){
			
			$('#mtable > tbody:last').append("<tr class='item'><td>"+b_title+"</td><td>"+b_author+"</td><td>"+p_amount+"</td></tr>")
		}
		
		
		
		
	</script>

</head><!--/head-->

<body>


<form name="detailForm" id="detailForm">
		<input type="hidden" name="p_no" id="p_no" value="">
</form>


<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>





<!-- Small modal -->
 <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
     <table class="table table-borderded tel" id="mtable">
							<colgroup>
								<col width="50%" />
								<col width="30%" />
								<col width="20%" />
							</colgroup>
							<thead>
								<tr>
								<th>책 제목</th>
								<th>저자</th>
								<th>수량</th>
								</tr>
							</thead>
							<tbody id="list">
								
							</tbody>
						</table>
						
    </div>
  </div>
</div>
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>마이페이지 메뉴</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="/member/memberMypage.do?pur_del_mode=purchaseTable">주문내역</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="/member/memberMypage.do?pur_del_mode=deliveryTable">배송내역</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">취소/교환 신청 내역</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="/member/memberUpdateForm.do">회원 정보 수정</a></h4>
								</div>
							</div>
							<hr />
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">1:1문의 내역</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">게시판 활동 내역</a></h4>
								</div>
							</div>
						</div><!--/category-products-->

					</div>
				</div>
				<!-- <style>
					.tett{ height:300px;}
				</style> -->
				
				<div class="col-sm-9 padding-right tett purchaseTable">
					<form id="searchForm" method="get" action="/member/memberMypage.do">
						<input type="hidden" name="pur_del_mode" id="pur_del_mode" value="${listData.searchMode}"/>
						<input type="hidden" name="page" id="page" value="${listData.page}"/>
		          		<input type="hidden" name="pageSize" id="pageSize" value="${listData.pageSize}"/>
		          		
		          		<!-- 리스트 사이즈 제어 기본 value = 8 -->
		          		<input type="hidden" name="listSize" id="listSize" value="8"/>
		          		
		          		<!-- 정렬 제어를 위한 파라메터 -->
		          		<input type="hidden" name="orderTarget" id="orderTarget" value="${listData.orderTarget}"/>
		          		<input type="hidden" name="orderDirection" id="orderDirection" value="${listData.orderDirection}"/>
					</form>
					<div class="col-sm-10 padding-right" >
					<!------------ 타이틀 변경 ---------------->
					<c:choose>
						<c:when test="${listData.searchMode eq 'purchaseTable'}">
							<h3>최근 주문 내역</h3>
						</c:when>
						<c:when test="${listData.searchMode eq 'deliveryTable'}">
							<h3>최근 배송 내역</h3>
						</c:when>
					</c:choose>
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
	            			</div>
			         	</div>
            			<!------------ 테이블 헤더 지정 ---------------->
						<table class="table table-borderded">
							<c:choose>
								<c:when test="${listData.searchMode eq 'purchaseTable'}">
									<colgroup>
										<col width="25%" />
										<col width="15%" />
										<col width="15%" />
										<col width="25%" />
									</colgroup>
									<thead>
										<tr>
											<th>주문일자</th>
											<th>주문번호</th>
											<th>주문내역</th>
											<th>주문자명</th>
										</tr>
									</thead>
								</c:when>
								<c:when test="${listData.searchMode eq 'deliveryTable'}">
									<colgroup>
										<col width="30%" />
										<col width="15%" />
										<col width="15%" />
										<col width="13%" />
										<col width="10%" />
									</colgroup>
									<thead>
									<tr>
										<th>배송일자</th>
										<th>송장번호</th>
										<th>주문번호</th>
										<th>배송상태</th>
										<th>배송</th>
									</tr>
								</c:when>
							</c:choose>
						<!------------ 테이블 내용 설정 ---------------->
							<tbody id="list">
								<!-- 데이터 출력 -->
								<c:choose>
									<c:when test="${not empty purchase }">
										<c:forEach var="purchase" items="${purchase}">
											<tr class="tac" data-num="${purchase.p_no}">
												<td>${purchase.p_date }</td>
												<td>${purchase.p_no }</td>
												<td><button type="button" class="btn btn-primary goDetail"  data-toggle="modal" data-target=".bs-example-modal-lg">상세보기</button></td>
												<td>${purchase.m_name}</td>
												
											</tr>
										</c:forEach>
									</c:when>
									<c:when test="${not empty delivery }">
										<c:forEach var="delivery" items="${delivery }">
											<c:if test="${not empty delivery.del_num }">
											<tr class="tac" data-num="${delivery.del_site }" >
												<td>${delivery.del_ondate }</td>
												<td>${delivery.del_num }</td>
												<td>${delivery.p_no } </td>
												<td>${delivery.del_status }</td>
												<td><input type="button" class="btn btn-default goDelivery" value="배송추적"></td>
											</tr>
											</c:if>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4" class="tac">내역이 존재하지 않습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
								
							</tbody>
						</table>
					</div>
					<hr/>
					
					<%-- <div class="col-sm-10 padding-right deliveryTable" >
					<h4>배송정보</h4>
						<form method="get" action="/member/memberMypage.do">
							<input type="hidden" name="pur_del_mode" id="pur_del_mode" value="delivery"/>
							<input type="hidden" name="page" id="page" value="${listData.page}"/>
			          		<input type="hidden" name="pageSize" id="pageSize" value="${listData.pageSize}"/>
			          		
			          		<!-- 리스트 사이즈 제어 기본 value = 8 -->
			          		<input type="hidden" name="listSize" id="listSize" value="8"/>
			          		
			          		<!-- 정렬 제어를 위한 파라메터 -->
			          		<input type="hidden" name="orderTarget" id="orderTarget" value="${listData.orderTarget}"/>
			          		<input type="hidden" name="orderDirection" id="orderDirection" value="${listData.orderDirection}"/>
						</form>
						<table class="table table-borderded">
							<colgroup>
								<col width="30%" />
								<col width="15%" />
								<col width="15%" />
								<col width="13%" />
								<col width="10%" />
							</colgroup>
							<thead>
							<tr>
								<th>배송일자</th>
								<th>송장번호</th>
								<th>주문번호</th>
								<th>배송상태</th>
								<th>배송</th>
							</tr>
							</thead>
							<tbody id="list">
								<!-- 데이터 출력 -->
								<c:choose>
									<c:when test="${not empty delivery }">
										<c:forEach var="delivery" items="${delivery }">
											<c:if test="${not empty delivery.del_num }">
											<tr class="tac" data-num="${delivery.del_site }" >
												<td>${delivery.del_ondate }</td>
												<td>${delivery.del_num }</td>
												<td>${delivery.p_no } </td>
												<td>${delivery.del_status }</td>
												<td><input type="button" class="btn btn-default goDelivery" value="배송추적"></td>
											</tr>
											</c:if>
										</c:forEach>
										
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4" class="tac">배송내역이 존재하지 않습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
								
							</tbody>
						</table>
						
						<hr />
						
						
					</div> --%>
					<hr />
						
					
					
				</div>
			</div>
		</div>
	</section>

	

</body>
</html>