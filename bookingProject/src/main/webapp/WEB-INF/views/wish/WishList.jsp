<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!DOCTYPE html>

<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>



$(function(){
	

 //바로 구매 버튼 클릭 시 nowPurchaseBtn
	 $(".nowPurchaseBtn").click(function(){
	alert("이것은 바로구매입니다.")
		 var isbnv=$(this).parents("tr").attr("data-num");
//		 	alert(isbn)
		  var isbn=$("#isbn").val(isbnv);
		  $("#nowpay").val(1); 
		  $("#cart_amount").val(1);
		 				 
		 $("#wishListForm").attr({
				"method":"get",
				"action":"/purchase/purchaseList.do"
											
				})
				$("#wishListForm").submit();
				 
		 
				 
	 })
//위시리스트 책 삭제 

$(".cartDeleteBtn").click(function(){
	var isbn=$(this).parents("tr").attr("data-num");
	$("#isbn").val(isbn) 
	
	if(confirm("위시리스트에서 삭제 하겠습니까?")){
		
		$.ajax({
			   url:"/wish/wishDelete.do",
			   type:"GET",
			   data:{"isbn":isbn},
			   dataType:"text",
			   error:function(request,status,error){
				   alert("code : " + request.status + "\r\ nmessage : "
					       + request.reponseText + "\r\n error : " + error);
				   alert("시스템 오류입니다.")
			   },
			   success:function(Data){
				   if(Data=="SUCCESS"){
					   alert("삭제 성공")
				   	   location.reload();
				   }//IF종료
			   
			   }//SUCCESS종료
		
		})/*ajax종료 */
	}/* if문 종료 */
	
})

//쇼핑 계속하기 버튼 클릭시
$("#goPurchaseBtn").click(function(){
	location.href="/book/bookIndex.do";
});


//장바구니에 책 추가 
$(".cartInsertBtn").click(function(){ 				 
	 var num=$(this).parents("tr").attr("data-num");
	$("#isbn").val(num) 
	$("#cart_amount").val(1)
	
	 
	 $.ajax({
		   url:"/cart/cartInsert.do",
		   type:"POST",
		   data:$("#wishListForm").serialize(),
		   dataType:"text",
		   error:function(request,status,error){
			   alert("code : " + request.status + "\r\ nmessage : "
				       + request.reponseText + "\r\n error : " + error);
			   alert("시스템 오류입니다.")
		   },
		   success:function(Data){
			    if(Data=="SUCCESS"){
	 				
	 				if(confirm("장바구니에 추가 되었습니다  장바구니로 이동하시겠습니까?")){
	 					 				
	 					$("#wishListForm").attr({
	 						"method":"get",
	 						"action":"/cart/cartlist.do"
	 						
	 					})
	 					$("#wishListForm").submit();
	 					
	 				}
	 				
	 				else{
	 					
	 					return;
	 				}
	 
			    }
		   }
			 
	 
	 
})	
}) /*insert 종료  */


})/*function 종료  */
</script>

	
 
	



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	  "${sessionScope.memSession.m_id}" 세션스코프
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
							<td class="col-sm-2">이미지</td>
							<td class="description">상품정보</td>
							
							<td class="quantity">선택</td>
							
							<td></td>
						</tr>
					</thead>
					<tbody >
			
						<c:if test="${empty wish }">
							  <tr>
							  <td colspan=3 class="text-center"> <h3>위시리스트가 비어있습니다.</h3>	  
							  </tr>
						 </c:if>
						  
						<c:forEach var="d" items="${wish}">							
							<tr data-num="${d.isbn}">
							  <td class="col-sm-2"><span class="col-sm-6 thumbnail"><img src="/resources/include/assets/images/do.jpg" alt="" /></span></td>
							  <td class="col-sm-8" >
							  
							  <span class="godetail"><h4>${d.b_title}</h4></span> 		
							  </td>
							  
							  <td class="col-sm-1 padding-right">
							  <form class="form-horizontal" id="wishListForm" name="wishListForm">
							  
 								<input type="hidden" id="isbn" name="isbn"  />
 								<input type="hidden" id="cart_amount" name="cart_amount"  />
 								<input type="hidden" id="nowpay" name="nowpay"  />
 								
 								 <div class="form-group">
							  
							  <span class="cartInsertBtn"><input type="button" class="btn btn-default" value="장바구니"  />	</span>																			
							  <span class="nowPurchaseBtn"> <input type="button" class="btn btn-default" value="바로구매" /> </span>
							  <span class="cartDeleteBtn"><input type="button" class="btn btn-default" value="삭제" /></span>
						
							  </div>
							  </form>
						
							  
							  </td>
							</tr>
							</c:forEach>
						</tbody>
						</table>
						
						</div>
							<div class="text-center" >
											<input type="button" class="btn btn-default update" value="쇼핑 계속하기" id="goPurchaseBtn"/>
											
							</div>
							<p></p>		
						
						</div>
		
		
		
		
				
		
	</section> <!--/#cart_items-->
    
	




</body>
</html>