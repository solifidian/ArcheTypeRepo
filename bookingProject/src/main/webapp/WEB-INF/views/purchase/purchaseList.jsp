<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!DOCTYPE html>

<html>
<head>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!--주소api js -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!--pg연동 api js  -->
<script src="https://service.iamport.kr/js/iamport.payment-1.1.4.js" type="text/javascript"></script>
<!--validate  -->
<!-- <script src="/resources/include/assets/js/chk.js"></script> -->

<script type="text/javascript">

//아임페이 초기화
var IMP = window.IMP; // 생략가능
IMP.init('imp35387748'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

//결제 방식
var pay="";
var amount=0;
var buyer_name=0;


var total=0;/*총합계 계산  */
var delivery=2500;/* 배송비 */
var point=0.01; //적립금 1%
var m_id="${sessionScope.memSession.m_id}";
var c_id="${cookie.JSESSIONID.value}";
$(function(){
//	 alert("m_id"+m_id)
	$("#nonMemberPurchaseAgree").hide();
	listAll();
	
	 //비회원일 경우 약관동의 내용 보여주는 스크립트
    $('#myTab a:last').tab('show');
	
	//로그인 하지 않았을 경우 사용가능한 쿠폰 버튼을 클릭할 수 없습니다.
	if(m_id==""){
	 $("#useCoupon").attr("disabled","true")
	 $("#nonMemberPurchaseAgree").show();
	 //배송지 정보에 사용자 정보 부분이 hide됩니다.
	 $("#purchaseUserInfo").hide();
	}
	
	
	
	//validate
    //장바구니 돌아가기 버튼
	$("#goBackCartBtn").click(function(){
		
		history.go(-1)
		
	})
	
	
	//쿠폰적용
	$("#useCoupon").click(function(){
		
		var couponratio=$("#coupon").val()
//		alert(couponratio)
		//쿠폰값이 null일 경우 쿠폰 값을 적용x
		if(couponratio==null){
		$("#lastTotPrice").html((total+delivery)+"원");  //합계 +배송비용
		}
		//쿠폰값이 null일 경우 쿠폰 값을 적용x
		var ratio=couponratio*total
		$("#lastTotPrice").html(priceNumber((total-ratio)+delivery)+"원");  //합계 +배송비용
		
	})
	
	//결제 버튼 클릭 시 
	$("#purchaseBtn").click(function(){
		alert("결제하기")
		var couponname=$(this).attr("data-name");
		
		var couponratio=$("#coupon").val()
		var paymethod = $(':radio[name="pay"]:checked').val(); //페이방법
		var name=$("#name").val();  //배송자 연락처
		var address=$("#address1").val()+"  "+$("#address2").val()//주소
		var mobile=$("#mobilePhone1").val()+"-"+$("#mobilePhone2").val()+"-"+$("#mobilePhone3").val()//모바일
		var home=$("#homePhone1").val()+"-"+$("#homePhone2").val()+"-"+$("#homePhone3").val()//home
		var agree=0;
		var payprice=(total+delivery)
		var coupon_code=couponratio;
		var p_discount=couponratio;
		var nowpay=0;
		
		
		if(m_id==""){
			m_id='0';
			p_discount=0;
			coupon_code=0;
		}
		
		
		
		
		//주문동의 체크 박스 값 
		if ($('#purchaseAgree').is(":checked"))
				{
				  agree=1
				}
		else	{
				  agree=0
				}
		
		
		
			
		$("#m_id").val(m_id)
		$("#m_phone").val(mobile)
		$("#m_post_address").val(address)
		$("#m_name").val(name)
		$("#p_agreement").val(agree)
		$("#coupon_code").val(coupon_code)
		$("#cookie_name").val(c_id)
		$("#p_totprice").val(payprice)
		$("#p_method").val(paymethod)
		$("#p_discount").val(p_discount)
		$("#nowpay").val(nowpay)
	    $("#m_point").val(total*point)
		
		
		/*
		card(신용카드)
		trans(실시간계좌이체)
		vbank(가상계좌)
		phone(휴대폰소액결제)
		samsung(삼성페이 / 이니시스 전용)
		kpay(KPay앱 직접호출 / 이니시스 전용)
		cultureland(문화상품권 / 이니시스 전용)
		smartculture(스마트문상 / 이니시스 전용) 
		happymoney(해피머니 / 이니시스 전용)
		
		*/
		
		
		if(!chkSubmit($('#m_name'),"받는 분 을")) return;
		else if(!chkSubmit($('#mobilePhone1'),"휴대번호를 ")) return;
		else if(!chkSubmit($('#mobilePhone2'),"휴대번호를 ")) return;
		else if(!chkSubmit($('#mobilePhone3'),"휴대번호를 ")) return;
		else if(!chkSubmit($('#homePhone1'),"집 전화 번호를 ")) return;
		else if(!chkSubmit($('#homePhone2'),"집 전화 번호를 ")) return;
		else if(!chkSubmit($('#homePhone3'),"집 전화 번호를 ")) return;
		else if(!chkSubmit($('#address1'),"주소를")) return;
		else if(!chkSubmit($('#address2'),"상세 주소를")) return;
		else if(!chkSubmit($('#purchaseAgree'),"주문동의를")) return;
		else if(m_id==''){
				if(!chkSubmit($('#nomemberPurchaseAgree'),"비회원 주문동의를")) return;
		}
		else{
			
		
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : paymethod,
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : name,
		    amount : payprice,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : name,
		    buyer_tel : mobile,
		    buyer_addr : address,
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        
		        $("#purchaseHiddenForm").attr({
		        	"method":"post",
		        	"action":"purchase/purchaseUpdate.do"
		        })
		        $("#purchaseHiddenForm").submit();
		        
		        
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        
		        alert("결제에 실패했습니다.")
		    }
		  
		}); 
		
		}/* else 종료 */		
	}) 
	 
	 
 })
	
	//장바구니 리스트 호출 
	function listAll(){
	   //장바구니에 담긴 아이템 및 책의 수 저장
	
	    var m_id="${sessionScope.memSession.m_id}";
	    if(m_id!="")
		m_id="${sessionScope.memSession.m_id}"
		else if(m_id=="")
		m_id='0';	
		var cart_ip="${cookie.JSESSIONID.value}"
		
		//즉시 구매로 온 경우 isbn값은 "" 
		var isbn="${data.isbn}"
		
		var url="";
		if(isbn==""){
			//alert("정상구매")
			//isbn값이 ""일경우 정상 구매
		   url="/carttable/cart.do?m_id="+m_id+"&cart_ip="+cart_ip
		   
		}else{
			//isbn 값이 있을 경우 즉시구매한 isbn정보만 호출 
		   url="/carttable/cart.do?m_id="+m_id+"+&cart_ip="+cart_ip+"&isbn="+isbn
		  // alert("즉시구매")
		}
			
				
			$.getJSON(url,function(data){
			console.log(data.length);
			
			
			$(data).each(function(){
				var b_title=		this.b_title;
				var b_author=		this.b_author;
				var b_abprice=		this.b_abprice;
				var b_pagesize=	    this.b_pagesize;
				var cart_amount= this.cart_amount
				var isbn=this.isbn;
				
				
				addNewItem(isbn,b_title,cart_amount,b_abprice,b_pagesize);
				
			})
			
		}).fail(function(){
			alert("카테고리 불러오는데 실패했습니다.")
		})
	}
	
    function point(total , point){
    	var x=total*point
    	//alert(x)
    	
    }
    
	function addNewItem(isbn, b_title,cart_amount,b_abprice,b_pagesize) {
		
		var emoti="<span class='deletebtn'> <i class='fa fa-times'></i></span>"
		var img="<span class='thumbnail'><img src='/resources/images/bookImg/"+isbn+".jpg' alt=''></span>"
		var amount="<span>"+cart_amount+"</span>"
		var data="<div class='posi'><input type='text' class='pwdvalue' name='pwdvalue'>"
    		data+="<input type='button' class='pwdchk_btn' value='비밀번호확인'> ";
    		data+="<span class='msg'>비밀번호를 입력해주세요</span></div>";
    		
    		var	totalprice=b_abprice*cart_amount
    		total+=totalprice;
    		
    		
	$('#cart_table > tbody:last').append("<tr data-num="+isbn+"><td class='col-md-1'>"+img+"</td><td class='col-md-4'>"+b_title+"</td><td>"+priceNumber(b_abprice)+"</td><td >"+amount+"</td><td>"+priceNumber(b_abprice*cart_amount)+"</td></tr>");
	  
	/*총 합계 계산 영역   */
	
	
	$("#totalprice").html(priceNumber(total)+"원");  //합계비용
	$("#deliveryprice").html(priceNumber(delivery)+"원"); //배송비용
	$("#price").html(priceNumber(total+delivery)+"원");  //합계 +배송비용
	$("#lastTotPrice").html(priceNumber(total+delivery)+"원"); //합계+배송비용
	$("#point").html(priceNumber(total*point)+"원"); //합계+배송비용
	
	}
	
	 	
	//다음 주소록 호출
	function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                 $("#address1").val(fullAddr);
        
            }
        }).open();
    }
	

	
	
