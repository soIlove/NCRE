var header="";
function edit(obj){
	var head = $(obj).parent().parent();
	header = head.html();
	var td="<td style='text-align: center;'><input type='text' class='m-wrap big' value='" + head.children("td:eq(0)").html() + "' disabled='disabled'></td>";
	td+="<td style='text-align: center;'><input type='text' class='m-wrap big' value='" + head.children("td:eq(1)").html() + "'></td>";
	td+="<td style='text-align: center;'><input type='text' class='m-wrap big' value='" + head.children("td:eq(2)").html() + "' disabled='disabled'></td>";
	td+="<td style='text-align: center;'><input type='text' class='m-wrap big' value='" + head.children("td:eq(3)").html() + "'></td>";
	td+="<td style='text-align: center;'><a class='' onclick='save(this)' href='javascript:void(0)'>Save</a></td>";
	td+="<td style='text-align: center;'><a class='' onclick='cancel(this)' href='javascript:void(0)'>Cancel</a></td>";
	head.html(td);
}

function del(obj){
	var delobj =$(obj).parent().parent();
	var cid= delobj.children("td:eq(2)").html();
	$.get("sysadmin/delsetting?cid="+cid,function(data){
		if(data){
			location.href="/NCRE/sysadmin/findacad";
		}
	})
}

function save(obj){
	var saveobj = $(obj).parent().parent();
	var aid= saveobj.children("td:eq(0)").children().val();
	var aname= saveobj.children("td:eq(1)").children().val();
	var cid= saveobj.children("td:eq(2)").children().val();
	var cname= saveobj.children("td:eq(3)").children().val();
	$.get("sysadmin/savesetting?aid="+aid+"&aname="+aname+"&cid="+cid+"&cname="+cname,function(data){
		if(data){
			location.href="/NCRE/sysadmin/findacad";
		}
	})
}

function cancel(obj){
	var head = $(obj).parent().parent();
	head.html(header);
}

function addnew(){
	$("#add_newDiv").attr("style","display:block");
}

function closenew(){
	$("#add_newDiv").attr("style","display:none");
}

function addAcad(){
	var aname = $("#atext").val();
	var cname = $("#ctext").val();
	$.get("sysadmin/addsetting?aname="+aname+"&cname="+cname,function(data){
		if(data){
			location.href="/NCRE/sysadmin/findacad";
		}else{
			alert("该院系班级信息已存在！");
		}
	});
}