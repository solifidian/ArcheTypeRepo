<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		  <%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
	<head>
	<style>
		.book-thumb{
			max-height:200px;
		}
	</style>
	<script type="text/javascript" src="/resources/include/js/listCommon.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script>
		 var m_id="${sessionScope.memSession.m_id}"


		 $(function(){
			 
			var searchMode = "<c:out value='${listData.searchMode}'/>";
			var searchDateMode = "<c:out value='${listData.searchDateMode}'/>"
			if(searchMode != ''){
				$("#searchMode").val(searchMode);
			}
			if(searchDateMode != ''){
				$("#searchDateMode").val(searchDateMode);
			}
			 $("#cart_ip").val("${cookie.JSESSIONID.value}");
			
			
			 
			 
			 /* $.ajax({
				 url:"/admin/member/loginCheck.do",
				 success:function(resultData){
					 if(resultData == "NoMember"){
						 alert("비회원 입니다")
					 }
					 else if(resultData == "YesMember"){
						 alert("회원 입니다.")
					 }
					 else{
						 alert("Unexpected Error.")
					 }
				 }
			 }) */
			 
			 //바로 구매 버튼 클릭 시 nowPurchaseBtn
			 $(".nowPurchaseBtn").click(function(){
			 var num=$(this).parents("tr").attr("data-num");
				
			 	 $("#isbn").val(num);
				 $("#m_id").val(m_id);
				 $("#nowpay").val(1);  //즉시 구매값 구별
				 if(m_id==""){
					 alert("로그인 페이지로 이동")
				 }else{
				 				 
				 $("#searchform").attr({
						"method":"get",
						"action":"/purchase/purchaseList.do?isbn="+isbn
													
						})
						$("#searchform").submit();
						 
				 }/*else종료  */ 
						 
				 
				 
				 
			 })
			 
			 //위시리스트 버튼 클릭 시 
			 $(".wishListInsertBtn").click(function(){
				 var isbn=$(this).parents("tr").attr("data-num");
				 $("#isbn").val(num);
//				 alert(cart_ip)
//				 alert(num)
				  //1=바로구매 0=x		 
				 if(m_id==""){
					 alert("로그인 페이지로 이동")
				 }else{
					 
					 $.ajax({
						   url:"/wish/wishInsert.do",
						   type:"POST",
						   data:isbn,
						   dataType:"text",
						   error:function(request,status,error){
							   alert("code : " + request.status + "\r\ nmessage : "
								       + request.reponseText + "\r\n error : " + error);
							   alert("시스템 오류입니다.")
						   },
						   success:function(Data){
							    if(Data=="SUCCESS"){
					 				alert("위시 리스트 추가 성공")
					 				
					 				/*위시리스트로 이동 */
					 				if(confirm("위시리스트로 이동하시겠습니까?")){
					 				$("#searchform").attr({
				 						"method":"get",
				 						"action":"/wish/wishList.do"
				 						
				 					})
				 					$("#searchform").submit();
				 					
				 				}
					 				
							    }/*confirm 종료    */		
							    
							    else if(Data=="SAMEVALUE"){
							    	alert("이미 해당 도서가 위시리스트에 있습니다.")
							    	
							    	
							    	/*위시리스트로 이동 */
					 				if(confirm("위시리스트로 이동하시겠습니까?")){
					 				$("#searchform").attr({
				 						"method":"get",
				 						"action":"/wish/wishList.do"
				 						
				 					})
				 					$("#searchform").submit();
					 				}
							    	
							    }
						   
						   }//success종료
					 })
				 }//else종료
				 
			 })
			//장바구니에 책 추가 
			 $(".cartInsertBtn").click(function(){ 				 
				 var num=$(this).parents("tr").attr("data-num");
				 var m_id="${sessionScope.memSession.m_id}"
				 var amount= $(this).parents("tr").find("input[type='text']").val();
				 if( m_id==""){
					 m_id="0";
				 }else if( m_id!=""){
					 m_id="${sessionScope.memSession.m_id}";
				 }
				$("#isbn").val(num) 
				$("#m_id").val(m_id) 
				$("#cart_amount").val(amount)
				 
				$.ajax({
					   url:"/cart/cartInsert.do",
					   type:"POST",
					   data:$("#searchform").serialize(),
					   dataType:"text",
					   error:function(request,status,error){
						   alert("code : " + request.status + "\r\ nmessage : "
							       + request.reponseText + "\r\n error : " + error);
						   alert("시스템 오류입니다.")
					   },
					   success:function(Data){
						    if(Data=="SUCCESS"){
				 				
				 				if(confirm("장바구니에 추가 되었습니다  장바구니로 이동하시겠습니까?")){
				 					$("#m_id").val(m_id) 
				 				
				 				
				 					$("#searchform").attr({
				 						"method":"get",
				 						"action":"/cart/cartlist.do"
				 						
				 					})
				 					$("#searchform").submit();
				 					
				 				}
				 				
				 				else{
				 					
				 					return;
				 				}
				 
						    }
					   }
						 
				 
				 
			 		})	
			 })
			 $("#marketbtn").click(function(){
				 var num=$(this).parents("tr").attr("data-num");
			 })

		 })

		</script>	
				
	</head>
		<body>
		
			<script>
				  window.fbAsyncInit = function() {
				    FB.init({
				      appId      : '170080446812154',
				      xfbml      : true,
				      version    : 'v2.8'
				    });
				    FB.AppEvents.logPageView();
				  };
				
				  (function(d, s, id){
				     var js, fjs = d.getElementsByTagName(s)[0];
				     if (d.getElementById(id)) {return;}
				     js = d.createElement(s); js.id = id;
				     js.src = "//connect.facebook.net/en_US/sdk.js";
				     fjs.parentNode.insertBefore(js, fjs);
				   }(document, 'script', 'facebook-jssdk'));
			</script>
	
		<section>
	<!--
		검색 패널
			페이징에 필요한 hidden 값들 다수 분포, Paging요소와 함께 사용해야함.
			미관을 위해 정작 당사자인 그 PagingBar는 저 밑에 따로 놀고 있음
			엔터 인식을 위해 form자체에 action과 method값을 적어 놨음
			혹여 스크립트에서 form 상세를 결정하는 타입인 경우 주의
	-->
		 <div class="well">
			 <div class="row">
		          <!-- 전체 리스트 제어 폼 -->
		          	<form class="navbar-form navbar-left" id="searchForm" method="get" action="/book/bookSearch.do">
		          		<!-- 페이지 정렬을 위한 hidden input들 -->
		          		<input type="hidden" name="page" id="page" value="${listData.page}"/>
		          		<input type="hidden" name="pageSize" id="pageSize" value="${listData.pageSize}"/>
		          		
		          		<!-- 리스트 사이즈 제어 기본 value = 8 -->
		          		<input type="hidden" name="listSize" id="listSize" value="8"/>
		          		
		          		<!-- 정렬 제어를 위한 파라메터 -->
		          		<input type="hidden" name="orderTarget" id="orderTarget" value="${listData.orderTarget}"/>
		          		<input type="hidden" name="orderDirection" id="orderDirection" value="${listData.orderDirection}"/>
		          		
		          		<!-- 키워드 검색 -->
		          		<div class="form-inline">
			          		<div class="form-group">
			          			<h3><span class="label label-default">검색</span>
					          	<select class="form-control" name="searchMode" id="searchMode">
					      			<option value="allSch">전체</option>
					      			<option value="titleSch">글제목</option>
					      			<option value="authorSch">저자</option>
					      			<option value="publisherSch">출판사</option>
					      			<option value="isbnSch">ISBN</option>
					      			<option value="seriesSch">시리즈명</option>
					      		</select>
					      		
					 			</h3>
			          		</div>
			          		<div class="form-group">
			          			<h3>
			          				<input type="text" class="form-control" name="keyword" id="keyword" value="${listData.keyword}"/>
			          			</h3>
			          		</div>
		          		</div>	
			      		<!-- 일자 검색 -->
			      		<input type="hidden" class="form-control" name="searchDateMode" id="searchDateMode" value="publishSch">
			      		<div class="form-inline">
				      		<div class="form-group">
				          		<h3>
				          			<span class="label label-default">일자 검색</span>
					          	</h3>
				          	</div>
				          	<div class="form-group">
				          		<h3>
				          		<input type="date" class="form-control" name="searchStartDate" id="searchStartDate" value="${listData.searchStartDate}">
				          		</h3>
				          	</div>
				          	<div class="form-group">
				          		<h3><input type="date" class="form-control" name="searchEndDate" id="searchEndDate" value="${listData.searchEndDate}">
				          		</h3>
				          	</div>
				          	<div class="form-group">
				          		<h3>
				          			<button class="btn btn-warning" id="searchKeywordBtn">검색</button>
				          		</h3>
				          	</div>
				          	
			          	</div>
		          	</form>
			</div>
		</div>
		<!--검색 조건 테이블 영역  -->
	    
	    <h2 class="title text-center">도서 목록</h2>
	    
	    
    <!--
    	 네비게이션 바 영역 시작
    		pagingBarTag가 필요
   			표시 건 수는 listData.searchTotal을 필요로 함
   			searchTotal은 Control 영역에서 listData에 넣어주어야 함
   	-->
	    <div class="row">
	    	<div class="navbar-form navbar-left" role="navigation">
         		<div class="form-inline">
         			<label for="form-control">페이지당 표시 건 수
	         		<select class="form-control" name="pageSizeChange" id="pageSizeChange" >	         			
	         			<option value="5">5</option>
	         			<option value="10">10</option>
	         			<option value="30">30</option>
	         		</select>
	         		/ 검색 결과 :${listData.searchTotal}건
        			</label>
         		</div>
		  <h3><a href="/book/bookDetail.do?isbn=${d.isbn}">${d.b_title}</a></h3>
           </div>
           <div class="navbar-form navbar-right">
	         <div class="paginationBar text-center paginate">
	           	<tag:PagingBar page="${listData.page}" searchTotal="${listData.searchTotal}" pageSize="${listData.pageSize}"/>
	         </div>
	       </div>
	    </div>
	    
	<!---------------- 네비게이션 바 영역 종료 --------------->
	         
		<div class="col-sm-12 padding-right">
			<div class="features_items"><!--features_items-->
				<table class="col-sm-12" >
					<c:if test="${empty bookList }">
						  <tr>
						  	<td colspan=3> 등록 정보가 존재하지않습니다.	  
						  </tr>
					 </c:if>
						<c:forEach var="d" items="${bookList}">							
							<tr data-num="${d.isbn}">
							  <td class="col-sm-2">
							  	<object class="book-thumb thumbnail" data="/images/bookImg/${d.isbn}.jpg" type="image/jpg">
								  	<img src="/images/bookImg/no_book_img.png"/>
							  	</object>
							  </td>
							 <td class="col-sm-8" >
								 <h3><a href="/book/bookDetail.do?isbn=${d.isbn}">${d.b_title}</a></h3>
								 <span> ${d.b_author} &nbps; / &nbps; ${d.b_pubdate}</span><br>
								 <span> 리뷰(4건) 회원평점 ***** 만점에 5점 관련이벤트(0건) 중고상품(3건)</span><br>
								 <span> ${price}원 </span><br>
								 <span> 주제어 스마트폰 , 시력 회복법 , 생활습관 , 스트레칭 , 콘택트렌즈  더보기</span><br>
							 </td>
							 <td class="col-sm-1">
							 	<form class="form-horizontal" id="searchform" name="searchform">
	 								<input type="hidden" id="isbn" name="isbn"  />
	 								<input type="hidden" id="nowpay" name="nowpay" value=0  />
	 								<div class="form-group">
									  	<span class="cartInsertBtn"><input type="button" class="btn btn-default" value="장바구니"  />	</span>																			
									  	<span class="nowPurchaseBtn"><input type="button" class="btn btn-default" value="바로구매"  /></span>
									  	<span class="wishListInsertBtn"><input type="button" class="btn btn-default" value="위시리스트" class="btn2" /></span>
									  	<input type="text" size="1" id="cart_amount" name="cart_amount" value="1" /> 수량
								  	</div>
								</form>
							  </td>
							</tr>
							</c:forEach>
						
						</table>
						
						</div>
						</div>
		 <!--메인종료  -->			
	</section>
