<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>		
      	<link rel="shortcut icon" href="./image/icon.png" />
		<link rel="apple-touch-icon" href="./image/icon.png" />
	<title> </title>	
<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script src="/resources/include/js/common.js"></script>
<style type="text/css">
.msg_default{color:blue;}
.msg_error{color:red;}

</style>
<script type="text/javascript">
//변수 처리!
	var replyNum, message = "작성시 입력한 비밀번호를 입력해주세요.",
	pwdConfirm = 0; btnKind = "";
	
	$(function(){
		//기본 댓글 목록 불러오기
		var bd_post_no = "<c:out value='${detail.bd_post_no}' />";
		listAll(bd_post_no);
		
	
		//textarea maxlength설정
		$("#re_content").on('keyup',function(){
			if($(this).val().length>4000){
				alert("글자수는 영문4000, 한글 2000자로 제한됩니다!")
				$(this).val($(this).val().subString(0,4000));
				$("#re_content").focus();
			}
	});
		
		//작성버튼 클릭시
		$("#replyInsertBtn").click(function(){
			if(!chkSubmit($("#re_writer"), "작성자를"))return;
			else if(!chkSubmit($("#re_pwd"), "비밀번호를"))return;
			else if(!chkSubmit($("#re_content"),"내용을"))return;
			else{
				var insertUrl = "/replies/replyInsert.do";				
				$.ajax({	
					url : insertUrl,
					type :"POST",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" :"POST"
					}, 
					dataType:"text",				
					data : JSON.stringify({
						bd_post_no : bd_post_no,
						bd_forum_no : 1,
						re_writer:$("#re_writer").val(),
						re_pwd:$("#re_pwd").val(),
						re_content:$("#re_content").val()
					}),
					error : function(){
						alert("시스템 오류입니다. 다시한번 확인해 주세요.")
					},
					success : function(resultData){
						if(resultData == "SUCCESS"){
							alert("댓글 등록이 완료되었습니다.");
							dataReset();
							listAll(bd_post_no);
						}
					}						
				});
			}
			
		});
		
		//수정하기 버튼 눌렀을때 수정폼 출력
		$(document).on("click",".update_form", function(){
			$(".reset_btn").click();
			var currLi = $(this).parents("li");
			if(pwdConfirm == 0){
				replyNum = currLi.attr("data-num");
				btnKind = "upBtn";
				pwdView(currLi);
				
			}else if(pwdConfirm == 1){
				var conText = currLi.children().find("p").html();
				currLi.find("input[type='button']").hide();
				var conArea = currLi.children().find("p");
				
				conArea.html("");
				var data = "<textArea name='content' id='content'>"+conText+"</textArea>";
				data += "<input type='button' class='update_btn btn btn-primary ' value='수정완료'>";
				data += "<input type='button' class='reset_btn btn btn-primary' value='수정취소'>";
				conArea.html(data);
			}
		});
		
		//수정취소 버튼 클릭시
		$(document).on("click",".reset_btn",function(){
			var conText = $(this).parents("li").find("textarea").html();
			$(this).parents("li").find("input[type='button']").show();
			var conArea = $(this).parents("li").children().find("p");
			conArea.html(conText);
		});
		
		//댓글 수정을 위한 ajax연동처리
		$(document).on("click",".update_btn",function(){
			var currLi = $(this).parents("li");
			var re_no = $(this).parents("li").attr("data-num");
			var re_content = $("#content").val();
			if(!chkSubmit($("#content"), "댓글 내용을"))return;
			else{
				$.ajax({
					url : '/replies/'+re_no+".do",
					type : 'put',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "PUT"
					},
					data : JSON.stringify({
						re_content:re_content}),
					dataType : 'text',
					success : function(result){
						console.log("result : "+result);
						if(result == 'SUCCESS'){
							alert("수정 완료되었습니다.");
							listAll(bd_post_no);
						}
					}
				});
			}
		});
		
		//댓글 삭제를 위한 ajax 연동처리
		$(document).on("click",".delete_btn", function(){
			var currLi = $(this).parents("li");
			replyNum = currLi.attr("data-num");
			
			var re_no = $(this).parents("li").attr("data-num");
			var r_content = $("#content").val();
			
			if(pwdConfirm == 0){
				pwdView(currLi);
				btnKind = "delBtn";
				
			}else if(pwdConfirm == 1){
				if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
					$.ajax({
						url : '/replies/'+re_no+".do",
						type : 'delete',
						header :{
							"Content-Type" :"application/json",
							"X-HTTP-Method-Override" : "DELETE"
						},
						data : JSON.stringify({
							re_content : re_content}),
						dataType : 'text',
						success : function(result){
							console.log("result:"+result);
							if(result == 'SUCCESS'){
								alert("삭제 완료되었습니다.");
								listAll(bd_post_no);
							}
						}
					});
				}else{
					pwdConfirm = 0;			//취소했을때 비밀번호 검증부터 다시하게
				}
			}
		});
		
		//비밀번호 입력버튼 스타일리스트 주기
		$(document).on("focus", ".passwd", function(){
			$(this).val("");
			var span = $(this).parents("form").find("span");
			span.removeClass("msg_error");
			span.addClass("msg_default");
			span.html(message);
		});
		
		//비밀번호 취소 버튼 클릭 시 이벤트
		$(document).on("click", ".pwdResetBut", function(){
			$(this).parent().parent().html("");
		});
		
		//비밀번호 구현
		$(document).on("click", ".pwdCheckBut", function(){
			var form = $(this).parents("form");
			var pwd = form.find(".passwd");
			var msg = form.find(".msg");
			
			var up = $(this).parents("li").find(".update_form");
			var del = $(this).parents("li").find(".delete_btn");
			
			if(!formCheck(pwd, msg, "비밀번호를"))return;
			else{
				$.ajax({
					url : "/replies/pwdConfirm.do",
					type : "post",
					data : "re_no="+replyNum+"&re_pwd="+pwd.val(),
					dataType : "text",
					error : function(){
						alert('시스템 오류입니다. 관리자에게 문의하세요.');
					},
					success : function(resultData){
						if(resultData == 0){
							msg.addClass("msg_error");
							msg.text("입력한 비밀번호가 일치하지 않습니다.");
						}else if(resultData == 1){
							console.log("resultData : "+resultData);
							pwdConfirm = resultData;
							$(".pwdResetBut").click();
							
							if(btnKind == "upBtn"){
								up.click();
							}else if(btnKind == "delBtn"){
								del.click();
							}
							
							btnKind = ""; 	//비밀번호 종류 버튼 초기화
							pwdConfirm = 0;	//비밀번호 확인 여부 초기화
						}
					}
				});
			}
		});
		
	});/* 최상위 종료 */
	
	//비밀번호 검증
	function pwdView(area){
		$(".pwdResetBut").click();
		var pwd_div = $("<div>");
		
		var data = "<form name = 'f_pwd'>";
		data += "<label for ='passwd'>비밀번호 : </label>";
		data += "<input type='password' name='passwd' class='passwd' />";
		data += "<input type='button' class='pwdCheckBut btn btn-default ' value='확인' />";
		data += "<input type='button' class='pwdResetBut btn btn-default ' value='취소' />";
		data += "<span class='msg msg_default'>"+message+"</span></form>";
		pwd_div.html(data);
		
		area.append(pwd_div);
	}
	
	//리스트 요청 함수
	function listAll(bd_post_no){
		$("#comment_list").html("");
		var url = "/replies/all/"+bd_post_no+".do";
		$.getJSON(url, function(data){
			console.log(data.length);
			
			$(data).each(function(){
				var re_no = this.re_no;
				var re_writer = this.re_writer;
				var re_content = this.re_content;
				var re_update = this.re_update;
				var re_update_time = this.re_update_time;
			
				addNewItem(re_no, re_writer, re_content, re_update, re_update_time);
				
			});
		}).fail(function(){
			alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
		});
	}
	
	
	function addNewItem(re_no, re_writer, re_content, re_update, re_update_time){
	
		//새로운 글이 추가될 <li>
		var new_li = $("<li>");
		new_li.attr("data-num", re_no);
		new_li.addClass("comment_item media");
		
		//하나의 댓글을 감싸는 <div>
		var area_div = $("<div>");
		area_div.addClass("media-body");
		
		// 이미지 추가될 ul
		var ul_img = $("<ul>");
		ul_img.addClass("sinlge-post-meta");
		
		
		//작성자 이름을 저장하는 <li>와 아이콘<i>
		var li_writer = $("<li>");
		var i_writer = $("<i>");
		i_writer.addClass("fa fa-user");
		li_writer.append(i_writer);
		li_writer.append(re_writer+"님");
		
		//작성시간을 저장하는 <li>
		var li_time = $("<li>");
		var i_time = $("<i>");
		i_time.addClass("fa fa-clock-o");
		li_time.append(i_time);		
		li_time.append(re_update_time);
		
				
		//작성일자를 저장하는 <li>
		var li_date = $("<li>");
		var i_date = $("<i>");
		i_date.addClass("fa fa-calendar");
		li_date.append(i_date);
		li_date.append(re_update);		
	
		//내용
		var content_p = $("<p>");
		content_p.addClass("con");
		content_p.html(re_content);	

		
		//수정하기 버튼
		var up_input = $("<input>");
		up_input.attr({"type":"button", "value" :"수정하기"});
		up_input.addClass("update_form btn btn-default dropdown-toggle usa");
		
		//삭제하기 버튼
		var del_input = $("<input>");
		del_input.attr({"type":"button", "value" : "삭제하기"});
		del_input.addClass("delete_btn btn dropdown-toggle usa");
		
		//ul에  li조립하기		
		ul_img.append(li_writer).append(li_date).append(li_time);

		
		//전체조립					
		area_div.append(ul_img).append(content_p).append(up_input).append(del_input);	
		new_li.append(area_div);
		$("#comment_list").append(new_li);		
	
	}
	
	function dataReset(){
		$("#re_writer").val("");
		$("#re_pwd").val("");
		$("#re_content").val("");
	};
	
