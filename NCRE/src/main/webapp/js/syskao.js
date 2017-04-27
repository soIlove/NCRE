var header="";
function edit(obj){
	var head = $(obj).parent().parent();
	header = head.html();
	var td="<td style='text-align: center;'><input type='text' class='m-wrap big' value='" + head.children("td:eq(0)").html() + "' disabled='disabled'></td>";
	td+="<td style='text-align: center;'><input type='text' class='m-wrap small' value='" + head.children("td:eq(1)").html() + "'></td>";
	td+="<td style='text-align: center;'><input type='text' class='m-wrap samll' value='" + head.children("td:eq(2)").html() + "'></td>";
	td+="<td style='text-align: center;'><input type='text' class='m-wrap small' value='" + head.children("td:eq(3)").html() + "'></td>";
	td+="<td style='text-align: center;'><input type='text' class='m-wrap small' value='" + head.children("td:eq(4)").html() + "'></td>";
	td+="<td style='text-align: center;'><a class='' onclick='save(this)' href='javascript:void(0)'>Save</a></td>";
	td+="<td style='text-align: center;'><a class='' onclick='cancel(this)' href='javascript:void(0)'>Cancel</a></td>";
	head.html(td);
}

function cancel(obj){
	var head = $(obj).parent().parent();
	head.html(header);
}

function save(obj){
	var saveobj = $(obj).parent().parent();
	var krid= saveobj.children("td:eq(0)").children().val();
	var krclass= saveobj.children("td:eq(1)").children().val();
	var krtotal= saveobj.children("td:eq(2)").children().val();
	var krlou= saveobj.children("td:eq(3)").children().val();
	var kraddr= saveobj.children("td:eq(4)").children().val();
	$.get("sysadmin/savekao?krid="+krid+"&krclass="+krclass+"&krtotal="+krtotal+"&krlou="+krlou+"&kraddr="+kraddr,function(data){
		if(data){
			location.href="/NCRE/sysadmin/findkao";
		}
	})
}

function del(obj){
	var delobj =$(obj).parent().parent();
	var krid= delobj.children("td:eq(0)").html();
	$.get("sysadmin/delkao?krid="+krid,function(data){
		if(data){
			location.href="/NCRE/sysadmin/findkao";
		}
	})
}

function openAddnews(){
	$("#kaoAddDiv").attr("style","display:block");
}

function closeAddnews(){
	$("#kaoAddDiv").attr("style","display:none");
}

$("#addform").form({
	url:"sysadmin/addkao",
	success: function(data){
		if(data){
			location.href="/NCRE/sysadmin/findkao";
		}
	}
});