var sid=$("#sid_2").val(); 

$.post("user/ifbaomin",{"sid":sid},function(data){
	
	if(data!=null){
		alert("你已经完成报名，不能重复报名，可在个人中心查考报名情况 ")
		window.location.href="page/profile_msg.jsp";
	}

},"json")


$('#datetimepicker').datetimepicker({
	 minView: 'month',            //设置时间选择为年月日 去掉时分秒选择
     format:'yyyy-mm-dd',
     pickDate: true,
     pickTime: true,
     hourStep: 1,
     minuteStep: 15,
     secondStep: 30,
     inputMask: true,
     language: 'zh-CN'
   });

 function addpic(obj){
	 $("#pic").attr("src",window.URL.createObjectURL(obj.files[0]));
 }
 
 $(function(){
	 $.get("user/getTest",function(data){
			var str="";
		for(var i=0;i<data.length;i++){
			if(data[i].televel==1){
				str="<input type=\"checkbox\" value=\""+data[i].tename+"\" name=\"test\"/>&nbsp;&nbsp;"+data[i].tename+"&nbsp;&nbsp;&nbsp;&nbsp;"
				$("#one").append(str);
			}else if(data[i].televel==2){
				str="<input type=\"checkbox\"  value=\""+data[i].tename+"\" name=\"test\"/ >&nbsp;&nbsp;"+data[i].tename+"&nbsp;&nbsp;&nbsp;&nbsp;"
				$("#two").append(str);
			}else if(data[i].televel==3){
				str="<input type=\"checkbox\" value=\""+data[i].tename+"\" name=\"test\"/>&nbsp;&nbsp;"+data[i].tename+"&nbsp;&nbsp;&nbsp;&nbsp;"
				$("#three").append(str);
			}else{
				str="<input type=\"checkbox\" value=\""+data[i].tename+"\" name=\"test\"/>&nbsp;&nbsp;"+data[i].tename+"&nbsp;&nbsp;&nbsp;&nbsp;"
				$("#else").append(str);
			}
		}
	 })
 })
 
$("#con").click(function(){
	var obj=document.getElementsByName("test");
	var check_val=[];
	$("#name").text($("#sname").val());
	$("#sex").text($("input:radio:checked").val());
	$("#birth").text($("#ebirthday").val());
	$("#nation").text($("#enation").val());
	$("#identif").text($("#eidentif").val());
	$("#phone").text($("#ephone").val());
	$("#work").text($("#ework").val());
	$("#addr").text($("#eaddr").val());
	for(k in obj){
		if(obj[k].checked){
			check_val.push(obj[k].value);
		}
	}
	$("#test").text(check_val);
	 $("#epic").attr("src",$("#pic").attr("src"));
	$("#tename").val(check_val);
	 
}) 

/*$("#subTest").click(function(){
	var flag;
	$.post("user/apply",{sid:sid,sname:$("#sname").val(),ssex:$("input:radio:checked").val(),epicture:$("#pic").attr("src"),
		enation:$("#enation").val(),ebirthday:$("#ebirthday").val(),eidentif:$("#eidentif").val(),ework:$("#ework").val(),
		eaddr:$("#eaddr").val(),ephone:$("#ephone").val(),tename:$("#test").text()},function(data){
			if(data){
				alert("提交申请成功");
			}else{
				alert("提交申请失败，请核对您的信息是否有误");
			}
	})
})*/




$("#submit_form").form({
	url : "user/apply",
	success : function(data) {
		if (data) {
			alert("恭喜你报名成功,请等待审核");
			location.href = "page/profile_msg.jsp";
		}
	}
})

