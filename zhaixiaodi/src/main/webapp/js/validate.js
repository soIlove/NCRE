/**
 * Validate Tony 2012-02-17
 */

// ===================================
// 功能：验证字段是否为空
// 参数：o---要验证的对象ID；s---要验证的对象名称
// ===================================
function checkNull(o) {
	if ($("#" + o).val() == "") {
		return false;
	} else {
		return true;
	}
}

// ===================================
// 功能： 验证两个字段的值是否相等
// 参数：o1---要验证的对象1的ID；o2---要验证的对象2的ID；
// s1---要验证的对象1的名称；s2---要验证的对象2的名称
// ===================================
function compare(o1, o2) {
	if ($("#" + o2).val() != $("#" + o1).val()) {
		return false;
	} else {
		return true;
	}
}

// ===================================
// 功能： 验证Email格式是否正确
// 参数：o---要验证的对象ID
// ===================================
function checkEmail(o) {
	var isEmail = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if (!isEmail.test($("#" + o).val())) {
		return false;
	} else {
		return true;
	}
}

// ===================================
// 功能： 验证手机号码格式是否正确
// 参数：o---要验证的对象ID
// ===================================
function checkPhone(o) {
	var isPhone = /^1[3|4|5|8][0-9]\d{8}$/;
	if (!isPhone.test($("#" + o).val())) {
		return false;
	} else {
		return true;
	}
}

// ===================================
// 功能： 验证输入是否是汉字
// 参数：id---要验证的对象ID
// ===================================
function checkCN(id) {
	var rule = /[\u4e00-\u9fa5]/g;
	if (rule.test($("#" + id + "").val())) {
		return true;
	} else {
		return false;
	}
}

// ===================================
// 功能： 验证输入是否是数字
// 参数：id---要验证的对象ID
// ===================================
function checkIsNumber(id) {
	var rule = /^[0-9]+(.[0-9]{1,2})?$/;
	if (rule.test($("#" + id + "").val().trim())) {
		return true;
	} else {
		return false;
	}
}

/**
 * 限制输入框只能输入数字
 * @param inputId
 */
function OnlyEnterNum(inputId) {
	$("#" +inputId).keydown(function(e) {
		var k = window.event ? e.keyCode : e.which;
		if (((k >= 48) && (k <= 57)) || k == 8 || k == 0 || (k >= 96 && k <= 105) || k == 13) {
		} else {
			if (window.event) {
				window.event.returnValue = false;
			} else {
				e.preventDefault();//for firefox
			}
		}
	});
	
	$("#" +inputId).keypress(function(e) {
		var code; 
		   if (document.all) { //判断是否是IE浏览器
		    code = window.event.keyCode; 
		   } else { 
		    code = arguments.callee.caller.arguments[0].which; 
		   } 
		   var character = String.fromCharCode(code);
		   var txt=new RegExp("[ ,\\`,\\~,\\!,\\@,\#,\\$,\\%,\\^,\\+,\\*,\\&,\\\\,\\/,\\?,\\|,\\:,\\.,\\<,\\>,\\{,\\},\\(,\\),\\'',\\;,\\=,\"]"); 
		   //特殊字符正则表达式 
		   if (txt.test(character)) {
		    if (document.all) { 
		     window.event.returnValue = false; 
		    } else { 
		     arguments.callee.caller.arguments[0].preventDefault(); 
		    } 
		   }
	});
}

/**
 * 仅校验纯数字，不包含浮点数
 * 
 * @param str
 * @returns {Boolean}
 */
function isNumber(str) {
	str = str.replace(/^(\s+)/, "");
	str = str.replace(/(\s+)$/, "");
	if (str.length == 0)
		return false;

	var strDigital;
	var i;
	strDigital = "0123456789";
	for ( var i = 0; i < str.length; i++) {
		if (strDigital.indexOf(str.substring(i, i + 1)) < 0)
			return false;
	}
	return true;
}

/**
 * 校验身份证 15位或者18位
 * 
 * @param {Object}
 *            StrNo
 */
