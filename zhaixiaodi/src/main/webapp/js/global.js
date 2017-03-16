/**
 *该JS定义通用函数，供系统使用
 *部分函数依赖jQuery,使用时注意
 */
/**
 * IE下显示png24透明图片
 */
function fixpng24() {
	var arVersion = navigator.appVersion.split("MSIE");
	var version = parseFloat(arVersion[1]);
	if ((version >= 5.5) && (document.body.filters)) {
		for ( var i = 0; i < document.images.length; i++) {
			var img = document.images[i];
			var imgName = img.src.toUpperCase();
			if (imgName.substring(imgName.length - 3, imgName.length) == "PNG") {
				var imgID = (img.id) ? "id='" + img.id + "' " : "";
				var imgClass = (img.className) ? "class='" + img.className
						+ "' " : "";
				var imgTitle = (img.title) ? "title='" + img.title + "' "
						: "title='" + img.alt + "' ";
				var imgStyle = "display:inline-block;" + img.style.cssText;
				if (img.align == "left")
					imgStyle = "float:left;" + imgStyle;
				if (img.align == "right")
					imgStyle = "float:right;" + imgStyle;
				if (img.parentElement.href)
					imgStyle = "cursor:hand;" + imgStyle;
				var strNewHTML = "<span "
						+ imgID
						+ imgClass
						+ imgTitle
						+ " style=\""
						+ "width:"
						+ img.width
						+ "px; height:"
						+ img.height
						+ "px;"
						+ imgStyle
						+ "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
						+ "(src=\'" + img.src
						+ "\', sizingMethod='scale');\"></span>"
				img.outerHTML = strNewHTML;
				i = i - 1;
			}
		}
	}
}

/* This function is used to change the style class of an element */
function isUndefined(value) {
	var undef;
	return value == undef;
}

/**
 * Check if any checkbox is checked, otherwise open message box.
 * 
 * @param parentId
 * @param msg
 * @returns {Boolean}
 */
function isSelected(parentId, msg) {
	var checked = false;
	$("#" + parentId + " :checkbox").each(function(index, domEle) {
		if ($(domEle).attr('checked')) {
			checked = true;
			return;
		}
	});
	if (!checked) {
		alert(msg);
	}
	return checked;
}

/**
 * Select all checkbox.
 * 
 * @param parentId
 * @param triggerId
 */
function jqSelectAll(parentId, triggerId) {
	$("#" + parentId + " :checkbox").attr('checked',
			$('#' + triggerId).is(':checked'));
}

/* Function to clear a form of all it's values */
function clearForm(formId) {
	var frmObj = document.getElementById(formId);
	for ( var i = 0; i < frmObj.length; i++) {
		var element = frmObj.elements[i];
		if (element.type.indexOf("text") == 0
				|| element.type.indexOf("password") == 0) {
			element.value = "";
		} else if (element.type.indexOf("radio") == 0) {
			element.checked = element.value == '';
		} else if (element.type.indexOf("checkbox") == 0) {
			element.checked = false;
		} else if (element.type.indexOf("select") == 0) {
			for ( var j = 0; j < element.length; j++) {
				element.options[j].selected = false;
			}
			element.options[0].selected = true;
		}
	}
}

/* Function to get a form's values in a string */
function getFormAsString(frmObj) {
	var query = "";
	for ( var i = 0; i < frmObj.length; i++) {
		var element = frmObj.elements[i];
		if (element.type.indexOf("checkbox") == 0
				|| element.type.indexOf("radio") == 0) {
			if (element.checked) {
				query += element.name + '=' + escape(element.value) + "&";
			}
		} else if (element.type.indexOf("select") == 0) {
			for ( var j = 0; j < element.length; j++) {
				if (element.options[j].selected) {
					query += element.name + '=' + escape(element.value) + "&";
				}
			}
		} else {
			query += element.name + '=' + escape(element.value) + "&";
		}
	}
	return query;
}

/*
 * Function to hide form elements that show through the search form when it is
 * visible
 */
function toggleForm(frmObj, iState) // 1 visible, 0 hidden
{
	for ( var i = 0; i < frmObj.length; i++) {
		if (frmObj.elements[i].type.indexOf("select") == 0
				|| frmObj.elements[i].type.indexOf("checkbox") == 0) {
			frmObj.elements[i].style.visibility = iState ? "visible" : "hidden";
		}
	}
}

/* Helper function for re-ordering options in a select */
function opt(txt, val, sel) {
	this.txt = txt;
	this.val = val;
	this.sel = sel;
}

/* Function for re-ordering <option>'s in a <select> */
function move(list, to) {
	var total = list.options.length;
	index = list.selectedIndex;
	if (index == -1)
		return false;
	if (to == +1 && index == total - 1)
		return false;
	if (to == -1 && index == 0)
		return false;
	to = index + to;
	var opts = new Array();
	for (i = 0; i < total; i++) {
		opts[i] = new opt(list.options[i].text, list.options[i].value,
				list.options[i].selected);
	}
	tempOpt = opts[to];
	opts[to] = opts[index];
	opts[index] = tempOpt
	list.options.length = 0; // clear

	for (i = 0; i < opts.length; i++) {
		list.options[i] = new Option(opts[i].txt, opts[i].val);
		list.options[i].selected = opts[i].sel;
	}

	list.focus();
}

