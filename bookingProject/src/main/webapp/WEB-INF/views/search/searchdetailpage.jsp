<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<head>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		
				
	</head>
		
		
		<section>
		
		
		
		 <!--검색 조건 테이블 영역  -->
		<div class="row">
			<div class="col-md-2">
			 <h3>결과</h3>
			
			</div>
		
		
		</div>
		
		<!--검색 조건 테이블 영역  -->
		<div class="row">
		<div class="col-md-8 col-md-offset-4">
		 
	              
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
	     
	     
	        <div class="col-md-7 col-md-offset-5">
	      		<div class="col-md-2">
	      		<button  class="btn btn-default btn-xs" aria-label="Left Align"><span class="glyphicon glyphicon-chevron-left"></button> 
	      		</div>
	      	<div class="col-md-4">
	      	
	      		1/ 2/ 3/ 4/ 5/ 6/ 7/ 8/ 9 
	        </div>
	      		<div class="col-md-1">
	      		<button  class="btn btn-default btn-xs" aria-label="Left Align"><span class="glyphicon glyphicon-chevron-right"></button> 
	      		</div>
	      	
	        </div>     
	             
	             
	    </div>
	    <!--검색창 영역  -->
	         <div class="col-sm-12 padding-right">
	    
				
				<div class="col-sm-12 padding-right">
	          
	         
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Features Items</h2>
						<table class="col-sm-12" >
							<tr data-num="${d.cat_no}" rowspan=2>
							  <td class="col-sm-2"><span class="thumbnail"><img src="/resources/include/assets/images/do.jpg" alt="" /></span></td>
							  <td class="col-sm-8" >
							 
							  <span class="godetail"><h3>${data.b_name}</h3></span>
								 <span> ${data.b_author}지음 ${data.b_translator} 옮김 북스토리라이프 ${data.b_pubdate}</span><br>
								 <span> 리뷰(4건) 회원평점 ***** 만점에 5점 관련이벤트(0건) 중고상품(3건)</span><br>
								 
								 <span> 주제어 스마트폰 , 시력 회복법 , 생활습관 , 스트레칭 , 콘택트렌즈  더보기</span><br>
							  
							
							  </td>
							 
						  </tr>
						  <!-- 결제 금액 관련   -->
						  <tr>
						  	<td class="col-sm-2"></td>
						  	<td class="col-sm-8">
						  	
						  	<span> ${data.b_abprice}원 </span><br>
						  	<span> 통합포인트 : 540원 적립 [5% 적립] </span><br>
						  	<p>				  	
						  	
						  	</td>
						  
						  </tr>
						  
						  <!-- 배송 관련   -->
						  
						  <tr>
						  	<td class="col-sm-2"></td>
						  	<td class="col-sm-8">
						  	
						  	<span> 배송비 : 해당 도서 포함 만원이상 구매시 무료 </span><br>
						  	<span> 도착예정일 : 서울 종로구 종로1가 교보생명빌딩 기준 </span><br>
						  	<span> 바로드림 : 인터넷으로 주문하고 영업점에서 직접 수령 </span><br>
						 		<p>			  	
						 	</td>
						  
						  </tr>
						  
						   <!-- 버튼영역  -->
						   <tr>
						  	<td class="col-sm-2"></td>
						  	<td class="col-sm-8">
						  	
						  	<div class="form-inline">
						  	
						  	<input type="button" class="btn btn-default btn-lg" id="jang" name="jang" value="장바구니 담기" />
						  	<input type="button" class="btn btn-default btn-lg" id="jang" name="jang" value="바로구매" />
						  	<input type="button" class="btn btn-default btn-lg" id="jang" name="jang" value="보관함" />
						  	
						  	</div>
						  					  	
						 	</td>
						  
						  </tr>
						  
						  
						  
						
						</table>
						
						</div>
						</div>
				
				
				
				
							
								
			</div> <!--메인종료  -->
						
					
						
						
					
	</section>