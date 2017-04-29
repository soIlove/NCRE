$(function(){
	var sname=$("#name").text();
	 $.get("user/show?sname="+sname,function(data){
			$("#birth").text(data.ebirthday);
			$("#nation").text(data.enation);
			$("#identif").text(data.eidentif);
			$("#phone").text(data.ephone);
			$("#work").text(data.ework);
			$("#addr").text(data.eaddr);
			$("#epic").attr("src",data.epicture);
	 })
	 
	 $.get("user/tests?sname="+sname,function(data){
		 $("#test").text(data);
	 })
	 
	 $.get("user/stuation?sname="+sname,function(data){
		$("#station").text(data);
	 })
})