<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="/zhaixiaodi/">
<title>登录</title>
<link type="text/css" rel="stylesheet" href="easyui/themes/icon.css">
<link type="text/css" rel="stylesheet" href="easyui/themes/default/easyui.css">
<link type="text/css" rel="stylesheet" href="css/loginAdmin.css">
</head>
<body>
	<div id="loginDiv">
		<form id="loginForm" action="admin/login" method="post">
			<p><label>${errorMsg }&nbsp;</label></p><c:remove var="errorMsg" scope="session"/>
			<p><input name="adname" value="" placeholder="请输入姓名" required="required"/></p>
			<p><input type="password" value="" name="adpwd" placeholder="请输入密码"  required="required"/></p>
			<p><img src="randImg.jpg" alt="正在加载验证啊" title="看不清，换一张"/><input name="vcode" placeholder="请输入验证码" id="vcode"  required="required"/></p>
			<p><input type="submit" value="登录" id="loginBtn"/></p>
			<a href="page/forgetPassword.jsp">忘记密码</a>
		</form>
	</div>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js_1/loginAdmin.js"></script>
</body>
</html>