<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<style>

</style>

 	<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
 	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript">
	
		// 로그인실패시에 다시 로그인페이지로 오면 아이디, 비밀번호 틀린경우 메세지 띄워주기위한 변수
		var msg ="${fail}";
		$(function(){
			if (msg!="") alert(msg);
			
			
			
			$("#btn_login").click(function(){
				if(!chkSubmit($('#m_id'), "아이디를")) return;
				else if(!chkSubmit($('#m_pwd'), "패스워드를")) return;
				else {
					$("#login_form").attr({
						"method":"post",
						"action":"/member/memberLogin.do"
					});
					$("#login_form").submit();	
				}
			});
			
			
			//아이디 / 비밀번호 찾기 버튼 클릭
			$("#btn_find").click(function(){
				location.href="/member/findIdPwdForm.do";
			});
			
			//회원가입 버튼 클릭
			$("#btn_member").click(function(){
				location.href="/member/memberForm.do";
			});
			
			
			
		});
	</script>

</head><!--/head-->

<body>
	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-5 col-sm-offset-3">
					<div class="login-form "><!--login form-->
						<h2>Login to your account</h2>
						<form id="login_form">
							<input type="text" name="m_id" id="m_id" maxlength="20" placeholder="아이디를 입력해주세요"/>
							<input type="password" id="m_pwd" name="m_pwd" maxlength="20" placeholder="비밀번호를 입력해주세요" />					
							
							<div class="btn-group" role="group" aria-label="...">
							<button type="button" class="btn btn-default " id="btn_login"><i class="glyphicon glyphicon-music" aria-hidden="true"></i> 로그인<i class="glyphicon glyphicon-music" aria-hidden="true"></i></button>
							  <button type="button" class="btn btn-default" id="btn_find"><i class="fa fa-search"></i>아이디/비밀번호 찾기</button>
							  <button type="button" class="btn btn-default" id="btn_member">
								<i class="fa fa-heart" aria-hidden="true"></i>회원 가입<i class="fa fa-heart" aria-hidden="true"></i></button>
							</div>
						</form>								
						
					</div>				
				</div>
			</div>
		</div>
	</section><!--/form-->
	

</body>
</html>