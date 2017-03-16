
var param=$("#uuidhidden").val();
getExpress(1);
function getExpress(pageNum){
	$.get("zxd/list?page="+pageNum,function(data){
		//alert(data.rows);
		$("#expressList").empty();
		var expresses= data.rows;
		for(var i=0;i<expresses.length;i++){
			$("#expressList").append("<li class='topic'><div class='u_photo'>"+
				"<img src='image/85_avatar_m.jpg' height='48' width='48'>" +
				"<div style='width:48px;height:20px;line-height:20px;font-size:13px;" +
				"font-family:'微软雅黑';text-align:center;color:#E76D26;' >"+expresses[i].uname+"</div>"+
				"</div><div class='u_post'><a href='javaScript:Graborder("+expresses[i].oid+")'><div class='btn_order'>抢单</div></a>"+
				"<div class='li_1' style='line-height: 21px;'>"+
				"<a style='font-size: 18px; font-family: '微软雅黑';' class='i_title'"+
				"href='javascript:void(0)'>"+expresses[i].otype+"</a></div>"+
				"<div class='li_2' style='margin-top: 15px;'>"+
				"<a href='javascript:void(0)'>"+expresses[i].zaddr+"</a> <em class='li_s'>"+expresses[i].otime+"</em>" +
				"<em class='readNum li_s'>"+expresses[i].osize+"</em><em class='collectNum li_s'>" +
				"<span class='money'>￥"+expresses[i].oprice+"</span></em></div>"+
				"<div class='li_3' style='font-size: 14px; font-family: '微软雅黑';" +
				" padding-top: 10px;'>"+expresses[i].odesc +
				"</div></div></li>");
			
			
		}
		//if(data.totalPage>5){
			$("#pagation").empty();
			if(pageNum<5){
				switch(pageNum){
				case 1:
					$("#pagation").append("<ul><li><span>1</span></li>" +
							"<li><a href='javascript:void(0)'  onclick='getExpress(2)'>"+2
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress(3)'>"+3
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress(4)'>"+4
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress(5)'>"+5
							+"</a></li><li><em style='javascript:void(0)'  onclick='getExpress(1)'>...</em></li>"
							+"<li><a href='javascript:void(0)'  onclick='getExpress("+data.totalPage+")'>"+data.totalPage
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress("+(data.currPage+1)+")'"
							+">下一页</a></li></ul>") ;
					break;
				case 2:
					$("#pagation").append("<ul><li><a href='javascript:void(0)'  onclick='getExpress(1)'>"+1+"</a></li>" +
							"<li><span>2</span></li><li><a href='javascript:void(0)'  onclick='getExpress(3)'>"+3
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress(4)'>"+4
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress(5)'>"+5
							+"</a></li><li><em style='javascript:void(0)'  onclick='getExpress(1)'>...</em></li>"
							+"<li><a href='javascript:void(0)'  onclick='getExpress("+data.totalPage+")'>"+data.totalPage
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress("+(data.currPage+1)+")'"
							+">下一页</a></li></ul>") ;
					break;
				case 3:
					$("#pagation").append("<ul><li><a href='javascript:void(0)'  onclick='getExpress(1)'>"+1+"</a></li>" +
							"<li><a href='javascript:void(0)'  onclick='getExpress(2)'>"+2
							+"</a></li><li><span>3</span></li><li><a href='javascript:void(0)'  onclick='getExpress(4)'>"+4
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress(5)'>"+5
							+"</a></li><li><em style='javascript:void(0)'  onclick='getExpress(1)'>...</em></li>"
							+"<li><a href='javascript:void(0)'  onclick='getExpress("+data.totalPage+")'>"+data.totalPage
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress("+(data.currPage+1)+")'"
							+">下一页</a></li></ul>") ;
					break;
				case 4:
					$("#pagation").append("<ul><li><a href='javascript:void(0)'  onclick='getExpress(1)'>"+1+"</a></li>" +
							"<li><a href='javascript:void(0)'  onclick='getExpress(2)'>"+2
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress(3)'>"+3
							+"</a></li><li><span>4</span></li><li><a href='javascript:void(0)'  onclick='getExpress(5)'>"+5
							+"</a></li><li><em style='javascript:void(0)'  onclick='getExpress(1)'>...</em></li>"
							+"<li><a href='javascript:void(0)'  onclick='getExpress("+data.totalPage+")'>"+data.totalPage
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress("+(data.currPage+1)+")'"
							+">下一页</a></li></ul>") ;
					break;
				default:"参数错误！！！";
				}
				
			}else if(pageNum==data.totalPage||pageNum==data.totalPage-1){
				switch(pageNum){
				case data.totalPage-1:
					$("#pagation").append("<ul><li><a href='javascript:void(0)' onclick='getExpress(1)'>1</a></li>" +
							"<li><em style='display:block; height:30px; line-height:16px;'>...</em>" +
							"</li><li><a href='javascript:void(0)' onclick='getExpress("+(data.totalPage-4)+")'>"+(data.totalPage-4)+"</a></li>" +
							"<li><a href='javascript:void(0)' onclick='getExpress("+(data.totalPage-3)+")'>"+(data.totalPage-3)+"</a></li>" +
							"<li><a href='javascript:void(0)' onclick='getExpress("+(data.totalPage-2)+")'>"+(data.totalPage-2)+"</a></li>" +
							"<li><span>"+(data.totalPage-1)+"</span></li>" +
							"<li><a href='javascript:void(0)' onclick='getExpress("+data.totalPage+")'>"+data.totalPage+"</a></li>" +
							"<li><a href='javascript:void(0)'  onclick='getExpress("+(data.currPage+1)+")'>下一页</a></li></ul>");
					break;
				case data.totalPage:
					$("#pagation").append("<ul><li><a href='javascript:void(0)' onclick='getExpress(1)'>1</a></li>" +
							"<li><em style='display:block; height:30px; line-height:16px;'>...</em>" +
							"</li><li><a href='javascript:void(0)' onclick='getExpress("+(data.totalPage-4)+")'>"+(data.totalPage-4)+"</a></li>" +
							"<li><a href='javascript:void(0)' onclick='getExpress("+(data.totalPage-3)+")'>"+(data.totalPage-3)+"</a></li>" +
							"<li><a href='javascript:void(0)' onclick='getExpress("+(data.totalPage-2)+")'>"+(data.totalPage-2)+"</a></li>" +
							"<li><a href='javascript:void(0)' onclick='getExpress("+(data.totalPage-1)+")'>"+(data.totalPage-1)+"</a></li>" +
							"<li><span>"+data.totalPage+"</span></li></ul>");
					break;
				default:"参数错误！！！";
				}
				
			}
			else if(pageNum>=5&&pageNum<=data.totalPage-2){
					$("#pagation").append("<ul><li><a href='javascript:void(0)' onclick='getExpress(1)'>1</a></li><li>" +
							"<em style='display:block; height:30px; line-height:16px;'>...</em>"+
					        "</li><li><a href='javascript:void(0)' onclick='getExpress("+(data.currPage-2)+")'>"+(data.currPage-2)+"</a></li>" +
							"<li><a href='javascript:void(0)' onclick='getExpress("+(data.currPage-1)+")'>"+(data.currPage-1)+"</a></li>" +
							"<li><span>"+data.currPage+"</span></li>" +
							"<li><a href='javascript:void(0)' onclick='getExpress("+(data.currPage+1)+")'>"+(data.currPage+1)+"</a></li>" +
							"<li><a href='javascript:void(0)' onclick='getExpress("+(data.currPage+2)+")'>"+(data.currPage+2)+"</a></li>" +
							"<li><em style='display:block; height:30px; line-height:16px;'>...</em>"+
							"</li><li><a href='javascript:void(0)' onclick='getExpress("+data.totalPage+")'>"+data.totalPage+"</a></li>" +
							"<li><a href='javascript:void(0)'  onclick='getExpress("+(data.currPage+1)+")'>下一页</a></li></ul>");
			}
			
		//}
		

	},"json");
}


