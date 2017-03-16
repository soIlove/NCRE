$(document).ready(function(){
	var tel= GetQueryString("username") ;
	
	if(tel == null){
		window.location.href="htm/findPwd.html";
	}
	$("#tel").val(tel);
	tel={"tel":tel};
	$.post("zxd/getMail",tel,function(data){
		if(data != null){
			$("#mail").val(data);
			$(".red").html(data);
			//进入页面后自动发送邮件,获取验证码
			sendMail(data);
		} 
	},"json");   
});

function sendMail(   email ){
	email={"email":email};
	alert("验证码正在前往邮箱!!!!请耐心等候");
	$.post("zxd/sendMail",email,function(data){
		if(data){
			alert("邮件发送成功,请注意查收!!!");
		}else{
			alert("邮件发送失败!!");
			
		}
	},"json");   
}

function GetQueryString(name){
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if(r!=null)return unescape(r[2]); return null;
}


function verify(){
	var code=$("input[name='randomCode']").val();
	if(code==""){
		 return false;
	}
	code={"code":code};
	var result=false;
	$.post("zxd/verifyCode",code,function(data){
		if(data){
			result= true;
			var tel= GetQueryString("username") ;
			window.location.href="htm/findPwd3.html?tel="+tel;
		}else{
			alert("验证码错误!");
		}
	},"json"); 
	return result;
} 





