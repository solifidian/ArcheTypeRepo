<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>		
      	<link rel="shortcut icon" href="./image/icon.png" />
		<link rel="apple-touch-icon" href="./image/icon.png" />
	<title> </title>	
	<script>
		$(function(){
			
			//문의게시판으로 가기 버튼
			$("#cusBtn1").click(function(){
				location.href="/board/boardList.do";
			});
			
			
			//FAQ 게시판으로 가기 버튼
			$("#cusBtn2").click(function(){
				location.href="/book/bookFAQ.do";
			});
			
		});
	</script>
	</head>
	<body>
		 <div id="contact-page" class="container">
    	<div class="bg">
	    	<div class="row">
	    	
  				<div class="col-sm-3">
				<div class="left-sidebar">
					<h2>고객센터</h2>
					<div class="panel-group category-products" id="accordian"><!-- 카테고리  -->
					
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordian" href="#bookAndPeople">
										<span class="badge pull-right"><i class="fa fa-plus"></i></span>
										1:1문의
									</a>
								</h4>
							</div><!--class: panel-heading끝  -->
							<div id="bookAndPeople" class="panel-collapse collapse">
								<div class="panel-body">
										<ul>
											<li><a href="/board/boardList.do">문의게시판 </a></li>
											<li><a href="/book/bookFAQ.do">FAQ </a></li>											
										</ul>
								</div><!--class: panel-body끝  -->
							</div><!-- id:review 끝 -->				
						</div><!--class: panel panel-default 끝  -->
						
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordian" href="#powerBook">
										<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											문의
									</a>
								</h4>
							</div><!--class: panel-heading끝  -->
							<div id="powerBook" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="">문의 </a></li>
											<li><a href="">문의 </a></li>										
										</ul>
									</div><!--class: panel-body끝  -->
							</div><!-- id:review 끝 -->							
						</div><!--class: panel panel-default 끝  -->
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordian" href="#event">
										<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											문의
									</a>
								</h4>
							</div><!--class: panel-heading끝  -->
							<div id="event" class="panel-collapse collapse">
								<div class="panel-body">
									<ul>
										<li><a href="">문의 </a></li>
										<li><a href="">문의 </a></li>										
									</ul>
								</div><!--class: panel-body끝  -->
							</div><!-- id:review 끝 -->
						</div><!--class: panel panel-default 끝  -->	
						
						<div class="brands_products">
								<h2>문의</h2>
								<div class="brands-name">
									<ul class="nav nav-pills nav-stacked">
										<li><a href=""> <span class="pull-right">(#)</span>문의</a></li>
										<li><a href=""> <span class="pull-right">(#)</span>문의</a></li>									
									</ul>
								</div>
						</div><!--/리뷰-->
	
<!--현재 하는 이벤트 이미지 첨부  -->
						<div class="shipping text-center"><!--이벤트-->
								<img src="/resources/images/home/shipping.jpg" alt="" />
						</div><!--/이벤트-->
													
					</div><!--/카테고리 class: panel-group category-products  -->
				</div><!--/class:  left-sidebar -->	
			</div><!--/class: col-sm-3  -->
	    	    		
	    	    		
	    	    		
	    		<div class="col-sm-9">  			   			
					<h2 class="title text-center"> <strong>고객센터</strong></h2>    			    				    				
					<div>
						<img src="/resources/images/ping.png">
					
						
					</div>
				 		
			
			<br><br><br><br>  	
    		<div class="row">  	
	    		<div class="col-sm-8">
	    		
	    			<div class="contact-info">
	    				<h2 class="title text-center">Contact Info</h2>
	    				<address>
	    					<p>도서왕 Booking Inc.</p>
							<p>서울특별시 영등포구 당산동</p>
							<p>Seoul, Korea</p>
							<p>Mobile: +1234 5678 9</p>
							<p>Fax: 1-234-456-456</p>
							<p>Email: info@booking.com</p>
	    				</address>
	    			
	    			</div>
    			</div>    			
	    	</div>  
    	</div>
    	</div>				
    	</div>  
    </div><!--/#contact-page-->
	</body>
</html>
