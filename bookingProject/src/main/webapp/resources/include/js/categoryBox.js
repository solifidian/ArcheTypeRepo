
function makeCateBox(target,cat_step,cat_root,name){
	var conStr = "";
	
	$.ajax({
		url:"/booking/common/categoryBoxList.do",
		type:"post",
		data:"cat_root="+cat_root+"&cat_step="+cat_step,
		success:function(resultData){
			conStr += '<select class="form-control" name="'+name+'" id="'+name+'">';
			conStr += '<option value="'+0+'">'+"분류 선택"+'</option>';
			$(resultData).each(function(){
				conStr += '<option value="'+this.cat_no+'">'+this.cat_name+'</option>';
			});
			
			conStr += '</select>'
			
			$(target).append(conStr);
		}
	})
	
}

function makeCateBoxSelected(target,cat_step,cat_root,name,sel_no,callback){
	var conStr = "";
	
	$.ajax({
		url:"/booking/common/categoryBoxList.do",
		type:"post",
		data:"cat_root="+cat_root+"&cat_step="+cat_step,
		success:function(resultData){
			conStr += '<select class="form-control" name="'+name+'" id="'+name+'">';
			conStr += '<option value="'+0+'">'+"분류 선택"+'</option>';
			$(resultData).each(function(){
				if(this.cat_no == sel_no){
					conStr += '<option value="'+this.cat_no+'" selected="selected">'+this.cat_name+'</option>';
				}
				else{
					conStr += '<option value="'+this.cat_no+'">'+this.cat_name+'</option>';
				}
			});
			conStr += '</select>'
			
			$(target).append(conStr);
			callback();
		}
	})
	
}
function makeCateBoxFromNo(target,cat_no){
	var conStr = "";
	
	$.ajax({
		url:"/booking/common/categoryOne.do",
		type:"post",
		data:"cat_no="+cat_no,
		success:function(data){
			
			makeCateBoxSelected(target,1,0,"hc",data.hc_no,function(){
				if(data.hc_no != null && data.hc_no != ''){
					makeCateBoxSelected(target,2,data.hc_no,"mc",data.mc_no,function(){
						if(data.mc_no != null && data.mc_no != ''){
							makeCateBoxSelected(target,3,data.mc_no,"cat_no",data.lc_no);
						}
					});
				}
			});

		}
	})
	
}

$(function(){
	makeCateBox("#categoryBoxes",1,0,"hc");
				
	$(document).on("change","#hc",function(){
		var sel_no = $("#hc").val();
		$("#mc").remove();
		$("#cat_no").remove();
		if(sel_no != 0){
			makeCateBox("#categoryBoxes",2,sel_no,"mc");
		}
		
	})
	
	$(document).on("change","#mc",function(){
		var sel_no = $("#mc").val();
		$("#cat_no").remove();
		if(sel_no != 0){
			makeCateBox("#categoryBoxes",3,sel_no,"cat_no");
		}
	})
})