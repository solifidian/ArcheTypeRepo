<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정. initial-scale는 초기비율-->
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/Web_icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/Mobile_icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		<style type="text/css">
			
		</style>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript">
			$(function(){
				var resultData = "${resultData}";
				var resultMessage = "${resultMessage}";
				
				if(resultMessage != null && resultMessage != ""){
					alert(resultMessage);
				}
				
				if(resultData.indexOf("SUCCESS") > -1){
					location.href = "${redirectURL}";
				}
				else{
					history.go(-1);
				}
					
			})
		</script>
		<title>Insert title here</title>
	</head>
	<body>
		
	</body>
</html>