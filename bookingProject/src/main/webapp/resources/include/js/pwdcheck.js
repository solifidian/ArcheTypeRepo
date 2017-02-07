 function boardpwdconfirm(butchk){
	   if(!chkSubmit($("#passwd"),"비번입력하세요")) return;
	   else{
		   
		   $.ajax({
			
			   url:"/Board/board/pwdCheck.do",
			   type:"post",
			   data:$("#f_pwd").serialize(),
			   dataType:"text",
			   error:function(){
				   alert("시스템 오류입니다.")
			   },
			   success:function(resultData){
				   var gourl="";
				   if(resultData==0){
					   $("#mgs").text("비밀번호가 일치하지 않습니다.").css("color","#000099");
					   $("passwd").select();					   
					   
				   }else if(resultData==1){
					   $("#msg").text("");
					   if(butchk==1){
						   gourl="/Board/board/updateForm.do";
						   
					   }else if(butchk==2){
						   gourl="/Board/board/delete.do";
						   
					   }
					   $("#f_data").attr("action",gourl);
					   $("#f_data").submit();
				   }
				   
			   }
			   
		   })
		   
		   
		   
		   
	   }
   }	
   