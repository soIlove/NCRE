<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>
<style>
	
	.m{
		margin-left:200px;
	}
	
	#pic,#epic{
		width:140px;
		height:160px;
	}
	.file {
    position:absolute;
    margin-left:830px;
    margin-top:-320px;
    display: inline-block;
   	color: #888;
    background: #fafafa;
    border: 1px solid #ddd;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
}
.file input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.file:hover {
    background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: none;
}
	
.span3{
	margin-right:80px;
}
</style>
	<base href="/NCRE/">
	<meta charset="utf-8" />

	<title>Metronic | Form Stuff - Form Wizard</title>

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
	<link rel="stylesheet" type="text/css" href="media/css/select2_metro.css" />
	<link rel="stylesheet" type="text/css" href="datetime/css/bootstrap-datetimepicker.css" />
		<link rel="stylesheet" type="text/css" href="datetime/css/bootstrap-datetimepicker.min.css" />
	<link rel="stylesheet" type="text/css" href="media/css/chosen.css" />

	<!-- END PAGE LEVEL STYLES -->

	<link rel="shortcut icon" href="media/image/favicon.ico" />

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="page-header-fixed">

	<!-- BEGIN HEADER -->

	<div class="header navbar navbar-inverse navbar-fixed-top">
		
		
			
			<input type="hidden" id="sname_2" value="${loginUser.sname} }">
		<!-- BEGIN TOP NAVIGATION BAR -->

		<div class="navbar-inner">

			<div class="container-fluid">

				<!-- BEGIN LOGO -->

				<a class="brand" href="index.jsp">

				<img src="media/image/logo.png" alt="logo" />

				</a>

				<!-- END LOGO -->

				<!-- BEGIN RESPONSIVE MENU TOGGLER -->

				<a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">

				<img src="media/image/menu-toggler.png" alt="" />

				</a>          

				<!-- END RESPONSIVE MENU TOGGLER -->            

				<!-- BEGIN TOP NAVIGATION MENU -->              

				<ul class="nav pull-right">

					<!-- BEGIN USER LOGIN DROPDOWN -->

					<li class="dropdown user">

						<a href="index.jsp" class="dropdown-toggle" data-toggle="dropdown">


						<span class="username">${loginUser.sname} </span>

						<i class="icon-angle-down"></i>

						</a>

						<ul class="dropdown-menu">
							<li><a href="page/login.html"><i class="icon-key"></i> Log Out</a></li>
						</ul>

					</li>

					<!-- END USER LOGIN DROPDOWN -->

				</ul>

				<!-- END TOP NAVIGATION MENU --> 

			</div>

		</div>

		<!-- END TOP NAVIGATION BAR -->

	</div>

	<!-- END HEADER -->

	<!-- BEGIN CONTAINER -->

	<div class="page-container rowfluid">

		<!-- BEGIN SIDEBAR -->

		<div class="page-sidebar nav-collapse collapse">

			<!-- BEGIN SIDEBAR MENU -->        

			<ul class="page-sidebar-menu">

				<li>

					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->

					<div class="sidebar-toggler hidden-phone"></div>

					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->

				</li>

				<li>

					<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->

					<form class="sidebar-search">

						<div class="input-box">

							<a href="javascript:;" class="remove"></a>

							<input type="text" placeholder="Search..." />

							<input type="button" class="submit" value=" " />

						</div>

					</form>

					<!-- END RESPONSIVE QUICK SEARCH FORM -->

				</li>

				<li class="start active ">

					<a href="index.jsp">

					<i class="icon-home"></i> 

					<span class="title">报考新闻</span>

					<span class="selected"></span>

					</a>

				</li>



				<li class="">

					<a href="javascript:;">

					<i class="icon-table"></i> 

					<span class="title">报考版块</span>

					<span class="arrow "></span>

					</a>

					<ul class="sub-menu" style="display:block">

					

						<li class="active" >

							<a href="page/apply.jsp">

							申请报名</a>

						</li>
						
						
						<li >

							<a href="page/profile_msg.jsp">

							个人报考信息</a>

						</li>


					</ul>

				</li>



			</ul>

			<!-- END SIDEBAR MENU -->

		</div>

	</div>
		<!-- END SIDEBAR -->

		<!-- BEGIN PAGE -->  

		<div class="page-content">

			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->

			<div id="portlet-config" class="modal hide">

				<div class="modal-header">

					<button data-dismiss="modal" class="close" type="button"></button>

					<h3>portlet Settings</h3>

				</div>

				<div class="modal-body">

					<p>Here will be a configuration form</p>

				</div>

			</div>
			
			<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->

			<!-- BEGIN PAGE CONTAINER-->

			<div class="container-fluid">

				<!-- BEGIN PAGE HEADER-->   

				<div class="row-fluid">

					<div class="span12">

						<!-- BEGIN STYLE CUSTOMIZER -->

						<div class="color-panel hidden-phone">

							<div class="color-mode-icons icon-color"></div>

							<div class="color-mode-icons icon-color-close"></div>

							<div class="color-mode">

								<p>THEME COLOR</p>

								<ul class="inline">

									<li class="color-black current color-default" data-style="default"></li>

									<li class="color-blue" data-style="blue"></li>

									<li class="color-brown" data-style="brown"></li>

									<li class="color-purple" data-style="purple"></li>

									<li class="color-grey" data-style="grey"></li>

									<li class="color-white color-light" data-style="light"></li>

								</ul>

								<label>

									<span>Layout</span>

									<select class="layout-option m-wrap small">

										<option value="fluid" selected>Fluid</option>

										<option value="boxed">Boxed</option>

									</select>

								</label>

								<label>

									<span>Header</span>

									<select class="header-option m-wrap small">

										<option value="fixed" selected>Fixed</option>

										<option value="default">Default</option>

									</select>

								</label>

								<label>

									<span>Sidebar</span>

									<select class="sidebar-option m-wrap small">

										<option value="fixed">Fixed</option>

										<option value="default" selected>Default</option>

									</select>

								</label>

								<label>

									<span>Footer</span>

									<select class="footer-option m-wrap small">

										<option value="fixed">Fixed</option>

										<option value="default" selected>Default</option>

									</select>

								</label>

							</div>

						</div>
	</div>
						<!-- END BEGIN STYLE CUSTOMIZER -->   

						<h3 class="page-title">

							申请报名

							 <small>计算机等级考试报名</small>

						</h3>

						<ul class="breadcrumb">

							<li>

								<i class="icon-home"></i>

								<a href="index.jsp">主页</a> 

								<span class="icon-angle-right"></span>

							</li>

							<li>

								<a href="index.jsp">报考版块</a>

								<span class="icon-angle-right"></span>

							</li>

							<li><a href="page/apply.jsp">申请报名</a></li>

						</ul>

					</div>

				</div>

				<!-- END PAGE HEADER-->

				<!-- BEGIN PAGE CONTENT-->

				<div class="row-fluid">

					<div class="span12">

						<div class="portlet box blue" id="form_wizard_1">

							<div class="portlet-title">

								<div class="caption">

									<i class="icon-reorder"></i>  <span class="step-title">申请流程</span>

								</div>

								<div class="tools hidden-phone">

									<a href="javascript:;" class="collapse"></a>

									<a href="#portlet-config" data-toggle="modal" class="config"></a>

									<a href="javascript:;" class="reload"></a>

									<a href="javascript:;" class="remove"></a>

								</div>

							</div>

							<div class="portlet-body form">

								<form action="javascript:void(0)" class="form-horizontal" id="submit_form" enctype="multipart/form-data" method="post">
			
									<div class="form-wizard">

										<div class="navbar steps">

											<div class="navbar-inner">

												<ul class="row-fluid">

													<li class="span3">

														<a href="#tab1" data-toggle="tab" class="step active">

														<span class="number">1</span>

														<span class="desc"><i class="icon-ok"></i> 完善学生信息</span>   

														</a>

													</li>

													<li class="span3">

														<a href="#tab2" data-toggle="tab" class="step">

														<span class="number">2</span>

														<span class="desc"><i class="icon-ok"></i>选择考试类型</span>   

														</a>

													</li>

													<li class="span3">

														<a href="#tab3" data-toggle="tab" class="step">

														<span class="number">3</span>

														<span class="desc"><i class="icon-ok"></i> 确认提交</span>   

														</a>

													</li>


												</ul>

											</div>

										</div>
								</div>
										<div id="bar" class="progress progress-success progress-striped">

											<div class="bar"></div>

										</div>

										<div class="tab-content">

											<div class="alert alert-error hide">

												<button class="close" data-dismiss="alert"></button>

												您填写的信息有误！请仔细核查！

											</div>

											<div class="alert alert-success hide">

												<button class="close" data-dismiss="alert"></button>

												恭喜您，提交成功！

											</div>

											<div class="tab-pane active" id="tab1">

												<h3 class="block">完善报名信息</h3>
												
												<input type="hidden" id="sid_2" name="sid" value="${loginUser.sid}">
												
												<input type="hidden" id="tename" name="tename" value="">
												
												<div class="control-group">

													<label class="control-label">姓名<span class="required">*</span></label>

													<div class="controls">

														<input type="text" class="span6 m-wrap" name="sname" readonly="readonly" id="sname" value="${loginUser.sname }"/>

														<span class="help-inline"></span>

													</div>

												</div>
												<div class="control-group">
		                                        <label class="control-label">性别<span class="required">*</span></label>
															<div class="controls">
														  <label class="radio-inline">
															  &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="ssex" value="男" checked >男
														</label>
														<label class="radio-inline">
														&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="ssex" value="女">女
														</label>
															</div>
												  </div>
		                                        <div class="control-group">

													<label class="control-label">出生日期<span class="required">*</span></label>

													<div class="controls">
														<div id="datetimepicker" class="input-append date">
														      <input type="text" id="ebirthday" name="ebirthday" required="required"></input>
														      <span class="add-on" style="height:20px;"><i class="icon-th"></i></span>
														    </div>
														<span class="help-inline"></span>

													</div>

												
											    </div> 
											    
											    <div class="control-group">

													<label class="control-label">证件头像<span class="required">*</span></label>

													<div class="controls">
														<div class="zw">
                                				    <input name="epicdata" id="epicdata"  multiple="multiple" type="file" style="display:none" onchange="addpic(this)"  required="required">
                               					   <a href="javascript:void(0)" onclick="document.getElementById('epicdata').click();"><div id="picdiv" style='width:100px;height:100px;border:1px solid #666;'><img style="width:98px;height:98px;" id="pic" alt="证件照" src="images/not_pic.jpg"></div></a>
                         							 </div>	
											    </div>

													</div>

												
												
												<div class="control-group">

													<label class="control-label">民族<span class="required">*</span></label>

													<div class="controls">

														<input type="text" class="span6 m-wrap" name="enation" required="required" id="enation"/>

														<span class="help-inline"></span>

													</div>

												</div>
												<div class="control-group">

													<label class="control-label">证件号码<span class="required">*</span></label>

													<div class="controls">

														<input type="text" class="span6 m-wrap" name="eidentif" required="required" maxlength="18" id="eidentif"/>

														<span class="help-inline"></span>

													</div>

												</div>
												<div class="control-group">

													<label class="control-label">联系电话<span class="required">*</span></label>

													<div class="controls">

														<input type="tel" class="span6 m-wrap" name="ephone" maxlength="11" required="required" id="ephone"/>

														<span class="help-inline"></span>

													</div>

												</div>

												<div class="control-group">

													<label class="control-label">职业<span class="required">*</span></label>

													<div class="controls">

														<input type="text" class="span6 m-wrap" name="ework" id="ework" required="required"/>

														<span class="help-inline"></span>

													</div>
													</div>

												<div class="control-group">

													<label class="control-label">家庭住址<span class="required">*</span></label>

													<div class="controls">

														<input type="text" class="span6 m-wrap" name="eaddr" id="eaddr" required="required"/>

														<span class="help-inline"></span>

													</div>

												</div>
												
											<!-- 	<div class="control-group">
													<img src="media/image/8.jpg"  class="img-thumbnail" id="pic" style="position:absolute;margin-left:800px;margin-top:-500px;">
													
    												<input  name="epicdata" id ="epicdata" onchange="chgPic(this)" multiple="multiple" type="file" value="上传文件">
													
													
													
											    </div> -->
												
											</div>
												
											<div class="tab-pane" id="tab2">

												<h3 class="block">报考等级信息</h3>
												<div class="control-group">

													<label class="control-label">一级<span class="required">*</span></label>
												</div>

												<div class="control-group m" id="one">

													
												</div>

												<div class="control-group">

													<label class="control-label">二级<span class="required">*</span></label>

												</div>

												<div class="control-group m" id="two">

												</div>


												<div class="control-group">

													<label class="control-label">三级<span class="required">*</span></label>

											</div>

												<div class="control-group m" id="three">


												</div>

												<div class="control-group">

													<label class="control-label">其他<span class="required">*</span></label>

												</div>

												<div class="control-group m" id="else">


												</div>

											</div>

											<div class="tab-pane" id="tab3">

												<h3 class="block">提交信息</h3>

												<div class="control-group">

													<label class="control-label">姓名:</label>

													<div class="controls">

														<span class="text display-value" data-display="username" id="name" ></span>

													</div>

												</div>

												<div class="control-group">

													<label class="control-label">性别:</label>

													<div class="controls">

														<span class="text display-value" data-display="email" id="sex"></span>

													</div>

												</div>

												<div class="control-group">

													<label class="control-label">出生日期:</label>

													<div class="controls">

														<span class="text display-value" data-display="fullname" id="birth"></span>

													</div>

												</div>

												<div class="control-group">

													<label class="control-label">民族:</label>

													<div class="controls">

														<span class="text display-value" data-display="gender" id="nation"></span>

													</div>

												</div>

												<div class="control-group">

													<label class="control-label">证件号码:</label>

													<div class="controls">

														<span class="text display-value" data-display="phone" id="identif"></span>

													</div>

												</div>

												<div class="control-group">

													<label class="control-label">联系电话:</label>

													<div class="controls">

														<span class="text display-value" data-display="address" id="phone"></span>

													</div>

												</div>

												<div class="control-group">

													<label class="control-label">职业:</label>

													<div class="controls">

														<span class="text display-value" data-display="city" id="work"></span>

													</div>

												</div>

												<div class="control-group">

													<label class="control-label">家庭住址:</label>

													<div class="controls">

														<span class="text display-value" data-display="country" id="addr"></span>

													</div>

												</div>

												<div class="control-group">

													<label class="control-label">报考项目:</label>

													<div class="controls">

														<span class="text display-value" data-display="remarks" id="test"></span>

													</div>
													<div class="control-group">
													<img src="media/image/8.jpg" alt="证件照" class="img-thumbnail" id="epic" style="position:absolute;margin-left:400px;margin-top:-430px;">
											    </div>

											</div>
											</div>

										<div class="form-actions clearfix">

											<a href="javascript:;" class="btn button-previous">

											<i class="m-icon-swapleft"></i> Back 

											</a>

											<a href="javascript:;" class="btn blue button-next" id="con">

											Continue <i class="m-icon-swapright m-icon-white"></i>

											</a>

											<input type="submit" class="btn green button-submit" id="subTest" value="提交">

											 <i class="m-icon-swapright m-icon-white"></i>

											

										</div>

									</div>

								</form>

							</div>

						</div>

					</div>

				</div>

				<!-- END PAGE CONTENT-->         

			</div>

			<!-- END PAGE CONTAINER-->


		<!-- END PAGE -->  


	<!-- END CONTAINER -->

	<!-- BEGIN FOOTER -->

	<div class="footer">

		<div class="footer-inner">

			2017 &copy; NCRE. Admin Cyber Oar.

		</div>

		<div class="footer-tools">

			<span class="go-top">

			<i class="icon-angle-up"></i>

			</span>

		</div>

	</div>

	<!-- END FOOTER -->

	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

	<!-- BEGIN CORE PLUGINS -->

	<script src="media/js/jquery-1.10.1.min.js" type="text/javascript"></script>
	<script src="datetime/js/bootstrap-datetimepicker.js" type="text/javascript"></script>
	<script src="datetime/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	<script src="datetime/js/locales/bootstrap-datetimepicker.fr.js" type="text/javascript"></script>
	<script src="datetime/js/locales/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
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

	<script type="text/javascript" src="media/js/jquery.validate.min.js"></script>

	<script type="text/javascript" src="media/js/additional-methods.min.js"></script>

	<script type="text/javascript" src="media/js/jquery.bootstrap.wizard.min.js"></script>

	<script type="text/javascript" src="media/js/chosen.jquery.min.js"></script>

	<script type="text/javascript" src="media/js/select2.min.js"></script>
	
	<script src="easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
	<script src="easyui/jquery.easyui.min.js" type="text/javascript"></script>
	
	<script type="text/javascript" src="js/apply.js"></script>

	<!-- END PAGE LEVEL PLUGINS -->

	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	

	<script src="media/js/app.js"></script>

	<script src="media/js/form-wizard.js"></script>     

	<!-- END PAGE LEVEL SCRIPTS -->

	<script>

		jQuery(document).ready(function() {       

		   // initiate layout and plugins

		   App.init();

		   FormWizard.init();

		});

	</script>

	<!-- END JAVASCRIPTS -->   

</body>

<!-- END BODY -->

</html>