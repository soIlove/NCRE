var loginUser = {
	_globalLoginUser : '',
	_loginState : false,
	location : '110100',
	getUserId : function() {
		return this._globalLoginUser.id;
	},
	getLoginName : function() {
		return this._globalLoginUser.username;
	},
	getUserName : function() {
		return this._globalLoginUser.realName;
	},
	getType : function() {
		return this._globalLoginUser.type;
	},
	getLocation : function() {
		return this.location;
	},
	isLogin : function() {
		return this._loginState;
	}
};

function delMerchantCookie(){
	
	deleteCookie("IESESSION", "/", "shouhuobao.com");
	deleteCookie("IESESSION", "/merchant/", "shouhuobao.com");
	deleteCookie("JSESSIONID", "/", "shouhuobao.com");
	deleteCookie("JSESSIONID", "/merchant/", "shouhuobao.com");
	deleteCookie("IESESSION", "/", "www.shouhuobao.com");
	deleteCookie("IESESSION", "/merchant/", "www.shouhuobao.com");
	deleteCookie("JSESSIONID", "/", "www.shouhuobao.com");
	deleteCookie("JSESSIONID", "/merchant/", "www.shouhuobao.com");

}

var sqs = {
	b_version : "",

	testBrowser : function(code) {
		sqs.userBrowser();

		$.get("http://112.125.20.238:1218", {
			name : "BrowserQ",
			opt : "put",
			data : "pointId:" + code + "---->" + sqs.b_version,
			auth : "cp_mq_118"
		});
	},

	userBrowser : function() {
		var browserName = navigator.userAgent.toLowerCase();
		if (/msie/i.test(browserName) && !/opera/.test(browserName)) {
			sqs.b_version = "IE";
			return;
		} else if (/firefox/i.test(browserName)) {
			sqs.b_version = "Firefox";
			return;
		} else if (/chrome/i.test(browserName) && /webkit/i.test(browserName)
				&& /mozilla/i.test(browserName)) {
			sqs.b_version = "Chrome";
			return;
		} else if (/opera/i.test(browserName)) {
			sqs.b_version = "Opera";
			return;
		} else if (/webkit/i.test(browserName)
				&& !(/chrome/i.test(browserName) && /webkit/i.test(browserName) && /mozilla/i
						.test(browserName))) {
			sqs.b_version = "Safari";
			return;
		} else {
			sqs.b_version = "unKnow";
		}
	}
};

