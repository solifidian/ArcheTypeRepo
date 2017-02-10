<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<!-- 문서 유형 : 현재 웹 문서가 어떤 HTML 버전에 맞게 작성되었는지를 알려준다. -->

<!--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
     "http://www.w3.org/TR/html4/loose.dtd">
     DTD 선언문이 HTML 페이지의 가장 첫 라인에 명시되어야 웹 브라우저가 HTML 버전을 인식.
     HTML태그나 CSS를 해당 버전에 맞도록 처리하므로 웹 표준 준수를 위하여 반드시 명시되어야 한다.-->

<html>
<head>


<meta charset="UTF-8">

<!-- html5 : 파일의 인코딩 방식 지정 - 한국어 처리를 위한 euc-kr과 다국어 처리를 위한 utf-8로 설정.-->
		<meta charset="utf-8">
		<!-- html4 : 파일의 인코딩 방식 지정 -->
		<!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->

		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->

		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정. initial-scale는 초기비율-->

		<!-- 모바일 웹 페이지 설정 -->
	
		<!-- 모바일 웹 페이지 설정 끝 -->

		<!--IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. http://code.google.com/-->
		<!--[if lt IE 9]>
			<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<!-- 웹페이지에 jQuery를 불러오도록 설정 -->
		   <link href="/resources/include/css/bootstrap.min.css" rel="stylesheet">
		    <link href="/resources/include/css/font-awesome.min.css" rel="stylesheet">
		    <link href="/resources/include/css/prettyPhoto.css" rel="stylesheet">
		    <link href="/resources/include/css/price-range.css" rel="stylesheet">
		    <link href="/resources/include/css/animate.css" rel="stylesheet">
			<link href="/resources/include/css/main.css" rel="stylesheet">
			<link href="/resources/include/css/responsive.css" rel="stylesheet">
		
	    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    	<script src="/resources/include/js/bootstrap.min.js"></script>
    	<script>
    	$(function(){
    		
    		$("#goMemberJoinBtn").click(function(){
    			location.href="/member/memberLoginPage.do"
    			
    		})
    		$("#goHomeBtn").click(function(){
    			location.href="/book/bookIndex.do"
    			
    		})
    		
    		
    	})
    	
    	
    	
    	(function(d, s, id) {
    		  var js, fjs = d.getElementsByTagName(s)[0];
    		  if (d.getElementById(id)) return;
    		  js = d.createElement(s); js.id = id;
    		  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8&appId=170080446812154";
    		  fjs.parentNode.insertBefore(js, fjs);
    		}(document, 'script', 'facebook-jssdk'));
    	
    	
    	</script>
	   <style>
	   body{ background-color: black;
	   }
	   
	   .fb-comments{ background-color: white;
	   margin-top: 100px;}
	   
	   </style>
	   
	    
		<!-- javascript start -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div class="container text-center">
   		<div class="row">
   			<div class="col-sm-12">
   			    <div class="col-sm-10">    			
   				 <img src="/resources/images/home/event.png" alt="" />
   				 </div>
				<div class="col-sm-5 col-md-offset-2">
					<input type="button" class="btn btn-default btn-lg" value="쿠폰 받으러 가기" id="goMemberJoinBtn"/>
					<input type="button" class="btn btn-default btn-lg" value="홈페이지 가기"   id="goHomeBtn"/>
								
				</div>   				
   			    
   			
   			      <div class="col-sm-12 col-md-offset-2">
   			       <div id="fb-root">

                   <div class="fb-comments" data-href="https://www.facebook.com/greatbookbooking/" data-numposts="5"></div>
					</div>
					
					</div>
   				
					
   				
   			
   			
   			
   			
   			
   			
   			</div>
   		
   		
   		
   		
   		
   		
   		
   		</div>
   
   
   
   
   </div>
</body>
</html>