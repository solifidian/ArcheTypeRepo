<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
		<style>
			th.orderth:hover{
				background-color:grey;
			}
			tr.dataRow:hover{
				color:blue;
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

			})
		</script>
  </head>
  <body>
          <h2 class="sub-header">등록 회원 리스트</h2>
          <div class="well">
          <div class="table-responsive">
          	<!-- 전체 리스트 제어 폼 -->
          	<form class="navbar-form navbar-left" id="searchForm" method="get" action="/admin/member/memberList.do">
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
	      			<option value="idSch">ID</option>
	      			<option value="nickSch">닉네임</option>
	      			<option value="nameSch">이름</option>
	      			<option value="emailSch">이메일</option>
	      		</select>
	      		<input type="text" class="form-control" name="keyword" id="keyword" value="${listData.keyword}"/>
	      		
	      		<br/><br/>
	      			      		
	      		<!-- 일자 검색 -->
          		<h3><span class="label label-default">등록일 검색</span></h3>
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
         		&nbsp;&nbsp;/&nbsp;검색 결과 : <%-- ${listData.searchTotal} --%> 건 &nbsp;&nbsp;/&nbsp;
         		<button type="button" id="excelDownBtn" class="btn btn-primary">엑셀로 다운로드</button>
         	</div>
         	<br/>
	        <form id="bookEditForm">
	            <table class="table table-striped">
	           		<colgroup>
	           			<col width="12%"/>
	           			<col width="15%"/>
	           			<col width="10%"/>
	           			<col width="10%"/>
	           			<col width="8%"/>
	           			<col width="10%"/>
	           			<col width="15%"/>
	           			<col width="5%"/>
	           			<col width="10%"/>
	           		</colgroup>
	              <thead>
	                <tr>
	                  <th class="orderth" data-value="m_no">번호</th>
	                  <th class="orderth" data-value="m_id">아이디</th>
	                  <th class="orderth" data-value="m_nick">닉네임</th>
	                  <th class="orderth" data-value="m_name">이름</th>
	                  <th class="orderth" data-value="m_birth">생년월일</th>
	                  <th class="orderth" data-value="m_sex">성별</th>
	                  <th class="orderth" data-value="m_phone">전화번호</th>
	                  <th class="orderth" data-value="m_email">이메일</th>
	                  <th class="orderth" data-value="m_update">등록일</th>
	                </tr>
	              </thead>
	              <tbody>
	               	<!-- 데이터 출력 -->
	               	<c:choose>
	               		<c:when test="${not empty memberList}">
	               			<c:forEach var="member" items="${memberList}" varStatus="status">
	               				<tr class="dataRow" data-num="${member.m_no}">
	               					<td class="order">${member.m_no}</td>
	               					<td>${member.m_id}</td>
	               					<td>${member.m_nick}</td>
	               					<td>${member.m_name}</td>
	               					<td>${member.m_birth}</td>
	               					<td>${member.m_sex}</td>
	               					<td>${member.m_phone}</td>
	               					<td>${member.m_email}</td>
	               					<td>${member.m_update}</td>
	               				</tr>
	               			</c:forEach>
	               		</c:when>
	               		<c:otherwise>
	               			<tr>
	               				<td colspan="4" align="center">등록된 회원이 없습니다</td>
	               			</tr>
	               		</c:otherwise>
	               	</c:choose>
	              </tbody>
	            </table>
            </form>
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
