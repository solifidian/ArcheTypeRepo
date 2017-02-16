<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
		<style>
			th.orderth:hover{
				background-color:grey;
			}
			span.currentPage{
				color:red;
			}
		</style>
		<script type="text/javascript" src="/resources/include/js/listCommon.js"></script>
		<script type="text/javascript">
			$(function(){
				var searchMode = "<c:out value='${listData.searchMode}'/>";
				var searchDateMode = "<c:out value='${listData.searchDateMode}'/>"
				if(searchMode != ''){
					$("#searchMode").val(searchMode);
				}
				if(searchDateMode != ''){
					$("#searchDateMode").val(searchDateMode);
				}
				$("#updateStockBtn").click(function(){
					$.ajax({
						url:"/admin/book/isbnCheck.do",
						type:"post",
						data:"isbn="+$("#isbn").val(),
						dataType:"text",
						error:function(error,status,xhr){
							alert(error+status+xhr);
						},
						success:function(result){
							if(result == ''){
								alert("해당하는 isbn을 찾지 못했습니다.")
							}else{
								if(!chkSubmit("#st_amount","입고량을 입력해주세요")) return;
								else{
									$("#stockForm").submit();
								}
							}
						}
					})
				})
			})
		</script>
  </head>
  <body>
          <h2 class="sub-header">도서 입고 리스트</h2>
          <div class="well">
          <div class="table-responsive">
          	<!-- 전체 리스트 제어 폼 -->
          	<form class="navbar-form navbar-left" id="stockForm" method="post" action="/admin/book/bookStockInsert.do">
          		<!-- 기존 도서 입고 처리 및 확인 유무 확인 -->
          		<h3><span class="label label-default">ISBN</span>
          		<input type="text" class="form-control" name="isbn" id="isbn"/></h3>
	      		<br/>
	      		<h3><span class="label label-default">입고 권 수</span>
	      		<input type="text" class="form-control" name="st_amount" id="st_amount"/></h3>
	      		<h3><span class="label label-default">입고명</span>
	      		<input type="text" class="form-control" name="st_name" id="st_name" value="상품 입고"/></h3>
	      		<button type="button" id="updateStockBtn" class="btn btn-primary">입고 처리</button>
          	</form>
          </div>
         </div>
          <div class="well">
          <div class="table-responsive">
          	<!-- 전체 리스트 제어 폼 -->
          	<form class="navbar-form navbar-left" id="searchForm" method="get" action="/admin/book/bookStockList.do">
          		<!-- 페이지 정렬을 위한 hidden input들 -->
          		<input type="hidden" name="page" id="page" value="${listData.page}"/>
          		<input type="hidden" name="pageSize" id="pageSize" value="${listData.pageSize}"/>
          		
          		<!-- 리스트 사이즈 제어 기본 value = 8 -->
          		<input type="hidden" name="listSize" id="listSize" value="8"/>
          		
          		<!-- 정렬 제어를 위한 파라메터 -->
          		<input type="hidden" name="orderTarget" id="orderTarget" value="${listData.orderTarget}"/>
          		<input type="hidden" name="orderDirection" id="orderDirection" value="${listData.orderDirection}"/>
          		
          		<!-- 키워드 검색 -->
          		<h3><span class="label label-default">기록 검색</span></h3>
	          	<select class="form-control" name="searchMode" id="searchMode" >
	      			<option value="isbnSch">ISBN</option>
	      			<option value="stockNameSch">입고명</option>
	      		</select>
	      		<input type="text" class="form-control" name="keyword" id="keyword" value="${listData.keyword}"/>
	      		<br/><br/>
	      		<h3><span class="label label-default">날짜</span></h3>
	          	<input type="date" class="form-control" name="searchStartDate" id="searchStartDate" value="${listData.searchStartDate}">
	          	<input type="date" class="form-control" name="searchEndDate" id="searchEndDate" value="${listData.searchEndDate}">
	          	<button id="searchKeywordBtn" class="btn btn-primary">검색</button>
          	</form>
          </div>
         </div>
         <div class="well">
         	<div class="navbar-left">
         		페이지당 표시 건 수
         		<select name="pageSizeChange" id="pageSizeChange" >
         			<option value="5">5</option>
         			<option value="10">10</option>
         			<option value="30">30</option>
         		</select>건
         		&nbsp;&nbsp;/&nbsp;검색 결과 : ${listData.searchTotal} 건&nbsp;&nbsp;/&nbsp;
         		<!-- <button type="button" id="excelDownBtn" class="btn btn-primary">엑셀로 다운로드</button> -->
         	</div>
            <table class="table table-striped">
           		<colgroup>
           			<col width="15%"/>
           			<col width="35%"/>
           			<col width="10%"/>
           			<col width="10%"/>
					<col width="20%"/>
					<col width="10%"/>
           		</colgroup>
              <thead>
                <tr>
                  <th class="orderth" data-value="st_no">입고 번호</th>
                  <th class="orderth" data-value="isbn">ISBN</th>
                  <th class="orderth" data-value="st_amount">입고량</th>
                  <th class="orderth" data-value="st_date">입고일</th>
                  <th class="orderth" data-value="st_name">입고명</th>
                  <th class="orderth" data-value="st_name_no">입고명 번호</th>
                </tr>
              </thead>
              <tbody>
               	<!-- 데이터 출력 -->
               	<c:choose>
               		<c:when test="${not empty stockList}">
               			<c:forEach var="stock" items="${stockList}" varStatus="status">
               				<tr data-num="${stock.st_no}">
               					<td class="order">${stock.st_no}</td>
               					<td>${stock.isbn}</td>
               					<td>${stock.st_amount}</td>
               					<td>${stock.st_date}</td>
               					<td>${stock.st_name}</td>
               					<td>${stock.st_name_no}</td>
               				</tr>
               			</c:forEach>
               		</c:when>
               		<c:otherwise>
               			<tr>
               				<td colspan="4" align="center">등록된 도서가 없습니다</td>
               			</tr>
               		</c:otherwise>
               	</c:choose>
              </tbody>
            </table>
            <div class="paginationBar text-center" >
            	<tag:PagingBar page="${listData.page}" searchTotal="${listData.searchTotal}" pageSize="${listData.pageSize}"/>
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
