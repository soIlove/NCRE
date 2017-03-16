$("#loginDiv").dialog({
	top:80,
	width:300,
	title:"",
	border:false,
	modal:true,	
});


$("#loginForm p img").click(function(){
	$(this).attr("src", "randImg.jpg?" + new  Date().getTime());
});
