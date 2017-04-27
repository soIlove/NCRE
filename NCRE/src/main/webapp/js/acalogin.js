$("#acalogin").click(function(){
	var acemail=$("#acemail_1").val();
	var acloginpwd=$("#acloginpwd_1").val();
	if(acemail!=""&acloginpwd!=""){
		$.get("acaadmin/login?acemail="+acemail+"&acloginpwd="+acloginpwd,function(data){
			
			if(data){
				location.href="/NCRE/page/acaindex.jsp";
			}else{
				alert("用户名或密码不正确");
				location.href="/NCRE/page/acalogin.jsp";
			}
		})
	}
})


function addpic(obj){
	var picpath=window.URL.createObjectURL(obj.files[0]);	
	$("#acpicture_1").attr("src",picpath)
}

$.post("acaadmin/findacademy",function(data){
	for(var i=0;i<data.length;i++){
		$("#acacademyid").append('<option value="'+data[i].aid+'">'+data[i].aname+'</option>')
		
	}
},"json")


$("#acphone").blur(function(){
	
	 var phoneNum = $("#acphone").val();
    if (phoneNum.length == 11) {
        var isPhone = /^1[3-9]\d{9}$/;
        if (isPhone.test(phoneNum)) {
        } else {
        	document.getElementById("errmsgphone").style.display="block";
        }
    } else {
    	 document.getElementById("errmsgphone").style.display="block";
    }
});




$("#RegistForm").form({
	
		url:"acaadmin/RegistExaminee",
		success:function(data){
		if(data){
			alert("恭喜你注册成功,请等待审核");
			window.location.href="page/acalogin.jsp"
		}	
			
		}
	

})


