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
				
				$("#excelDownBtn").click(function(){
					$("#searchForm").attr({
						"method":"get",
						"action":"/admin/sitelog/siteLogExcel.do"
					});
					
					$("#searchForm").submit();
					
					$("#searchForm").attr({
						"method":"get",
						"action":"/admin/sitelog/siteLogList.do"
					});
				});
			})
		</script>
  </head>
  <body>
          <h2 class="sub-header">사이트 로그 리스트</h2>
          <div class="well">
          <div class="table-responsive">
          	<!-- 전체 리스트 제어 폼 -->
          	<form class="navbar-form navbar-left" id="searchForm" method="get" action="/admin/sitelog/siteLogList.do">
          		<!-- 페이지 정렬을 위한 hidden input들 -->
          		<input type="hidden" name="page" id="page" value="${listData.page}"/>
          		<input type="hidden" name="pageSize" id="pageSize" value="${listData.pageSize}"/>
          		
          		<!-- 리스트 사이즈 제어 기본 value = 8 -->
          		<input type="hidden" name="listSize" id="listSize" value="8"/>
          		
          		<!-- 정렬 제어를 위한 파라메터 -->
          		<input type="hidden" name="orderTarget" id="orderTarget" value="${listData.orderTarget}"/>
          		<input type="hidden" name="orderDirection" id="orderDirection" value="${listData.orderDirection}"/>
          		
          		<!-- 키워드 검색 -->
          		<h3><span class="label label-default">검색</span></h3>
	          	<select class="form-control" name="searchMode" id="searchMode">
	      			<option value="allSch">전체</option>
	      			<option value="titleSch">title</option>
	      			<option value="ipSch">IP</option>
	      			<option value="commentSch">comment</option>
	      		</select>
	      		<input type="text" class="form-control" name="keyword" id="keyword" value="${listData.keyword}"/>
	      		
	      		<br/><br/>
	      			      		
	      		<!-- 일자 검색 -->
          		<h3><span class="label label-default">일자 검색</span></h3>
          		<input type="hidden" name="searchDateMode" id="searchDateMode" value="date"/>
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
         		&nbsp;&nbsp;/&nbsp;검색 결과 : ${listData.searchTotal} 건 &nbsp;&nbsp;/&nbsp;
         		<button type="button" id="excelDownBtn" class="btn btn-primary">엑셀로 다운로드</button>
         	</div>
            <table class="table table-striped">
           		<colgroup>
           			<col width="10%"/>
           			<col width="20%"/>
           			<col width="20%"/>
           			<col width="20%"/>
           			<col width="30%"/>

           		</colgroup>
              <thead>
                <tr>
                  <th class="orderth" data-value="log_no">No</th>
                  <th class="orderth" data-value="log_update">log time</th>
                  <th class="orderth" data-value="log_ip">ip</th>
                  <th class="orderth" data-value="log_title">title</th>
                  <th class="orderth" data-value="log_comment">comment</th>
                </tr>
              </thead>
              <tbody>
               	<!-- 데이터 출력 -->
               	<c:choose>
               		<c:when test="${not empty siteLogList}">
               			<c:forEach var="siteLog" items="${siteLogList}" varStatus="status">
               				<tr data-num="${siteLog.log_no}">
               					<td class="order">${siteLog.log_no}</td>
               					<td>${siteLog.log_update}</td>
               					<td>${siteLog.log_ip}</td>
               					<td>${siteLog.log_title}</td>
               					<td>${siteLog.log_comment}</td>
               				</tr>
               			</c:forEach>
               		</c:when>
               		<c:otherwise>
               			<tr>
               				<td colspan="4" align="center">등록된 사이트 로그가 없습니다</td>
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
