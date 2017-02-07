/**
 * 
 */
function goPage(page){
	$("#page").val(page);
	$("#searchForm").submit();
}

$(function(){
	/* 정렬 제어 */
	var orderTarget = $("#orderTarget").val();
	if(orderTarget != null && orderTarget != ''){
		var orderDirection = $("#orderDirection").val();
		if(orderDirection == 'asc'){
			$("th[data-value='"+orderTarget+"']").append("▲")
		}
		else if(orderDirection == 'desc'){
			$("th[data-value='"+orderTarget+"']").append("▼")
		}
	}
	$("#pageSizeChange").change(function(){
		$("#pageSize").val($(this).val());
		goPage($("#page").val());
	})
	
	$("th.orderth").click(function(){
		if($("#orderTarget").val() == $(this).attr("data-value")){
			if($("#orderDirection").val() == 'asc'){
				$("#orderDirection").val('desc');
			}
			else if($("#orderDirection").val() == 'desc'){
				$("#orderDirection").val('asc');
			}
		}
		else{
			$("#orderTarget").val($(this).attr("data-value"));
			$("#orderDirection").val('desc');
		}
		goPage($("#page").val());
	})
			
	/* 검색 조건 디폴트 */
	$("#pageSizeChange").val($("#pageSize").val());
	$("#searchMode").change(function(){
		if($("#searchMode").val() == "allSch"){
			$("#keyword").attr("placeholder","전체 데이터 조회합니다");
			$("#keyword").focus();
		}else if($("#searchMode").val() != "allSch"){
			$("#keyword").attr("placeholder","");
			$("#keyword").focus();
		}
	})
	$("#keyword").keypress(function(key){
		if(key.which == 13){
			$("#page").val(1);
			$("#searchForm").submit();
		}
	});
	$("#searchKeywordBtn").click(function(){
		$("#page").val(1);
		$("#searchForm").submit();
	})
});