function getType(){
	$.get("zxd/type",function(data){

		$("#typelist").empty();
		var sum=0;
		for(var i=0;i<data.length;i++){
			$("#typelist").append(
						"<span><a href='zxd/findType?otype="+data[i].otype+"'>"+data[i].otype
						+"<em>("+data[i].num+")</em></a></span>");
			sum+=parseInt(data[i].num);		
		}
		$("#typelist").append(" <span><a href='javascript:void(0)' onclick='getExpress(1)'>全部<em>("+sum+")</em></a></span>");
		$("#typelist a").click(function(){
			listExpress(this.href);
			return false;
		});
		
	},"json");
}

getType();



$('#getordmsg').window({    
	  width:400,    
	    height:250,    
	    modal:true,   
	    minimizable:false,
	    maximizable:false,
	    collapsible:false,
	    title:'填写抢单信息',
	    closed:true
	    	
});  

function Graborder(oid){
	$("#hiddoid").val(oid);
	if(param==null||param==""){
		alert("温馨提示:请先登录!")
		window.location.href="page/Login.jsp";
	}else{
		getdidbyuuid();
		
	}
	
}
function getdidbyuuid(){
	$.post("zxd/getdidbyuuid",{"uuid":param},function(data){
		if(data!=null){
			$("#hidddid").val(data);
			$('#getordmsg').window('open');
			
		}else{			
			alert("对不起，您还不是小递员哦，赶紧加入我们吧.")
		}
	},"json")
	
}
function applyorder(){
	var oid=$("#hiddoid").val();
	var adesc=$("#ordoramsg").val();
	var did=$("#hidddid").val();
	$.post("order/addzaccept",{"oid":oid,"adesc":adesc,"did":did},function(data){
			if(data){
				alert("抢单申请已为你提交，请等待对方确认");
				$('#getordmsg').window('close')
			}			
},"json")
/*	var socket=new WebSocket('ws://'+window.location.host+'/zhaixiaodi/pushmsg');
	//连接与服务器的连接
	socket.onopen = function () {
		alert("连接")
			socket.send("hello,my name is 黄福州");
	};
	//与服务之间的通信
	socket.onmessage = function (message) {
			alert("你有一个新消息"+message.data)
	};
	//断开与服务器的连接
	socket.onclose = function () {

	};*/
}


