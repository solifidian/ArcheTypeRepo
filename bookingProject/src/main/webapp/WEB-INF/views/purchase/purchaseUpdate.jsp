<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!DOCTYPE html>

<html>
<head>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


<script type="text/javascript">
	
	
	//브라우저 뒤로가기 막기
	history.pushState(null, null, location.href); 
		window.onpopstate = function(event) { 
											history.go(1); 
											}
	 //브라우저 f5 ,백스페이스 버튼 막기
	$(function(){
		window.onkeydown = function() {
			var kcode = event.keyCode;
			if(kcode == 8 || kcode == 116) event.returnValue = false;
		}
		
		
		$("#purchaseListBtn").click(function(){
			alert("구매내역페이지로 이동")
			location.href="/booking/search.do"
			
		})
		
		$("#continueShoppingBtn").click(function(){
			alert("메인페이지로 이동")
			location.href="/booking/search.do"
			
		})
		
	
	})	
</script>
<style>
#lastPrice{
			text-align: center;
			vertical-align:middle;
		   }
.btn-lg-paySuccess{padding:10px 16px;font-size:18px;line-height:1.33;
			 background: #FE980F;
 			 border-radius: 0;
  			 color: #FFFFFF;
 			 margin-top: 18px;
 			 border: none;	
 			 margin-bottom: 100px;
 			 
}





</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body oncontextmenu="return false">
     
	  ${sessionScope.memSession.m_id} 세션스코프
	<section><!--결제 완료 페이지 시작  -->
	 <div class="col-sm-12 padding-right">
		
	
	<!--결제 영역  -->
	
	    	<div class="purchaseSuccess"><!--features_items-->
					<h2 class="title text-center">구매가 정상적으로 완료되었습니다. </h2>
					<table class="table table-bordered">
						<tr>
							<td rowspan="3"><h2>주문 완료</h2></td>
							<td colspan="2" rowspan="3"><h2>총 결제 금액       ${price} 원</h2></td>
							
						</tr>
						<tr>
							
							
							
						</tr>
						<tr>
							
							
						</tr>
					</table>
	 	
	 			
	 				<div id="a" class="container">
	 					<div class="text-center">
		 				 <input type="button" id="purchaseListBtn"class="btn btn-lg-paySuccess" value="구매내역 확인" />
		 				 <input type="button" id="continueShoppingBtn" class="btn btn-lg-paySuccess" value="쇼핑 계속하기" />
		 				</div>
	 				
	 				</div>
	 		</div>
	 	</div>
	
	</section><!--/#결제 완료 페이지 종료-->




</body>
</html>