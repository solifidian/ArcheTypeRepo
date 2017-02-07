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

	




 	<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		$(function(){
			/* //상세보기 버튼 클릭시 상세페이지 이동
      		$(".goDetail").click(function(){      			
      			var p_no = $(this).parents("tr").attr("data-num");
      			alert(p_no);
      			$("#p_no").val(p_no);
      			console.log("주문번호 : "+p_no);
      			//ajax로 boots_view불러와서 책 정보 가져오기
      			
      		}); */
			
      		//배송추적 클릭시 이동
      		$(".goDelivery").click(function(){      			
      			var p_no = $(this).parents("tr").attr("data-num");
      			alert(p_no);
      			$("#p_no").val(p_no);
      			console.log("주문번호 : "+$("#p_no").val());
      			// 택배회사 주소 넣기
      		});
      		
      		
    		$(document).on("click",".purchaseDetailBtn",function(){
    			var dataNum = $(this).parents("tr").attr("data-num");
    			console.log(dataNum);
    			
    			$.ajax({
    				url:"/purchase/purchaseDetail.do",
    				type:"POST",
    				data:"p_no="+dataNum,
    				success:function(detailList){
    					$(detailList).each(function(){
    						var p_no = this.p_no;
    						var b_name = this.b_name;
    						var p_amount = this.p_amount;
    						console.log(p_no+"/"+b_name+"/"+p_amount);
    					})
    				}
    				
    			})
    		})
		});
		
	</script>

</head><!--/head-->

<body>

<article>
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
		  Launch demo modal
		</button>
		
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">주문 내역 상세</h4>
		      </div>
		      <div class="modal-body">
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
	</article>

						
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
								<col width="15%" />
								<col width="15%" />
								<col width="30%" />
								<col width="13%" />
								<col width="10%" />
							</colgroup>
							<thead>
								<tr>
									<th>주문일자</th>
									<th>주문번호</th>
									<th>주문내역</th>
									<th>주문자명</th>
									<th>배송</th>
								</tr>
							</thead>
							<tbody id="list">
								<!-- 데이터 출력 -->
								<c:choose>
									<c:when test="${not empty purchase }">
										<c:forEach var="purchase" items="${purchase }">
											<tr class="tac" data-num="${purchase.p_no}">
												<td>${purchase.p_date }</td>
												<td>${purchase.p_no }</td>
												<td><input type="button" class="btn btn-default purchaseDetailBtn" value="상세보기"> </td>
												<td>${purchase.m_name}</td>
												<td><input type="button" class="btn btn-default goDelivery" value="배송추적"></td>
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
					<hr />
					
					<div class="col-sm-10 padding-right" >
					<h4>배송정보</h4>
						<table class="table table-borderded">
							<colgroup>
								<col width="15%" />
								<col width="15%" />
								<col width="30%" />
								<col width="13%" />
								<col width="10%" />
							</colgroup>
							<thead>
							<tr>
								<th>주문일자</th>
								<th>송장번호</th>
								<th>위치</th>
								<th>배송상태</th>
								<th>배송</th>
							</tr>
							</thead>
							<tbody id="list">
								<!-- 데이터 출력 -->
								<c:choose>
									<c:when test="${not empty purchase }">
										<c:forEach var="purchase" items="${purchase }">
											<c:if test="${not empty purchase.del_num }">
											<tr class="tac"  >
												<td>${purchase.del_ondate }</td>
												<td>${purchase.del_num }</td>
												<td>${purchase.p_no } </td>
												<td>${purchase.del_status }</td>
												<td><input type="button" class="btn btn-default" value="배송추적"></td>
											</tr>
											</c:if>
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
						
						<hr />
						
						
					</div>
					<hr />
						
					
					
				</div>
			</div>
		</div>
	</section>
	

	

</body>
</html>