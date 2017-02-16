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
		<script type="text/javascript" src="/resources/include/js/categoryBox.js"></script>
		<script type="text/javascript">
			
			$(function(){
				var searchMode = "<c:out value='${listData.searchMode}'/>";
				var searchDateMode = "<c:out value='${listData.searchDateMode}'/>";
				var searchCat_no = "<c:out value='${listData.cat_no}'/>";
				if(searchMode != ''){
					$("#searchMode").val(searchMode);
				}
				if(searchDateMode != ''){
					$("#searchDateMode").val(searchDateMode);
				}
				if(searchCat_no != '' && searchCat_no != 0){
					makeCateBoxSearched("#categoryBoxes",searchCat_no);
				}
			})
		</script>
  </head>

          <h2 class="sub-header">등록 도서 리스트</h2>
          <div class="well">
	          <div class="table-responsive">
	          	<!-- 전체 리스트 제어 폼 -->
	          	<form class="navbar-form navbar-left" id="searchForm" method="get" action="/admin/book/bookList.do">
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
		      			<option value="titleSch">글제목</option>
		      			<option value="authorSch">저자</option>
		      			<option value="publisherSch">출판사</option>
		      			<option value="isbnSch">ISBN</option>
		      			<option value="seriesSch">시리즈명</option>
		      		</select>
		      		<input type="text" class="form-control" name="keyword" id="keyword" value="${listData.keyword}"/>
		      		
		      		<br/><br/>
		      		
		      		<h3><span class="label label-default">분류</span></h3>
					<div class="form-inline" id="categoryBoxes">
						<input type="hidden" name="cat_no" id="cat_no" value="0"/>
					</div>
					
		      		<br/><br/>
		      			      		
		      		<!-- 일자 검색 -->
	          		<h3><span class="label label-default">일자 검색</span></h3>
	          		<select class="form-control" name="searchDateMode" id="searchDateMode">
		      			<option value="publishSch">발매일</option>
		      			<option value="updateSch">등록일</option>
		      			<option value="editdateSch">수정일</option>
		      		</select>
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
         	<br/>
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
	                  <th class="orderth" data-value="isbn">ISBN</th>
	                  <th class="orderth" data-value="b_title">글제목</th>
	                  <th class="orderth" data-value="b_author">저자</th>
	                  <th class="orderth" data-value="pub_name">출판사</th>
	                  <th class="orderth" data-value="b_abprice">가격</th>
	                  <th class="orderth" data-value="b_pubdate">발매일</th>
	                  <th class="orderth" data-value="cat_no">분류</th>
	                  <th class="orderth" data-value="b_stock">재고</th>
	                  <th class="orderth" data-value="b_update">등록일</th>
	                </tr>
	              </thead>
	              <tbody>
	               	<!-- 데이터 출력 -->
	               	<c:choose>
	               		<c:when test="${not empty bookList}">
	               			<c:forEach var="book" items="${bookList}" varStatus="status">
	               				<tr class="dataRow" data-num="${book.isbn}">
	               					<td class="order">${book.isbn}</td>
	               					<td>${book.b_title}</td>
	               					<td>${book.b_author}</td>
	               					<td>${book.pub_name}</td>
	               					<td>${book.b_abprice}</td>
	               					<td>${book.b_pubdate}</td>
	               					<td>${book.cat_name}</td>
	               					<td>${book.b_stock}</td>
	               					<td>${book.b_update}</td>
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
