<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!DOCTYPE html>

<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>



$(function(){
	
//위시리스트 책 삭제 

$(".cartDeleteBtn").click(function(){
	var num=$(this).parents("tr").attr("data-num");
	$("#isbn").val(num) 
	
	if(confirm("위시리스트에서 삭제 하겠습니까?")){
		
		$.ajax({
			   url:"/wish/wishDelete.do",
			   type:"GET",
			   data:$("#wishListForm").serialize(),
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

//장바구니에 책 추가 
$(".cartInsertBtn").click(function(){ 				 
	 var num=$(this).parents("tr").attr("data-num");
	 var m_id="${sessionScope.memSession.m_id}"
	 
	$("#isbn").val(num) 
	$("#m_id").val(m_id) 
	$("#cart_amount").val(1)
	alert(m_id);
	 
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
	 					$("#m_id").val(m_id) 
	 				
	 				
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
 								<input type="hidden" id="m_id" name="m_id" value="${sessionScope.memSession.m_id}" />
 								<input type="hidden" id="cart_ip" name="cart_ip" value="${cookie.JSESSIONID.value}" />
 								 <div class="form-group">
							  
							  <span class="cartInsertBtn"><input type="button" class="btn btn-default" value="장바구니"  />	</span>																			
							   <input type="button" class="btn btn-default" value="바로구매" class="btn1" />
							  <span class="cartDeleteBtn"><input type="button" class="btn btn-default" value="삭제" /></span>
						
							  </div>
							  </form>
						
							  
							  </td>
							</tr>
							</c:forEach>
						</tbody>
						</table>
						
						</div>
						</div>
		
		
		
		
				
		
	</section> <!--/#cart_items-->
    
	




</body>
</html>