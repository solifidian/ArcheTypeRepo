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
    <title>Home | E-Shopper</title>

	<style>
		section#slider img.img-responsive{
			max-height:300px;
			max-width:300px;
		}
		section#slider div#slider-carousel{
			min-heigth:1000px;
			box-sizing: border-box;
		}
		.book-thumb{
			max-height:200px;
			margin:auto;
		}
		
		#col{color:orange; font-weight:bold; margin-top:10px;}
	</style>
	<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
	
	<script>
	 
	
	var id="${sessionScope.memSession.m_id}";
	 if(id=="")id=0;
	 
		$(function(){
			
			
			if (getCookie("coupon_pop") != "${cookie.JSESSIONID.value}"){
				//회원일 경우에만 쿠폰 팝업 활성화
				if(id!=0){
					 coupon_pop()
				}
				
			}	
			
			
/* 			//addToCart버튼 클릭시				
			$("#cartBtn").click(function(){
				if(id==null || id==""){
					alert("로그인 창으로 이동 하시겠습니까?");
					location.href="/member/memberLoginPage.do";
				}else {
					$.ajax({
						   url:"/cart/cartInsert.do",
						   type:"POST",
						   data : $("#cartForm").serialize(),
						   dataType:"text",
						   error:function(request,status,error){
							   alert("code : " + request.status + "\r\ nmessage : "
								       + request.reponseText + "\r\n error : " + error);
							   alert("시스템 오류입니다.")
						   },
						   success:function(Data){
							    if(Data=="SUCCESS"){					 				
					 				if(confirm("장바구니에 추가 되었습니다  장바구니로 이동하시겠습니까?")){
					 					location.href = "/cart/cartlist.do";					 					
					 				}
					 				
					 				else{					 					
					 					return;
					 				}
					 
							    }
						   }					 
				 })	
				}
			}); */
	
			
			$("#mypage").click(function(){
				if(id==0) {
//					alert(id);
					location.href="/memeber/memberLoginPage.do";
				}
				else {
					$("#m_id").val(id);
				}
			$("#hidden_form").attr({
					"method":"post",
					"action":"/member/memberMypage.do"
				});
				$("#hidden_form").submit();
			
			});
			
		});
		
		//장바구니에 넣기
		function cartInsert(isbn){
			var cart_amount = 1;
		
			$.ajax({
				url:"/cart/cartInsert.do",
				type:"POST",
				data:"isbn="+isbn+"&cart_amount="+cart_amount,
			    dataType:"text",			   
			   success:function(Data){
				    if(Data=="SUCCESS"){				    	
		 				if(confirm("장바구니에 추가 되었습니다  장바구니로 이동하시겠습니까?")){
		 					location.href = "/cart/cartlist.do";					 					
		 				}else{	
		 					return;
		 				}		 
				    }
			   	},error:function(request,status,error){			  
				   alert("code : " + request.status + "\r\ nmessage : "
					       + request.reponseText + "\r\n error : " + error);
				   alert("시스템 오류입니다.")
			   	}	
			});
		}
		
		
		//팝업 오늘 하루보기 쿠키 체크 function
		function getCookie(name) { 
			   var cookieName = name + "=";
			   var x = 0;
			   while ( x <= document.cookie.length ) { 
			      var y = (x+cookieName.length); 
			      if ( document.cookie.substring( x, y ) == cookieName) { 
			         if ((lastChrCookie=document.cookie.indexOf(";", y)) == -1) 
			            lastChrCookie = document.cookie.length;
			         return decodeURI(document.cookie.substring(y, lastChrCookie));
			      }
			      x = document.cookie.indexOf(" ", x ) + 1; 
			      if ( x == 0 )
			         break; 
			      } 
			   return "";
			}
		

		 //쿠폰 이벤트 팝업
		 function coupon_pop(){
			 
		 window.open("/coupon/coupon_pop.do","이벤트 쿠폰","width=300,height=200,toolbar='no',location='no',status='no',menubar='no',resizable='no'");
		
		 }
	 
	</script>


</head><!--/head-->

