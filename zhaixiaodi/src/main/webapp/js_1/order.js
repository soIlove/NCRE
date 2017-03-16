$('#seleaddrDIV').window({    
	    width:600,    
	    height:450,    
	    modal:true,   
	    minimizable:false,
	    maximizable:false,
	    collapsible:false,
	    title:'选择地址',
	   closed:true
	    	
	    
	}); 	


function order(){
	 var params=$('#iform').serialize();//获取值  
	 $.post("order/submit",params,function (data){
		 if(data){
			 alert("下单成功,即将跳往首页");
			 window.location.href="index.jsp";
		 }else{
			 alert("下单失败");
		 }
	 },"json");
	  	 
 }


function selectaddr(){
	$("#profile_ul_addr").html("");
	$('#seleaddrDIV').window('open'); 	
	
	
	var uuid=$('#uuidhidden').val();

	$.post("zxd/getaddr",{'uuid':uuid},function(data){
			for(var i=0;i<data.length;i++){
		
				$("#profile_ul_addr").append("<li class='profile_li_addr_1'  id='li"+i+"'><div class='profile_div_addr_1' ><span>"+data[i].zaddr+"</span>" 
						+"&nbsp;&nbsp;<a  href='javaScript:void(0)' class='profile_a_addr' onclick='ensureaddr(\""+data[i].zaddr+"\")'>选择</a></div></li>")
			}
	},"json")
}



function ensureaddr(zaddr){ 
	$("#seleaddrDIV").window('close');
	$("#oaddr").val(zaddr);
}

function addaddr(){
var zaddr=$("#addr_2_inp").val();
var uuid=$('#uuidhidden').val();
$.post("zxd/addaddr",{"zaddr":zaddr,"uuid":uuid},function(data){
	if(data){
		$("#oaddr").val(zaddr);
		$('#seleaddrDIV').window('close');		
	}
},"json")
}
