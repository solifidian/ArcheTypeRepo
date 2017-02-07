<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | E-Shopper</title>
    <link href="/resources/include/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/include/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/include/css/prettyPhoto.css" rel="stylesheet">
    <link href="/resources/include/css/price-range.css" rel="stylesheet">
    <link href="/resources/include/css/animate.css" rel="stylesheet">
	<link href="/resources/include/css/main.css" rel="stylesheet">
	<link href="/resources/include/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
	<header id="header"><!--header-->
		 <tiles:insertAttribute name="header"/>
	</header><!--/header-->
	
	<section id="section1"><!--메인-->
		
		
		
		
		<div class="container">
				<div class="col-md-12">
										
							
						 <tiles:insertAttribute name="body"/>
				
					
				</div>
			</div>
	</section><!--/section1종료-->
	
	
	<footer id="footer"><!--Footer-->
		 <tiles:insertAttribute name="footer"/>
		
	</footer><!--/Footer-->
	

  
</body>
</html>