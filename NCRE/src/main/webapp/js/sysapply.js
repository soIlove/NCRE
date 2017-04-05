/*$.post("sysadmin/findapply",function(data){
	var str="";
	for(var i=0;i<data.length;i++){
		str+="<tr class=''><td class='center'>"+data[i].acloginname+"</td><td class='center'>"+data[i].acemail+"</td><td class='center'>"+data[i].acsex+"</td>"+
			"<td class='center'><img src='"+data[i].acpicture+"'></td><td class='center'>"+data[i].acwork+"</td><td class='center'>"+data[i].academy.aname+"</td><td class='center'>"+data[i].acphone+"</td>"+
			"<td class='center'>"+data[i].actime+"</td>"+
			"<td><a class='' href='javascript:void(0)'>Agree</a></td>"+
			"<td><a class='' href='javascript:void(0)'>Disagree</a></td></tr>";
	}
	$("#applydata").append(str);
},"json");*/