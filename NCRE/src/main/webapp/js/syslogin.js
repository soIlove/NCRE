$("#syslogin").click(function(){
	var syname=$("#name").val();
	var sypwd=$("#pwd").val();
	if(syname!=""&sypwd!=""){
		$.get("sysadmin/login?syname="+syname+"&sypwd="+sypwd,function(data){
			if(data){
				location.href="/NCRE/page/sysmanage.jsp";
			}else{
				alert("用户名或密码不正确");
				location.href="/NCRE/page/syslogin.jsp";
			}
		})
	}
})