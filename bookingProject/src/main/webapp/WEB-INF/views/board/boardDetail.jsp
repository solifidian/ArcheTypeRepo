<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>

<!-- 문서 유형 : 현재 웹 문서가 어떤 HTML 버전에 맞게 작성되었는지를 알려준다. -->

<!--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
     "http://www.w3.org/TR/html4/loose.dtd">
     DTD 선언문이 HTML 페이지의 가장 첫 라인에 명시되어야 웹 브라우저가 HTML 버전을 인식.
     HTML태그나 CSS를 해당 버전에 맞도록 처리하므로 웹 표준 준수를 위하여 반드시 명시되어야 한다.-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<link rel="shortcut icon" href="../../image/icon.png" />
<link rel="apple-touch-icon" href="../../image/icon.png" />		

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script src="/resources/include/js/common.js"></script>
<title>boardDetail</title>
</head>
<style>
		.ac{text-align:center;}
		.contentTit{text-align:center;}
		#tb{border-collapse:collapse; margin:0px auto;}
		.but:hover{background:#FE980F;color:#fff;border-color:#FE980F;}

</style>
<script type="text/javascript">

	var butChk = 0;		//수정버튼과 삭제버튼을 구분하기위한 변수
	$(function(){
		$("#pwdChk").hide();
		
		
		//목록버튼 클릭시 이벤트
		$("#boardList").click(function(){
			location.href= "/board/boardList.do";
		});
		
		//수정버튼 클릭시 이벤트
		$("#updateForm").click(function(){
			$("#pwdChk").show();
			$("#msg").text("작성시 입력한 비밀번호를 입력해주세요.").css("color","orange");
			butChk = 1;
		});
		
		//삭제버튼 클릭시 이벤트
		$("#boardDelete").click(function(){
			$("#pwdChk").show();
			$("#msg").text("작성시 입력한 비밀번호를 입력해주세요.").css("color","#orange");
			butChk = 2;
		});
		
		
	/* 	//답변버튼 클릭시 이벤트
		$("#boardReply").click(function(){
			$()	
		}); */
		
		//비밀번호 체크
		$("#pwdBut").click(function(){
			boardPwdConfirm();
		});
		
		
		
	});//최상위 종료
	
	
	//비밀번호 확인 버튼 클릭시 실질적인 처리 함수
	function boardPwdConfirm(){
		if(!chkSubmit($("#bd_pwd"),"비밀 번호를"))return;
		else{
			$.ajax({
				url : "/board/pwdConfirm.do",
				type : "POST",
				data : $("#f_pwd").serialize(),
				success:function(result){
					var goUrl = "";
					if(result == 0){
						$("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다.").css("color","red");
						$("#bd_pwd").select();
					}else if(result == 1){
						$("#msg").text("");
						if(butChk == 1){
							goUrl = "/board/boardUpdateForm.do";
						}else if(butChk == 2){
							if(confirm("정말 삭제하시겠습니까? 댓글도 함께 삭제됩니다")){
								goUrl = "/board/boardDelete.do";
							}
							
						}
						
						$("#f_data").attr("action", goUrl);
						$("#f_data").submit();
					}
				}
				
			});
		}
	}
</script>

<body>
<section>
	<div class="container">
		<div class="row">

<!-- ===========================================================================  -->
<!-- ===========================================================================  -->
<!-- ===========================================================================  -->
			
			<div class="col-sm-9">
			
				<div class="blog-post-area">
					<h2 class="title text-center">게시글 읽기</h2>
						<div class="single-blog-post">
						<form name="f_data" id="f_data" method="POST">
							<input type="hidden" name="bd_post_no" class="bd_post_no" value="${detail.bd_post_no}" />
							<input type="hidden" name="bd_forum_no" class="bd_forum_no" value="${detail.bd_forum_no}" />
							
						</form>
<!-- ================== 비밀번호 확인 버튼 및 버튼 추가 시작 ==================== -->
		
			
				
					<div id="pwdChk">
						<form name="f_pwd" id="f_pwd">
							<input type="hidden" name="bd_post_no" id="bd_post_no" value="${detail.bd_post_no}" />
							<label for="bd_pwd" id="l_pwd">비밀번호: </label>
							<input type="password" name="bd_pwd" id="bd_pwd" />
							<input type="button" id="pwdBut" class="but btn btn-default " value="확인" />
							<span id="msg"></span>											
						</form>
					</div>
				
					<div style="float:right">
						<input type="button" value="수정" class="but btn btn-default" id="updateForm">
						<input type="button" value="삭제" class="but btn btn-default" id="boardDelete">
						<input type="button" value="목록" class="but btn btn-default" id="boardList" >
					</div>
			
	<br>
	<!-- ================== 비밀번호 확인 버튼 및 버튼 추가 종료 ==================== -->	
						
<!-- ================ 상세 정보 보여주기 시작 ======================  -->						
							
							<div class="post-meta">
								<ul>
									<li><i class="fa fa-user">글쓴이</i> ${detail.bd_writer}</li>							
									<li><i class="fa fa-calendar">작성일</i>${detail.bd_update}</li>
									<li><i class="fa fa-clock-o">시간</i> ${detail.bd_editdate}</li>
									<li><i class="fa fa-user">조회수</i> ${detail.bd_readcnt}</li>
								</ul>
								<p></p>

							</div><!--/class="post-meta"  -->
							<table class="table table-condensed">
								<colgroup>
									<col width="20px">	
									<col width="30px">
									<col width="20px">	
									<col width="30px">	
								</colgroup>			
								<tbody>
									<tr>
										<td class="ac" >게시판 이름</td>
										<td colspan="3">${detail.bd_forum_name}</td>
									</tr>
									<tr>
										<td class="ac" >카테고리</td>
										<td>${detail.bd_category}</td>
										<td class="ac">말머리</td>
										<td>${detail.bd_head}</td>
									</tr>	
									<tr>
										<td class="ac" >제목</td>
										<td colspan="3">${detail.bd_title}</td>
									</tr>																
									<tr>
										<td class="ac" colspan="4">${detail.bd_content}</td>
									</tr>
								</tbody>	
							</table>
						</div><!--/class="single-blog-post"  -->		
<!-- ============== 상세 정보 보여주기  종료 ========== -->
<!-- ============== 다음글/전글읽기 시작 ========== -->
					<div class="pager-area">
					<!-- 	<ul class="pager pull-right">
							<li><a href="#">Pre</a></li>
							<li><a href="#">Next</a></li>
						</ul> -->
					</div><!--/class="pager-area"  -->
<!-- ============== 다음글/전글읽기 종료 ========== -->
				</div><!-- /class="blog-post-area" -->
<!-- ============== 추천하기 시작 ========== -->				
				<div class="rating-area">
					<ul class="ratings">
						<li class="rate-this">추천</li>
						<li>
							<div style="cursor:pointer;float:none;margin:0 auto;" class="" onclick="" id="">
							<strong class="num">추천수 : ${detail.bd_score}</strong>
							</div>
						</li>
						<li class="color">아이콘</li>						
					</ul>
<!-- ============== 추천하기 끝 ========== -->
<!-- ============== 비밀글 여부확인 ========== -->
					<ul class="tag">
						<li>비밀글:</li>
						<li>${detail.bd_status}</li>
					</ul>

<!-- ==============태그  시작:태그테이블 미완성 이유로 우선 주석처리========== -->									
<!-- 				<ul class="tag">
						<li>TAG:</li>
						<li><a class="color" href=""> <span>/</span></a></li>
						<li><a class="color" href=""> <span>/</span></a></li>
						<li><a class="color" href=""></a></li>
					</ul> -->
<!-- ==============태그  끝========== -->			
				</div><!--/rating-area-->
<!-- ============= 소셜 연결  시작========== -->						
				<div class="socials-share">
						<a href=""><img src="/resources/images/blog/socials.png" alt=""></a>
				</div><!--/socials-share-->		
<!-- ============= 소셜 연결  끝========== -->	

<%-- 리플영역  --%>

	<jsp:include page="/WEB-INF/views/reply/reply.jsp" /> 
							
			</div><!--/ class="col-sm-9" -->			
		</div><!--/ class: row -->
	</div><!--/ class: container  -->
</section>

</body>
</html>