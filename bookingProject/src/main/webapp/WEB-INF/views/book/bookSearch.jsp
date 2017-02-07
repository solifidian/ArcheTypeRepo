<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		  <%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
	<head>
	<style>
		span.currentPage{
			color:red;
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
						"action":"/purchase/purchaseList.do?m_id="+m_id+"&isbn="+isbn
													
						})
						$("#searchform").submit();
						 
				 }/*else종료  */ 
						 
				 
				 
				 
			 })
			 
			 //위시리스트 버튼 클릭 시 
			 $(".wishListInsertBtn").click(function(){
				 var num=$(this).parents("tr").attr("data-num");
				 $("#isbn").val(num);
				 alert(num)
						 
				 if(m_id==""){
					 alert("로그인 페이지로 이동")
				 }else{
					 
					 $.ajax({
						   url:"/wish/wishInsert.do",
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
				alert(amount)	
				 if( m_id==""){
					 m_id="0";
				 }else if( m_id!=""){
					 m_id="${sessionScope.memSession.m_id}";
				 }
				$("#isbn").val(num) 
				$("#m_id").val(m_id) 
				$("#cart_amount").val(amount)
				alert(m_id);
				 
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
				 alert(num)
				 
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
		
		
		
		 <!--검색 조건 테이블 영역  -->
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
		      		</div>
		      		<br/><br/>
		      			      		
		      		<!-- 일자 검색 -->
		      		<div class="form-inline">
		          		<h3><span class="label label-default">일자 검색</span></h3>
		          		<input type="hidden" class="form-control" name="searchDateMode" id="searchDateMode" value="publishSch">
			          	<input type="date" class="form-control" name="searchStartDate" id="searchStartDate" value="${listData.searchStartDate}">
			          	<input type="date" class="form-control" name="searchEndDate" id="searchEndDate" value="${listData.searchEndDate}">
			          	<button id="searchKeywordBtn" class="btn btn-primary">검색</button>
		          	</div>
	          	</form>
        </div>
		
		<!--검색 조건 테이블 영역  -->
		<div class="row">
		<div class="col-md-8 col-md-offset-4">
		 
	             ${sessionScope.memSession.m_id} 세션스코프 쿠키값${cookie.JSESSIONID.value}
	               <table class="table table-bordered">
	               <tr>
	               <td>새로나온책</td>
	               <td>베스트셀러</td>
	               <td>정가 인하</td>
	               <td>이벤트 도서</td>
	               <td>회원 리뷰</td>
	               </tr>
	               </table>
	                      
	            
	             </div>
	             
	    </div>
	    
	    
	    
	    <!--검색창 영역  -->
	    	<div class="row">
		     	<div class="navbar navbar-default">
	         		페이지당 표시 건 수
	         		<select name="pageSizeChange" id="pageSizeChange" >
	         			<option value="5">5</option>
	         			<option value="10">10</option>
	         			<option value="30">30</option>
	         		</select>건
	         		&nbsp;&nbsp;/&nbsp;검색 결과 : ${listData.searchTotal} 건 &nbsp;&nbsp;/&nbsp;
	         		<button type="button" id="excelDownBtn" class="btn btn-primary">엑셀로 다운로드</button>
	         	</div>
         	</div>
         	<div class="row">
         		<div class="paginationBar text-center" >
		           	<tag:PagingBar page="${listData.page}" searchTotal="${listData.searchTotal}" pageSize="${listData.pageSize}"/>
		       	</div> 
		     </div>
	         <div class="col-sm-12 padding-right">
			        
	         
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Features Items</h2>
						<table class="col-sm-12" >
						
						<c:if test="${empty bookList }">
							  <tr>
							  <td colspan=3> 등록 정보가 존재하지않습니다.	  
							  </tr>
						 </c:if>
						
						<c:forEach var="d" items="${bookList}">							
							<tr data-num="${d.isbn}">
							  <td class="col-sm-2"><span class="thumbnail"><img src="/images/do.jpg" alt="" /></span></td>
							  <td class="col-sm-8" >
							 
							  <h3><a href="/book/bookDetail.do?isbn=${d.isbn}">${d.b_title}</a></h3>
								 <span> ${d.b_author} &nbps; / &nbps; ${d.b_pubdate}</span><br>
								 <span> 리뷰(4건) 회원평점 ***** 만점에 5점 관련이벤트(0건) 중고상품(3건)</span><br>
								 <span> ${d.b_abprice}원 </span><br>
								 <span> 주제어 스마트폰 , 시력 회복법 , 생활습관 , 스트레칭 , 콘택트렌즈  더보기</span><br>
							  
							
							  </td>
							  <td class="col-sm-1">
							  <form class="form-horizontal" id="searchform" name="searchform">
							  
 								<input type="hidden" id="isbn" name="isbn"  />
 								<input type="hidden" id="cart_ip" name="cart_ip" value="${cookie.JSESSIONID.value}" />
 								<input type="hidden" id="nowpay" name="nowpay"  />
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
				<!-- 
				
	         <div class="col-sm-12 padding-right">
					<div class="features_items">features_items
						<h2 class="title text-center">Features Items</h2>
						<div class="col-sm-12">
						도서 검색 이미지 영역 	
						<div class="col-sm-2">
						  <div class="thumbnail"><img src="/images/do.jpg" alt="" /></div></div>
						
						정보 영역
						<div class="col-sm-9">
						 <h3>도깨비</h3>
						 <span> 혼베 가즈히로 지음 황미숙 옮김 북스토리라이프 2016년 10월</span><br>
						 <span> 리뷰(4건) 회원평점5점 만점에 5점 관련이벤트(0건) 중고상품(3건)</span><br>
						 <span> 11,500원→ 10,350원 (10%할인) 570원(5%적립)</span><br>
						
						
						
						</div>
						
						장바구니 영역
						<div class="col-sm-1">	
					
							  <input type="button" class="btn btn-default" value="장바구니" id="" /> 																				
							  <input type="button" class="btn btn-default" value="바로구매" id="" />
							  <input type="button" class="btn btn-default" value="보관함" id="" />
							    수량<input type="text" size=1 />
						
						
						</div>
						
											
						
						 -->
							
								
		 <!--메인종료  -->
						
					
						
						
					
	</section>