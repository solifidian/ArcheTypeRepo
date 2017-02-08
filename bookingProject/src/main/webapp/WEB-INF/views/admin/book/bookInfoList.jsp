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
		<script type="text/javascript" src="/resources/include/js/categoryBox.js"></script>
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

				$(document).on("click","tr.dataRow",function(){
					var isbn = $(this).attr("data-num");
					$.ajax({
						url:"/admin/book/bookSelect.do",
						type:"post",
						data:"isbn="+isbn,
						success:function(data){
							$("#bookEditForm #bookEditMode").val("update");
							$("#bookEditForm #isbn").val(data.isbn);
							//$("#bookEditForm #isbn").attr("readonly","true")
							$("#bookEditForm #b_title").val(data.b_title);
							$("#bookEditForm #b_author").val(data.b_author);
							$("#bookEditForm #pub_name").val(data.pub_name);
							$("#bookEditForm #b_abprice").val(data.b_abprice);
							$("#bookEditForm #b_pubdate").val(data.b_pubdate);
							$("#bookEditForm #b_index").val(data.b_index);
							$("#bookEditForm #b_comment").val(data.b_comment);
							$("#bookEditForm #b_complain").val(data.b_complain);
							$("#bookEditForm #series_name").val(data.series_name);
							$("#bookEditForm #series_no").val(data.series_no);
							$("#bookEditForm #series_no_sub").val(data.series_no_sub);
							$("#bookEditForm #categoryBoxes").html("");
							makeCateBoxFromNo("#bookEditForm #categoryBoxes",data.cat_no);
						}
					});
				});
				
				$("#bookEditResetBtn").click(function(){
					$("#bookEditMode").val("insert");
					$("#categoryBoxes").html("");
					makeCateBox("#categoryBoxes",1,0,"hc");
				})
				
				$("#bookEditConfirmBtn").click(function(){
					var editURL = "";
					
					if($("#bookEditMode").val() == "update"){
						editURL = "/admin/book/bookUpdate.do"	
					}
					else if($("#bookEditMode").val() == "insert"){
						editURL = "/admin/book/bookInsert.do"	
					}
					if(!chkSubmit("#bookEditForm #isbn","ISBN을 입력해 주세요")) return;
					else if(!chkSubmit("#bookEditForm #b_title","책 제목을 입력해 주세요")) return;
					else if(!chkSubmit("#bookEditForm #b_author","저자명을 입력해 주세요")) return;
					else if(!chkSubmit("#bookEditForm #pub_name","출판사명을 입력해 주세요")) return;
					else if(!chkSubmit("#bookEditForm #b_abprice","정가를 입력해 주세요")) return;
					else if(!chkSubmit("#bookEditForm #b_pubdate","출판일을 입력해 주세요")) return;
					else{
						console.log($("#cat_no").val())
						$.ajax({
							url:editURL,
							type:"post",
							data:$("#bookEditForm").serialize(),
							dataType:"text",
							success:function(resultData){
								if(resultData == "SUCCESS"){
									alert("등록 완료");
									goPage($("#page").val());
								}
								else if(resultData == "FAILED"){
									alert("오류 발생");
								}
							}
						})
					}
					
				});
				
			})
		</script>
  </head>
  <body>
          <h2 class="sub-header">등록 도서 리스트</h2>
          <div class="well">
	          <div class="table-responsive">
	          	<!-- 전체 리스트 제어 폼 -->
	          	<form class="navbar-form navbar-left" id="searchForm" method="get" action="/admin/book/bookInfoList.do">
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
            <div class="well">
         	 <form id="bookEditForm">
         	 	<div class="form-inline">
         	 		<select class="form-control" name="bookEditMode" id="bookEditMode">
	         	 		<option value="insert">등록</option>
	         	 		<option value="update">수정</option>
		         	 </select>
	         	 	<button type="button" id="bookEditConfirmBtn" class="btn btn-primary">등록/수정</button>
			        <button type="reset" id="bookEditResetBtn" class="btn btn-primary">초기화</button>
         	 	</div>
         	 	<br/>
         	 	<br/>
         	 	<div class="row">
         	 		<div class="form-group col-md-2">
						<label for="isbn">ISBN</label>
						<input type="text" name="isbn" id="isbn" class="form-control"/>
					</div>
					<div class="form-group col-md-2">
						<label for="b_title">책제목</label>
						<input type="text" name="b_title" id="b_title" class="form-control"/>
					</div>
					<div class="form-group col-md-4">
						<label for="categoryBoxes">분류</label>
						<div class="form-inline" id="categoryBoxes">
						<input type="hidden" name="cat_no" id="cat_no" value="0"/>
						</div>
					</div>
         	 	</div>
				<div class="row">
					<div class="form-group col-md-2">
						<label for="b_author">저자명</label>
						<input type="text" name="b_author" id="b_author" class="form-control"/>
					</div>
					<div class="form-group col-md-2">
						<label for="pub_name">출판사</label>
						<input type="text" name="pub_name" id="pub_name" class="form-control"/>
					</div>
					<div class="form-group col-md-2">
						<label for="b_abprice">가격</label>
						<input type="text" name="b_abprice" id="b_abprice" class="form-control"/>
					</div>
					<div class="form-group col-md-2">
						<label for="b_pubdate">발매일</label>
						<input type="date" name="b_pubdate" id="b_pubdate" class="form-control"/>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-2">
						<label for="series_name">시리즈명</label>
						<input type="text" name="series_name" id="series_name" class="form-control"/>
					</div>
					<div class="form-group col-md-2">
						<label for="series_no">시리즈 번호</label>
						<input type="text" name="series_no" id="series_no" class="form-control"/>
					</div>
					<div class="form-group col-md-2">
						<label for="series_no_sub">시리즈 번호2</label>
						<input type="text" name="series_no_sub" id="series_no_sub" class="form-control"/>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-8">
						<label for="b_index">목차</label>
						<textarea name="b_index" id="b_index" class="form-control" rows="5"></textarea>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-8">
						<label for="b_comment">상세 정보</label>
						<textarea name="b_comment" id="b_comment" class="form-control" rows="5"></textarea>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-8">
						<label for="b_complain">교환/환불 규약</label>
						<textarea name="b_complain" id="b_complain" class="form-control" rows="5"></textarea>
					</div>
				</div>
         	 </form>
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
