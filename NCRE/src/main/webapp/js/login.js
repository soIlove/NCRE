$("#loginBtn").click(function(){
	var sxid=$("#sxid").val();
	var spwd=$("#spwd").val();
	var vcode=$("#vcode").val();
	if(sxid!=""&spwd!=""){
		$.get("user/login?sxid="+sxid+"&spwd="+spwd+"&vcode="+vcode,function(data){
			if(data){
				location.href="/NCRE/index.jsp";
			}else{
				alert("用户名或密码不正确");
				location.href="/NCRE/page/login.jsp";
			}
		})
	}
});

$("#forgetBtn").click(function(){
	var user=$("#getEmail").val();
	var email=$("#email").val();
	if(user!=""&&email!=""){
		$.get("user/forget?sxid="+user+"&semail="+email,function(data){
			if(data){
				alert("邮件发送成功！");
			}else{
				alert("邮件发送失败！");
			}
		})
	}
});

$("#getEmail").blur(function(){
	var account=$("#getEmail").val();
	if(account!=null&&account!=""){
		$.get("user/getEmail?sxid="+account,function(data){
			var emailreg =/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/; 
			if(emailreg.test(data)){
				$("#email").val(data);
			}else{
				alert("账号不存在");
			}
		})
	}
});
$("#userLogin p img").click(function(){
	$(this).attr("src", "vcode.jpg?" + new  Date().getTime());
});

$(function(){
	
	$.get("user/getAcademy",function(data){
		var str="";
		for(var i=0;i<data.length;i++){
			str+="<option>"+data[i].aname+"</option>";
		}
		$("#academy").append(str);
	})
});

$("#academy").change(function(){
	var academy=$("#academy option:selected").val();
	$("#classes").html("<option disabled='disabled' selected='selected'>所在班级</option>");
	$.get("user/getClasses?academy="+academy,function(data){
		var str="";
		for(var i=0;i<data.length;i++){
			str+="<option>"+data[i].cname+"</option>";
		}
		$("#classes").append(str);
	})
});

$("#register").click(function(){
	$.post("user/register",{sname:$("#sname").val(),spwd:$("#register_password").val(),semail:$("#semail").val(),
		sacademy:$("#academy option:selected").val(),sclass:$("#classes option:selected").val()},function(data){
		if(data!=null){
			alert("注册成功！您的账号为"+data+"请妥善保管！")
			jQuery('.login-form').show();
            jQuery('.register-form').hide();
            $("#sxid").val(data);
		}else{
			alert("注册失败！")
		}
		
	})
});