$("#main").tabs({
	fit:true,
	border:false,
});

$("#sideNav").accordion({
	fit:true,
	border:false,	
});

var urlJson={"用户管理":"userManage.jsp","投单查询":"orderSearch.jsp","修改密码":"modifyPwd.jsp",
		"接单查询":"acceptSearch.jsp",
};

$(".treeNav").tree({
	onClick: function(node){  // node是指树节点， node.text是节点文本内容
		var nt = node.text;
		if($("#main").tabs('exists', nt)){
			$("#main").tabs('close', nt)
		}
		
		if(urlJson[nt]){
			$('#main').tabs('add',{    
			    title:nt,    
			    href:"back/"+ urlJson[nt],    //只有body元素内部的内容才会被加载
//			    href:"index.jsp",	
			    closable:true,    
			});
		}else{
			$("#main").tabs('add',{
				title: nt,
				content:nt,
				iconCls:"icon-mini-add",
				closable:true,
			});
		}
		
	}
});


$.extend($.fn.layout.methods,{
	full:function(jq){
		return jq.each(function(){
			var layout=$(this);
			var center=layout.layout("panel","center");
			center.panel("maximize");
			center.parent().css("z-index",10);
			
			$(window).on("resize.full",function(){
				layout.layout("unFull").layout("resize");
			})
		});
	},
	unfull:function(jq){
		return jq.each(function(){
			var layout=$(this);
			var center=layout.layout("panel","center");
			center.parent().css("z-index","inherit");
			center.panel("restore");
			$(window).off("resize.full");
		});
	}
});

function full(){
	$("body").layout("full");
	$("#center_content").addClass("panel-fit");
}

function unfull(){
	$("body").layout("unfull");
}