function isChinaIDCard(StrNo) {
	StrNo = StrNo.toString();
	if (StrNo.length == 18) {
		var a, b, c;
		if (!isInteger(StrNo.substr(0, 17))) {
			return false;
		}
		a = parseInt(StrNo.substr(0, 1)) * 7 + parseInt(StrNo.substr(1, 1)) * 9
				+ parseInt(StrNo.substr(2, 1)) * 10;
		a = a + parseInt(StrNo.substr(3, 1)) * 5 + parseInt(StrNo.substr(4, 1))
				* 8 + parseInt(StrNo.substr(5, 1)) * 4;
		a = a + parseInt(StrNo.substr(6, 1)) * 2 + parseInt(StrNo.substr(7, 1))
				* 1 + parseInt(StrNo.substr(8, 1)) * 6;
		a = a + parseInt(StrNo.substr(9, 1)) * 3
				+ parseInt(StrNo.substr(10, 1)) * 7
				+ parseInt(StrNo.substr(11, 1)) * 9;
		a = a + parseInt(StrNo.substr(12, 1)) * 10
				+ parseInt(StrNo.substr(13, 1)) * 5
				+ parseInt(StrNo.substr(14, 1)) * 8;
		a = a + parseInt(StrNo.substr(15, 1)) * 4
				+ parseInt(StrNo.substr(16, 1)) * 2;
		b = a % 11;
		if (b == 2) {
			c = StrNo.substr(17, 1).toUpperCase();// 转为大写X
		} else {
			c = parseInt(StrNo.substr(17, 1));
		}
		switch (b) {
		case 0:
			if (c != 1) {
				return false;
			}
			break;
		case 1:
			if (c != 0) {
				return false;
			}
			break;
		case 2:
			if (c != "X") {
				return false;
			}
			break;
		case 3:
			if (c != 9) {
				return false;
			}
			break;
		case 4:
			if (c != 8) {
				return false;
			}
			break;
		case 5:
			if (c != 7) {
				return false;
			}
			break;
		case 6:
			if (c != 6) {
				return false;
			}
			break;
		case 7:
			if (c != 5) {
				return false;
			}
			break;
		case 8:
			if (c != 4) {
				return false;
			}
			break;
		case 9:
			if (c != 3) {
				return false;
			}
			break;
		case 10:
			if (c != 2) {
				return false;
			}
		}
	} else {
		if (!isInteger(StrNo)) {
			return false;
		}
	}
	switch (StrNo.length) {
	case 15:
		if (isValidDate("19" + StrNo.substr(6, 2), StrNo.substr(8, 2), StrNo
				.substr(10, 2))) {
			return true;
		} else {
			return false;
		}
	case 18:
		if (isValidDate(StrNo.substr(6, 4), StrNo.substr(10, 2), StrNo.substr(
				12, 2))) {
			return true;
		} else {
			return false;
		}
	}
	return false;
}

function isInteger(str) {
	if (/[^\d]+$/.test(str)) {
		return false;
	}
	return true;
}

function isValidDate(iY, iM, iD) {
	var a = new Date(iY, iM, iD);
	var y = a.getFullYear();
	var m = a.getMonth();
	var d = a.getDate();
	if (y != iY || m != iM || d != iD) {
		return false;
	}
	return true;
}

/**
 * 校验邮箱格式
 * 
 * @param email
 * @returns {Boolean}
 */
function isEmail(email) {
	var srt = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	if (srt.test(email)) {
		return true;
	} else {
		return false;
	}
}

/**
 * 校验邮政编码
 * 
 * @param post
 * @returns {Boolean}
 */
function isPostalCode(post) {
	var srt = /^[0-9]{6}$/;
	if (srt.test(post)) {
		return true;
	} else {
		return false;
	}
}

/**
 * 检验数字和字母（包含大小写）
 * 
 * @param value
 * @returns {Boolean}
 */
function checkNumAndChar(value) {
	var re = /^[a-zA-Z0-9]{0,}$/;
	if (re.test(value)) {
		return true;
	}
	return false;
}

/**
 * 限制输入框只能输入数字
 * @param inputId
 */
function OnlyEnterNumAndChar(inputId) {
	
}
