<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<head>
	<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script src="/resources/include/js/bootstrap.min.js"></script>
	<script src="/resources/include/js/jquery.scrollUp.min.js"></script>
	<script src="/resources/include/js/price-range.js"></script>
    <script src="/resources/include/js/jquery.prettyPhoto.js"></script>
    <script src="/resources/include/js/main.js"></script>
  	<script>
  		$(function(){	
  			
  			$(".for-admin,.hi").hide();
  			var m_id="${sessionScope.memSession.m_id}";
  			
  			if(m_id != null && m_id != "" && m_id != "0"){
  				$(".for-member,.hi").show();
  	  			$(".for-non-member").hide();  	  			
  	  			if(m_id == "admin"){
  	  				$(".for-admin").show();
  	  			}
  			}
  			else{
  				$(".for-member").hide();
  	  			$(".for-non-member").show();
  			}
  		
  		})
  		
</script>
</head><!--/head-->

<body>
	<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">										
								<li class="hi"><a href="#"><i class="fa fa-user"></i> ${sessionScope.memSession.m_nick}님 안녕하세요 </a></li>
							</ul> 
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="http://www.facebook.com"><i class="fa fa-facebook"></i></a></li>
								<li><a href="http://www.twitter.com"><i class="fa fa-twitter"></i></a></li>
								<li><a href="http://www.linkedin.com"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="https://dribbble.com"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="http://plus.google.com"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="/resources/index.html"><img src="/images/home/log.png" alt="" /></a>
						</div>
						<!-- <div class="btn-group pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
									USA
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">Canada</a></li>
									<li><a href="#">UK</a></li>
								</ul>
							</div>
							
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
									DOLLAR
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">Canadian Dollar</a></li>
									<li><a href="#">Pound</a></li>
								</ul>
							</div>
						</div> -->
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">

								<li><a href="/wish/wishList.do"><i class="fa fa-star"></i> 위시리스트</a></li>
								<li><a href="/cart/cartlist.do"><i class="fa fa-shopping-cart"></i> 장바구니</a></li>
								<li class="for-member"><a href="/member/memberMypage.do"><i class="fa fa-user"></i> 마이페이지</a></li>
								<li class="for-non-member"><a href="/member/memberForm.do"><i class="glyphicon glyphicon-thumbs-up"></i>회원가입</a></li>
								<li class="for-non-member"><a href="/member/memberLoginPage.do"><i class="fa fa-lock"></i> 로그인</a></li>
								<li class="for-member"><a href="/member/memberLogout.do"><i class="fa fa-lock"></i> 로그아웃</a></li>
								<li class="for-admin"><a href="/admin/sitelog/siteLogList.do"><i class="fa fa-lock"></i> 관리자 페이지</a></li>
							
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="/book/bookIndex.do" class="active">Home</a></li>
								<li class="dropdown"><a href="/book/bookForeign.do">IT도서<i class="fa fa-angle-down"></i></a>
									 <ul role="menu" class="sub-menu">
										<li><a href="/book/bookSearch.do">도서 검색</a></li>
									 </ul>
								 </li>
								<li class="dropdown"><a href="/book/bookDomestic.do" >국내도서<i class="fa fa-angle-down"></i></a>
									 <ul role="menu" class="sub-menu">
									 	<li><a href="/book/bookSearch.do">도서 검색</a></li>
									 </ul>
								 </li>
								 <li class="dropdown"><a href="" >책추천<i class="fa fa-angle-down"></i></a>
									 <ul role="menu" class="sub-menu">
									 	<li><a href="/book/bookBestSeller.do" class="active">베스트셀러</a></li>	
							 			<li><a href="/book/bookNew.do" >신간</a></li>					
										<li><a href="/book/bookMonth.do">이달의책</a></li>	
									 </ul>
								 </li>					
						
								<li><a href="/book/bookSearch.do">도서 검색</a></li>	
								<li class="dropdown"><a href="#">커뮤니티<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="/board/boardList.do">커뮤니티 게시판</a></li>
                                        
                                    </ul>
                                </li>
                               	<li><a href="/board/cusService.do">고객센터</a></li>                                 
								<li><a href="/book/errorPage.do">404</a></li>							
								
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
					
					
				
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<head>
	<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script src="/resources/include/js/bootstrap.min.js"></script>
	<script src="/resources/include/js/jquery.scrollUp.min.js"></script>
	<script src="/resources/include/js/price-range.js"></script>
    <script src="/resources/include/js/jquery.prettyPhoto.js"></script>
    <script src="/resources/include/js/main.js"></script>
  	<script>
  		$(function(){	
  			
  			$(".for-admin,.hi").hide();
  			var m_id="${sessionScope.memSession.m_id}";
  			
  			if(m_id != null && m_id != "" && m_id != "0"){
  				$(".for-member,.hi").show();
  	  			$(".for-non-member").hide();  	  			
  	  			if(m_id == "admin"){
  	  				$(".for-admin").show();
  	  			}
  			}
  			else{
  				$(".for-member").hide();
  	  			$(".for-non-member").show();
  			}
  		
  		})
  		
