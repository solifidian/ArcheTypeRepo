<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

	




 	<script src="/booking/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		$(function(){
			
			//상세보기 버튼 클릭시 상세modal페이지 이동
      		$(".goDetail").click(function(){
      			$('#mtable > tbody:last').html("");
      			var p_no = $(this).parents("tr").attr("data-num");
      			alert(p_no);
      			$("#p_no").val(p_no);
      			console.log("주문번호 : "+p_no);
      			 $.ajax({
		             url: "/booking/member/boots_view.do",
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

<button type="button" class="btn btn-primary"  data-toggle="modal" data-target=".bs-example-modal-lg">상세보기</button>
<div class="test">

</div>
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
								<th>책 제목</th>
								<th>저자</th>
								<th>수량</th>
								
							</thead>
							<tbody id="list">
								
							</tbody>
						</table>
						
    </div>
  </div>
</div>
						
	<h1>1번 ${sessionScope.bookId.getM_id()}</h1>
	
	<h1>3번 ${sessionScope.memVO.m_id}</h1>
	<h1>4번 ${sessionScope.memVO.getM_id()}</h1>
	
	<h1></h1>
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>주문내역</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">주문내역</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">배송내역</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">취소/교환 신청 내역</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">회원 정보 수정</a></h4>
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
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">이건 뭐할까</a></h4>
								</div>
							</div>
						</div><!--/category-products-->
					
						
						
						
					
					</div>
				</div>
				<!-- <style>
					.tett{ height:300px;}
				</style> -->
				
				<div class="col-sm-9 padding-right tett">
					
					<div class="col-sm-10 padding-right" >
					<h4>최근 주문 내역</h4>
						<table class="table table-borderded">
							<colgroup>
								<col width="25%" />
								<col width="15%" />
								<col width="15%" />
								<col width="25%" />
								
							</colgroup>
							<thead>
								<th>주문일자</th>
								<th>주문번호</th>
								<th>주문내역</th>
								<th>주문자명</th>
								
							</thead>
							<tbody id="list">
								<!-- 데이터 출력 -->
								<c:choose>
									<c:when test="${not empty purchase }">
										<c:forEach var="purchase" items="${purchase }">
											<tr class="tac" data-num="${purchase.p_no}">
												<td>${purchase.p_date }</td>
												<td>${purchase.p_no }</td>
												<td><button type="button" class="btn btn-primary goDetail"  data-toggle="modal" data-target=".bs-example-modal-lg">상세보기</button></td>
												<td>${purchase.m_name}</td>
												
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4" class="tac">주문내역이 존재하지 않습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
								
							</tbody>
						</table>
					</div>
					<hr6 />
					
					<div class="col-sm-10 padding-right" >
					<h4>배송정보</h4>
						<table class="table table-borderded">
							<colgroup>
								<col width="30%" />
								<col width="15%" />
								<col width="15%" />
								<col width="13%" />
								<col width="10%" />
							</colgroup>
							<thead>
								<th>배송일자</th>
								<th>송장번호</th>
								<th>주문번호</th>
								<th>배송상태</th>
								<th>배송</th>
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
						
						
					</div>
					<hr />
						
					
					
				</div>
			</div>
		</div>
	</section>

	

</body>
</html>