</script>
	</head>
<body>
	<div class="container">
		<div class="row">				
			<div class="col-sm-9">		
			<!----------------------리플 영역------------------  -->	
				<div class="response-area">
					<ul class="media-list" id="comment_list">
						
							
							<!-- 여기에 동적 생성 요소가 들어가게 됩니다.  -->
						
						
					</ul>	
				</div>	
			<!----------------------/리플 영역------------------  -->	
				
				<form name="f_data" id="f_data" method="post">
					<input type="hidden" name="bd_post_no" name="bd_post_no" value="${detail.bd_post_no}">
					<input type="hidden" name="bd_forum_no" name="bd_forum_no" value="${detail.bd_forum_no}">
					
				</form>
				
				<div class="replay-box">
					<div class="row">			
						<form id="comment_form">						
							<div  class="text-area">
								<div class="blank-arrow">
									<label>Your Name</label>
								</div>
								<span>*</span>
								<input type="text" id="re_writer" name="re_writer" maxlength="20" placeholder="이름을 작성해주세요">
								<div class="blank-arrow">
									<label>Password</label>
								</div>
								<span>*</span>
								<input type="password" id="re_pwd" name="re_pwd" maxlength="15" placeholder="비밀번호를 작성해주세요">
								<div class="blank-arrow">
									<label>content</label>
								</div>
								<span>*</span>
								<textarea name="re_content" id="re_content" rows="11" placeholder="내용을 작성해주세요"></textarea>
								<input type="button" id="replyInsertBtn" class="btn btn-primary" value="작성">
							</div><!--/class="text-area"  -->
						</form>
				
					</div><!--/class="row"  -->		
				</div><!--/class="reply-box" -->
			</div><!--/class="col-sm-9"  -->
		</div><!--/class="row"  -->	
	</div><!--/class="container"  -->
	
</body>
</html>
