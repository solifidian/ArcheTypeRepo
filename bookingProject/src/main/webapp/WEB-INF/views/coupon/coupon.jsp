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
		<link rel="shortcut icon" href="../../image/icon.png" />
		<link rel="apple-touch-icon" href="../../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->

		<!--IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. http://code.google.com/-->
		<!--[if lt IE 9]>
			<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<!-- 웹페이지에 jQuery를 불러오도록 설정 -->
	    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<!-- javascript start -->
		<script>
		
		$(function(){
			//오늘 하루보지 않기 기능
		
				
			//쿠폰이미지 클릭 시 쿠폰 획득 
			$("#couponImg").click(function(){
				
//				alert("야야")
				 $.ajax({
					 url:"/coupon/couponInsert.do",
					 success:function(resultData){
//						 alert(resultData)
						 if(resultData == "success"){
							 alert("발급완료 했습니다")
							 window.open('', '_self').close();
						 }else if(resultData == "miss"){
							 alert("이미 받은 쿠폰 입니다.")
							 window.open('', '_self').close();
						 }else if(resultData == "fail"){
							 alert("발급 실패 했습니다.")
							 window.open('', '_self').close();
						 }
						 else{ 
							 alert("발급 실패 다시 시도해주세요.")
						 }
						 
					 }
				 })/*  ajax 종료 */
				
				
			})/*$("#couponImg").click종료  */
			
			
		}) /* function 종료 */
		
		
		
		//오늘 하루 팝업띄우지 않기 function 쿠키 세팅
		function setCookie(name, value, expiredays){
			var todayDate = new Date();
				todayDate.setDate (todayDate.getDate() + expiredays);
				document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
			
		}
	 
		
		function closePop(){
				
			var ischecked=$("#pop").val();
			
				
			if (ischecked=="on"){
				setCookie("coupon_pop", "${cookie.JSESSIONID.value}", 1);
				window.open('', '_self').close();
		  	}
		
			
		}
		
		 
		
			
			
		</script>
		
		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div id="couponImg">
			 <img src="http://localhost:8080/resources/images/coupon/coupon.PNG"></img>
 		</div>
		<div class="PopupBottom"> 
			<input class="PopupCheck" type='checkbox' id="pop" name='pop' onClick="closePop()"><span class="PopupText">오늘 하루 다시 보지 않기</span>
		</div>
	
</body>
</html>