function  listExpress(url){
	function getExpress02(pageNum){
		$.post(url+"&page="+pageNum,function(data){
			$("#expressList").empty();
			var expresses= data.rows;
			for(var i=0;i<expresses.length;i++){
				$("#expressList").append("<li class='topic'><div class='u_photo'>"+
					"<img src='image/85_avatar_m.jpg'height='48' width='48'>"+
					"<div style='width:48px;height:20px;line-height:20px;font-size:13px;" +
					"font-family:'微软雅黑';text-align:center;color:#E76D26;' >"+expresses[i].uname+"</div>"+
					"</div><div class='u_post'><a href='javaScript:Graborder("+expresses[i].oid+")'><div class='btn_order'>抢单</div></a>"+
					"</div><div class='u_post'>"+

					"<div class='li_1' style='line-height: 21px;'>"+
					"<a style='font-size: 18px; font-family: '微软雅黑';' class='i_title'"+
					"href='javascript:void(0)'>"+expresses[i].otype+"</a></div>"+
					"<div class='li_2' style='margin-top: 15px;'>"+
					"<a href='javascript:void(0)'>"+expresses[i].zaddr+"</a> <em class='li_s'>"+expresses[i].otime+"</em>" +
					"<em class='readNum li_s'>"+expresses[i].osize+"</em><em class='collectNum li_s'>" +
					"<span class='money'>￥"+expresses[i].oprice+"</span></em></div>"+
					"<div class='li_3' style='font-size: 14px; font-family: '微软雅黑';" +
					" padding-top: 10px;'>"+expresses[i].odesc +
					"</div></div></li>");
				
				
			}
			$("#pagation").empty();
			if(pageNum<5){
				switch(pageNum){
				case 1:
					$("#pagation").append("<ul><li><span>1</span></li>" +
							"<li><a href='javascript:void(0)'  onclick='getExpress02(2)'>"+2
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress02(3)'>"+3
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress02(4)'>"+4
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress02(5)'>"+5
							+"</a></li><li><em style='javascript:void(0)'  onclick='getExpress02(1)'>...</em></li>"
							+"<li><a href='javascript:void(0)'  onclick='getExpress02("+data.totalPage+")'>"+data.totalPage
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress02("+(data.currPage+1)+")'"
							+">下一页</a></li></ul>") ;
					break;
				case 2:
					$("#pagation").append("<ul><li><a href='javascript:void(0)'  onclick='getExpress02(1)'>"+1+"</a></li>" +
							"<li><span>2</span></li><li><a href='javascript:void(0)'  onclick='getExpress02(3)'>"+3
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress02(4)'>"+4
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress02(5)'>"+5
							+"</a></li><li><em style='javascript:void(0)'  onclick='getExpress02(1)'>...</em></li>"
							+"<li><a href='javascript:void(0)'  onclick='getExpress02("+data.totalPage+")'>"+data.totalPage
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress02("+(data.currPage+1)+")'"
							+">下一页</a></li></ul>") ;
					break;
				case 3:
					$("#pagation").append("<ul><li><a href='javascript:void(0)'  onclick='getExpress02(1)'>"+1+"</a></li>" +
							"<li><a href='javascript:void(0)'  onclick='getExpress02(2)'>"+2
							+"</a></li><li><span>3</span></li><li><a href='javascript:void(0)'  onclick='getExpress02(4)'>"+4
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress02(5)'>"+5
							+"</a></li><li><em style='javascript:void(0)'  onclick='getExpress02(1)'>...</em></li>"
							+"<li><a href='javascript:void(0)'  onclick='getExpress02("+data.totalPage+")'>"+data.totalPage
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress02("+(data.currPage+1)+")'"
							+">下一页</a></li></ul>") ;
					break;
				case 4:
					$("#pagation").append("<ul><li><a href='javascript:void(0)'  onclick='getExpress02(1)'>"+1+"</a></li>" +
							"<li><a href='javascript:void(0)'  onclick='getExpress02(2)'>"+2
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress02(3)'>"+3
							+"</a></li><li><span>4</span></li><li><a href='javascript:void(0)'  onclick='getExpress02(5)'>"+5
							+"</a></li><li><em style='javascript:void(0)'  onclick='getExpress02(1)'>...</em></li>"
							+"<li><a href='javascript:void(0)'  onclick='getExpress02("+data.totalPage+")'>"+data.totalPage
							+"</a></li><li><a href='javascript:void(0)'  onclick='getExpress02("+(data.currPage+1)+")'"
							+">下一页</a></li></ul>") ;
					break;
				default:"参数错误！！！";
				}
				
			}else if(pageNum==data.totalPage||pageNum==data.totalPage-1){
				switch(pageNum){
				case data.totalPage-1:
					$("#pagation").append("<ul><li><a href='javascript:void(0)' onclick='getExpress02(1)'>1</a></li>" +
							"<li><em style='display:block; height:30px; line-height:16px;'>...</em>" +
							"</li><li><a href='javascript:void(0)' onclick='getExpress02("+(data.totalPage-4)+")'>"+(data.totalPage-4)+"</a></li>" +
							"<li><a href='javascript:void(0)' onclick='getExpress02("+(data.totalPage-3)+")'>"+(data.totalPage-3)+"</a></li>" +
							"<li><a href='javascript:void(0)' onclick='getExpress02("+(data.totalPage-2)+")'>"+(data.totalPage-2)+"</a></li>" +
							"<li><span>"+(data.totalPage-1)+"</span></li>" +
							"<li><a href='javascript:void(0)' onclick='getExpress02("+data.totalPage+")'>"+data.totalPage+"</a></li>" +
							"<li><a href='javascript:void(0)'  onclick='getExpress02("+(data.currPage+1)+")'>下一页</a></li></ul>");
					break;
				case data.totalPage:
					$("#pagation").append("<ul><li><a href='javascript:void(0)' onclick='getExpress02(1)'>1</a></li>" +
							"<li><em style='display:block; height:30px; line-height:16px;'>...</em>" +
							"</li><li><a href='javascript:void(0)' onclick='getExpress02("+(data.totalPage-4)+")'>"+(data.totalPage-4)+"</a></li>" +
							"<li><a href='javascript:void(0)' onclick='getExpress02("+(data.totalPage-3)+")'>"+(data.totalPage-3)+"</a></li>" +
							"<li><a href='javascript:void(0)' onclick='getExpress02("+(data.totalPage-2)+")'>"+(data.totalPage-2)+"</a></li>" +
							"<li><a href='javascript:void(0)' onclick='getExpress02("+(data.totalPage-1)+")'>"+(data.totalPage-1)+"</a></li>" +
							"<li><span>"+data.totalPage+"</span></li></ul>");
					break;
				default:"参数错误！！！";
				}
				
			}
			else if(pageNum>=5&&pageNum<=data.totalPage-2){
					$("#pagation").append("<ul><li><a href='javascript:void(0)' onclick='getExpress02(1)'>1</a></li><li>" +
							"<em style='display:block; height:30px; line-height:16px;'>...</em>"+
					        "</li><li><a href='javascript:void(0)' onclick='getExpress02("+(data.currPage-2)+")'>"+(data.currPage-2)+"</a></li>" +
							"<li><a href='javascript:void(0)' onclick='getExpress02("+(data.currPage-1)+")'>"+(data.currPage-1)+"</a></li>" +
							"<li><span>"+data.currPage+"</span></li>" +
							"<li><a href='javascript:void(0)' onclick='getExpress02("+(data.currPage+1)+")'>"+(data.currPage+1)+"</a></li>" +
							"<li><a href='javascript:void(0)' onclick='getExpress02("+(data.currPage+2)+")'>"+(data.currPage+2)+"</a></li>" +
							"<li><em style='display:block; height:30px; line-height:16px;'>...</em>"+
							"</li><li><a href='javascript:void(0)' onclick='getExpress02("+data.totalPage+")'>"+data.totalPage+"</a></li>" +
							"<li><a href='javascript:void(0)'  onclick='getExpress02("+(data.currPage+1)+")'>下一页</a></li></ul>");
			}

		},"json");
	}
	getExpress02(1);
	
}