</script>
<style>
#lastPrice{
			text-align: center;
			vertical-align:middle;
		   }
.btn-lg-pay{padding:10px 16px;font-size:18px;line-height:1.33;
			 background: #FE980F;
 			 border-radius: 0;
  			 color: #FFFFFF;
 			 margin-top: 18px;
 			 border: none;	
}




</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
      
	    
	  
	  <!-- purchase 정보를 전달하기 위한  히든 폼  -->
	  <form id="purchaseHiddenForm">
	  	<input type="hidden" id="m_name" name="m_name"  />
	  	<input type="hidden" id="m_phone" name="m_phone"  />
	 	<input type="hidden" id="m_post_address" name="m_post_address"  />
	 	<input type="hidden" id="p_agreement" name="p_agreement"  />
	 	<input type="hidden" id="cookie_name" name="cookie_name"  />
	 	<input type="hidden" id="coupon_code" name="coupon_code"  />
	 	<input type="hidden" id="p_totprice" name="p_totprice"  />
	 	<input type="hidden" id="p_discount" name="p_discount" />
	 	<input type="hidden" id="m_id" name="m_id"  />
	 	<input type="hidden" id="nowpay" name="nowpay" value="0" />
	 	<input type="hidden" id="m_point" name="m_point"/>
	 	
	  </form>
	  
	  
	  
	  
	  
	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">주문 상품 목록</li>
				</ol>
			</div>
			<!--비회원 구매 동의   -->
			<!--비회원 구매 동의 영역  -->
	
	<div id="nonMemberPurchaseAgree" class="text-center">
		<h2>비회원 구매 동의 약관</h2>
		    <div class="text-center">
		   
			<ul class="nav nav-tabs" role="tablist" id="myTab">
			  <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">수집하는 개인정보의 항목</a></li>
			  <li role="presentation"><a href="#profile"  aria-controls="profile" role="tab" data-toggle="tab">개인정보 수집 및 이용목적</a></li>
			  <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">개인정보의 보유 및 이용기간</a></li>
			  <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">개인정보의 위탁안내 </a></li>
			</ul>
			 </div>
			<div class="tab-content">
			  <div role="tabpanel" class="tab-pane active" id="home">
			<iframe src="/resources/include/txt/personagreement1.txt" height="400px" width="1000px"></iframe> 
			
			
			
			  
			  </div>
			  <div role="tabpanel" class="tab-pane" id="profile">
			  
			
			  <iframe src="/resources/include/txt/personagreement2.txt" height="400px" width="1000px"></iframe> 
			  
			  
			  
			  </div>
			  <div role="tabpanel" class="tab-pane" id="messages">
			<iframe src="/resources/include/txt/personagreement3.txt" height="400px" width="1000px"></iframe> 
						
			  
			  
			  </div>
			  <div role="tabpanel" class="tab-pane" id="settings">
			  <iframe src="/resources/include/txt/personagreement1.txt" height="400px" width="1000px"></iframe> 
			  
			  </div>
			    	 <div >
						    <label>
							      <input type=checkbox value="1" name="nomemberPurchaseAgree" id="nomemberPurchaseAgree">
						      		<b>비회원 구매 약관 동의</b><br>
										
						   </label>
					  </div>
			    </div>
			

			
			</div><!--비회원 구매 동의 영역 종료  -->
				
				
	
			
			
			
			
			
			
			
			
			
			
			
			<div class="step-one">
				<h2 class="heading">1.주문상품 목록</h2>
			</div>
			
			<div class="table-responsive cart_info">
				<table class="table table-condensed" id="cart_table">
					<thead>
						<tr class="cart_menu">
							<td class="col-sm-1">이미지</td>
							<td class="description">설명</td>
							<td class="price">판매가</td>
							<td class="quantity">수량</td>
							<td class="total">합계</td>
							<td></td>
						</tr>
					</thead>
					<tbody >
	
						
						
						
						
						
						
					</tbody>
				
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->
    <!--배송비 영역 시작  -->
	<section id="infoCart">
		<div class="container">
			
			<div class="row">
			
				<div class="col-sm-12">
					<div class="total_area">
																		
					<div class="well col-sm-3">총 합계 <span id="totalprice">원</span></div>
					<div class="well col-sm-3">배 송 비 <span id="deliveryprice">원</span></div>
					<div class="well col-sm-3">결제 예정금액  <span id="price">원</span></div>
					<div class="well col-sm-3">적립 예정 <span id="point">원</span></div>
					
						
						 
						 <form id="cartform">
						  
						 <div class="text-center" id="noMemberScript">
						<small>비회원은 포인트가 적립되지 않습니다.</small>
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</section><!--/#do_action-->
	
	
	<!--배송지 입력 영역 시작  -->
	
	
	<section id="infoDelivery">
		<div class="container">
			
			<div class="row">
			
				<div class="step-one">
					<h2 class="heading">2.배송지</h2>
				</div>
			
				<div class="col-sm-12">
					<div class="total_area">
																		
					   <table class="table table-bordered">
					     <tr id="purchaseUserInfo">
					     	<td ><label class="control-label">주문자 정보</label></td>
					     	<td colspan=3>${sessionScope.memSession.m_name} | ${sessionScope.memSession.m_email}| ${sessionScope.memSession.m_phone} 주문/배송에 관한 SMS 및 메일이 발송됩니다</td>
					     	
					     </tr>
					     <tr>
					     	<td><label class="control-label">배송지 정보</label></td>
					     	<td>
					     	<div class=col-sm-10>
					     		<form class="form-horizontal" id="purchaseForm">
							     	 <div class="form-group">
										    <label for="name" class="col-sm-2 control-label">받는 분</label>
										    <div class="col-sm-4">
										      <input type="text" class="form-control" id="name" name="name" required="required"  >
										    </div>
									  </div>
									  <!-- 휴대전화  입력 폼 -->
									  <div class="form-group">
										    <label for="mobilePhone1" class="col-sm-2 control-label">휴대 번호 </label>
										    <div class="col-sm-2">
										     	<select id="mobilePhone1" class="form-control" >
										     	  <option value="010" selected>010</option>
										     	  <option value="011" >011</option>
										     	  <option value="017" >017</option>
										     	  <option value="018" >018</option>
										     	  <option value="019" >019</option>
										     	</select> 
										     	
										    </div>
										    <div class="col-sm-2">
										    <input type="text" size=4 class="form-control sm" id="mobilePhone2" name="mobilePhone2" >
										    </div>
										     <div class="col-sm-2">
										    <input type="text" size=4 class="form-control sm" id="mobilePhone3" name="mobilePhone3" >
										    </div> 										    
									  </div><!-- 휴대전화 입력 폼 종료 -->
									  
									  
									  		  <!-- 전화  입력 폼 -->
									  <div class="form-group">
										    <label for="homePhone1" class="col-sm-2 control-label">전화 번호 </label>
										    <div class="col-sm-2">
										     	<select id="homePhone1" class="form-control" >
										     	  <option value="02" selected>02</option>
										     	  <option value="031" >031</option>
										     	  <option value="032" >032</option>
										     	  <option value="033" >033</option>
										     	  <option value="041" >041</option>
										     	  <option value="042" >042</option>
										     	  <option value="043" >043</option>
										     	  <option value="051" >051</option>
										     	  <option value="052" >052</option>
										     	  <option value="053" >053</option>
										     	  <option value="054" >054</option>
										     	  <option value="055" >055</option>
										     	  <option value="061" >061</option>
										     	  <option value="062" >062</option>
										     	  <option value="063" >063</option>
										     	  <option value="064" >064</option>
										     	  				     	  
										     	  
										     	  </select> 
										     	
										    </div>
										    <div class="col-sm-2">
										    <input type="text" size=4 class="form-control sm" id="homePhone2" name="homePhone2" >
										    </div>
										     <div class="col-sm-2">
										    <input type="text" size=4 class="form-control sm" id="homePhone3" name="homePhone3" >
										    </div> 										    
									  </div><!-- 전화 입력 폼 종료 -->
									  
									  
									  	  <!-- 배송 주소  입력 폼 -->
									  <div class="form-group">
										    <label for="address1" class="col-sm-2 control-label">배송주소 </label>
										    <div class="col-sm-8">
										      <input type="text" class="form-control" id="address1" readonly/> 
										    </div>
										    <div class="col-sm-2">
										    <input type="button"  class="btn btn-default" onclick="sample5_execDaumPostcode()" value="우편번호" >
										     
										     <!--우편번호 api  -->
										 
										     
										     
										    </div>
										    
										    <label for="address2" class="col-sm-2 control-label"> </label>
										    <div class="col-sm-8">
										      <input type="text" class="form-control" id="address2" placeholder="상세주소" /> 
										    </div>										    										   
										   								 											    						   
									  </div><!-- 배송주소 입력 폼 종료 -->
														  				     	
					     		</form>
					     	</div><!-- 배송지 정보 종료 -->
					     	
					     	
					     	     		
					     	</td><!-- 배송지 정보 종료 -->
					     
					     </tr>
					     <tr>
					     	<td><label class="control-label">쿠폰 정보</label></td>
					     	<td>
					     		<div class=col-sm-10>
					     		<form class="form-horizontal">
					     		     		  <!-- 쿠폰   입력 폼 -->
									  <div class="form-group">
										   
										    <div class="col-sm-5">
										     <select id="coupon">
										      <c:if test="${empty coupon}">
													 <option value="">쿠폰 없음</option>
											          
											  </c:if>
											  
												 <option value="">쿠폰을 선택하세요</option>	
												<c:forEach var="d" items="${coupon}">	
										        
										        <option value="${d.coupon_discount_ratio}">${d.coupon_name}</option>
										        </c:forEach>
										      
										    
										    </select> 
										     
										    </div>
										    <input type="button" id="useCoupon" class="btn btn-default" value="쿠폰 적용" />
											   
										   								 
											    						    
									  </div><!-- 쿠폰 입력 폼 종료 -->
					     	   </form>
					     	   </div>
					     	
					     	
					     	
					     	
					     	
					     	</td>
					    
					     </tr>
					     
					   
					   
					   
					   </table>
					   				   
					
					
						
						 
						 <form id="cartform">
						  
						 <div class="text-center">
						
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</section><!--/#do_delivery`-->
	
	
	    <!--결제 영역 시작  -->
	<section id="infoCart">
		<div class="container">
			
			<div class="row">
				<div class="step-one">
					<h2 class="heading">3.결제정보</h2>
				</div>
			
			
				<div class="col-sm-12">
					<div class="total_area">
						<table class="table table-bordered">
							<tr>
								<td class="col-sm-2"><label class="control-label">결제 방법</label></td>
								<td class="col-sm-8" >
								
								<!-- 	/* 
		card(신용카드)
		trans(실시간계좌이체)
		vbank(가상계좌)
		phone(휴대폰소액결제)
		samsung(삼성페이 / 이니시스 전용)
		kpay(KPay앱 직접호출 / 이니시스 전용)
		cultureland(문화상품권 / 이니시스 전용)
		smartculture(스마트문상 / 이니시스 전용)
		happymoney(해피머니 / 이니시스 전용)
		
		*/-->
									<form class="form-inline">
										<div class="radio">
										    <label>
										      <input type="radio" name="pay" value="card" checked="checked">
										      		신용카드
										    </label>
										    
										    
										  </div>
										  
										  <div class="radio">
										    <label>
										      <input type="radio" name="pay" value="phone" >
										      		휴대폰 결제
										    </label>
										    
										    
										  </div>
										  
										  	<div class="radio">
										    <label>
										      <input type="radio" name="pay" value="trans">
										      		실시간 가상계좌
										    </label>
										  </div>
										  
										  <div class="radio">
										    <label>
										      <input type=radio name="pay" value="vbank">
										      		가상계좌
										    </label>
										  </div>
										    <div class="radio">
										    <label>
										      <input type=radio name="pay" value="samsung">
										      		삼성페이
										    </label>
										  </div>
										 
										     <div class="radio">
										    <label>
										      <input type=radio name="pay" value="cultureland">
										      		컬쳐랜드
										    </label>
										  </div>
										     <div class="radio">
										    <label>
										      <input type=radio name="pay" value="smartculture">
										      		스마트 문화 상품권
										    </label>
										  </div>
										
										  
										  
										  	 <div >
										    <label>
										      <input type=checkbox value="1" name="purchaseAgree" id="purchaseAgree">
										      		<b>주문동의</b><br>
										      		주문할 상품의 상품명, 가격, 배송 정보에 동의하십니까?
										    </label>
										  </div>
										  
									  </form>
								
								
								</td>
								<td id="lastPrice" class="col-sm-2 text-center" rowspan="3" valign="middle">
									<h4><label> 최종 결제 금액   </label></h4>
									<h2><span id="lastTotPrice">원</span></h2><br>
									
									
									
												
								
									
								
								</td>
							</tr>
						
							<tr>
								<td><label class="control-label">결제 </label></td>
								<td>
							
									<div class="text-center">
										<input type="button" class="btn btn-default btn-lg-pay" value="결제하기" id="purchaseBtn"/>
										<input type="button" class="btn btn-default btn-lg-pay" value="장바구니" id="goBackCartBtn" />
									</div>
								
								
								</td>
								
							</tr>
							
						
						
						
							<tr>
								<td><label class="control-label">결제 안내</label></td>
								<td>
								 	<ul class="col-sm-12">
								 		<li>별도 앱 설치 없이 신용카드 또는 은행계좌 정보를 등록하여 네이버페이 비밀번호로 결제할 수 있는 간편결제 서비스입니다.</li>
								 		<li>결제 가능한 신용카드 : 신한, 삼성, 현대, BC, 국민, 하나, 롯데, NH농협, 씨티</li>
								 		<li>카카오페이는 간편하게 결제를 처리할수 있습니다.</li>
								 								 	
								 	</ul>
								
								
								</td>
								
							</tr>
						
						</table>
					
					
					
						
						 
				
					</div>
				</div>
			</div>
		</div>
	</section><!--/#결제 영역종료-->




</body>
</html>