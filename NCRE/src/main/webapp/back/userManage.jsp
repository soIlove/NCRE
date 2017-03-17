<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<base href="/zhaixiaodi/">

<title>用户管理</title>
</head>
<body>

	<div id="toolSignIn">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" placeholder="请输入用户电话" name ="tel" id="tel">
		&nbsp;&nbsp;&nbsp;<a href="javascript:searchSignInInfo()" class="easyui-linkbutton"	data-options="iconCls:'icon-search',plain:true">搜索</a>  
	</div>
	
	<table id="userList" style="height: 100%;"></table>

	<script type="text/javascript" src="js_1/userManage.js"></script>

</body>
</html>