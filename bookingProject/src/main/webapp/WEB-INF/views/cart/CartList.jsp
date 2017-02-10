<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!DOCTYPE html>

<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
	
 $(function(){
	//로그인 했을 경우 m_id=로그인 아이디 
	    var m_id="${sessionScope.memSession.m_id}";
	    
	    if(m_id!="")
		m_id="${sessionScope.memSession.m_id}";
		else if(m_id=="")
		m_id='0';	
	    
		  
	 //쇼핑 계속하기
 	 
	 $("#continueShoppingBtn").click(function(){
			alert("메인페이지로 이동")
			location.href="/book/bookIndex.do"
				
			})
	 //비회원 주문 하기
	 $("#noMemberPurchaseBtn").click(function(){
			 alert("비회원구매")
	 //회원이 비회원주문 클릭했을  경우 로그인 창으로 이동
		 if(m_id!='0'){
			alert("회원 구매를 이용해주세요 ")
	 		return;
	  	}
	
	 //카트가 비어있는 상태에서 구매를 클릭했을 때 경고
	     if(cartSize==0){
	    	 alert("카트가 비어있습니다.")
	    	 return;
		     }		 
			 
			 
	  $("#m_id").val(0);
	  $("#cart_form").attr({
		"method":"get",
		"action":"/purchase/purchaseList.do"
										
	   	 })
		$("#cart_form").submit();
		 })
	 
	 
	//회원주문 계속하기 
	 $("#memberPurchaseBtn").click(function(){
		//비회원이 회원주문 클릭했을  경우 로그인 창으로 이동
			if(m_id=='0'){
				alert("로그인 후 이용해주세요 ")
				return;
			}
		//카트가 비어있는 상태에서 구매를 클릭했을 때 경고
		     if(cartSize==0){
		    	 alert("카트가 비어있습니다.")
		    	 return;
		     }
		 
		 
		 
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
      ${cookie.JSESSIONID.value}  
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
							<li>적립 예정 <span id="point">원</span></li>
						</ul>
						 
						 <form id="cartform">
						  
						 <div class="text-center">
							<input type="hidden" id="m_id" name="m_id" />
							
							<input type="button" class="btn btn-default update" value="회원 주문하기" id="memberPurchaseBtn"/>							
							<input type="button" class="btn btn-default check_out" value="비회원 주문하기" id="noMemberPurchaseBtn" />
							<input type="button" class="btn btn-default check_out" value="쇼핑 계속하기" id="continueShoppingBtn" />
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</section><!--/#do_action-->




</body>
</html>