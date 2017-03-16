 function modifyPwd(){
	 var result=false;
	 var params=$("#editPwdForm").serialize();
	 if( $("#newPwd").val().length<1){
		 $("#errorMsg1").text("密码不能为空");
		 return false;
	 }
	 if( $("#newPwd").val() != $("#comfirPwd").val()){
		 $("#errorMsg2").text("两次密码不一样");
		 return false;
	 }
	 $.post("admin/modifyPwd",params,function(returndata){
		 alert(returndata);
			 $.messager.show({
					title : '修改密码',
					msg : $.trim(returndata) == "true"? "修改密码成功":"修改密码失败",
					showType : 'show',
					style : {
						top : document.body.scrollTop
								+ document.documentElement.scrollTop+40,
					}
				});
	 },"json");
	 $("#newPwd").val("");
	 $("#comfirPwd").val("");
	 return result;
 }
 
 function clean1( ){
	 if( $("#newPwd").val().length>=1){
		 $("#errorMsg1").text("");
	 }
 }
 function clean2( ){
	 if( $("#newPwd").val() == $("#comfirPwd").val()  ){
		 $("#errorMsg2").text("");
	 }
 
 }
 
 