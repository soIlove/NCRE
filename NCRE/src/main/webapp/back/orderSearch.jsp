<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<base href="/zhaixiaodi/">

<title>投单查询</title>
</head>
<body>

	<div id="toolSignIn">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="请输入投单人姓名" name ="name" id="name">
		&nbsp;&nbsp;&nbsp;<a href="javascript:searchOrder()" class="easyui-linkbutton"	data-options="iconCls:'icon-search',plain:true">搜索</a>  
	</div>
	
	<table id="orderList" style="height: 100%;"></table>

	<script type="text/javascript" src="js_1/orderSearch.js"></script>

</body>
</html>