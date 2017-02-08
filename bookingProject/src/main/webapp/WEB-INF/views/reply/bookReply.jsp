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
<style>
	#br_writer{width:150px;}
	.size{width:150px;}
	#comment_list{background-color:white;}
	ul.reply-title-bar{background-color:white}
	#newscore{width:150px;}
	
</style>
<script type="text/javascript">

	$(function(){
		//기본 댓글 목록 불러오기
		var isbn = "<c:out value='${detail.isbn}'/>"; 
		listAll(isbn);
		
	//입력버튼 클릭시
		$("#replyInsertBtn").click(function(){
			
			 if(!chkSubmit($("#br_content"),"내용을"))return;
			else{
				var insertUrl = "/bookReplies/bReplyInsert.do";				
				$.ajax({	
					url : insertUrl,
					type :"POST",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" :"POST"
					}, 
					dataType:"text",				
					data : JSON.stringify({
						isbn : isbn,
						br_writer :1,
						br_score :$("#br_score").val(),
						br_content:$("#br_content").val()
					}),
					error : function(){
						alert("시스템 오류입니다. 다시한번 확인해 주세요.")
					},
					success : function(resultData){
						if(resultData == "SUCCESS"){
							alert("댓글 등록이 완료되었습니다.");
							dataReset();
							listAll(isbn);
						}
					}						
				});
			}
			
		});
		
		//수정하기 버튼 눌렀을때 수정폼 출력
		$(document).on("click",".replyUpdateBtn",function(){		
			var currLi = $(this).parents("li");
			currLi.find("input[type='button']").hide();
			var conText = currLi.children().find("p").html();
			var conArea = currLi.children().find("p");				
			conArea.html("");
			var score = "<select name='newscore' class='form-control' id='newscore'><option value='5' selected>★★★★★<option value='4'>★★★★☆<option value='3'>★★★☆☆<option value='2'>★★☆☆☆<option value='1'>★☆☆☆☆	</select>";
			var data = "<textArea name='content' id='content'>"+conText+"</textArea>";
			data += score;
			data += "<input type='button' class='update_btn btn btn-primary ' value='수정완료'>";
			data += "<input type='button' class='reset_btn btn btn-primary' value='수정취소'>";
			
			conArea.html(data);
			
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
			var br_no = $(this).parents("li").attr("data-num");
			var br_score = $("#newscore").val();
			var br_content = $("#content").val();
			if(!chkSubmit($("#content"), "댓글 내용을"))return;
			else{
				$.ajax({
					url : '/bookReplies/'+br_no+".do",
					type : 'put',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override":"PUT"
					},
					data : JSON.stringify({
						br_score:br_score,
						br_content:br_content}),
					dataType : 'text',
					success : function(result){
						console.log("result : "+result);
						if(result == 'SUCCESS'){
							alert("수정 완료되었습니다.");
							listAll(isbn);
						}
					}
				});
			}
		});
		
		//댓글 삭제를 위한 ajax 연동처리
		$(document).on("click",".replyDeleteBtn",function(){			
			var currLi = $(this).parents("li");
			replyNum = currLi.attr("data-num");			
			var br_no = $(this).parents("li").attr("data-num");
			var br_content = $("#content").val();			

				if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
					$.ajax({
						url : '/bookReplies/'+br_no+".do",
						type : 'delete',
						header :{
							"Content-Type" :"application/json",
							"X-HTTP-Method-Override" : "DELETE"
						},
						data : JSON.stringify({
							br_score : br_score,
							br_content : br_content}),
						dataType : 'text',
						success : function(result){
							console.log("result:"+result);
							if(result == 'SUCCESS'){
								alert("삭제 완료되었습니다.");
								listAll(isbn);
							}
						}
					});
				}			
		});

		
	});/* 최상위 종료 */
	
	//리스트 요청 함수
	function listAll(isbn){
		$("#comment_list").html("");
		var url = "/bookReplies/br/"+isbn+".do";
		$.getJSON(url, function(data){
			console.log(data.length);
			
			$(data).each(function(){
				var br_no = this.br_no;
				var br_writer = this.br_writer;
				var br_content = this.br_content;
				var br_editdate = this.br_editdate;
				var br_update = this.br_update;
				var br_score = this.br_score;
			
				addNewItem(br_no, br_writer, br_content, br_editdate, br_update, br_score);
				
			});
		}).fail(function(){
			alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
		});
	}
	
	
	function addNewItem(br_no, br_writer, br_content, br_editdate,br_update, br_score){
	
		//새로운 글이 추가될 <li>
		var new_li = $("<li>");
		new_li.attr("data-num",br_no);
		new_li.addClass("comment_item media");
		
		//하나의 댓글을 감싸는 <div>
		var area_div = $("<div>");
		area_div.addClass("media-body");
		
		// 이미지 추가될 ul
		var ul_img = $("<ul>");
		ul_img.addClass("sinlge-post-meta");
		ul_img.addClass("reply-title-bar");
		
		//작성자 이름을 저장하는 <li>와 아이콘<i>
		var li_writer = $("<li>");
		var i_writer = $("<i>");
		i_writer.addClass("fa fa-user");
		li_writer.append(i_writer);
		li_writer.append(br_writer+"님");
		
		//작성시간을 저장하는 <li>
		var li_time = $("<li>");
		var i_time = $("<i>");
		i_time.addClass("fa fa-clock-o");
		li_time.append(i_time);		
		li_time.append(br_update);
		
				
		//작성일자를 저장하는 <li>
		var li_date = $("<li>");
		var i_date = $("<i>");
		i_date.addClass("fa fa-calendar");
		li_date.append(i_date);
		li_date.append(br_editdate);		
	
		//별점을 저장하는 <li>
		var li_score = $("<li>");
		var i_score=$("<i>");
		i_score.addClass("fa fa-star");
		li_score.append(i_score);
		li_score.append(br_score);
		
		//내용
		var content_p = $("<p>");
		content_p.addClass("con");
		content_p.html(br_content);	

		
		//수정하기 버튼
		var up_input = $("<input>");
		up_input.attr({"type":"button", "value" :"수정하기"});
		up_input.addClass("replyUpdateBtn btn btn-default dropdown-toggle usa");
		
		//삭제하기 버튼
		var del_input = $("<input>");
		del_input.attr({"type":"button", "value" : "삭제하기"});
		del_input.addClass("replyDeleteBtn btn dropdown-toggle usa");
		
		//ul에  li조립하기		
		ul_img.append(li_writer).append(li_date).append(li_time).append(li_score);

		
		//전체조립					
		area_div.append(ul_img).append(content_p).append(up_input).append(del_input);	
		new_li.append(area_div);
		$("#comment_list").append(new_li);		
	
	}
	
	function dataReset(){
		$("#br_content").val("");
	};
	
