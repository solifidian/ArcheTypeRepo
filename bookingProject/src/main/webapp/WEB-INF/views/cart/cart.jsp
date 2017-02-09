<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<style>
		div.deletebtn1{
			background-color:violet;
		}
	</style>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
 
var total=0;/*총합계 계산  */
var delivery=2500;/* 배송비 */
var cartSize=0; //카트에 들어있는 책의 수량
$(function(){
	listAll();
	
	  //장바구니 아이템 삭제
	  $("#aa").click(function(){
		  alert("aa")
	  })
	  
	  $(".deletebtn1").click(function(){
		alert();
		
		/* $("#cat_no").val(cat_no);
		
		$("#cartform").attr({
			"method":"post",
			"action":"/cart/cartdelete.do"
			
			
		})
		$("#cartform").submit()	; */
		
	})
	//장바구니 책 수량 업데이트 
	 $(document).on("blur",".CartAmountUpdate",function(){
		var isbn=$(this).parents("tr").attr("data-num");
		var cart_amount= $(this).parents("tr").find("input").val();
		
		
		alert(cart_amount)
	/*     var m_id="${sessionScope.memSession.m_id}";
	    
	    if(m_id!="")
		m_id="${sessionScope.memSession.m_id}";
		else if(m_id=="")
		m_id='0';	
	    
		var cart_ip="${cookie.JSESSIONID.value}" */
		$("#isbn").val(isbn);
		$("#cart_amount").val(cart_amount);
		alert(isbn+"//"+cart_amount)
		
		 	 $.ajax({
				 type:'GET',
				  url:'/carttable/cartBookUpdate.do?isbn='+isbn+'&cart_amount='+cart_amount,
				  
				 headers:{
					 
					"Content-Type":"application/json",
					"X-http-Method-Override":"GET"
				 },
				 dataTyep : "TEXT",
				   						
				 error:function(){
					 alert("수량 수정 실패 관리자에게 문의하세요 ")
				 },
				 success:function(result){
					 if(result=='SUCCESS'){
						 location.reload();
						 listAll();
						 
						 alert("수량 수정 성공 ")
					 }
				 }
				 
			 })/*ajax 종료  */	
		
	})/*장바구니 책 수량 업데이트 종료  */
	
	
	
	
	//장바구니 책 삭제 
	$(document).on("click",".deletebtn",function(){
		var isbn=$(this).parents("tr").attr("data-num");
	   
	
		 alert(isbn)
		 if(confirm("선택하신 책을 삭제 하겠습니까?")){
					 $.ajax({
						 type:'POST',
						  url:'/carttable/'+isbn+'.do',
						 headers:{
							 
							"Content-Type":"application/json",
							"X-http-Method-Override":"POST"
						 },
						 dataTyep : "TEXT",
						 	    						
						 error:function(){
							 alert("삭제 실패 관리자에게 문의하세요 ")
						 },
						 success:function(result){
							 if(result=='SUCCESS'){
								 alert("삭제 완료되었습니다.");
								 listAll();
								 location.reload();
							 }
						 }
						 
					 })
					 
				 }else{
					 listAll();
					 location.reload();
				 }	
		
		
		
	})




})

  //장바구니 리스트 호출 
	function listAll(){
	    var m_id = "${sessionScope.memSession.m_id}";
	    if(m_id != ""){
	    	m_id = "${sessionScope.memSession.m_id}"; 
	    }
		else if(m_id == ""){
			m_id = '0';	
		}
		
		var cart_ip="${cookie.JSESSIONID.value}"
		var url="/carttable/cart.do?m_id="+m_id+"&cart_ip="+cart_ip
		$.getJSON(url,function(data){
			console.log(data.length);
			//장바구니에 들어있는 책의 수량을 체크 하는 변수
			cartSize=data.length;

			//장바구니에 아무것도 없을 때 나오는 메시지
			if(data.length==0){
				$('#cart_table > tbody:last').append("<tr><td colspan=5 class='text-center'><h2>장바구니가 비어 있습니다.</h2></td></tr>")
				$("#totalprice").html("0 원");
				$("#deliveryprice").html("0 원");
				$("#price").html("0 원");
				$("#point").html("0 원"); //적립금
				
				
				
			}
			
			
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
	
  

	function addNewItem(isbn, b_title,cart_amount,b_abprice,b_pagesize) {
		
		var emoti="<span class='deletebtn'> <i class='fa fa-times'></i></span>"
		var img="<div class='col-xs-6 col-md-3'><img src='' class='img-su' alt=''><div>"
		var amount="<input type='text' size='1' class='CartAmountUpdate' value="+cart_amount+" >"
	
    		
    	var	totalprice=b_abprice*cart_amount
    	    total+=totalprice;
    /* 카트에 값이 있을 경우 */		
   	$('#cart_table > tbody:last').append("<tr data-num="+isbn+"><td class='col-md-1'>"+img+"</td><td class='col-md-4'>"+b_title+"</td><td>"+priceNumber(b_abprice)+"</td><td >"+amount+"</td><td>"+priceNumber(b_abprice*cart_amount)+"</td><td >"+emoti+"</td></tr>");
 
	
	/*총 합계 계산 영역   */
	
	
	$("#totalprice").html(priceNumber(total)+"원");
	$("#deliveryprice").html(priceNumber(delivery)+"원");
	$("#price").html(priceNumber(total+delivery)+"원");
	$("#point").html(priceNumber(total*0.01)+"원"); //적립금
	}
	
	
	</script>
	</head>
	<body>
	
	<form id="cart_form">
	   <input type="hidden" id="m_id" name="m_id" value="${sessionScope.memSession.m_id}" />
	</form>
	
	
	</body>
