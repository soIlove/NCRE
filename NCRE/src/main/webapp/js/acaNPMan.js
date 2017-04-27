var acmyid=$("#acmyid").val();

$.post("acaadmin/findNPmsg",{"acmyid":acmyid},function(data){
	
	
})

function removeApply(obj){
	
	var thistr=$(obj).parents('.tr_1');
	var cid=$(thistr).children().eq(0).text();
	
	$.get("acaadmin/removeApply?cid="+cid,function(data){
		if(data){
			alert("删除成功...")
			$(thistr).remove();
		}
	},"json");
	
}