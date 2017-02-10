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
		<link rel="shortcut icon" href="/image/Web_icon.png" />
		<link rel="apple-touch-icon" href="/image/Mobile_icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		<link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
	
	    <!-- Custom styles for this template -->
	    <link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">
	    
	    <link href="/resources/include/css/common.css" rel="stylesheet">
	
	    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
	    <!--[if lt IE 9]><script src="/resources/include/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	    <script src="/resources/include/assets/js/ie-emulation-modes-warning.js"></script>
	
	    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
	    
		<style type="text/css">
			.form-signin{
				width:320px;
				margin:auto;
				text-align:center;
			}
		</style>
		
		<script type="text/javascript">
			
		</script>
		<title>Insert title here</title>
	</head>
	
		 
	<body>
		<div class="container">
		      <form class="form-signin" method="post" action="/admin/member/adminLogin.do">
		        <h2 class="form-signin-heading">관리자 계정으로 접속</h2>
		        
		        <label for="m_id" class="sr-only">ID</label>
		        <input type="text" id="m_id" name="m_id" class="form-control" placeholder="관리자 계정" required autofocus>
		        
		        <label for="m_pwd" class="sr-only">Password</label>
		        <input type="password" id="m_pwd" name="m_pwd" class="form-control" placeholder="Password" required>
		        
		        <button class="btn btn-lg btn-primary btn-block" type="submit">접속</button>
		      </form>
   		</div> <!-- /container -->
		<!-- Bootstrap core JavaScript
	    ================================================== -->
	    <!-- Placed at the end of the document so the pages load faster -->
	    <script type="text/javascript" src="/include/js/jquery-1.12.4.min.js"></script>
	    <script src="/resources/include/dist/js/bootstrap.min.js"></script>
	    <script src="/resources/include/assets/js/docs.min.js"></script>
	    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	    <script src="/resources/include/assets/js/ie10-viewport-bug-workaround.js"></script>
	</body>
</html>