var acmyid=$("#acmyid").val();
findappmsg();

function findappmsg(){
	$.post("acaadmin/findappmsg",{"acmyid":acmyid},function(data){
		
	},"json")
}

function agreeApply(obj){
	
	var cid=$(obj).parents('.tr_1').children().eq(0).text();
	var status=$(obj).parents('.tr_1').children().eq(9).text();
	if(status=='审核通过'){
		alert("已通过，无需再次审核！")	
	}else {
		$.post("acaadmin/agreeApply",{"cid":cid},function(data){
			if(data){
				alert("审核通过...")	
				window.location.href="page/acaApply.jsp"
			}		
		},"json")
	}
	
	
	
}

function disagreeApply(obj){
	var cid=$(obj).parents('.tr_1').children().eq(0).text();
	var status=$(obj).parents('.tr_1').children().eq(9).text();
	var uname=$(obj).parents('.tr_1').children().eq(1).text();
	if(status=='审核通过'){
		alert("已通过，无需再次审核！")	
	}else {
			 
			 $('#notThrowLogModal').modal();
			 $("#cid_1").text(cid);
			 $("#uname").text(uname);
	
	}
	
}



$("#btn_submit").click(function(){
	var cid= $("#cid_1").text();
	var nocontent =[]; 
	$('input[name="cause"]:checked').each(function(){ 
		nocontent.push($(this).val()); 
	}); 
	//alert(chk_value.length==0 ?'你还没有选择任何内容！':chk_value); 
	
		nocontent.push($("#remarks").val());
	var content="";	
	for(var i=0;i<nocontent.length;i++){
		content+=nocontent[i]+";";
	}
	alert(content.length)
	if(content.length>1){
		$.post("acaadmin/addNPLog",{"nocontent":content,"cid":cid},function(data){
			if(data){
				disagreeApply_1(cid);
			}
		},"json")
	}else{
		alert("你还没有选择任何原因，请重新选择...")
	}
})
	
function disagreeApply_1(cid){
	$.post("acaadmin/disagreeApply",{"cid":cid},function(data){
		
		if(data){
			alert("操作成功，可在未通过栏查看学生信息")
			
			findappmsg();
			window.location.href="page/acaApply.jsp"
			//$('#sample_editable_1').bootstrapTable('refresh');
		}
		
	});
		
}