</script>
	</head>
<body>
	<div class="container">
		<div class="row">				
			<div class="col-sm-12">		
			<!----------------------리플 영역------------------  -->	
				<div class="response-area ">
					<ul class="media-list" id="comment_list">					
							
							<!-- 여기에 동적 생성 요소가 들어가게 됩니다.  -->
						
						
					</ul>	
				</div>	
			<!----------------------/리플 영역------------------  -->	
			<!-- isbn 을 hidden 으로 넘겨야햅 -->	
				<form name="f_data" id="f_data" method="post">
					<input type="hidden" name="isbn" name="isbn" value="${detail.isbn}">
					
				</form>
				
				<div class="replay-box">
					<div class="row">			
						<form id="comment_form " class="form-inline">
						  <div class="well well-lg">
						 	 <div class="form-group">
    								<label for="2"><i class="fa fa-star"></i></label>
   									<select name="br_score" id="br_score" class="form-control size" >
										<option value="5" selected>★★★★★															
										<option value="4">★★★★☆
										<option value="3">★★★☆☆
										<option value="2">★★☆☆☆
										<option value="1">★☆☆☆☆								
									</select>
 							 </div>
 							 
							   
							
							 
							  	<textarea name="br_content" id="br_content" rows="3" placeholder="한줄평을 입력해주세요" maxlength="50"></textarea>
								<input type="button" id="replyInsertBtn" class="btn btn-default usa" value="작성">
								</div>
							</form>			
					</div><!--/class="row"  -->		
				</div><!--/class="reply-box" -->
			</div><!--/class="col-sm-12"  -->
		</div><!--/class="row"  -->	
	</div><!--/class="container"  -->
	
</body>
</html>
