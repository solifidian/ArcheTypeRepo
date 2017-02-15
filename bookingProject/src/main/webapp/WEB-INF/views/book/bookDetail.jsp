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
	
		<!-------------------- Category Tab & recommand item Section Start -------------------->
	<section>
		<div class="container">
		<!--------------- row Start --------------->
			<div class="row"> 
			<!--
				Category Tab Start (Left)
				부트스트랩의 collapse를 이용함
				컨트롤 영역의 CategoryController로부터 Category리스트를 받아옴.
				Attribute에 추가 되어있어야 데이터가 표시됨.
				
				@cateList	List<CategoryVO>
				@cate	대분류 item
				@root	각 대분류에 대응하는 중분류를 뽑아 태그를 작성하기 위해 대분류를  c:out 으로 변수 선언 함
						중분류의 forEach가 끝나면 remove됨
				@cate2	중분류 item
				@root2	각 중분류에 대응하는 소분류를 뽑아 태그를 작(생략)
				
				@collapse_set 	첫번째 카테고리 탭만 최초에 펼쳐져 있도록 하기 위해 사용됨
								중분류 작성 마지막에 remove됨
				@aria_set		상동
				@in_set			상동
				
				현재 카테고리 DB가 입력이 되어있는 3, 7, 28번 분류만 표시되도록 해놓음
			 -->
			<div class="col-sm-3">
				<div class="left-sidebar">
					<h2>Category</h2>
					<div class="panel-group category-products" id="bookCategoryTab"  role="tablist">
						<c:if test="${empty cateList }">
							No DATA
						</c:if>
						<c:forEach var="cate" items="${cateList}">
							<c:choose>
								<c:when test="${cate.cat_step == 1}">
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="panel-heading" role="tab" id="heading${cate.cat_no}">
												<a data-toggle="collapse" data-parent="#bookCategoryTab" href="#collapse${cate.cat_no}" aria-expanded="true">
													<span class="badge pull-right"><i class="fa fa-plus"></i></span>
													<c:out value="${cate.cat_name}"/>
													<c:set var="root" value="${cate.cat_no}"/>
												</a>
											</div>
										</div>
										<ul><li>
										<div id="collapse${root}" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading${root}">
											<div class="panel-body">
											<div class="panel-group" id="tab${root}" role="tablist" aria-multiselectable="true">
											<c:forEach var="cate2" items="${cateList}">
												<c:choose>
													<c:when test="${cate2.cat_step == 2 && cate2.cat_root == root && (cate2.cat_no == 3 || cate2.cat_no == 7 || cate2.cat_no == 28) }">					
														<div class="panel panel-default">
																<c:choose>
																	<c:when test="${cate2.cat_no ==3 }">
																		<c:set var="collapse_set" value="collapsed"/>
																		<c:set var="aria_set" value="true"/>
																		<c:set var="in_set" value="in"/>
																	</c:when>
																	<c:otherwise>
																		<c:set var="collapse_set" value="collapsed"/>
																		<c:set var="aria_set" value="false"/>
																		<c:set var="in_set" value=""/>
																	</c:otherwise>
																</c:choose>
																<div class="panel-heading" role="tab" id="heading${cate2.cat_no}">
																	<a data-toggle="collapse"
																	class="${collapse_set}" data-parent="#tab${root}" href="#collapse${cate2.cat_no}"
																	aria-expanded="${aria_set}" aria-controls="collapse${cate2.cat_no}">
																		<span class="badge pull-right"><i class="fa fa-plus"></i></span>
																		<c:out value="${cate2.cat_name}"/>
																		<c:set var="root2" value="${cate2.cat_no}"/>
																		
																	</a>
																	
																</div>
																
																<div id="collapse${root2}" class="panel-collapse collapse ${in_set}" role="tabpanel" aria-labelledby="heading${root2}">
																	<div class="panel-body">
																		<c:forEach var="cate3" items="${cateList}">
																			<c:choose>
																				<c:when test="${cate3.cat_step == 3 && cate3.cat_root == root2}">		
																					<ul><li><a href="/book/bookSearch.do?cat_no=${cate3.cat_no}">
																						<c:out value="${cate3.cat_name}"/>
																					</a></li></ul>
																				</c:when>
																			</c:choose>
																		</c:forEach>
																	</div>
																</div>
														</div>	
														<c:remove var="collapse_set"/>
														<c:remove var="aria_set"/>
														<c:remove var="in_set"/>
													</c:when>
												</c:choose>
											</c:forEach>
											
											<c:remove var="root"/>
											</div>
											</div>
										
										</div>
										</li></ul>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>		
					</div>
				</div>
			</div>
			<!------- Category Tab End (Left) -------->
				 
				<style>
					
					#test2 { height:450px;}
					#test3 { height:450px;}					
					.tet {height:120px;}
					.tet2 {height:70px;}
					.tet3 {height:70px;}
					.d_form{text-align:center; 
						}
					.d_form label{margin-top:10px;}
					.d_form .bu {margin-top:10px;}
					.d_form .tt {border:1px gray dashed;}
					#b_cart{margin:10px 20px; width:200px;}
						
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
					//페이스북 연동 부분
		  			$(function(d, s, id) {
		  			  var js, fjs = d.getElementsByTagName(s)[0];
		  			  if (d.getElementById(id)) return;
		  			  js = d.createElement(s); js.id = id;
		  			  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8&appId=170080446812154";
		  			  fjs.parentNode.insertBefore(js, fjs);
		  			}(document, 'script', 'facebook-jssdk'));

					
					
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
			<div class="col-sm-9 padding-right">
				<div class="product-details"><!--product-details-->
						<div class="col-sm-4">						
					  		<div class="view-product">
								<object class="thumbnail" data="/images/bookImg/${detail.isbn}.jpg" type="image/jpg">
								  	<img src="/images/bookImg/no_book_img.png"/>
							  	</object>
								
							</div>
						
						</div>
					
					<div class="col-sm-7">
						<div class="product-information"><!--/product-information-->
							<img src="/resources/images/product-details/new.jpg" class="newarrival" alt="" />
							<h2>${detail.b_title}</h2>
							<p>저자 : ${detail.b_author}</p>
							<img src="/resources/images/product-details/rating.png" alt="" />
							<br>
							<span>
								<span> ${detail.b_abprice} 원</span></span>
								
								<span>
									<label>수량 : </label>
									<input type="text" name="cart_amount"  value="1" id="cart_amount" class="num"  style="width:20px; text-align:center;"/>
									<input type="button" id="bt_up" class="bt_up" value="+" />
									<input type="button" id="bt_down" class="bt_down" value="-" />
									<br>
									 <button type="button" class="btn btn-fefault cart" id="b_cart">
									 <i class="fa fa-shopping-cart"></i>장바구니에 담기</button> 
								</span>	
							<br>
							<p><b>출간일 :</b>${detail.b_pubdate}</p>
							<p><b>출판사 :</b>${detail.pub_name}</p>
							<p><b>isbn 코드 :</b> ${detail.isbn}</p>
							<p>배송비 안내<br>
								배송비 : 2500 원<br>
								도착 예정 일: 결제 후 1일 발송 예정</p>
							<!--페이스북 좋아요 /공유하기 버튼 영역  -->
							<p class="fb-like" data-href="https://www.facebook.com/greatbookbooking/" data-layout="standard" data-action="like" data-size="small" data-show-faces="false" data-share="true">
		                 	</p>
						</div><!--/product-information-->
					</div>
				</div><!--/product-details-->
					
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
								
								<li><a href="#complainText" data-toggle="tab">환불/교환 규정</a></li>
								<li><a href="#score" data-toggle="tab">한줄평점</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="b_intro" >
							<style>
								.tte{background-color:white;}
								
								table.tb1{
									border-collapse:collapse;
									text-align:left;
									line-height:1.5;
									border-top:1px solid #ccc;
									border-bottom:1px solid #ccc;
									border-left:3px solid #369;
									margin:20px 10px;
								}
								table.tb1 th{
									width : 147px;
									padding: 10px;
									font-weight:bold;
									vertical-align:top;
									color:#153d73;
									border-right:1px solid #ccc;
									border-bottom:1px solid #ccc;
								}
								table.tb1 td{
									width : /* 349px; */1200px;
									padding: 10px;
									vertical-align:top;
									border-right:1px solid #ccc;
									border-top:1px solid #ccc;
									border-bottom:1px solid #ccc;
								}
								
								#tab2{
									margin:20px 10px;
								}
							</style>
								<div class="col-sm-12 tte">
								 	<table class="tb1" >
								 		<tr>
								 			<th scope="row">isbn : </th>
								 			<td>${detail.isbn}</td>
								 		</tr>
								 		<tr>
								 			<th scope="row">도서명 : </th>
								 			<td>${detail.b_title}</td>
								 		</tr>
								 		<tr>
								 			<th scope="row">쪽수 : </th>
								 			<td>${detail.b_pagesize}</td>
								 		</tr>								 		
								 		<tr>
								 			<th scope="row">크기 : </th>
								 			<td>${detail.b_size}</td>
								 		</tr>
								 		<tr>
								 			<th scope="row">출판일 : </th>
								 			<td>${detail.b_pubdate}</td>
								 		</tr>
								 		<tr>
								 			<th scope="row">목차 : </th>
								 			<td id="big">${detail.b_index}</td>
								 		</tr>
								 		<tr>
								 			<th scope="row">책 상세 : </th>
								 			<td>${detail.b_comment}</td>
								 		</tr>							 		
								 	</table>								 	
								</div>
							</div>
							
						
							<div class="tab-pane fade" id="complainText" >
								<div class="col-sm-12 tte">
								 	<div class="row" id="tab2">
								 		<h3 class="alert alert-warning" >환불/교환 규정</h3>
								 		<p>${detail.b_complain}</p>
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