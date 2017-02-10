
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
		.InsertTable{border-collapse: collapse; width: 100%;}
		th, td {text-align: left; padding: 8px;}
		tr:nth-child(even){background-color: #f2f2f2}
		.tc{color: #333333; font-size: 12px; text-align:center;}
		.add{font-size:9px; color:orange;}
		.insertFormBut{text-align:center; margin:100px;}
		 input[type="button"]:hover{background-color:orange;}
		 .boxSize{width:90px;}
		 
		 
</style>
	
	<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script src="/resources/include/js/common.js"></script>
	 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<script type="text/javascript">
	
	
	var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var regEmailId = /([\w-\.]+)/;
	var regEmailDomain = /((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

	
	$(function(){
		
	/*본인인증 업데이트 2/9   */
		var auth=0;//본인인증 키 
	//email 본인 인증 메일 전송
	 $("#auth").click(function(){
		 var email = $("#m_emailId").val();
		 var domain = $("#m_domain").val();
		 var mail=email+"@"+ domain
		    $("#m_email").val(mail);
		 
		 if(!chkSubmit($("#m_emailId"),"이메일 주소를")) return;
		 else if(!chkSubmit($("#m_domain"),"도메인 주소를")) return;
		 else{
		 alert("등록한 email로 가서 인증 코드를 확인해주세요 ")
         $.ajax({
             url : "/member/emailchk.do",
             type : "post",
             dataType : "text",
             data : {"m_email":mail},
             error : function() {
             alert('오류입니다. 관리자에게 문의하세요.');
             },
             success : function(result) {
                if(result=="success"){
                   alert("이메일이 발송되었습니다..");
                   $("#auth").attr('disabled', 'true');
                   $("#msg").append("<form><input type='text' id='authpass' placeholder='인증코드를 입력해주세요'></form").append("<input type='button' class='authbtn' value='코드인증'>")
               
                      //이메일 코드 인증부분
           			     $(".authbtn").click(function(){
	    	                var authkey=$("#authpass").val()
           			    	 
           			    	$.ajax({
           		             url : "/member/emailconfirm.do?key="+authkey,
           		             type : "get",
           		             dataType : "text",
           		             error : function() {
           		             alert('오류입니다. 관리자에게 문의하세요.');
           		             },
           		             success : function(result) {
           		                if(result=="success"){
           		                   alert("인증완료");
           		                   $("#auth").attr('disabled', 'true');
           		                   $("#msg").html("인증완료")
           		                    auth=1
           		                           		           			 
           		                
           		                
           		                }
           		                else if(result!="success"){
           		                   alert("본인 인증에 실패 했습니다 다시 시도해주세요 .");
           		                   $("#msg").hide();
           		                   $("#auth").removeAttr("disabled");
           		                }
           		             }
           		          });/* ajax종료  */
           			    	 
	    					
	    					
						    })
                
                
                }
                else if(result=="1"){
                   alert("본인 인증에 실패 했습니다 다시 시도해주세요 .");
                   $("#msg").append("본인인증을 다시 시도해주세요")
                }
             }
          });/*이메일 발송 ajax종료  */
		 }/*else종료 */
	 })
	
	 
		
		
	//sns연동
/* 	 var SNS = {
                facebook: function (link, description) {
                    link = encodeURIComponent(link);
                    description = encodeURIComponent(description);
                    var url = 'http://www.facebook.com/sharer.php?u=' + link + '&amp;t=' + description;
                    window.open(url, '', '');
                },
                tweeter:function(link, description) {
                    link = encodeURIComponent(link);
                    description = encodeURIComponent(description);
                    var url = 'http://twitter.com/share?text=' + description + ' ' + link;
                    window.open(url, '', '');
                }
            }; */

    
    
            
		/* 뒤로 버튼 클릭시 처리 이벤트 */
		$("#back").click(function(){
			location.href="/book/bookIndex.do";	
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
		
		//아이디 중복 확인 버튼 클릭시
		$("#idChkBtn").click(function(){
		    if(!chkSubmit($("#m_id"),"아이디를")) return;
            else{
               $.ajax({
                  url : "/member/idChk.do",
                  type : "post",
                  dataType : "text",
                  data : $("#memberInsertF").serialize(),
                  error : function() {
                  alert('오류입니다. 관리자에게 문의하세요.');
                  },
                  success : function(result) {
                     if(result=="0"){
                        alert("사용가능한 아이디입니다.");
                        $("#m_id").attr('readonly', 'readonly');
                        idcheck = 1;
                     }
                     else if(result=="1"){
                        alert("중복되는 아이디입니다.아이디를 변경해주세요.");
                        $("#m_id").focus();
                     }
                  }
               });
            }	
		});
				
		 
		//회원가입 버튼 클릭시 처리 이벤트
		$("#memberInsertBtn").click(function(){
			if(!chkSubmit($('#m_id'),"아이디를")) return;
			else if(!chkSubmit($('#m_pwd'),"비밀번호를")) return;
			else if(!chkSubmit($('#m_pwdChk'),"비밀번호 확인을")) return;
			else if(!chkSubmit($('#m_nick'),"닉네임을")) return;
			else if(!chkSubmit($('#m_name'),"이름을")) return;
			else if(!chkSubmit($('#m_birth'),"생년월일을")) return;	
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
			/*본인인증 추가 2/9 윤지환  */
			else if(auth!=1){
			//auth 값이 1이면 인증 완료 0이면 실패 
			   alert("본인 인증을 진행해주세요 ")
				return
			}
			else{
				var email = $("#m_emailId").val();
			    var domain = $("#m_domain").val();
			    $("#m_email").val(email+"@"+ domain);

				$.ajax({
					url :"/member/memberInsert.do",
					type : "post",
					dataType : "text",
					data : $("#memberInsertF").serialize(),
					error : function(){
						alert ("오류입니다. 관리자에게 문의하세요.");
					},
					success : function(result){
						if(result == "1"){
							alert($("#m_id").val()+"님 회원가입을 축하드립니다.");
							location.href="/member/loginPage.do"
						}
					}
					
				});
			} 
			
		});
		
	

		
	});/* 최상위 function 종결 */
	
	
	
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
		<div class="contentTit"><h3>회원가입</h3></div>
		
	<div class="contentTB">	
	
	
	
	<h5 id="line" >기본정보입력</h5>
	<p>(*)가 표시되어있는 항목은 필수 입력 사항 입니다.</p>
		<form id="memberInsertF" name="memberInsertF">
		
		<!-- 아이디 중복 확인 -->	
		<input type="hidden" name="id_uq" id="id_uq" value="${m_id}}">
		<!-- 이메일 조합 -->
		<input type="hidden" name="m_email" id="m_email">
	
		
		
			<table class="table table-bordered" >
				<colgroup>
					<col width="15%">
					<col width="85%">
				</colgroup>
				<tr>
					<td class="tc">*아이디</td>
					<td><input type="text" id="m_id" name="m_id" maxlength="20" >
						<input type="button" id="idChkBtn" class="btn btn-default" name="idChkBtn" value="중복확인">
						<span class="add">(4자~12자리의 영문자, 숫자 / @,#$등 특수문자는 제외)</span></td>
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
					<td><input type="text" id="m_nick" name="m_nick" maxlength="20" ></td>
				</tr>
				<tr>
					<td class="tc">*이름</td>
					<td><input type="text" id="m_name" name="m_name" maxlength="20" ></td>
				</tr>
				 <tr>
			        <td class="tc">*생년월일</td>
			        <td><input type="date" id="m_birth" name="m_birth"></td>
	
			    </tr>
				<tr>
					<td class="tc">*성별</td>
					<td><input type="radio" name="m_sex" value="1" checked="checked">남자
						<input type="radio" name="m_sex" value="2">여자
					</td>
				</tr>
				<tr>
					<td class="tc">*이메일</td>
					<td><input type="text" id="m_emailId" name="m_emailId" maxlength="20" >@
						<input type="text" id="m_domain" name="m_domain" maxlength="20">
						<select class="boxSize" id="domain">
							<option value="none" selected >직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="hanmail.net">hanmail.net</option>						
						</select>
						<input type="button" class="btn btn-default" value="본인인증" id="auth"/> <span id="msg"></span>
					</td>
				</tr>				
			
				<tr>
					<td class="tc">*휴대전화</td>
					<td><input type="text" id="m_phone" name="m_phone" maxlength="13" placeholder="-을 빼고 입력해주세요">
						<span class="add">주문배송문자등 본인확인용으로 사용</span></td>
				</tr>
				<tr>
					<td class="tc">주소</td>
					<td>
		               <input type="text" id="postcode" placeholder="우편번호">
			            <input type="button" class="btn btn-default" id="execDaumPostcode" value="우편번호 찾기"><br>
			            <input type="text" name="m_home_address" id="m_home_address" placeholder="도로명주소" size="50px">
			            <input type="text" id="jibunAddress" placeholder="지번주소">
			            <span id="guide" style="color:#999"></span>
		            </td>		
				<tr>
					<td class="tc">메모</td>
					<td><textarea id="m_memo" name="m_memo" placeholder="메모를 입력하세요..."></textarea></td>
				</tr>
				<tr>
					<td class="tc">SNS연동</td>
					<td >
						<a href=""><i class="fa fa-facebook" onclick="SNS.facebook('http://www.facebook.com')"></i></a>
						<a href=""><i class="fa fa-twitter" onclick="SNS.tweeter('http://www.twitter.com')"></i></a>
						<a href=""><i class="fa fa-dribbble"></i></a>
						<a href=""><i class="fa fa-google-plus"></i></a>					
					</td>
				</tr>				
			</table>
		</form>
		
	</div><!-- "contentTB" 끝 -->
	
	
		<div class="insertFormBut">
				<input type="button" value="회원가입" class="btn btn-default	" id="memberInsertBtn">
				<input type="button" value="뒤로" class="btn btn-default" id="back">
		</div><!-- "contentBtn" 끝 -->
	
	</div><!--"contentContainter" 끝 -->
	
	
	</body>
</html>