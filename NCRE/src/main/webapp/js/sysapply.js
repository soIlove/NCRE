function doAgree(obj){
	var acid = $(obj).parent().parent().children().html().trim();
	$.get("sysadmin/agree?acid="+acid,function(data){
		if(data){
			location.href="/NCRE/sysadmin/findapply";
		}
	})
}

function doDisagree(obj){
	var acid = $(obj).parent().parent().children().html().trim();
	$.get("sysadmin/disagree?acid="+acid,function(data){
		if(data){
			location.href="/NCRE/sysadmin/findapply";
		}
	})
}

function exprotbaoMsg(){
	$.get("sysadmin/exportbaoMsg",function(data){
		alert("导出成功,位置为:D:/湖南工学院报考统计表.xls");
	})
}