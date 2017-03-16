//4.异步登录操作
function loginSub(){
	var params=$("#loginForm").serialize();//取到表单要提交的请求数据
	$.post("user/login",params,function(data){
		if(data){
			loginStr=$("#loginForm").html();			
			$("#loginForm").html("<label>欢迎<span style= color:green;'>"+$("#loginForm [name='username']").val()+"</span>使用本网站&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' onclick='logout()'>注销用户</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='admin.jsp'>管理后台</a></label>");
			
		}else{
			$("#error").html("用户名或密码错误！！！");
			$("#error").css({"color":"red"});
		}
		
	},"json");
	alert(params);
	return false;
}






$("#loginForm").form({
	url:"user/login",    
    success:function(data){ 
    	//alert(data);
    	if(data.trim()=="true"){
    		location.replace("page/list.jsp");
    	}else{
    		$.messager.show({
    			title:"登录信息",
    			msg:"登录失败，编号与姓名不匹配!!!",
    			showType:'show',
    			style:{
    				top:document.body.scrollTop+document.documentElement.scrollTop,
    			}
    		});

    	}
    },    
})


function loginSub(){
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
	
	
}