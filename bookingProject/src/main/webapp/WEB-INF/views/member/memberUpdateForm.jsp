<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

		<meta charset="utf-8">

		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	
		<link rel="shortcut icon" href="../../image/icon.png" />
		<link rel="apple-touch-icon" href="../../image/icon.png" />
	
	    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
		#line{border-bottom:5px solid gray; font-size:25px;}
		.contentTit{text-align:center;}
		.UpdateTable{border-collapse: collapse; width: 100%;}
		th, td {text-align: left; padding: 8px;}
		tr:nth-child(even){background-color: #f2f2f2}
		.tc{color: #333333; font-size: 12px; text-align:center;}
		.add{font-size:9px; color:orange;}
		 input[type="button"]:hover{background-color:orange;}
		 .boxSize{width:90px;}
		  img{width:50px; height:50px;} 
		 .updateFormBut{text-align:center; margin:50px; }
		 
</style>
	<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script src="/resources/include/js/common.js"></script>
	 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<script type="text/javascript">
	
	var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var regEmailId = /([\w-\.]+)/;
	var regEmailDomain = /((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

	var all ="<c:out value='${updateData.m_email}'/>"; 
	var seperate = all.split('@');

	
	
	$(function(){	
	

         //아이디랑 도메인 값 가져오기    		
       	$("#m_emailId").val(seperate[0]);
        $("#m_domain").val(seperate[1]);

        //주소 수정칸 숨겨놓기
        $("#addressHide").hide();
            
		/* 뒤로 버튼 클릭시 처리 이벤트 */
		$("#back").click(function(){
			location.href="/member/memberMypage.do";
		});
		
		 //주소 찾기 버튼 클릭시
	      $("#execDaumPostcode").click(function(){
	         execDaumPostcode();
	      });
	
		//도메인 주소 선택하면 값 가져가게 하는 이벤트
		$("#domain").change(function(){
			var name = $("#domain option:selected").text();
			$("#m_domain").val(name);
		});
		
		//회원 탈퇴 버튼 클릭시 처리 이벤트
		$("#memberDeleteBtn").click(function(){
			var result = confirm("정말로 탈퇴하시겠습니까?");
			if(result){
				var target = ${sessionScope.memSession.m_no};
				location.href = "/member/memberDelete.do?m_no="+target;
				alert("탈퇴 되셨습니다.");
			}else{
				//no
			}
		});
		 
		//우편번호 수정버튼 클릭시
		$("#addUpdateBtn").click(function(){
			$("#addressHide").show();
			$(this).hide();
		});
		
		//우편번호 수정취소버튼 클릭시
		$("#addUpdateResetBtn").click(function(){
			$(this).hide();
			$("#addressHide").hide();
			$("#addUpdateBtn").show();
		});
		
		//수정 버튼 클릭시 처리 이벤트
		$("#memberUpdateBtn").click(function(){
			if(!chkSubmit($('#m_pwd'),"비밀번호를")) return;
			//비밀번호 유효성 체크 한번 더 !		
			else if(!checkPassword($("#m_pwd").val()))return;			
			
			else if(!chkSubmit($('#m_pwdChk'),"비밀번호 확인을")) return;
			else if(!chkSubmit($('#m_nick'),"닉네임을")) return;			
			else if(!chkSubmit($('#m_emailId'),"이메일을")) return;
			else if (!regEmailId.test( $("#m_emailId").val() ) ) {
			      alert("잘못된 이메일 형식입니다. 다시 확인해주세요.");
			      $("#m_emailId").focus();
			      return ;
			}			
			else if(!chkSubmit($('#m_domain'),"도메인을")) return;
			else if (!regEmailDomain.test( $("#m_domain").val() ) ) {
			      alert("잘못된 도메인형식입니다. 다시 확인해주세요.");
			      $("#m_emailDomain").focus();
			      return;
			}
			
			else if(!chkSubmit($('#m_phone'),"전화번호를")) return;
			else if (!regExp.test( $("#m_phone").val() ) ) {
			      alert("잘못된 휴대폰 번호입니다. 숫자, - 를 포함한 숫자만 입력하세요.");
			      $("#m_phone").focus();
			      return ;
			}
	
			else if($('#m_pwd').val()!= $('#m_pwdChk').val()){
				alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요!!");
				return;
			}	
			
			else{
				var email = $("#m_emailId").val();
			    var domain = $("#m_domain").val();
			    $("#m_email").val(email+"@"+ domain);

				$.ajax({
					url :"/member/memberUpdate.do",
					type : "post",
					dataType : "text",
					data : $("#memberUpdateF").serialize(),
					error : function(){
						alert ("오류입니다. 관리자에게 문의하세요.");
					},
					success : function(resultStr){
						if(resultStr == "SUCCESS"){
							alert("수정이 완료되었습니다.");
						location.href="/member/memberMypage.do";
						}					
					}
					
				});
			} 
			
		});
		
		//textarea maxlength설정
		$("#m_comment").on('keyup',function(){
			if($(this).val().length>4000){
				alert("글자수는 영문4000, 한글 2000자로 제한됩니다!")
				$(this).val($(this).val().subString(0,4000));
				$("#m_comment").focus();
			}
	});

		
	});/* 최상위 function 종결 */
	
	//비밀번호 체크 숫자와 영문자 조합으로 10~15자리를 사용해야함
	var idss = "${sessionScope.memSession.m_id}";
	console.log(idss);
	function checkPassword(id,password){
		if(!/^[a-zA-Z0-9]{8,15}$/.test($("#m_pwd").val())){
			alert('숫자와 영문자 조합으로 8~15자리를 사용해야 합니다.');
			$("#m_pwd").focus();
			return false;
		}
		
		var checkNumber = ($("#m_pwd").val()).search(/[0-9]/g);
		var checkEnglish = ($("#m_pwd").val()).search(/[a-z]/ig);
		
		if(checkNumber <0 || checkEnglish <0){
			alert("숫자와 영문자를 혼용하여야 합니다.");
			$("#m_pwd").focus();
			return false;
		}
		if(/(\w)\1\1\1/.test($("#m_pwd").val())){
			alert('444같은 문자를 4번 이상 사용하실 수 없습니다.');
			$("#m_pwd").focus();
			return false;
		}
		if(($("#m_pwd").val()==idss)){
			console.log($("#m_pwd").val());
			console.log(idss);
			console.log($("#m_pwd").val()==id);
			alert("비밀번호를 아이디와 동일하게 설정하실수 없습니다.");
			$("#m_pwd").focus();
			return false;
		}
			return true;
		}
		
	
	//우편번호
	  function execDaumPostcode() {
	       new daum.Postcode({
	           oncomplete: function(data) {
	               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                   extraRoadAddr += data.bname;
	               }
	               // 건물명이 있고, 공동주택일 경우 추가한다.
	               if(data.buildingName !== '' && data.apartment === 'Y'){
	                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	               }
	               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	               if(extraRoadAddr !== ''){
	                   extraRoadAddr = ' (' + extraRoadAddr + ')';
	               }
	               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	               if(fullRoadAddr !== ''){
	                   fullRoadAddr += extraRoadAddr;
	               }

	               // 우편번호와 주소 정보를 해당 필드에 넣는다.
	               document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
	               document.getElementById('m_home_address').value = fullRoadAddr;
	               document.getElementById('jibunAddress').value = data.jibunAddress;

	               // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	               if(data.autoRoadAddress) {
	                   //예상되는 도로명 주소에 조합형 주소를 추가한다.
	                   var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                   document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

	               } else if(data.autoJibunAddress) {
	                   var expJibunAddr = data.autoJibunAddress;
	                   document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

	               } else {
	                   document.getElementById('guide').innerHTML = '';
	               }
	           }
	       }).open();
	   }

	
	</script>
</head>
<div class="contentContainter">	
		<div class="contentTit"><h3>회원수정</h3></div>
		
		<form name="f_data" id="f_data" method="POST">
			
			<input type="hidden" name="m_no" id="m_no" value="${sessionScope.memSession.m_no}">	
		</form>
	<div class="contentTB">	
	
		<h5 id="line" >기본정보입력</h5>
		<p>(*)가 표시되어있는 항목은 필수 입력 사항 입니다.</p>
			<form id="memberUpdateF" name="memberUpdateF">
				<!-- 이메일 조합 -->
			<input type="hidden" name="m_email" id="m_email">
					
				<table class="UpdateTable" >
					<colgroup>
						<col width="15%">
						<col width="85%">
					</colgroup>
					<tr>
						<td class="tc">*아이디</td>					
						<td>${sessionScope.memSession.m_id}</td>
					</tr>
					<tr>
						<td class="tc">*비밀번호</td>
						<td><input type="password" id="m_pwd" name="m_pwd" maxlength="20" >
							<span class="add"> 영문 대문자, 소문자, 숫자, 특수문자 중 2가지 이상을 조합한 10자 이상, 
	    						또는 3가지 이상 조합한 8자 이상을 권장합니다.</span></td>
					</tr>
					<tr>
						<td class="tc">*비밀번호 재입력</td>
						<td><input type="password" id="m_pwdChk" name="m_pwdChk" maxlength="20" ><span class="add">	
						비밀번호를 다시 한번 입력해주세요.</span></td>
					</tr>
					<tr>
						<td class="tc">*닉네임</td>
						<td><input type="text" id="m_nick" name="m_nick" maxlength="20" value="${sessionScope.memSession.m_nick}" ></td>
					</tr>
					<tr>
						<td class="tc">*이름</td>
						<td>${sessionScope.memSession.m_name}</td>
					</tr>
					 <tr>
				        <td class="tc">*생년월일</td>
				        <td>${updateData.m_birth}</td>
		
				    </tr>
					<tr>
						<td class="tc">*이메일</td>
						<td>				
							<input type="text" id="m_emailId" name="m_emailId" maxlength="20" value="">@
							<input type="text" id="m_domain" name="m_domain" maxlength="20" value="">
							<select class="boxSize" id="domain">
								<option value="none" selected >직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="hanmail.net">hanmail.net</option>						
							</select>
						</td>
					</tr>				
				
					<tr>
						<td class="tc">*휴대전화</td>
						<td><input type="text" id="m_phone" name="m_phone" maxlength="13" value="${sessionScope.memSession.m_phone}">
							<span class="add">주문배송문자등 본인확인용으로 사용</span></td>
					</tr>
					<tr>
						<td class="tc">주소</td>
						<td>
							${sessionScope.memSession.m_home_address}
							<input type="button" value="주소 수정" id="addUpdateBtn" class="btn btn-default">
							<span id="addressHide">
				               <input type="text" id="postcode" placeholder="우편번호">
					            <input type="button" class="btn btn-default" id="execDaumPostcode" value="우편번호 찾기"><br>
					            <input type="text" name="m_home_address" id="m_home_address" placeholder="도로명주소" size="50px">
					            <input type="text" id="jibunAddress" placeholder="지번주소">
					            <span id="guide" style="color:#999"></span>
					            <input type="button" id="addUpdateResetBtn" value="수정취소" class="btn btn-default">
				            </span>
			            </td>		
					<tr>
						<td class="tc">메모</td>
						<td><textarea id="m_comment" name="m_comment" placeholder="메모를 입력하세요...">${sessionScope.memSession.m_comment}</textarea></td>
					</tr>	
				</table>
			
			</form>
			
			
			<div class="updateFormBut">
			<input type="button" value="수정완료" class="btn btn-default" id="memberUpdateBtn">
				<input type="button" value="회원탈퇴" class="btn btn-default" id="memberDeleteBtn">
				<input type="button" value="뒤로" class="btn btn-default" id="back">
			</div><!-- "updateFormBut" 끝 -->
		</div><!-- "contentTB" 끝 -->
	
	
		
	
	</div><!--"contentContainter" 끝 -->
	
	
	</body>
</html>