/*
 * This function is used to select a checkbox by passing in the checkbox id
 */
function toggleChoice(elementId) {
	var element = document.getElementById(elementId);
	if (element.checked) {
		element.checked = false;
	} else {
		element.checked = true;
	}
}

/*
 * This function is used to select a radio button by passing in the radio button
 * id and index you want to select
 */
function toggleRadio(elementId, index) {
	var element = document.getElementsByName(elementId)[index];
	element.checked = true;
}

/* This function is used to open a pop-up window */
function openWindow(url, winTitle, winParams) {
	winName = window.open(url, winTitle, winParams);
	winName.focus();
}

/* This function is to open search results in a pop-up window */
function openSearch(url, winTitle) {
	var screenWidth = parseInt(screen.availWidth);
	var screenHeight = parseInt(screen.availHeight);

	var winParams = "width=" + screenWidth + ",height=" + screenHeight;
	winParams += ",left=0,top=0,toolbar,scrollbars,resizable,status=yes";

	openWindow(url, winTitle, winParams);
}

/* This function is used to set cookies */
function setCookie(name, value, expires, path, domain, secure) {
	document.cookie = name + "=" + escape(value)
			+ ((expires) ? "; expires=" + expires.toGMTString() : "")
			+ ((path) ? "; path=" + path : "")
			+ ((domain) ? "; domain=" + domain : "")
			+ ((secure) ? "; secure" : "");
}

/* This function is used to get cookies */
function getCookie(name) {
	var prefix = name + "="
	var start = document.cookie.indexOf(prefix)

	if (start == -1) {
		return null;
	}

	var end = document.cookie.indexOf(";", start + prefix.length)
	if (end == -1) {
		end = document.cookie.length;
	}

	var value = document.cookie.substring(start + prefix.length, end)
	return unescape(value);
}

/* This function is used to delete cookies */
function deleteCookie(name, path, domain) {
	if (getCookie(name)) {
		document.cookie = name + "=" + ((path) ? "; path=" + path : "")
				+ ((domain) ? "; domain=" + domain : "")
				+ "; expires=Thu, 01-Jan-70 00:00:01 GMT";
	}
}

// This function is for stripping leading and trailing spaces
String.prototype.trim = function() {
	return this.replace(/^\s*(\S*(\s+\S+)*)\s*$/, "$1");
};

// This function is used by the login screen to validate user/pass
// are entered.
function validateRequired(form) {
	var bValid = true;
	var focusField = null;
	var i = 0;
	var fields = new Array();
	oRequired = new required();

	for (x in oRequired) {
		if ((form[oRequired[x][0]].type == 'text'
				|| form[oRequired[x][0]].type == 'textarea'
				|| form[oRequired[x][0]].type == 'select-one'
				|| form[oRequired[x][0]].type == 'radio' || form[oRequired[x][0]].type == 'password')
				&& form[oRequired[x][0]].value == '') {
			if (i == 0)
				focusField = form[oRequired[x][0]];

			fields[i++] = oRequired[x][1];

			bValid = false;
		}
	}

	if (fields.length > 0) {
		focusField.focus();
		alert(fields.join('\n'));
	}

	return bValid;
}

// This function is a generic function to create form elements
function createFormElement(element, type, name, id, value, parent) {
	var e = document.createElement(element);
	e.setAttribute("name", name);
	e.setAttribute("type", type);
	e.setAttribute("id", id);
	e.setAttribute("value", value);
	parent.appendChild(e);
}

function confirmDelete(obj) {
	var msg = "确定要删除" + obj + "数据吗?";
	ans = confirm(msg);
	if (ans) {
		return true;
	} else {
		return false;
	}
}

function confirmMsg(msg) {
	ans = confirm(msg);
	if (ans) {
		return true;
	} else {
		return false;
	}
}

function highlightFormElements() {
	if (document.forms.length > 0 && document.forms[0].elements.length > 0) {
		var elements = document.forms[0].elements;
		for (i = 0; i < elements.length; i++) {
			if (elements[i].type == "text" || elements[i].type == "textarea") {
				elements[i].focus();
				break;
			}
		}
	}
	// add input box highlighting
	addFocusHandlers(document.getElementsByTagName("input"));
	addFocusHandlers(document.getElementsByTagName("textarea"));
}

function addFocusHandlers(elements) {
	for (i = 0; i < elements.length; i++) {
		if (elements[i].type != "button" && elements[i].type != "submit"
				&& elements[i].type != "reset"
				&& elements[i].type != "checkbox"
				&& elements[i].type != "radio") {
			if (!elements[i].getAttribute('readonly')
					&& !elements[i].getAttribute('disabled')) {
				elements[i].onfocus = function() {
					this.style.backgroundColor = '#ffd';
					this.select()
				};
				elements[i].onmouseover = function() {
					this.style.backgroundColor = '#ffd'
				};
				elements[i].onblur = function() {
					this.style.backgroundColor = '';
				}
				elements[i].onmouseout = function() {
					this.style.backgroundColor = '';
				}
			} else {
				elements[i].style.backgroundColor = '#ffeeee';
			}
		}
	}
}

