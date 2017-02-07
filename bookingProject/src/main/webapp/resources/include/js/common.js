function chkSubmit(v_item, v_msg){
	if($(v_item).val().replace("/\s/g","")==""){
		alert(v_msg);
		$(v_item).val("");
		$(v_item).focus();
		return false;
	}else{
		return true;
	}
}


function inputVerify(check,main){
	var chkbirth = /^[0-2][0-9]{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|[3][0-1])$/;
	var chkphone = /^0[0-9]{2}-\d{3,4}-\d{4}$/;
	var chkId = /^[0-9a-zA-Z]{4,12}$/;
	var chkPWD = /^\S{4,20}$/;
	var chkname = /^[^\s^\d]{1,10}$/;
	if(check == "phone"){
		if(chkphone.test($(main).val())){
			alert("000-0000-0000 형식으로 입력해 주세요");
			$(main).focus();
			return false;
		}else{
			return true;
		}
	}else if(check == "name"){
		if(!chkname.test($(main).val())){
			alert("5자 이내로 숫자나 공백문자를 적어넣을 수 없습니다.");
			$(main).focus();
			return false;
		}else{
			return true;
		}
	}
}

/***********************************************
 * chkFile(item)
 * 
 * 배열 내의 값을 찾아 인덱스를 반환.(요소가 없으면 -1을 반환)
 * jQuery.inArray(찾을 값, 검색 대상의 배열)
 ***********************************************/
function chkFile(item){
	if($(item).val() == '') return true;
	var ext = $(item).val().split('.').pop().toLowerCase();
	if(jQuery.inArray(ext,['gif','png','jpg','jpeg'])== -1){
		alert('gif,png,jpg,jpeg 파일만 업로드 할 수 있습니다.');
		return false;
	}else{
		return true;
	}
}

function formChk(main,err,msg){
	if($(main).val().replace("/\s/g","") == ""){
		$(err).html(msg+" 입력 해 주세요");
		$(main).focus();
		return false;
	}else{
		$(err).html("");
		return true;
	}
}
$(function(){
	$("#excelDownBtn").click(function(){
		alert("excel");
		/*$("#searchForm").attr({
			"method":"get",
			"action":"/admin/book/bookExcel.do"
		});
		$("#searchForm").submit();*/
	});
})
