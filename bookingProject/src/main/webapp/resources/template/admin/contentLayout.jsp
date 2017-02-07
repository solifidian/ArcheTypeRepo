<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ include file="admin.jspf" %>
	<title><tiles:getAsString name="title"/></title>
  </head>
  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
    	<tiles:insertAttribute name="header"/>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <tiles:insertAttribute name="leftbar"/>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <tiles:insertAttribute name="main"/>
        </div>
      </div>
    </div>

    
  </body>
</html>