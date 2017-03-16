/**
 * 平台的核心异步交互js代码
 */
var ajax = {
	init : function() {
		jQuery(document).ajaxStart(function(e, xhr, settings) {
			ajax.ajaxStart(e, xhr, settings);
		});
		jQuery(document).ajaxStop(function(e, xhr, settings) {
			ajax.ajaxStop(e, xhr, settings);
		});
		jQuery(document).ajaxSuccess(function(e, xhr, settings) {
			ajax.ajaxSuccess(e, xhr, settings);
		});
		jQuery(document).ajaxError(function(e, xhr, settings) {
			ajax.ajaxError(e, xhr, settings);
		});
		jQuery(document).ajaxSend(function(e, xhr, settings) {
			ajax.ajaxSend(e, xhr, settings);
		});
		jQuery(document).ajaxComplete(function(e, xhr, settings) {
			ajax.ajaxComplete(e, xhr, settings);
		});
	},

	ajaxStart : function(e, xhr, settings) {
		// alert("ajax stop ...");
	},

	ajaxStop : function(e, xhr, settings) {
		// alert("ajax stop ...");
	},

	ajaxSuccess : function(e, xhr, settings) {
		// alert("ajax success ...");
	},

	ajaxError : function(e, xhr, settings) {
		// alert("ajax error ...");
	},

	ajaxSend : function(e, xhr, settings) {
		// alert("ajax send ...");
	},

	ajaxComplete : function(e, xhr, settings) {
		ajax._headerhandle(xhr);
	},

	ajaxGetRequest : function(url, data, callFunction) {
		jQuery.ajax({
			type : 'POST',
			url : this._updateUrl(url),
			data : data,
			success : function(data, textStatus, jqXHR) {
				ajax._headerhandle(jqXHR);
				if (callFunction != undefined
						&& typeof (callFunction) == "function") {
					var callbacks = jQuery.Callbacks();
					callbacks.add(callFunction);
					callbacks.fire(data);
				}
			}
		});
	},

	ajaxPostRequest : function(url, data, callFunction) {
		jQuery.ajax({
			type : 'POST',
			url : this._updateUrl(url),
			data : data,
			success : function(data, textStatus, jqXHR) {
				ajax._headerhandle(jqXHR);
				if (callFunction != undefined
						&& typeof (callFunction) == "function") {
					var callbacks = jQuery.Callbacks();
					callbacks.add(callFunction);
					callbacks.fire(data);
				}
			}
		});
	},

	pageLoad : function(pageUrl, data, showElementId) {
		_hmt.push([ '_trackPageview', app.ctx + '/' + pageUrl ]);
		pageUrl = this._updateUrl(pageUrl);
		jQuery('#' + showElementId).load(pageUrl, data);
	},

	pageLoadCallBack : function(pageUrl, data, showElementId, callFunction) {
		pageUrl = this._updateUrl(pageUrl);
		jQuery('#' + showElementId).load(
				pageUrl,
				data,
				function(data, textStatus, jqXHR) {
					ajax._headerhandle(jqXHR);
					ajax.searchLoading(false);
					if (callFunction != undefined
							&& typeof (callFunction) == "function") {
						var callbacks = jQuery.Callbacks();
						callbacks.add(callFunction);
						callbacks.fire(data);
					}
				});
	},

	ajaxActionForm : function(formId, action, callFunction) {
		var targetForm = jQuery("#" + formId);
		this.disabledForm(formId, true);
		var data = targetForm.serialize();
		jQuery.ajax({
			type : 'POST',
			url : action,
			data : data,
			success : function(data, textStatus, jqXHR) {
				ajax.disabledForm(formId, false);
				ajax._headerhandle(jqXHR);
				if (callFunction != undefined
						&& typeof (callFunction) == "function") {
					var callbacks = jQuery.Callbacks();
					callbacks.add(callFunction);
					callbacks.fire(data);
				}
			}
		});
	},

	ajaxForm : function(formId, callFunction) {
		var targetForm = jQuery("#" + formId);
		this.disabledForm(formId, true);
		var data = targetForm.serialize();
		jQuery.ajax({
			type : 'POST',
			url : this._updateUrl(targetForm.attr("action")),
			data : data,
			success : function(data, textStatus, jqXHR) {
				ajax.disabledForm(formId, false);
				ajax._headerhandle(jqXHR);
				if (callFunction != undefined
						&& typeof (callFunction) == "function") {
					var callbacks = jQuery.Callbacks();
					callbacks.add(callFunction);
					callbacks.fire(data);
				}
			}
		});
	},

	ajax : function(parameter) {
		jQuery.ajax({
			type : parameter.type,
			url : this._updateUrl(parameter.url),
			data : parameter.data,
			success : function(data, textStatus, jqXHR) {
				if (parameter.success != undefined
						&& typeof (parameter.success) == "function") {
					var callbacks = jQuery.Callbacks();
					callbacks.add(parameter.success);
					callbacks.fire(data);
				}
			}
		});
	},

	// for form submit use
	disabledForm : function(formId, isDisabled) {
		var inputs = jQuery("form[id='" + formId + "']");
		for ( var i = 0; i < inputs.length; i++) {
			if (isDisabled) {
				jQuery(inputs[i]).attr("disabled", true);
			} else {
				jQuery(inputs[i]).attr("disabled", false);
			}
		}
	},

	/**
	 * 将url添加时间戳，解决缓存问题
	 */
	_updateUrl : function(ajaxUrl) {
		if (ajaxUrl.indexOf('ajax_timestamp') >= 0) {
			return ajaxUrl;
		}
		if (ajaxUrl.indexOf('?') >= 0) {
			return ajaxUrl + '&ajax_timestamp=' + new Date().getTime();
		} else {
			return ajaxUrl + '?ajax_timestamp=' + new Date().getTime();
		}
	},

	_headerhandle : function(jqXHR) {
		if (jqXHR.getResponseHeader('isSession') != null) {
			if (jqXHR.getResponseHeader('isSession') == 'false') {
				if (jqXHR.getResponseHeader('isAnonymous') != null) {
					if (jqXHR.getResponseHeader('isAnonymous') == 'false') {
						window.location.href = app.ctx;
					}
				}
			}
		}
	},

	trim : function(str) {
		for ( var i = 0; i < str.length && str.charAt(i) == " "; i++)
			;
		for ( var j = str.length; j > 0 && str.charAt(j - 1) == " "; j--)
			;
		if (i > j)
			return "";
		return str.substring(i, j);
	},

	/**
	 * JavaScript的转码方法
	 */
	encodeURI : function(param) {
		return encodeURIComponent(param);
	},

	/**
	 * javaScript 的转码,由于要encodeURI两次服务器端才能decode
	 */
	encodeURItoUTf8 : function(param) {
		return encodeURI(encodeURI(param));
	},

	/**
	 * 该函数提供DisplayTag分页使用
	 */
	displayTagAjax : function(destPageId, destContainer, baseAction) {
		var links = new Array();
		var container = $('#' + destPageId);
		ajax.addItemsToArray(container.find("table .sortable a"), links);
		ajax.addItemsToArray(container.find(".pagging a"), links);
		$.each(links, function() {
			var url = $(this).attr("href");
			ajax
					.addClickEvent(destPageId, this, url, destContainer,
							baseAction);
			$(this).removeAttr("href");
		});
		return true;
	},

	addClickEvent : function(pageId, element, url, destContainer, baseAction) {
		$(element).click(
				function() {
					if (url != undefined) {
						var preFix = url.indexOf('?');
						if (preFix >= 0) {
							url = url.substr(preFix);
						}
					}
					ajax.searchLoading(true);
					ajax.pageLoadCallBack(baseAction + url, null,
							destContainer, function(data, textStatus, jqXHR) {
								ajax.searchLoading(false);
							});
				});
	},

	addItemsToArray : function(items, array) {
		$.each(items, function() {
			array.push(this);
		});
	},

	/**
	 * 加载页面的loading, flag true显示loading，flag false隐藏loading
	 */
	pageLoading : function(flag, coverDest) {
		try {
			if (coverDest == null) {
				if (flag) {
					if ($.browser.version == "6.0") {
						$("#loading_layer").css({
							"height" : $(document).height(),
							"width" : $(document).width()
						}).show();
					} else {
						$("#loading_layer").css({
							"height" : $(document).height(),
							"width" : $(document).width()
						}).show();
						$("#loading_layer").show();
					}
				} else {
					$("#loading_layer").hide();
				}
			} else {
				if (flag) {
					$("#loading_layer").css({
						"height" : $('#' + coverDest).height(),
						"width" : $('#' + coverDest).width()
					}).show();
				} else {
					$("#loading_layer").hide();
				}
			}
		} catch (e) {
			return;
		}
	},

	miniLoading : function(destDiv) {
		var imgStr = "<img src='" + app.ctx
				+ "/res/img/images/icons/loading_mini.gif' alt='请稍候...'>";
		jQuery('#' + destDiv).html(imgStr);
	},

	/**
	 * 仅提供给‘搜索代收店’使用
	 * 
	 * @param flag
	 * @param coverDest
	 */
	searchLoading : function(flag) {
		try {
			if ($.browser.version != "6.0") {
				if (flag) {
					$("#loading_layer").css({
						"height" : $(document).height(),
						"width" : $(document).width(),
						"top" : '90px',
						"position" : 'absolute'
					}).show();
				} else {
					$("#loading_layer").hide();
				}
			}
		} catch (e) {
			return;
		}
	}

};
$(document).ready(ajax.init);