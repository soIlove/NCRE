var baseAction = {
		tab_names : [ "常用快递", "其它快递" ],
		commonTab : {
			// 常用快递
			 common :[ "申通", "圆通", "中通","韵达", "汇通", "顺丰", "宅急送", "EMS",
					"京东", "亚马逊","如风达","唯品会" ,"91生日","黑狗快递"],
			 codeCommon : ["100", "101","500","102", "502", "505","103","2",  "9999","9998","9997","9996","20160107","20160520"]
		},
		otherTab : {
			//其它快递
			 all : ["全峰快递", "城市100", "天天快递", "苏宁易购","优速","国通","港中能达","快捷速递",
			        "全一快递",  "德邦物流",  "中铁快运","其他" ],
			 codeAll : ["1216","1262","504" ,"9995","1207","200143","1192","1204","1259", "107" ,"1016","-1"]
		},
		expressSelector: function (divName) {// 初始化tab
			var html = "<div class='express-box demo1' id='demo1" + divName + "'>";
			html += "<ul class='tab_menu'>";
			html += "<li class='current' id='current" + divName + "'>" + baseAction.tab_names[0]
					+ "</li>";
			for ( var i = 1; i < baseAction.tab_names.length; i++) {
				html += "<li>" + baseAction.tab_names[i] + "</li>";
			}
			html += "</ul>";
			html += "<div class='tab_box'>";
			html += "<div>";
			for ( var i = 0; i < baseAction.commonTab.common.length; i++) {
				html += "<span><a code=" + baseAction.commonTab.codeCommon[i]
						+ " href='###' class='place' onclick='baseAction.clickCity(\""
						+ divName + "\",\"" + baseAction.commonTab.common[i]+ "\",\"" +baseAction.commonTab.codeCommon[i] + "\")'>" + baseAction.commonTab.common[i]
						+ "</a></span>";
			}
			html += "</div>";
			html += "<div class='hide'>";
			for ( var i = 0; i < baseAction.otherTab.all.length; i++) {
				html += "<span><a code=" + baseAction.otherTab.codeAll[i]
						+ " href='###' class='place city' onclick='baseAction.clickCity(\""
						+ divName + "\",\"" + baseAction.otherTab.all[i]+ "\",\"" +baseAction.otherTab.codeAll[i] + "\")'>" + baseAction.otherTab.all[i]
						+ "</a></span>";
			}
			html += "</div></div></div>";
			return html;
		},
 initDropList: function(e,divName,deliveryCompany_link) {
	if(!divName) {
		divName = $(this).attr("id");
	}
	var html = baseAction.expressSelector(divName);
	if($('#demo1' + divName).attr("id") != "demo1"+divName) {
		$("#" + divName).after(html);
	}
	$('#demo1' + divName).show();
	$("#current" + divName).attr("class", "current");
	$("#current" + divName).next("li").attr("class", "tab_menu li");
	$('#demo1' + divName).Tabs();
	// 单击外面，隐藏
	$(document).click(
			function(evt) {
				var target = evt.target;
				if((target.title == null || target.title == '') && 
						target.id != "kkpager_btn_go_input" && target.id != "kkpager_btn_go") {
					while (target.nodeName.toLowerCase() != "html") {
						if ($(target).hasClass('express-box')
								|| target.id == $("#" + divName).attr("id")
								|| target.id == $("#" + deliveryCompany_link).attr("id")) {
							return;
						}
						target = target.parentNode;
					}
				}
				$('#demo1' + divName).hide();
			});
 },
 clickCity: function(divName, value,code) {
	$('#demo1' + divName).hide();
	$("#" + divName).val(value);
	$("#" + divName).attr("data-id",code);
 }
};