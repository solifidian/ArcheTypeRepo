<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!DOCTYPE html>

<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	
 $(function(){
	
	//회원주문 계속하기 
	 $("#memberPurchaseBtn").click(function(){
		var m_id="${sessionScope.memSession.m_id}"
		$("#m_id").val(m_id);
		$("#cart_form").attr({
			"method":"get",
			"action":"/purchase/purchaseList.do"
									
		})
		$("#cart_form").submit();
		 
		 
		 
	 })
	 
	 
	 
 })/* function 종료 */
	
	
	

	
	
	</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	  ${sessionScope.memSession.m_id} 세션스코프
	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Shopping Cart</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed" id="cart_table">
					<thead>
						<tr class="cart_menu">
							<td class="col-sm-1">이미지</td>
							<td class="description">설명</td>
							<td class="price">판매가</td>
							<td class="quantity">수량</td>
							<td class="total">합계</td>
							<td></td>
						</tr>
					</thead>
					<tbody >
	
						 <jsp:include page="cart.jsp"></jsp:include>
						
						
					
					
					
					
<%-- 					<c:if test="${empty data }">
							  <tr>
							  <td colspan=5> <div class="text-center"><h3>장바구니가 비어 있습니다.</h3></div>	  
							  </tr>
					 </c:if>
									
					<c:forEach var="d" items="${data}">	
						<tr data-num="${d.cat_no}">
							<td class="cart_product">
								<a href=""><img src="images/cart/one.png" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href="">${d.b_name}</a></h4>
								<p>Web ID: 1089772</p>
								
							</td>
							<td class="cart_price">
								<p>${d.b_abprice}원</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href=""> + </a>
									<input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
									<a class="cart_quantity_down" href=""> - </a>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">${b.b_abprice}원</p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
							</td>
						</tr>
                </c:forEach> --%>
					</tbody>
				
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->
    
	<section id="do_action">
		<div class="container">
			
			<div class="row">
			
				<div class="col-sm-8">
					<div class="total_area">
												
						<ul>
							<li>총 합계 <span id="totalprice">원</span></li>
							<li>배 송 비 <span id="deliveryprice">원</span></li>
							<li>결제 예정금액  <span id="price"></span></li>
							<li>적립 예정 <span>$61</span></li>
						</ul>
						 
						 <form id="cartform">
						  
						 <div class="text-center">
							<input type="hidden" id="m_id" name="m_id" />
							
							<input type="button" class="btn btn-default update" value="회원 주문하기" id="memberPurchaseBtn"/>							
							<input type="button" class="btn btn-default check_out" value="비회원 주문하기" />
							<input type="button" class="btn btn-default check_out" value="쇼핑 계속하기" />
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</section><!--/#do_action-->




</body>
</html>