<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<base href="/zhaixiaodi/">

<title>修改密码</title>
</head>
<body>

	<form id="editPwdForm"   method="post" style="text-align: center;   margin-top: 60px;">
		<input type="hidden" value="${loginAdmin.adid}" name="adid"/>
		新密码:<input type="password" name="newPwd" id="newPwd" onblur="clean1( )"/>
		<p id="errorMsg1" style="color: red"></p><br><br>
		确认密码:<input type="password" name="comfirPwd" onblur="clean2( )" id="comfirPwd"/><br><br>
		<p id="errorMsg2" style="color: red"></p>
		<input type="button" value="确认" id="modify" onclick="return modifyPwd()"/>
	</form>

	 
	<script type="text/javascript" src="js_1/adminModifyPwd.js"></script>

</body>
</html>