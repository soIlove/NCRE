var phonenum="18188970546";
$.post("zxd/getusermsg",{"phonenum":phonenum},function(data){
	
	    $("#upicture").val(data.upicture);
		$("#upicimage").attr("src",data.upicture);
		$("#uname").val(data.uname);
		$("#uphone").val(data.uphone);
		$("#usex").val(data.usex);
		$("#uemail").val(data.uemail);
		$("#uaddr").val(data.uaddr);		
})

function addpic(obj){
	var picStr = window.URL.createObjectURL(obj.files[0]);
	$("#upicimage").attr("src", picStr);
};

$("#profile_msg").form({
	url: "zxd/updatemsg",
	success:function(data){
		if(data){
			alert("恭喜你，修改成功！")
		}
	}
});


