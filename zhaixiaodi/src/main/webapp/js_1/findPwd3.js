$(document).ready(function() {
	var tel = GetQueryString("tel");
	if (tel == null) {
		window.location.href = "htm/findPwd.html";
	}
	$("#tel").val(tel);
});
function GetQueryString(name){
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if(r!=null)return unescape(r[2]); return null;
}

function verify() {
	var code = $("input[name='randomCode']").val();
	if (code == "") {
		return false;
	}
	code = {"code" : code};
	var result = false;
	$.post("zxd/verifyCode", code, function(data) {
		if (data) {
			var username = $("input[name='username']").val();
			window.location.href = "htm/findPwd2.html?username=" + username;
		} else {
			alert("验证码错误!");
		}
	}, "json");
	return result;
}

function check() {
	var password = $("#password").val();
	var reg = /^\w{3,16}$/ig;
	if (!reg.test(password)) {
		$("#pwd_span").text("密码必须由3-16位的数字字母下划线组成");
	} else {
		$("#pwd_span").text("");
	}
}

function confirm() {
	if ($("#confirmpassword").val() != $("#password").val()) {
		$("#repwd_span").text("两次密码不一致!");
	} else {
		$("#repwd_span").text("");
	}
}

function confirmCode() {
	var code = $("input[name='randomCode']").val();
	if (code == "") {
		return false;
	}
	var result = false;
	if(code.length <= 4){
		code = {"code" : code};
		$.post("zxd/verifyCode", code, function(data) {
			if (data) {
				$("#code").text("");
				result = true;
			}else{
				$("#code").text("验证码错误!");
			}
		}, "json");
	}
	
	return result;
}

function editPwd() {
	var result = false;
	check();// 检查验证
	confirm();// 检查两次密码
	if ($("#repwd_span").text().length<=1 && $("#pwd_span").text().length<=1
			&& $("#code").text().length<=1) {// 校验验证码
		result = true;
	}
	var password = $("#confirmpassword").val();
	var username = $("#username").val();
	password = {
		"password" : password
	};
	 
	return result;
}
