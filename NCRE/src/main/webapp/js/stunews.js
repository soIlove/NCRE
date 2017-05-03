$('#view_show').dialog({    
    title: '新闻详情',  
    top:100,
    left:400,
    width: 600,
    height:500,
    closed: false,  
    cache: false,    
    modal: true   
});

$('#view_show').dialog("close");

function openView(obj){
	$('#view_show').dialog("open");
	var news_id=$(obj).parent().children("input").val();
	$.get("stuadmin/detailnews?news_id="+news_id,function(data){
		$("#detailName").text(data.news_name);
		$("#detailTime").text(data.news_date);
		$("#detailText").text(data.news_text);
		$("#detailImg").html(data.news_pic==null?"":"<img  src='"+data.news_pic+"' style='width: 380px; height: 200px; margin-bottom: 25px;'>");
		
	})
}