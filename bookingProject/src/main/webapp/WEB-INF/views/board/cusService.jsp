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
				location.href="/board/questionBoardList.do";
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
	    		<div class="col-sm-9">  			   			
					<h2 class="title text-center"> <strong>고객센터</strong></h2>    			    				    				
					<div>
						<img src="/resources/images/service.png">
					
						
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