<body>
	<!--------------  recommended items Start ------------->
	<div class="recommended_items">
		<h2 class="title text-center">2016년 출시 상품</h2>
		<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<div class="item active">	
					<c:forEach var="etc" items="${etcList}">
					<div class="col-sm-4">
						<div class="product-image-wrapper">
							<div class="single-products">
								<div class="productinfo text-center">
									<object class="book-thumb thumbnail" data="/images/bookImg/${etc.isbn}.jpg" type="image/jpg">
									  <img src="/images/bookImg/no_book_img.png"/>
									</object>
									<p id="col" >${etc.b_title}</p>
									<p>${etc.b_abprice}원</p>
								</div>
								<div class="product-overlay">
									<div class="overlay-content">
										<h2>${etc.b_abprice}원</h2>										
										<p>${etc.b_title}</p>
										<p>저자 : ${etc.b_author}</p>
										
										<a href="/book/bookDetail.do?isbn=${etc.isbn}" id="cartBtn" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>상세 정보 보기</a>
									</div>
									<img src="/resources/images/home/new.png" class="new" alt="" />
								</div>
								
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-------------- recommended items End ---------------->
	<br><br>
	<!--------------  recommended items Start ------------->
	<div class="recommended_items">
		<h2 class="title text-center">BOOKING 추천 도서</h2>
			<div id="recommended-item" class="carousel slide" data-ride="carousel">						
					<ol class="carousel-indicators">
						<li data-target="#recommended-item" data-slide-to="0" class="active"></li>
						<li data-target="#recommended-item" data-slide-to="1"></li>
						<li data-target="#recommended-item" data-slide-to="2"></li>
					</ol>
					
				<div class="carousel-inner">													
					<div class="item active">
						<c:forEach var="reco" items="${recommendList1}">
							<div class="col-sm-4">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<object class="book-thumb thumbnail" data="/images/bookImg/${reco.isbn}.jpg" type="image/jpg">
												  <img src="/images/bookImg/no_book_img.png"/>
												</object>
												<h2>${reco.b_abprice} 원</h2>
												<p>${reco.b_title}</p>															
											
												<a href="/book/bookDetail.do?isbn=${reco.isbn}" id="cartBtn" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>상세 정보 보기</a>	 
											</div>										
										</div>
									</div>
								</div>									
						</c:forEach>
					</div>
					
					<div class="item">
						<c:forEach var="reco" items="${recommendList2}">
								<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<object class="book-thumb thumbnail" data="/images/bookImg/${reco.isbn}.jpg" type="image/jpg">
													  <img src="/images/bookImg/no_book_img.png"/>
													</object>
													<h2>${reco.b_abprice} 원</h2>
													<p>${reco.b_title}</p>															
												<!-- 	<button type="button" class="btn btn-fefault cart" id="cartBtn">
													 <i class="fa fa-shopping-cart"></i> 장바구니에 담기</button> -->
													 <a href="/book/bookDetail.do?isbn=${reco.isbn}" id="cartBtn" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>상세 정보 보기</a>	 
												</div>										
											</div>
										</div>
									</div>									
							</c:forEach>										
					</div>	
					
					<div class="item">
						<c:forEach var="reco" items="${recommendList3}">
							<div class="col-sm-4">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<object class="book-thumb thumbnail" data="/images/bookImg/${reco.isbn}.jpg" type="image/jpg">
												  <img src="/images/bookImg/no_book_img.png"/>
												</object>
												<h2>${reco.b_abprice} 원</h2>
												<p>${reco.b_title}</p>															
												<!-- <button type="button" class="btn btn-fefault cart" id="cartBtn">
												 <i class="fa fa-shopping-cart"></i> 장바구니에 담기</button>  -->
												 <a href="/book/bookDetail.do?isbn=${reco.isbn}" id="cartBtn" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>상세 정보 보기</a>	 
												 </div>										
											</div>
										</div>
									</div>									
						</c:forEach>										
					</div>				 
				  							  		
			</div>
				<a class="left recommended-item-control" href="#recommended-item" data-slide="prev">
					<i class="fa fa-angle-left"></i>
			   </a>
			  
			  <a class="right recommended-item-control" href="#recommended-item" data-slide="next">
				<i class="fa fa-angle-right"></i>
			  </a>
		</div>
	</div>
	<!-------------- recommended items End ---------------->
	

</body>
</html>