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