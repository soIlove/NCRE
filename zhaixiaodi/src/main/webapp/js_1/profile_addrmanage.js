var uphone='18188970546';
var uuid=$('#uuidhidden').val();

$('#addDIV').window({    
    width:400,    
    height:250,    
    modal:true,   
    minimizable:false,
    maximizable:false,
    collapsible:false,
    title:'添加新地址',
    closed:true
});

$.post("zxd/getaddr",{'uuid':uuid},function(data){
		
		for(var i=0;i<data.length;i++){
			$("#profile_ul_addr").append("<li class='profile_li_addr_1'  id='li"+i+"'><div class='profile_div_addr_1' ><span>"+data[i].zaddr+"</span>" 
					+"&nbsp;&nbsp;<a  href='javaScript:void(0)' class='profile_a_addr' onclick='deladdr("+data[i].zid+","+i+")'>删除</a></div></li>")
		
		}
},"json")
function deladdr(zid,liId){
	$("#li"+liId).remove();
	
	$.post("zxd/deladdr",{"zid":zid},function(data){
		
},"json")

}
function addaddr(){	
	$('#addDIV').window('open')		
}

function addaddr_3(){
	var zaddr=$("#newAdd").val();
	$.post("zxd/addaddr",{"zaddr":zaddr,"uuid":uuid},function(data){
		if(data){
			$('#addDIV').window('close');
			window.location.href="page/profile_addrmanage.jsp"
		}
	},"json")
	
}