</script>
</head><!--/head-->

<body>
	<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">										
								<li class="hi"><a href="#"><i class="fa fa-user"></i> ${sessionScope.memSession.m_nick}님 안녕하세요 </a></li>
							</ul> 
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="https://www.facebook.com"><i class="fa fa-facebook"></i></a></li>
								<li><a href="https://www.twitter.com"><i class="fa fa-twitter"></i></a></li>
								<li><a href="https://www.linkedin.com/"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="https://dribbble.com/"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="https://plus.google.com "><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="/resources/index.html"><img src="/images/home/log.png" alt="" /></a>
						</div>
						<!-- <div class="btn-group pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
									USA
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">Canada</a></li>
									<li><a href="#">UK</a></li>
								</ul>
							</div>
							
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
									DOLLAR
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">Canadian Dollar</a></li>
									<li><a href="#">Pound</a></li>
								</ul>
							</div>
						</div> -->
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">

								<li><a href="/wish/wishList.do"><i class="fa fa-star"></i> 위시리스트</a></li>
								<li><a href="/cart/cartlist.do"><i class="fa fa-shopping-cart"></i> 장바구니</a></li>
								<li class="for-member"><a href="/member/memberMypage.do"><i class="fa fa-user"></i> 마이페이지</a></li>
								<li class="for-non-member"><a href="/member/memberForm.do"><i class="glyphicon glyphicon-thumbs-up"></i>회원가입</a></li>
								<li class="for-non-member"><a href="/member/memberLoginPage.do"><i class="fa fa-lock"></i> 로그인</a></li>
								<li class="for-member"><a href="/member/memberLogout.do"><i class="fa fa-lock"></i> 로그아웃</a></li>
								<li class="for-admin"><a href="/admin/sitelog/siteLogList.do"><i class="fa fa-lock"></i> 관리자 페이지</a></li>
							
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="/book/bookIndex.do" class="active">Home</a></li>
								<li class="dropdown"><a href="/book/bookForeign.do">IT도서<i class="fa fa-angle-down"></i></a>
									 <ul role="menu" class="sub-menu">
										<li><a href="/book/bookSearch.do">도서 검색</a></li>
									 </ul>
								 </li>
								<li class="dropdown"><a href="/book/bookDomestic.do" >국내도서<i class="fa fa-angle-down"></i></a>
									 <ul role="menu" class="sub-menu">
									 	<li><a href="/book/bookSearch.do">도서 검색</a></li>
									 </ul>
								 </li>
								 <li class="dropdown"><a href="" >책추천<i class="fa fa-angle-down"></i></a>
									 <ul role="menu" class="sub-menu">
									 	<li><a href="/book/bookBestSeller.do" class="active">베스트셀러</a></li>	
							 			<li><a href="/book/bookNew.do" >신간</a></li>					
										<li><a href="/book/bookMonth.do">이달의책</a></li>	
									 </ul>
								 </li>					
						
								<li><a href="/book/bookSearch.do">도서 검색</a></li>	
								<li class="dropdown"><a href="#">커뮤니티<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="/board/boardList.do">커뮤니티 게시판</a></li>
                                        
                                    </ul>
                                </li>
                               	<li><a href="/board/cusService.do">고객센터</a></li>                                 
								<li><a href="/book/errorPage.do">404</a></li>							
								
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
					
					
				
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
>>>>>>> refs/remotes/origin/master
	</header><!--/header-->