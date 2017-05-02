
var sid=$("#sid_2").val();
$.post("user/ifbaomin",{"sid":sid},function(data){
	
	if(data==""|data==null){
		alert("你还没有申请报名")
	}else if(data.tename==null){
		$("ssex").text(data.ssex);
		$("#nation").text(data.enation);
		$("#identif").text(data.eidentif);
		$("#phone").text(data.ephone);
		$("#work").text(data.ework);
		$("#addr").text(data.eaddr);
		$("#epic").attr("src",data.epicture)
		
	
		$("#test").text("您还未申请");
		$("#station").text("您还未申请");	
		
	}else{
		
		$("#ssex").text(data.ssex);
		$("#nation").text(data.enation);
		$("#identif").text(data.eidentif);
		$("#phone").text(data.ephone);
		$("#work").text(data.ework);
		$("#addr").text(data.eaddr);
		$("#epic").attr("src",data.epicture)
		
	
		$("#test").text(data.tename);
		$("#station").text(data.cstatus);
		
	}
	
},"json")



