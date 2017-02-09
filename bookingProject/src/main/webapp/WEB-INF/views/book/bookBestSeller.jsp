<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Justified Nav Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/include/css/justified-nav.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		
    		
    		// 책 첫번째 자세히보기 클릭시 이동 페이지
    		$("#b_month1").click(function(){
    			location.href="/bookDetail.do?="
    		});
    		
    		
    		
    		// 두번째 자세히보기 클릭시 이동 페이지
    		$("#b_month2").click(function(){
    			location.href="/bookDetail.do?="
    		});
    		
    		
    		//세번째 자세히보기 클릭시 이동 페이지
    		$("#b_month3").click(function(){
    			location.href="/bookDetail.do?="
    		});
    	});
    </script>
  </head>

  <body>

    <div class="container">
	
    
	<h5 id="line">베스트셀러</h5>
      <!-- Example row of columns -->
      <div class="row">
       
        <div class="col-lg-4">
        <div class="well"> 
        	<%-- 첫번째  책 제목  --%>
          <h2>110만 독자가 선택한 우리시대 최고의 교양서</h2>
          <p class="text-danger">설명 </p>
          <p><img src="http://image.yes24.com/momo/scmfiles/AdvertFiles/201701/2578228_170112101530.jpg" /></p>
          <p><a class="btn btn-primary" href="#" id="b_month1" role="button">자세히 보기 &raquo;</a></p>
        </div>
        
        </div>
        
        <div class="col-lg-4">
        <div class="well">  
        	<%-- 두번째 책 제목  --%>
          <h2>성장하는 민주 시민을 위한 책 내일을 위한 책</h2>
          <p>설명</p>
          <p><img src="http://image.yes24.com/momo/scmfiles/AdvertFiles/201701/2576035_170111051733.jpg" /></p>
          <p><a class="btn btn-primary" href="#" id="b_month2" role="button">자세히 보기 &raquo;</a></p>
       </div>
       
       </div>
       
        <div class="col-lg-4">
        <div class="well">  
        	<%-- 세번째  책 제목  --%>
          <h2>12가지 법칙이 만드는 피할 수 없는 미래</h2>
          <p>설명</p>
          <p><img src="http://image.yes24.com/momo/scmfiles/AdvertFiles/201701/2575768_170112033903.jpg" /></p>
          <p><a class="btn btn-primary" href="#" id="b_month3" role="button">자세히 보기 &raquo;</a></p>
        </div>
        
        </div>
      </div>
      
      
	
     


    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
