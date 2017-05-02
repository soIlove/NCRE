<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html >
<head>
	
	<base href="/NCRE/">

	<meta charset="utf-8" />

	<title>NCRE | Login Page</title>

	<meta content="width=device-width, initial-scale=1.0" name="viewport" />

	<meta content="" name="description" />

	<meta content="" name="author" />

	<!-- BEGIN GLOBAL MANDATORY STYLES -->

	<link href="media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/style-metro.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/style.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/style-responsive.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>

	<link href="media/css/uniform.default.css" rel="stylesheet" type="text/css"/>

	<!-- END GLOBAL MANDATORY STYLES -->

	<!-- BEGIN PAGE LEVEL STYLES -->

	<link href="media/css/login.css" rel="stylesheet" type="text/css"/>

	<!-- END PAGE LEVEL STYLES -->

	<link rel="shortcut icon" href="media/image/favicon.ico" />

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="login">

	<!-- BEGIN LOGO -->

	<div class="logo">

		<img src="media/image/logo-big.png" alt="" /> 

	</div>

	<!-- END LOGO -->

	<!-- BEGIN LOGIN -->

	<div class="content">

		<!-- BEGIN LOGIN FORM -->

		<form class="form-vertical login-form" action="javascript:void(0)">

			<h3 class="form-title">请登录您的账号</h3>

			<div class="alert alert-error hide">

				<button class="close" data-dismiss="alert"></button>

				<span>Enter any username and password.</span>

			</div>

			<div class="control-group">

				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->

				<label class="control-label visible-ie8 visible-ie9">email</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-user"></i>

						<input class="m-wrap placeholder-no-fix" type="text" placeholder="请输入邮箱" name="email" id="acemail_1" value="1914588314@qq.com"/>

					</div>

				</div>

			</div>

			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">password</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-lock"></i>

						<input class="m-wrap placeholder-no-fix" type="password" placeholder="请输入密码" name="acloginpwd" id="acloginpwd_1" value="a"/>

					</div>

				</div>

			</div>

			<div class="form-actions">

				<label class="checkbox">

				<input type="checkbox" name="remember" value="1"/> 记住密码

				</label>

				<button type="submit" class="btn green pull-right" id="acalogin">

				Login <i class="m-icon-swapright m-icon-white"></i>

				</button>            

			</div>

			<div class="forget-password">

				<h4>忘记密码 ?</h4>

				<p>

					不用担心，点击 <a href="javascript:;" class="" id="forget-password">这里</a>

				 	重新设置你的密码.

				</p>

			</div>

			<div class="create-account">

				<p>

					你难道还没有账号吗 ?&nbsp; 

					<a href="javascript:;" id="register-btn" class="">创建账号</a>

				</p>

			</div>

		</form>

		<!-- END LOGIN FORM -->        

		<!-- BEGIN FORGOT PASSWORD FORM -->

		<form class="form-vertical forget-form" action="javascript:void(0)"  >

			<h3 class="">Forget Password ?</h3>

			<p>Enter your e-mail address below to reset your password.</p>

			<div class="control-group">

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-envelope"></i>

						<input class="m-wrap placeholder-no-fix" type="text" placeholder="Email" name="email" />

					</div>

				</div>

			</div>

			<div class="form-actions">

				<button type="button" id="back-btn" class="btn">

				<i class="m-icon-swapleft"></i> Back

				</button>

				<button type="submit" class="btn green pull-right">

				Submit <i class="m-icon-swapright m-icon-white"></i>

				</button>            

			</div>

		</form>

		<!-- END FORGOT PASSWORD FORM -->

		<!-- BEGIN REGISTRATION FORM -->

		<form class="form-vertical register-form" action="javascript:void(0)" id="RegistForm" enctype="multipart/form-data" method="post">

			<h3 class="">Sign Up</h3>

			<p>Enter your account details below:</p>
			
			
			<div class="control-group">

				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->

				<label class="control-label visible-ie8 visible-ie9">acemail</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-envelope"></i>

						<input class="m-wrap placeholder-no-fix" type="text" placeholder="请填写邮箱" name="acemail" value="13207343805@163.com"/>

					</div>

				</div>

			</div>

			

			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9" >acloginpwd</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-lock"></i>

						<input class="m-wrap placeholder-no-fix" type="password" id="register_password" placeholder="密码" name="acloginpwd" value="a"/>

					</div>

				</div>

			</div>

			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">rpassword</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-ok"></i>

						<input class="m-wrap placeholder-no-fix" type="password" placeholder="确认密码" name="rpassword" value="a" required="required"/>

					</div>

				</div>

			</div>
			
			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">acloginname</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-user"></i>

						<input class="m-wrap placeholder-no-fix" type="text" placeholder="请填写姓名" name="acloginname" value="侯亮平"  required="required"/>

					</div>

				</div>

			</div>
			
			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">证件照</label>

				<div class="controls">

					<div class="input-icon left">
						 <div class="zw">
                                    <input name="acpicdata" id="acpicdata"  multiple="multiple" type="file" style="display:none" onchange="addpic(this)"  required="required">
                                  <a href="javascript:void(0)" onclick="document.getElementById('acpicdata').click();"><div id="picdiv" style='width:100px;height:100px;border:1px solid #666;overflow:hidden;';><img id="acpicture_1" src="images/long.png"></div></a>
                          </div>
						

					</div>

				</div>

			</div>
			
			<div class="control-group">
			<label class="control-label visible-ie8 visible-ie9">acsex</label>

				<div class="controls">

					<div class="input-icon left">

									<label class="checkbox-inline">
						<input type="radio" name="acsex" id="acsex_1" value="男" checked  > 男
					</label>
					<label class="checkbox-inline">
						<input type="radio" name="acsex" id="acsex_2"  value="女" >女
					</label>

					</div>

				</div>

			</div> 
			
			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">学院</label>

				<div class="controls">

					<div class="input-icon left">



						      <div class="col-lg-10 error">
						        <select id="acacademyid" name="acacademyid"class="selectpicker show-tick form-control"  required="required">
						        <option value="1" selected>请选择</option>
						       
						        </select>
						      </div>

					</div>

				</div>

			</div>
			
			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">acwork</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-user"></i>

						<input class="m-wrap placeholder-no-fix" type="text" placeholder="职称" name="acwork" id="acwork" maxlength="20" value="反贪局局长"  required="required"/>

					</div>

				</div>

			</div>
			
			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">acphone</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-phone"></i>

						<input class="m-wrap placeholder-no-fix" type="text" placeholder="请输入手机号码" name="acphone" id="acphone" value="13207343805"  required="required"/>
						<label id="errmsgphone" style="display:none; color:red">你输入的格式不正确哦，请重修输入</label>
					</div>

				</div>

			</div>

			

			<div class="control-group">

				<div class="controls">

					<label class="checkbox">

					<input type="checkbox" name="tnc"  required="required"/> I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a>

					</label>  

					<div id="register_tnc_error"></div>

				</div>

			</div>

			<div class="form-actions">

				<button id="register-back-btn" type="button" class="btn">

				<i class="m-icon-swapleft"></i>  Back

				</button>

				<input type="submit" id="Regirstexaminee" class="btn green pull-right" value="点击注册">

			</div>

		</form>

		<!-- END REGISTRATION FORM -->

	</div>

	<!-- END LOGIN -->

	<!-- BEGIN COPYRIGHT -->

	<div class="copyright">

		2017 &copy; NCRE. Admin Cyber Oar.

	</div>

	<!-- END COPYRIGHT -->

	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

	<!-- BEGIN CORE PLUGINS -->

	<script src="media/js/jquery-1.10.1.min.js" type="text/javascript"></script>

	<script src="media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->

	<script src="media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      

	<script src="media/js/bootstrap.min.js" type="text/javascript"></script>

	<!--[if lt IE 9]>

	<script src="media/js/excanvas.min.js"></script>

	<script src="media/js/respond.min.js"></script>  

	<![endif]-->   

	<script src="media/js/jquery.slimscroll.min.js" type="text/javascript"></script>

	<script src="media/js/jquery.blockui.min.js" type="text/javascript"></script>  

	<script src="media/js/jquery.cookie.min.js" type="text/javascript"></script>

	<script src="media/js/jquery.uniform.min.js" type="text/javascript" ></script>

	<!-- END CORE PLUGINS -->

	<!-- BEGIN PAGE LEVEL PLUGINS -->

	<script src="media/js/jquery.validate.min.js" type="text/javascript"></script>

	<!-- END PAGE LEVEL PLUGINS -->

	<!-- BEGIN PAGE LEVEL SCRIPTS -->

	<script src="media/js/app.js" type="text/javascript"></script>

	<script src="media/js/login.js" type="text/javascript"></script>  
	
	
	<!-- <script src="easyui/jquery.min.js" type="text/javascript"></script> -->
	<script src="easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
	<script src="easyui/jquery.easyui.min.js" type="text/javascript"></script>
	
	<script src="js/acalogin.js" type="text/javascript"></script>     

	<!-- END PAGE LEVEL SCRIPTS --> 

	<script>

		jQuery(document).ready(function() {     

		  App.init();

		  Login.init();

		});

	</script>

	<!-- END JAVASCRIPTS -->

</body>

<!-- END BODY -->

</html>