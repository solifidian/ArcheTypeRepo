<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <style>
    	.center{text-align:center;}
    	.enter{margin-bottom:30px;}
    	.col{background-color:white;}
    	.enter img{max-height:500px; min-height:500px;}
    	#txt{text-align:center;}
    </style>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		
    		
    		//이달의 책 첫번째 자세히보기 클릭시 이동 페이지
    		$("#b_month1").click(function(){
    			location.href="/bookDetail.do?="
    		});
    		
    		
    		
    		//이달의 책 첫번째 자세히보기 클릭시 이동 페이지
    		$("#b_month2").click(function(){
    			location.href="/bookDetail.do?="
    		});
    		
    		
    		//이달의 책 첫번째 자세히보기 클릭시 이동 페이지
    		$("#b_month3").click(function(){
    			location.href="/bookDetail.do?="
    		});
    	});
    </script>
  </head>

  <body>

    <div class="container">
      	<div class="col-sm-14">
       		<div class="well col page-header">
       			<h1 class="center"><i class="glyphicon glyphicon-book"></i> <span class="">  이달의 책</span></h1>
       		</div>
       	
       	
      <!-- Example row of columns -->
      <div class="row">       	
 
       	
		<c:choose>    
			<c:when test="${not empty monthList}" >
				<c:forEach var="monthList" items="${monthList}">
						<div class="col-lg-4 enter">
			        <div class="well"> 
			        	<%-- 책 제목  --%>
			          <h2 id="txt">${monthList.b_title}</h2>
			          <p class="text-danger">대표 회로 도서 3선 </p>
			          <p class="center"><img src="/images/bookImg/${monthList.isbn}.jpg" class="img-responsive" alt="" onerror="this.src = '/images/nobook.jpg'" /></p>
			          <p class="center"><a class="btn btn-primary" href="/book/bookDetail.do?isbn=${monthList.isbn}" id="b_month1" role="button">자세히 보기 &raquo;</a></p>
			        </div>
		        </div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<h1>책정보가 없습니다.</h1>
			</c:otherwise>
		</c:choose>
       						 
        
        
      </div>
      
      </div>
      
	
     


    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
