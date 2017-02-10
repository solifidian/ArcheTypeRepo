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


 


</head><!--/head-->

<body>
	
	<h1>${sessionScope.memSession.m_id}</h1>
	<section>
		
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Category</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											대분류1
										</a>
									</h4>
								</div>
								<div id="sportswear" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="#">소분류1 </a></li>
											<li><a href="#">소분류2 </a></li>
											<li><a href="#">소분류3 </a></li>
											<li><a href="#">소분류4</a></li>
											<li><a href="#">소분류5 </a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#mens">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											대분류2
										</a>
									</h4>
								</div>
								<div id="mens" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="#">소분류1</a></li>
											<li><a href="#">소분류2</a></li>
											<li><a href="#">소분류3</a></li>
											<li><a href="#">소분류4</a></li>
											
										</ul>
									</div>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#womens">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											대분류3
										</a>
									</h4>
								</div>
								<div id="womens" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="#">소분류1</a></li>
											<li><a href="#">소분류2</a></li>
											<li><a href="#">소분류3</a></li>
											<li><a href="#">소분류4</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">중분류1</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">중분류2</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">중분류3</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">중분류4</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">중분류5</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">중분류6</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">중분류7</a></h4>
								</div>
							</div>
						</div><!--/category-products-->
					
						<div class="brands_products"><!--brands_products-->
							<h2>Brands</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="#"> <span class="pull-right">(50)</span>분류1</a></li>
									<li><a href="#"> <span class="pull-right">(56)</span>분류2</a></li>
									<li><a href="#"> <span class="pull-right">(27)</span>분류3</a></li>
									<li><a href="#"> <span class="pull-right">(32)</span>분류4</a></li>
									<li><a href="#"> <span class="pull-right">(5)</span>분류5</a></li>
									<li><a href="#"> <span class="pull-right">(9)</span>분류6</a></li>
									<li><a href="#"> <span class="pull-right">(4)</span>분류7</a></li>
								</ul>
							</div>
						</div><!--/brands_products-->
						
						
						
						
					
					</div>
				</div>
				
				 
				
				 
				<style>
					/* #test {background-color:black; }
					#test1 {background-color:red; } */
					#test2 { height:450px;}
					#test3 { height:450px;}
					/* #test4 {background-color:blue; }
					#test5 {background-color:aqua; }
					#test5-1 {background-color:gray; }
					#test5-2 {background-color:orange; }
					#test6 {background-color:purple; }
					#test7 {background-color:navy; } */
					.tet {height:120px;}
					.tet2 {height:70px;}
					.tet3 {height:70px;}
					.d_form{text-align:center; 
						}
					.d_form label{margin-top:10px;}
					.d_form .bu {margin-top:10px;}
					.d_form .tt {border:1px gray dashed;}
						
				</style>
				<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
				<script type="text/javascript">
				var s_id = "${sessionScope.memSession.m_id}";
				$(function(){ 
					
					//수량 조절
					  $('.bt_up').click(function(){ 
					    var n = $('.bt_up').index(this);
					    var num = $(".num").val();
					    num = $(".num").val(num*1+1); 
					  });
					  $('.bt_down').click(function(){ 
					    var n = $('.bt_down').index(this);
					    var num = $(".num").val();
					    if(num<=0){alert("수량이 0보다 아래가 될수 없습니다.")
					    	$(".num").val(0);}
					    else {
					    num = $(".num").val(num*1-1);
					    }
					  });
					 
					
					//구매 버튼 클릭시
					$("#b_buy").click(function(){
						if(s_id==null || s_id==""){
							alert("로그인 창으로 이동 하시겠습니까?");
						}else {
							$("#b_detail").attr({
			            		"method":"post",
			                    "action":"/book/.do"
			            	});
			                $("#b_detail").submit();
						}
					});
					
					//장바구니 버튼 클릭시
					$("#b_cart").click(function(){
						if(s_id==null || s_id==""){
							alert("로그인 창으로 이동 하시겠습니까?");
						}else {

							$.ajax({
								   url:"/cart/cartInsert.do",
								   type:"POST",
								   data:$("#b_detail").serialize(),
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
					});
				});
					
				</script> 
				  
	
				<form id="b_detail">
				<input type="hidden" name="isbn" id="isbn" value="${detail.isbn}">
				
				<div class="col-sm-9 padding-right d_form" >
					<div class="col-sm-4 tt" id="test2">
						<label></label>
						<object class="thumbnail" data="/images/bookImg/${detail.isbn}.jpg" type="image/jpg">
								  	<img src="/images/bookImg/no_book_img.png"/>
							  	</object>
						
					</div>
					<div class="col-sm-8" id="test3">
						<div class="row-sm-6 tet tt" id="test4">
							<label>도서  : ${detail.b_title}</label>
							<br>
							<label>저자  : ${detail.b_author}</label>	
						</div>
						
						<div class="row-sm-6 tet2" id="test5">
							<div class="col-sm-7 tet3 tt" id="test5-1">
								<label>가격 : ${detail.b_abprice} 원</label> 
							</div>
							
							<div class="col-sm-5 tet3 tt" id="test5-2">
								출간일 : ${detail.b_pubdate}
								<br>
								출판사 : ${detail.pub_name}
								<br>
								isbn 코드 : ${detail.isbn}
							</div>
						</div>
						
						<div class="row-sm-6 tet tt" id="test6">
							<label>
								배송비 안내<br>
								배송비 : 2500 원<br>
								도착 예정 일: 결제 후 1일 발송 예정
								
							
							</label>
						</div>
						
						<div class="row-sm-6 tet tt" id="test7">
							<label>수량 : <input type="text" name="cart_amount"  value="1" id="cart_amount" class="num"  style="width:20px; text-align:center;"/>
								<input type="button" id="bt_up" class="bt_up" value="+" />
								<input type="button" id="bt_down" class="bt_down" value="-" />
                				
                			</label><br>
							<input type="button" class="btn btn-default add-to-cart bu" id="b_buy" name="b_buy" value="구매하기">
							<input type="button" class="btn btn-default add-to-cart bu" id="b_cart" name="b_cart" value="장바구니">
						</div>
						
					
					</div>
					
				</div>
				</form>
				<div class="col-sm-9 padding-right">
						<hr></hr>
						
					 <div class="recommended_items"><!--recommended_items-->
						<h2 class="title text-center">관련 상품</h2>
						
						<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">	
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="/images/home/recommend1.jpg" alt="" />
													<h2>가격</h2>
													<p>상품이름</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="/images/home/recommend2.jpg" alt="" />
													<h2>가격</h2>
													<p>상품이름</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="/images/home/recommend3.jpg" alt="" />
													<h2>가격</h2>
													<p>상품이름</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
								</div>
								<div class="item">	
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="/images/home/recommend1.jpg" alt="" />
													<h2>가격</h2>
													<p>상품이름</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="/images/home/recommend2.jpg" alt="" />
													<h2>가격</h2>
													<p>상품이름</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="/images/home/recommend3.jpg" alt="" />
													<h2>가격</h2>
													<p>상품이름</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
								</div>
							</div>
							 <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
								<i class="fa fa-angle-left"></i>
							  </a>
							  <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
								<i class="fa fa-angle-right"></i>
							  </a>			
						</div>
					</div><!--/recommended_items-->
				
					
					
					
					
					
					<!-- 사이드 바  -->
					
				</div>
							
				<div class="col-sm-12 padding-right">
				
					
					<style>
						 /* #rede {background-color:pink;} */
						 .tete {height:700px;}
						 .tree{text-align:center;}
					</style>
				
					<div class="tete" id="rede">
						<div class="category-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#b_intro" data-toggle="tab">책소개</a></li>
								<li><a href="#byAuthor" data-toggle="tab">저자 소개</a></li>
								<li><a href="#bookInfo" data-toggle="tab">책 소개</a></li>
								<li><a href="#complainText" data-toggle="tab">환불/교환 규정</a></li>
								<li><a href="#score" data-toggle="tab">한줄평점</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="b_intro" >
							<style>
								.tte{background-color:white;}
							</style>
								<div class="col-sm-12 tte">
								 	<table>
								 		<tr>
								 			<td>isbn</td>
								 			<td>${detail.isbn}</td>
								 		</tr>
								 		<tr>
								 			<td>쪽수</td>
								 			<td></td>
								 		</tr>
								 		<tr>
								 			<td>언어</td>
								 			<td></td>
								 		</tr>
								 		<tr>
								 			<td>크기</td>
								 			<td></td>
								 		</tr>
								 		<tr>
								 			<td>제본형태</td>
								 			<td></td>
								 		</tr>
								 		<tr>
								 			<td>총권수</td>
								 			<td></td>
								 		</tr>
								 	</table>
								</div>
							</div>
							
							<div class="tab-pane fade" id="byAuthor" >
								<div class="col-sm-12 tte">
								 	내용
								</div>
							</div>
							
							<div class="tab-pane fade" id="bookInfo" >
								<div class="col-sm-12 tte">
								 	<div class="row">
								 		<h3>목차</h3>
								 		${detail.b_index}
								 	</div>
								 	<div class="row">
								 		<h3>상세</h3>
								 		${detail.b_comment}
								 	</div>
								 	
								</div>
							</div>
							<div class="tab-pane fade" id="complainText" >
								<div class="col-sm-12 tte">
								 	<div class="row">
								 		<h3>환불/교환 규정</h3>
								 		${detail.b_complain}
								 	</div>
								</div>
							</div>			
							<div class="tab-pane fade" id="score" >
								<div class="col-sm-12 tte">
								 	<div class="row">
<%-- 리플영역  --%>

	<jsp:include page="/WEB-INF/views/reply/bookReply.jsp" /> 	

								 	</div>
	
								</div>
							</div>				
						</div>
					</div><!--/category-tab-->

					</div>
					</div>
					
			</div>
		</div>
	</section>
	
	
	

</body>
</html>