function radio(clicked) {
	var form = clicked.form;
	var checkboxes = form.elements[clicked.name];
	if (!clicked.checked || !checkboxes.length) {
		clicked.parentNode.parentNode.className = "";
		return false;
	}

	for (i = 0; i < checkboxes.length; i++) {
		if (checkboxes[i] != clicked) {
			checkboxes[i].checked = false;
			checkboxes[i].parentNode.parentNode.className = "";
		}
	}

	// highlight the row
	clicked.parentNode.parentNode.className = "over";
}

// 显示信息提示框
function showTipsDialog(iconClassName, msg) {
	$("#tipsicon").removeClass();
	$("#tipsicon").addClass(iconClassName);
	$(".tipsinfo").text(msg);

	$('#layer-tips, #context-layer-tips').show();
}

// 显示文本框提示性文字
function displayInputTips(inputBoxId, tips) {
	var object = $("#" + inputBoxId);

	object.val(tips);
	object.css("color", "gray");
	object.focus(function() {
		if (object.val() == tips) {
			object.val("");
		}
	});

	object.blur(function() {
		if (object.val() == "") {
			object.val(tips);
		}
	});
}

// 初始化文本框
function initInputValue(inputBoxId, tips) {
	if ($("#" + inputBoxId).val() == tips) {
		$("#" + inputBoxId).val("");
	}
}

/**
 * 提供去掉字符串两端的空格
 */
function trim(str) {
	var i, j, k;
	str = " " + str + " ";
	i = 0;
	k = str.length;
	while (str.indexOf(" ") == 0 && i < k) {
		j = str.length;
		str = str.substring(1, j);
		i++;
	}
	i = 0;
	k = str.length;
	while ((str.lastIndexOf(" ") == str.length - 1) && i < k) {
		j = str.length - 1;
		str = str.substring(0, j);
		i++;
	}
	return str;
}

/**
 * disable按钮，供页面通过Btn交互时，避免重复多次点击使用
 * 
 * @param btnID
 * @param isDisabled
 */
function disabledBtn(btnID, isDisabled) {
	var inputs = jQuery("#" + btnID);
	for ( var i = 0; i < inputs.length; i++) {
		if (isDisabled) {
			jQuery(inputs[i]).attr("disabled", true);
		} else {
			jQuery(inputs[i]).attr("disabled", false);
		}
	}
}

/**
 * Disable表单，供页面在提交表单时使用，避免重复提交表单
 * 
 * @param formID
 * @param isDisabled
 */
function disabledFrom(formID, isDisabled) {
	var inputs = jQuery("#" + formID + " input");
	for ( var i = 0; i < inputs.length; i++) {
		if (isDisabled) {
			jQuery(inputs[i]).attr("disabled", true);
		} else {
			jQuery(inputs[i]).attr("disabled", false);
		}
	}
}

/**
 * 提供检测特殊字符，表单校验用
 * 
 * @param str
 * @returns
 */
function forbiddenCharacter(str) {
	var bool = /[<>\\#*&^$%\'\"]+/g.test(str);
	return bool;
}

/**
 * 弹出对话框
 * 
 * @param id
 */
function popupDialog(id) {
	$('#' + id).modal({
		backdrop : true,
		keyboard : true,
		show : true
	});
}

/**
 * 弹出蒙版
 */
function popupMaskLayer() {
	$("#maskLayer").removeClass("hide").addClass("in");
}

/**
 * 关闭蒙版
 */
function closeMaskLayer() {
	$("#maskLayer").removeClass("in").addClass("hide");
}

/**
 * 保留V位有效数字
 * 
 * @param num
 * @param v
 * @returns {Number}
 */
function decimal(num, v) {
	var vv = Math.pow(10, v);
	return Math.round(num * vv) / vv;
}

/**
 * 登陆页面响应回车事件
 */
function enterSumbit() {
	var event = arguments.callee.caller.arguments[0] || window.event;// 消除浏览器差异
	if (event.keyCode == 13) {
		login.login();
	}
}

/**
 * 从URL中提取参数
 * 
 * @param key
 * @returns
 */
function getUrlParameter(key) {
	return (document.location.search.match(new RegExp("(?:^\\?|&)" + key
			+ "=(.*?)(?=&|$)")) || [ '', null ])[1];
}

;
(function($) {
	$
			.extend({
				format : function(str, step, splitor) {
					str = str.toString();
					var len = str.length;

					if (len > step) {
						var l1 = len % step, l2 = parseInt(len / step), arr = [], first = str
								.substr(0, l1);
						if (first != '') {
							arr.push(first);
						}
						;
						for ( var i = 0; i < l2; i++) {
							arr.push(str.substr(l1 + i * step, step));
						}
						;
						str = arr.join(splitor);
					}
					return str;
				}
			});
})(jQuery);