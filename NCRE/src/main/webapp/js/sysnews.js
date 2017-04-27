var header="";
function edit(obj){
	$("#newsModifyDiv").attr("style","display:block");
	var head = $(obj).parent().parent();
	$("#news_id").val(head.children("td:eq(0)").html());
	$("#news_name").val(head.children("td:eq(1)").html());
	$("#news_text").html(head.children("td:eq(2)").html());
	$("#choiceImg").attr("src",head.children("td:eq(3)").children().attr("src")!=""?head.children("td:eq(3)").children().attr("src"):"images/not_pic.jpg");
}

function clickPic(obj){
	$(obj).parent().children("input").click();
}

function changePic(obj){
	$(obj).parent().children("img").attr('src',window.URL.createObjectURL(obj.files[0]));
};

function del(obj){
	var delobj =$(obj).parent().parent();
	var id= delobj.children("td:eq(0)").html();
	$.get("sysadmin/delnews?news_id="+id,function(data){
		if(data){
			location.href="/NCRE/sysadmin/findnews";
		}
	})
}


$("#modifyform").form({
	url:"sysadmin/savenews",
	success: function(data){
		if(data){
			location.href="/NCRE/sysadmin/findnews";
		}
	}
});

$("#addform").form({
	url:"sysadmin/addnews",
	success: function(data){
		if(data){
			location.href="/NCRE/sysadmin/findnews";
		}
	}
});

function openAddnews(){
	$("#newsAddDiv").attr("style","display:block");
}

function closeAddnews(){
	$("#newsAddDiv").attr("style","display:none");
}

function closeModifynews(){
	$("#newsModifyDiv").attr("style","display:none");
}

