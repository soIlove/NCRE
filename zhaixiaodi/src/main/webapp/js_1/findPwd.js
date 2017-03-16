$("input[name='username']").blur(function(){
	$("#IDErrer").remove();
	var tel=$("input[name='username']").val();
	 if(tel==""){
		 return;
	 }
	 
	tel={"tel":tel};
	$.post("zxd/check",tel,function(data){
		if(!data){
			if($("#IDErrer") != null){
				$("input[name='username']").after("<lable  id='IDErrer' style='color: red'  >账号不存在</lable>");
			}
		} 
	},"json");                                                                                                                                               
});

 function verify(){
	 var result=false;
	var code=$("input[name='randomCode']").val();
	if(code==""){
		alert("验证码不能为空!");
		 return false;
	}
	var tel=$("input[name='username']").val();
	if(tel=="" || $("#IDErrer").text().length >0 ){
		alert("用户名/手机 不能为空!"+$("#IDErrer"));
		 return;
	}
	code={"code":code};
	$.post("zxd/verifyCode",code,function(data){
		if(data){
			var username=$("input[name='username']").val();
			window.location.href="htm/findPwd2.html?username="+username;
		}else{
			alert("验证码错误!");
			 
		}
	},"json");     
	 return result;
} 