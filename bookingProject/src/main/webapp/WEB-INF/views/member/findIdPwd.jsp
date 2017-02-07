<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>		
      	<link rel="shortcut icon" href="./image/icon.png" />
		<link rel="apple-touch-icon" href="./image/icon.png" />
	<title> </title>	
	
	</head>
	<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script src="/resources/include/js/common.js"></script>
	<script type="text/javascript">
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
		
	$(function(){
			//아이디찾기 버튼을 눌렀을떄
			$("#findIdBtn").click(function(){
				if(!chkSubmit($("#name"), "이름을"))return;
				else if(!chkSubmit($("#email"), "이메일을"))return;
				else if (!regEmail.test( $("#email").val() ) ) {
				      alert("잘못된 이메일 형식입니다. 다시 확인해주세요.");
				      $("#email").focus();
				      return ;
				}
				else{
					$.ajax({
						url : "/member/findId.do",
						type : "post",
						data : $("#findIdForm").serialize(),
						dataType : "text",
						error : function(){
							alert('시스템 오류입니다. 관리자에게 문의하세요.');
						},
						success : function(resultData){
							if(resultData != ""){
								alert("당신의 아이디는"+resultData+"입니다.");
							}else{
								alert("아이디가 존재하지않습니다.");
							}
						}
					});
				}
				
			});
			
			//비밀번호 찾기 버튼을 눌렀을때
			$("#findPwdBtn").click(function(){
				if(!chkSubmit($("#m_id"), "아이디를 "))return;
				else if(!chkSubmit($("#m_name"), "이름을"))return;
				else if(!chkSubmit($("#m_email"),"이메일을"))return;
				else if (!regEmail.test( $("#m_email").val() ) ) {
				      alert("잘못된 이메일 형식입니다. 다시 확인해주세요.");
				      $("#m_email").focus();
				      return ;
				}
				else{
					$.ajax({
						url : "/member/findPwd.do",
						type : "post",
						data : $("#findPwdForm").serialize(),
						dataType : "text",
						error : function(){
							alert('시스템 오류입니다. 관리자에게 문의하세요.');
						},
						success : function(resultData){
							if(resultData != ""){
								alert("당신의 비밀번호는"+resultData+"입니다.");
							}else{
								alert("회원정보가 일치하지않습니다.");
							}
						}
					});
				}
				
				
			});
			
		});
	
	
	</script>
	<body>
	
	<h2>아이디 또는 비밀번호 찾기</h2>	
	<section id="form"><!--form-->
	
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
							<h2>아이디 찾기</h2>
						<form id="findIdForm">
							<input type="text"  id="name" name="m_name" placeholder="이름"/>
							<input type="email" id="email" name="m_email" placeholder="이메일"/>
							<button type="button" id="findIdBtn" class="btn btn-default">아이디 찾기</button>
						</form>
					</div><!--find id form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
									
					<div class="login-form"><!--find pwd form-->
						<h2>비밀번호 찾기</h2>
						<form id="findPwdForm">
							<input type="text"  id="m_id" name="m_id" placeholder="아이디"/>
							<input type="text"  id="m_name" name="m_name" placeholder="이름"/>
							<input type="email" id="m_email" name="m_email" placeholder="이메일"/>
							<button type="button" id="findPwdBtn" class="btn btn-default">비밀번호 찾기</button>
						</form>
					</div><!--/find pwd form-->
					
					
				</div>
			</div>
		</div>
	</section><!--/form-->
	</body>
</html>
