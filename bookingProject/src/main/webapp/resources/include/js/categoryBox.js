
function makeCateBox(target,cat_step,cat_root,name){
	var conStr = "";
	
	$.ajax({
		url:"/common/categoryBoxList.do",
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
		url:"/common/categoryBoxList.do",
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
		url:"/common/categoryOne.do",
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
	$("#hc").remove();
}

function makeCateBoxSearched(target,cat_no){
	var conStr = "";
	
	$.ajax({
		url:"/common/categoryOne.do",
		type:"post",
		data:"cat_no="+cat_no,
		success:function(data){
			console.log(data.cat_no)
			if(data.cat_no == 0){
				$("#hc").remove();
				makeCateBox("#categoryBoxes",1,0,"hc");
			}
			else{
				$("#hc").remove();
				makeCateBoxSelected(target,1,0,"hc",data.hc_no,function(){
					if(data.hc_no != null && data.hc_no != '' && data.hc_no != '0'){
						makeCateBoxSelected(target,2,data.hc_no,"mc",data.mc_no,function(){
							if(data.mc_no != null && data.mc_no != ''){
								makeCateBoxSelected(target,3,data.mc_no,"lc",data.lc_no);
								if(data.lc_no != null && data.lc_no != ''){
									makeCateBoxSelected(target,4,data.lc_no,"lc2",data.lc2_no);
								}
							}
						});
					}
				});
			}
			
		}
	})
}
$(function(){
	makeCateBox("#categoryBoxes",1,0,"hc");
				
	$(document).on("change","#hc",function(){
		var sel_no = $("#hc").val();
		$("#mc").remove();
		$("#lc").remove();
		$("#lc2").remove();
		if(sel_no != 0){
			makeCateBox("#categoryBoxes",2,sel_no,"mc");
			$("#cat_no").val(sel_no);
		}
		else{
			$("#cat_no").val(0);
		}
		
	})
	
	$(document).on("change","#mc",function(){
		var sel_no = $("#mc").val();
		$("#lc").remove();
		$("#lc2").remove();
		if(sel_no != 0){
			makeCateBox("#categoryBoxes",3,sel_no,"lc");
			$("#cat_no").val(sel_no);
		}
		else{
			$("#cat_no").val($("#hc").val());
		}
	})
	
	$(document).on("change","#lc",function(){
		var sel_no = $("#lc").val();
		$("#lc2").remove();
		if(sel_no != 0){
			makeCateBox("#categoryBoxes",4,sel_no,"lc2");
			$("#cat_no").val(sel_no);
		}
		else{
			$("#cat_no").val($("#mc").val());
		}
	})
	
	$(document).on("change","#lc2",function(){
		var sel_no = $("#lc2").val();
		if(sel_no != 0){
			$("#cat_no").val(sel_no);
		}
		else{
			$("#cat_no").val($("#lc").val());
		}
	})
})