function formCheck(main, item, msg){
	if(main.val().replace(/\s/g,"")==""){
	item.html(msg+"입력해주세요");
	//item.hide(3000);
	main.val("");
	return false;
	
	}else{
		return true;
	}
}
	

function chkSubmit(v_itme,v_msg){
	if(v_itme.val().replace(/\s/g,"")==""){
		alert(v_msg+"입력해주세요");
		
		v_itme.val("");
		v_itme.focus();
		return false;
		
	}else{
		return true;
	}
	
}


function chkFile(item){
	/*
	 * .pop() 마지막 요소만 반환함.
	 * jquery.inarray(찾을값,검색 대상의 배열);
	 * */
	var ext = item.val().split('.').pop().toLowerCase();
	if($.inArray(ext,["gif","png","png","jpg"])==-1){
		alert("gif,png.jpg.jpeg만 등록가능합니다.");
		return false;
	}else{
		return true;
	}
	
}


//금액 영역에 , 콤마 출력 
function priceNumber(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
