var login = {
	globalTimer : 0,
	callBack : null,
	pwdToken : "shouhuobao",
	globalIndex : 0,
	interval:null,
	_d : '',
	_count : 0,
	_visitCount : 0,
	init : function() {
		$("#j_password").keypress(function(e) {
			var theEvent = e || window.event;
			var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
			if (code == 13) {
				$("#btnSubmit").click();
				return false;
			}
			return true;
		});
	},

	login : function() {
		
		delMerchantCookie();
		
		if ($.trim($("#j_username").val()) == "") {
			alert("请输入登录名");
			$("#j_username").focus();
			return false;
		}
		if ($.trim($("#j_password").val()) == "") {
			alert("请输入密码");
			$("#j_password").focus();
			return false;
		}

		var expires = new Date();
		expires.setTime(expires.getTime() + 24 * 90 * 60 * 60 * 1000);
	//	if ($("#remember").attr("checked") != "checked") {
			var enPswd = CryptoJS.TripleDES.encrypt($("#j_password").val(),
					login.pwdToken);

			setCookie("shb_username", $("#j_username").val(), expires, app.ctx);
			setCookie("shb_password", enPswd, expires, app.ctx);
			setCookie("isRememberMe", "true", expires, app.ctx);
		//} else {
		//	setCookie("shb_username", "", expires, app.ctx);
		//	setCookie("shb_password", "", expires, app.ctx);
	//	setCookie("isRememberMe", "false", expires, app.ctx);
		//}
		ajax.ajaxForm('loginForm', login.loginCallback);
	},

	logout : function() {
		var expires = new Date();
		expires.setTime(expires.getTime() + 24 * 90 * 60 * 60 * 1000);
		setCookie("isRememberMe", "true", expires, app.ctx);
		window.location.href = app.ctx + "/account/logout.html";
	},

	loginCallback : function(transport) {
		
		var _backData = jQuery.parseJSON(transport);
		
		if (_backData.resCode == 0) {
			deleteCookie("isClosedTemp", app.ctx);
			loginUser._loginState = true;
			loginUser._globalLoginUser = _backData;
			if (login.callBack != undefined
					&& typeof (login.callBack) == "function") {
				var callbacks = jQuery.Callbacks();
				callbacks.add(login.callBack);
				callbacks.fire();
			}
			
			if (_backData.type == 5) {
				// 超级店老大
				window.location.href = app.ctx
						+ '/superadmin/parcel/parcel-center.html';
			} else {
				if(_backData.showWhich == 0) {
					if(getCookie("isFirstLogin")){
						window.location.href = app.ctx + '/home/home-center.html';
					}else{
						window.location.href = "chargeNotice.jsp";
					}				}else if(_backData.showWhich == 1) {
					window.location.href = app.ctx + '/receive/receive-center.html';
				}else if(_backData.showWhich == 2) {
					window.location.href = app.ctx + '/post/post-center.html';
				}else if(_backData.showWhich == 3) {
					window.location.href = app.ctx + '/presell/presell-center.html';
				}else if(_backData.showWhich == 4) {
					window.location.href = app.ctx + '/convenience/convenience-center.html';
				}else if(_backData.showWhich == 5) {
					window.location.href = app.ctx + '/shopapp/shopapp-center.html';
				}else if(_backData.showWhich == 6) {
					window.location.href = app.ctx + '/vendor/management-center.html';
				}else if(_backData.showWhich == 7) {
					window.location.href = app.ctx + '/help/help-center.html';	
				}else if(_backData.showWhich == 8) {
					window.location.href = app.ctx + '/member/member-center.html';	
				}else {
					window.location.href = app.ctx + '/receive/receive-center.html';
				}
			}
		} else {
			alert(_backData.resDesc);
			return;
		}
	},
	showPhoneDownload : function() {
		$("#userPointPhone").val("");
		$("#sendTips").hide();
		popupDialog("mobileDownloadWindow");
		$("#userPointPhone").val($("#merchantPhoneHidden").val());
	},
	sendDownloadHref : function(type) {
		var isPhone = /^1[3|4|5|8][0-9]\d{4,8}$/;
		var phoneVal  = $("#userPointPhone").val();
		if(type == 2){
			phoneVal =  $("#userPointPhone2").val();
		}
		if (!isPhone.test(phoneVal)) {
			if(type == 2) {
				$("#sendTips2").show();
				$("#sendTips2").html("手机号验证错误");
				return false;
			}else {
				$("#sendTips").show();
				$("#sendTips").html("手机号验证错误");
				return false;
			}
		}
		var sended = getCookie("homepage-sended2");
		if(sended == phoneVal.trim()) {
			if(type==2) {
				$("#sendTips2").show();
				$("#sendTips2").html("已发送，不可重复发送，每天3次。");
				return false;
			}else {
				$("#sendTips").show();
				$("#sendTips").html("已发送，不可重复发送，每天3次。");
				return false;
			}
		}
		ajax.ajax({
			type : "POST",
			url : app.ctx + "/member/send-download-href.an",
			data : "sendPhone=" + phoneVal.trim(),
			success : function(msg) {
				$("#subSuccess").attr("disabled", false);
				if (msg == "0") {
					var expires = new Date();
					expires.setTime(expires.getTime() + 24 * 60 * 60 * 1000);
					setCookie("homepage-sended"+login.globalIndex, phoneVal.trim(), expires, app.ctx);
					login.globalIndex++;
					if(type==2) {
						$("#sendTips2").show();
						$("#sendTips2").html("已发送成功，请注意查收");
						return false;
					}else {
						$("#sendTips").show();
						$("#sendTips").html("已发送成功，请注意查收");
						return false;
					}
				} else {
					if(type==2) {
						$("#sendTips2").show();
						$("#sendTips2").html("已发送，不可重复发送，每天3次。");
						return false;
					}else {
						$("#sendTips").show();
						$("#sendTips").html("已发送，不可重复发送，每天3次。");
						return false;
					}
				}
			}
		});
	},
	showAmount:function() {
		$("#hideAmount").show();
		$("#showAmount").hide();
	},
	hideAmount: function() {
		$("#hideAmount").hide();
		$("#showAmount").show();
	},
	scanLoginOn:function(){
		login._count = login._count+1;
		if(login._count%2==0){
			login._visitCount = 0;
			window.clearInterval(login.interval);
			$("#scanLoginArea").hide();
			$("#formLogin").show();
		}else{
			var rstr = login.generateMixed(10);
			login._d = new Date().getTime()+rstr;
			$("#formLogin").hide();
			$("#scanLoginArea").show();
			$("#qcodeArea").html("");
			jQuery('#qcodeArea').qrcode({
				render	: "canvas",
				text	: ""+login._d,
				width:220,
				height:220
			});	
			login.interval = window.setInterval("login.loginInterval('"+login._d+"')",5000);
		}
	},
	scanLoginRemove:function(){
		login._count = 0;
		login._visitCount = 0;
		window.clearInterval(login.interval);
		$("#scanLoginArea").hide();
		$("#formLogin").show();
	},
	loginInterval : function(val){
		login._visitCount = login._visitCount+1;
		if(login._visitCount>15){
			login._count = 0;
			login._visitCount = 0;
			window.clearInterval(login.interval);
			$("#scanLoginArea").hide();
			$("#formLogin").show();
		}else{
			ajax.ajax({
				type : "POST",
				url : app.ctx + "/qcode-login.an",
				data : "qcode=" + val,
				success : function(msg) {
					if(msg!='fail'){
						$("#j_username").val(msg.split(";")[0]);
						$("#j_password").val(msg.split(";")[1]);
						ajax.ajaxForm('loginForm', login.loginCallback);
					}
				}
			});
		}
	},
	generateMixed : function(n){
		var chars = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
		var res = "";
	     for(var i = 0; i < n ; i ++) {
	         var id = Math.ceil(Math.random()*35);
	         res += chars[id];
	     }
	     return res;
	}
};

$(document).ready(login.init);