<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/images/Web_icon.png" />
	<link rel="apple-touch-icon" href="/images/Mobile_icon.png" />

    <title>Dashboard Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="/resources/include/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
   		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			function goPage(page){
				if($("#search").val() == "allSch"){
					$("#keyword").val("");
				}
				$("#page").val(page);
				$("#searchForm").attr({
					"method":"get",
					"action":"/board/boardList.do"
				})
				$("#searchForm").submit();
			}
			

			function hrefSubmit(formid){
				$(formid).attr({
					"method":"get",
					"action":"/admin/board/boardList.do"
				});
				$(formid).submit();
			}
			$(function(){
				var formerKeyword = "<c:out value='${data.keyword}'/>";
				if(formerKeyword != ""){
					$("#keyword").val("<c:out value='${data.keyword}'/>");
					$("#searchType").val("<c:out value='${data.searchType}'/>");
					
					$("#boardList tbody tr td:contains('"+formerKeyword+"')").each(function(){
						var regex = RegExp(formerKeyword,"gi");
						var newText = $(this).text().replace(regex,"<span class='searched'>"+formerKeyword+"</span>");
						$(this).html(newText);
					})
				}
				
				/* if("<c:out value='${data.pageSize}'/>" != ""){
					$("#pageSize").val("<c:out value='${data.pageSize}'/>");
				} */
				
				$("#searchType").change(function(){
					if($("#searchType").val() == "allSch"){
						$("#keyword").attr("placeholder","전체 데이터 조회합니다");
						$("#keyword").focus();
					}else if($("#searchType").val() != "allSch"){
						$("#keyword").attr("placeholder","");
						$("#keyword").focus();
					}
				})
				
				$("#searchForm").click(function(){
					if($("#searchType").val() == "allSch"){
						
					}
				})
				
				/* $(".order").click(function(){
					var order_by = $(this).attr("data-value");
					console.log("선택값:"+order_by);
					
					$("#order_by").val(order_by);
					if($("#order_sc").val() == 'desc'){
						$("#order_sc").val('asc');
					}else if($("#order_sc").val() == 'asc'){
						$("#order_sc").val('desc');
					}
					goPage($("#page").val());
				})
				
				$("#pageSize").change(function(){
					goPage($("#page").val());
				}); */
				
				
				$(document).on("click","table tbody tr",function(){
					var b_num = $(this).attr("data-num");
					$("#selectForm #b_num").val(b_num);
					$("#selectForm").attr({
						"method":"get",
						"action":"/board/boardDetail.do"
					})
					$("#selectForm").submit();
				})
				
				$("#searchForm").submit(function(){
					$("#searchForm").attr({
						"method":"get",
						"action":"/admin/board/boardList.do"
					});
				});
				$("#insertFormBtn").click(function(){
					location.href="/board/writeForm.do"
				});
			});
		</script>
  </head>
  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Help</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="#">회원 리스트</a></li>
            <li><a href="/admin/board/boardList.do">게시판 리스트</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Dashboard</h1>

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
          </div>
          <h2 class="sub-header">Section title</h2>
          <div class="table-responsive">
          	<form class="navbar-form navbar-left" id="searchForm">
          		검색
	          	<select name="searchType" id="searchType">
	      			<option value="allSch">전체</option>
	      			<option value="titleSch">제목</option>
	      			<option value="contentSch">내용</option>
	      			<option value="combineSch">제목+내용</option>
	      			<option value="writerSch">글쓴이</option>
	      		</select>
	      		<input type="text" name="keyword" id="keyword" value="${data.keyword}"/>
	      		
	      		<a href="javascript:;" onclick="hrefSubmit('#searchForm'); return false;">Search</a>
          	</form>
          	<form class="navbar-form navbar-left" id="dateSearchForm">
          		날짜검색
	          	<input type="date" class="form-control" name="sch_start_date">
	          	<input type="date" class="form-control" name="sch_end_date">
	          	<a href="javascript:;" onclick="hrefSubmit('#dateSearchForm'); return false;">Search</a>
          	</form>
            <table class="table table-striped">
           		<colgroup>
           			<col width="17%"/>
           			<col width="45%"/>
           			<col width="15%"/>
           			<col width="23%"/>
           		</colgroup>
              <thead>
                <tr>
                  <th>글번호</th>
                  <th>글제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                </tr>
              </thead>
              <tbody>
               	<!-- 데이터 출력 -->
               	<c:choose>
               		<c:when test="${not empty boardList}">
               			<c:forEach var="board" items="${boardList}" varStatus="status">
               				<tr data-num="${board.b_num}">
               					<td class="order">${board.b_num}</td>
               					<td>${board.b_title}</td>
               					<td>${board.b_name}</td>
               					<td class="order">${board.b_date}</td>
               				</tr>
               			</c:forEach>
               		</c:when>
               		<c:otherwise>
               			<tr>
               				<td colspan="4" align="center">등록된 글이 없습니다</td>
               			</tr>
               		</c:otherwise>
               	</c:choose>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/resources/include/dist/js/bootstrap.min.js"></script>
    <script src="/resources/include/assets/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
