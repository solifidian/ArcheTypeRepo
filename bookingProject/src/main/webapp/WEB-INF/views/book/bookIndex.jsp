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
  
	
 


</head><!--/head-->

<body>
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
			
			
			
			$("#mypage").click(function(){
				if(id==0) {
					alert(id);
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
	<h1>3번 ${sessionScope.memVO.m_id}</h1>
	<form id="hidden_form">
		<input type="hidden" id="m_id" name="m_id">
	</form>
	<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<h1><span>도깨비</span>포토 에세이</h1>
									<h2>쓸쓸하고 찬란한 신</h2>
									<p>
									매회 방영 즉시 뜨거운 화제가 되었던 초감동 에피소드들과 명대사들, 스토리가 생생하게 담겨 있는 ‘포토에세이’
									한 번도 공개된 적 없던 공유-이동욱-육성재-김고은-유인나의 완벽한 케미가 돋보이는 초고화질 현장 스틸컷
									</p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
									<img src="http://bimage.interpark.com/goods_image/9/8/4/2/263969842g.jpg" class="girl img-responsive" alt="" />
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<h1><span>너의 이름은</span>+부록</h1>
									<h2>너의이름은 Another Side : Earthbound </h2>
									<p>애니메이션 차세대 거장으로 거듭난 신카이 마코토 감독이
기적 같은 사랑이라는 테마 속에, 또 하나의 메시지를 소설에 담았다. </p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
									<img src="http://image.yes24.com/momo/TopCate1048/MidCate005/103197776.jpg" class="girl img-responsive" alt="" />
								</div>
							</div>
							
							<div class="item">
								<div class="col-sm-6">
									<h1><span>유시민의</span>글쓰기 특강</h1>
									<h2>유시민의 30년 베스트셀러 영업기밀</h2>
									<p>글쓰기가 두려운 그대들이여, 이제 원하는 대로 글을 써보자!
									</p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
									<img src="http://bimage.interpark.com/goods_image/8/8/5/9/237228859g.jpg" class="girl img-responsive" alt="" />
								</div>
							</div>
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Category</h2>
						<div class="panel-group category-products" id="accordian"  role="tablist" aria-multiselectable="true">
							<c:if test="${empty cateList }">
								No DATA
							</c:if>
							<div class="panel-group">
							<c:forEach var="cate" items="${cateList}">
								<c:choose>
									<c:when test="${cate.cat_step == 1}">
										<div class="panel panel-default">
											<div class="panel-body">
													<a data-toggle="collapse" data-parent="#accordian" href="#tap${cate.cat_no}">
														<span class="badge pull-right"><i class="fa fa-plus"></i></span>
														<c:out value="${cate.cat_name}"/>
														<c:set var="root" value="${cate.cat_no}"/>
													</a>
											</div>
											<div id="tap${root}" class="panel-collapse collapse in">
												<div class="panel-body">
												<c:forEach var="cate2" items="${cateList}">
												<c:choose>
													<c:when test="${cate2.cat_step == 2 && cate2.cat_root == root && (cate2.cat_no == 3 || cate2.cat_no == 7 ||cate2.cat_no == 28 )}">									
																<ul><li>
																	<c:choose>
																		<c:when test="${cate2.cat_no ==3 }">
																		<a data-toggle="collapse" data-parent="#tap${root}" href="#tap${cate2.cat_no}">
																			<span class="badge pull-right"><i class="fa fa-plus"></i></span>
																			<c:out value="${cate2.cat_name}"/>
																			<c:set var="root2" value="${cate2.cat_no}"/>
																		</a>
																		</c:when>
																		<c:otherwise>
																		<a data-toggle="collapse" data-parent="#tap${root}" href="#tap${cate2.cat_no}">
																			<span class="badge pull-right"><i class="fa fa-plus"></i></span>
																			<c:out value="${cate2.cat_name}"/>
																			<c:set var="root2" value="${cate2.cat_no}"/>
																		</a>
																		</c:otherwise>
																	</c:choose>
																	<div id="tap${root2}" class="panel-collapse collapse">
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
																</li></ul>
														
													</c:when>
												</c:choose>
												</c:forEach>
											</div>
											<c:remove var="root"/>
											</div>
										</div>
									</c:when>
								</c:choose>
							</c:forEach>
							</div>
					</div>
		</div>
		</div>
				
				<div class="col-sm-9 padding-right">
					
					<div class="category-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#group1" data-toggle="tab">분류1</a></li>
								<li><a href="#group2" data-toggle="tab">분류2</a></li>
								<li><a href="#group3" data-toggle="tab">분류3</a></li>
								<li><a href="#group4" data-toggle="tab">분류4</a></li>
								<li><a href="#group5" data-toggle="tab">분류5</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="group1" >
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery1.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery2.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery3.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery4.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
							</div>
							
							
							<!-- group2 시작 -->
							<div class="tab-pane fade" id="group2" >
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery4.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery3.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery2.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery1.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
							</div>
							
							<!-- group3 시작 -->
							<div class="tab-pane fade" id="group3" >
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery3.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery4.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery1.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery2.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
							</div>
							
							
							<!-- group4시작 -->
							<div class="tab-pane fade" id="group4" >
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery1.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery2.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery3.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery4.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
							</div>
							
							<!-- group5 시작 -->
							<div class="tab-pane fade" id="group5" >
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery2.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery4.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery3.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="/images/home/gallery1.jpg" alt="" />
												<h2>가격</h2>
												<p>상품이름</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div><!--/category-tab-->
					
					<div class="recommended_items"><!--recommended_items-->
						<h2 class="title text-center">별도 상품</h2>
						
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
			</div>
		</div>
	</section>
	
	
	

</body>
</html>