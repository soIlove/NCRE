$('#orderList').datagrid({
	url : 'zxd/list',
	loadMsg: "数据加载中...",
	pagination : true, //底部显示分页工具栏
	toolbar : '#toolSignIn',
	pageList : [ 5, 10, 15, 20, 25, 30 ],/* 每页的条数(可选) */
	fitColumns : true,// 自适应
	singleSelect : true,// 只能选择一条(单选)
	columns : [ [{field : 'oid',title : '投单编号',width : 70,align : 'center'},
	             {field : 'uname',title : '投单者昵称',width : 85,align : 'center'},
				{field : 'orelname',title : '投单者姓名',width : 85,align : 'center'},
				{field : 'otime', title : '投单时间',width : 90,align : 'center'},
				{field : 'ocode',title : '取货码',width : 70,align : 'center'},
				{field : 'osize',title : '包裹大小',width : 80,align : 'center'},
				{field : 'odesc',title : '投单描述',width : 130,align : 'center'},
				{field : 'oprice',title : '代递金额',width : 60,align : 'center'},
				{field : 'otype',title : '快递类型',width : 90,align : 'center'},
				{field : 'zaddr',title : '地址',width :120,align : 'center'	},
				 
			 ] ]
 });
//搜索投单
function searchOrder() {
	var name = $("#name").val();
	$.get(	"zxd/searchOrder?name=" + name,	 function(data) {
				 $('#orderList').datagrid('loadData', {
					 total : 0,
					 rows : []
				 });
						if (data != null) {
//							alert(JSON.stringify(data.rows[0].oid));
							for (var i = 0; i < data.rows.length; i++) {
								$('#orderList').datagrid('appendRow',{
									oid : data.rows[i].oid,
									uname : data.rows[i].uname,
									orelname : data.rows[i].orelname,
									otime : data.rows[i].otime,
									ocode : data.rows[i].ocode,
									osize : data.rows[i].osize,
									odesc : data.rows[i].odesc,
									oprice : data.rows[i].oprice,
									otype : data.rows[i].otype,
									zaddr : data.rows[i].zaddr,
								});
							}
						}
					}, "json");
	$("#name").val("");//清空搜索框
}

 
 function dele(uuid ){
	  $.get("zxd/del?uuid="+uuid,function(data){
		if(!data){
			$.messager.show({
				title : '删除信息',
				msg : '删除失败!!',
				showType : 'show',
				style : {
					top : document.body.scrollTop
							+ document.documentElement.scrollTop,
					bottom : ''
				}
			});
		
		}else{
			$("#tel").val("");//清空搜索框
			searchSignInInfo();
		}
	},"json");
  }