var app = {
	staticUrlPrefix : 'http://static1.shouhuobao.com/merchant',
	sendStatus : false,
	sendSfCode : '',
	init : function() {

		String.prototype.len = function() {
			return this.replace(/[^\x00-\xff]/g, "**").length;
		};

		$(".wb_o_btn").click(function() {
			$("#wb_open").hide();
		});

		$(".wb_c_btn").click(function() {
			$("#wb_open").show();
		});

		delMerchantCookie();
		if (!loginUser.isLogin()) {
			// 判断是否要自动登录
			if (getCookie("isRememberMe") == "true") {
				$("#j_username").val(getCookie("shb_username"));
				$("#j_password").focus();
				var decrypted = CryptoJS.TripleDES.decrypt(
						getCookie("shb_password"), login.pwdToken);
				var decPswd = decrypted.toString(CryptoJS.enc.Utf8);
				$("#j_password").val(decPswd);
				
			//	ajax.ajaxForm('loginForm', login.loginCallback);
			}
		} else {
			window.location.href = app.ctx + "/receive/receive-center.html";
		}

	},

	loadMerchantInfo : function(receivePointId) {
		// 加载代收点Top详细信息
		if (!loginUser.isLogin()) {
			ajax.ajaxPostRequest(app.ctx
					+ '/vendor/getMerchantData.an?receivePointId='
					+ receivePointId, null, function(data) {
				var json = eval('(' + data + ')');
				if (json.res) {
					var times = 0;
					app.scrollData(times);
					if (json.isOperator) {
						$("#headerbalance").hide();
					} else {
						$("#headerbalance").show();
					}
					$("#h_userId").val(json.userId);
					$("#_merchantName").html(json.merchantName);
					$("#_merchantRank").html("" + json.accounAmt + "元");
					$("#_merchantRemark").html("" + json.remark + "条");
//					$("#_merchantCoin").html("" + json.coinAmt + "枚");
//					$("#countSms").html(json.taskSize);
					$("#merchantPhoneHidden").val(json.merchantPhone);

					if (json.merchantTmalName.length != 0) {
						$("#_merchantTmalName").html(
								" | " + json.merchantTmalName);
					}
					app.sendStatus = json.sendStatus;
					app.sendSfCode = json.sendSfCode;

					// sqs.testBrowser(receivePointId);

					$("#currentSFCode").html(app.sendSfCode);
					if (!app.sendStatus) {
						/*
						 * $(".subnav li").removeClass("active");
						 * $("#point_send_link").parent().addClass("active");
						 * $("#parentMt").empty().append("<div
						 * class='noSendService'></div>");
						 * $("#point_send_link") .attr("href",
						 * "javascript:void(0)");
						 * $("#point_send_link").click(function() { $(".subnav
						 * li").removeClass("active");
						 * $(this).parent().addClass("active");
						 * $("#parentMt").empty().append("<div
						 * class='noSendService'></div>"); //
						 * $('#sendStatusLayer').modal({ // backdrop : true, //
						 * keyboard : true, // show : true // }); });
						 */
					}
				}
			});
		}
	},
	myScroll : null,
	scrollData : function(times) {
		/*
		ajax.pageLoadCallBack(app.ctx + "/news/push-task-list.an", {
							"msgType" : "4",
							"isRead" : "1"
						}, "pushMsgDiv", 
						function() {
							var startIndex = 0;
							var maxIndex = $("#pushMsgDiv").find("div").length - 1;
							var index = startIndex;
							$("#countSms").html(maxIndex + 1);
							// 如果当前下标大于最大下标，则把当前下标从新指向开始下标
							if (maxIndex < 0) {
								$("#wx_smsTips").show();
								$("#header_sms").hide();
								return false;
							}else {
								$("#header_sms").show();
								$("#wx_smsTips").hide();
								$("#sms_user_content").attr("data-id",
										$("#div0").attr("data-id"));
								app.parmsContent("div0");
								app.setMoreItem(0);
							}
							var intFunc = function() {
								if (index > maxIndex) {
									index = startIndex;
								}
								times++;
								if (times == 30) {
									times = 0;
									window.clearInterval(app.myScroll);
									app.scrollData(times);
									return;
								}
								$("#header_sms").show();
								$("#wx_smsTips").hide();
								$("#sms_user_content").attr("data-id",
										$("#div" + index).attr("data-id"));
								app.setMoreItem(index);
								app.parmsContent("div" + index++);
							};
							app.myScroll = setInterval(intFunc, 5000);

							var clickIs = "false";
							$("#closeMsg,#header_sms")
									.click(
											function(event) {
												event.stopPropagation();
												clickIs = "true";
												window
														.clearInterval(app.myScroll);
												$("#header_sms").hide();
												$("#wx_smsTips").show();
												var taskId = $(
														"#sms_user_content")
														.attr("data-id");
												$
														.ajax({
															type : "POST",
															data : "taskId="
																	+ taskId,
															url : app.ctx
																	+ "/news/set-task-readed.an",
															success : function(
																	data) {
																var json = eval('('
																		+ data
																		+ ')');
																if (data != "error") {
																	$(
																			"#countSms")
																			.html(
																					json.params1);
																	if ($(
																			"#account_num")
																			.attr(
																					"id")) {
																		$(
																				"#account_num")
																				.html(
																						"账户提现通知("
																								+ json.params3
																								+ ")");
																	}
																	if ($("#phone_num").attr("id")) {
																			$("#phone_num").html("手机取货通知("+ json.params2+ ")");
																	}
																	
																	if ($("#shop_num").attr("id")) {
																		$("#shop_num").html("微店订单消息("+ json.params4+ ")");
																}
																}
															}
														});
											});

							$("#header_sms").mouseenter(function(event) {
								event.stopPropagation();
								window.clearInterval(app.myScroll);
								return;
							}).mouseleave(function(event) {
								event.stopPropagation();
								if (clickIs == "true") {
									return;
								} else {
									window.clearInterval(app.myScroll);
									app.myScroll = setInterval(intFunc, 5000);
								}
							});
						});
		*/
	},
	parmsContent : function(id) {
		var msgcontent  = $("#" + id).html();
		var msglength = msgcontent.length;
		if(msglength > 100 ) {
			msgcontent = msgcontent.substring(0,100) + "……";
		}else if (msglength > 0) {
			msgcontent = msgcontent.substring(0,msglength);
		}
		$("#sms_user_content").html(msgcontent);
	},
	/**
	 * 按需加载脚本或者样式文件，type标识加载类型，css或者js, url标识待加载资源的url
	 * 
	 * @param {Object}
	 *            type
	 * @param {Object}
	 *            url
	 */
	lazyLoad : function(type, position, url, callFunction) {

		if (typeof type == 'undefined') {
			return;
		}
		if (typeof url == 'undefined') {
			return;
		}
		if ($.trim(type).length == 0) {
			return;
		}
		if ($.trim(url).length == 0) {
			return;
		}
		if (type != 'css' && type != 'js') {
			return;
		}
		if (type == 'js') {
			$.getScript(url, function(transport) {
				eval(transport);
				if (callFunction != undefined
						&& typeof (callFunction) == "function") {
					var callbacks = jQuery.Callbacks();
					callbacks.add(callFunction);
					callbacks.fire();
				}
			});

		}

		if (type == 'extjs') {
			var _script = document.createElement('script');
			_script.type = 'text/javascript';
			_script.src = url;
			if (position == 'body') {
				document.getElementsByTagName('body')[0].appendChild(_script);
			}
			if (position == 'head') {
				document.getElementsByTagName('head')[0].appendChild(_script);
			}
		}

		if (type == 'css') {
			var _link = document.createElement('link');
			_link.rel = 'stylesheet';
			_link.type = 'text/css';
			_link.href = url;
			document.getElementsByTagName('head')[0].appendChild(_link);
		}
	},

	refreshValidate : function(obj) {
		if (app.validateNum > 20) {
			$("#" + obj).attr("src", "../validateImg.jpg");
		} else {
			app.validateNum++;
			$("#" + obj).attr("src", "../validateImg.jpg?" + Math.random());
		}
	},
	setMoreItem : function(index) {
		var msgHrefs = $("#more_msg").attr("href").split("?");
		var msgHref = msgHrefs[0];
		var msgType = $("#div" + index).attr("data-name");
		var readId = $("#div" + index).attr("data-id");
		var item;
		if (msgType == "5" || msgType == "05" || msgType == "4"
				|| msgType == "04") {
			item = "1";
		} else if (msgType == "06" || msgType == "6") {
			item = "2";
		}else if (msgType == "11" ) {
			item = "4";
		}
		// $("#header_sms").attr("onclick","window.location.href='/merchant/system/notice-center.html?item="+item+"&item2="+readId+"'");
		$("#more_msg").attr("href",
				msgHref + "?item=" + item + "&item2=" + readId);
	}
};

$(document).ready(app.init);