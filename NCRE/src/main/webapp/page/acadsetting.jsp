<%@page import="com.cyber.ncre.entity.academyAdmin"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<!-- BEGIN HEAD -->

<head>
<base href="/NCRE/">
<meta charset="utf-8" />

<title>Metronic | Data Tables - Editable Tables</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport" />

<meta content="" name="description" />

<meta content="" name="author" />

<!-- BEGIN GLOBAL MANDATORY STYLES -->

<link href="media/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />

<link href="media/css/bootstrap-responsive.min.css" rel="stylesheet"
	type="text/css" />

<link href="media/css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />

<link href="media/css/style-metro.css" rel="stylesheet" type="text/css" />

<link href="media/css/style.css" rel="stylesheet" type="text/css" />

<link href="media/css/style-responsive.css" rel="stylesheet"
	type="text/css" />

<link href="media/css/default.css" rel="stylesheet" type="text/css"
	id="style_color" />

<link href="media/css/uniform.default.css" rel="stylesheet"
	type="text/css" />

<!-- END GLOBAL MANDATORY STYLES -->

<!-- BEGIN PAGE LEVEL STYLES -->

<link rel="stylesheet" type="text/css"
	href="media/css/select2_metro.css" />

<link rel="stylesheet" href="media/css/DT_bootstrap.css" />
<link rel="stylesheet" href="css/acadsetting.css" />

<!-- END PAGE LEVEL STYLES -->

<link rel="shortcut icon" href="media/image/favicon.ico" />

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="page-header-fixed">

	<!-- BEGIN HEADER -->

	<div class="header navbar navbar-inverse navbar-fixed-top">

		<!-- BEGIN TOP NAVIGATION BAR -->

		<div class="navbar-inner">

			<div class="container-fluid">

				<!-- BEGIN LOGO -->

				<a class="brand" href="index.html"> <img
					src="media/image/logo.png" alt="logo" />

				</a>

				<!-- END LOGO -->

				<!-- BEGIN RESPONSIVE MENU TOGGLER -->

				<a href="javascript:;" class="btn-navbar collapsed"
					data-toggle="collapse" data-target=".nav-collapse"> <img
					src="media/image/menu-toggler.png" alt="" />

				</a>

				<!-- END RESPONSIVE MENU TOGGLER -->

				<!-- BEGIN TOP NAVIGATION MENU -->

				<ul class="nav pull-right">
					<li class="dropdown user"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <!-- <img alt="" src="media/image/avatar1_small.jpg" />-->

							<span class="username">${sysUser.syname}</span> <i
							class="icon-angle-down"></i>

					</a>

						<ul class="dropdown-menu">
							<li><a href="sysadmin/logout"><i class="icon-key"></i>
									Log Out</a></li>
						</ul></li>


				</ul>

			</div>

		</div>

		<!-- END TOP NAVIGATION BAR -->

	</div>

	<!-- END HEADER -->

	<!-- BEGIN CONTAINER -->

	<div class="page-container row-fluid">

		<!-- BEGIN SIDEBAR -->

		<div class="page-sidebar nav-collapse collapse">

			<!-- BEGIN SIDEBAR MENU -->

			<ul class="page-sidebar-menu">

				<li>
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->

					<div class="sidebar-toggler hidden-phone"></div> <!-- BEGIN SIDEBAR TOGGLER BUTTON -->

				</li>
				<br />



				<li class="active "><a href="javascript:;"> <i
						class="icon-th"></i> <span class="title">核心功能</span> <span
						class="selected"></span> <span class="arrow "></span>

				</a>

					<ul class="sub-menu">


						<li class=""><a href="sysadmin/findapply"> 申请管理</a></li>


						<li class="active"><a href="sysadmin/findacad"> 院系管理 </a></li>


						<li class=""><a href="sysadmin/findnews"> 新闻管理</a></li>


						<li class=""><a href="sysadmin/findkao"> 考场管理 </a></li>



					</ul></li>
			<li class="last "><a href="javascript:void(0)" onclick="exprotbaoMsg()"> <i
						class="icon-bar-chart"></i> <span class="title">报考统计</span>

				</a></li>
			</ul>

			<!-- END SIDEBAR MENU -->

		</div>

		<!-- END SIDEBAR -->

		<!-- BEGIN PAGE -->

		<!-- 中心部分 -->
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

									<li class="color-black current color-default"
										data-style="default"></li>

									<li class="color-blue" data-style="blue"></li>

									<li class="color-brown" data-style="brown"></li>

									<li class="color-purple" data-style="purple"></li>

									<li class="color-grey" data-style="grey"></li>

									<li class="color-white color-light" data-style="light"></li>

								</ul>

								<label> <span>Layout</span> <select
									class="layout-option m-wrap small">

										<option value="fluid" selected>Fluid</option>

										<option value="boxed">Boxed</option>

								</select>

								</label> <label> <span>Header</span> <select
									class="header-option m-wrap small">

										<option value="fixed" selected>Fixed</option>

										<option value="default">Default</option>

								</select>

								</label> <label> <span>Sidebar</span> <select
									class="sidebar-option m-wrap small">

										<option value="fixed">Fixed</option>

										<option value="default" selected>Default</option>

								</select>

								</label> <label> <span>Footer</span> <select
									class="footer-option m-wrap small">

										<option value="fixed">Fixed</option>

										<option value="default" selected>Default</option>

								</select>

								</label>

							</div>

						</div>

						<!-- END BEGIN STYLE CUSTOMIZER -->

						<!-- BEGIN PAGE TITLE & BREADCRUMB-->

						<h3 class="page-title">院系管理</h3>

						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a href="page/sysmanage.jsp">主页</a><i
								class="icon-angle-right"></i></li>
							<li><a href="page/acadsetting.jsp">院系管理</a></li>
						</ul>
					</div>

				</div>

				<div class="row-fluid">

					<div class="span12">
						<!-- BEGIN EXAMPLE TABLE PORTLET-->

						<div class="portlet box blue">

							<div class="portlet-title">

								<div class="caption">
									<i class="icon-edit"></i>院系数据
								</div>

								<div class="tools">

									<a href="javascript:;" class="collapse"></a> <a
										href="#portlet-config" data-toggle="modal" class="config"></a>

									<a href="sysadmin/findacad" class="reload"></a> <a
										href="javascript:;" class="remove"></a>

								</div>

							</div>

							<div class="portlet-body">

								<div class="clearfix">

									<div class="btn-group">

										<button onclick="addnew()" class="btn green">

											Add New <i class="icon-plus"></i>

										</button>

									</div>

									<div class="btn-group pull-right">

										<button class="btn dropdown-toggle" data-toggle="dropdown">
											Tools <i class="icon-angle-down"></i>

										</button>

										<ul class="dropdown-menu pull-right">
											<li><a href="#">Export to Excel</a></li>
										</ul>
									</div>
								</div>

								<table class="table table-striped table-hover table-bordered"
									id="sample_editable_1">

									<thead>

										<tr>
											<th style="text-align: center;">AacademyId</th>

											<th style="text-align: center;">Aacademy</th>

											<th style="text-align: center;">ClassId</th>

											<th style="text-align: center;">Class</th>

											<th style="text-align: center;">Edit</th>

											<th style="text-align: center;">Delete</th>

										</tr>

									</thead>
									<tbody>
										<c:forEach var="acadinfo" items="${acadMsg}">
											<tr class=''>
												<td style="text-align: center;">${acadinfo.academy.aid}</td>
												<td style="text-align: center;">${acadinfo.academy.aname}</td>
												<td style="text-align: center;">${acadinfo.cid}</td>
												<td style="text-align: center;">${acadinfo.cname}</td>
												<td style="text-align: center;"><a class=""
													onclick="edit(this)" href="javascript:void(0)">Edit</a></td>
												<td style="text-align: center;"><a class=""
													onclick="del(this)" href="javascript:void(0)">Delete</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<div class="footer">

			<div class="footer-inner">2017 &copy; NCRE. Admin Cyber Oar.</div>

			<div class="footer-tools">

				<span class="go-top"> <i class="icon-angle-up"></i>

				</span>

			</div>

		</div>

		<div id="add_newDiv">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-edit"></i>添加院系信息
					</div>
				</div>
			</div>
			<div class="portlet-body">
				<form action="javascript:void(0)" method="get" id="addform">
					<ul id="addul">
						<li>学院: &nbsp;&nbsp;<input type="text" name="aname"
							id="atext" /></li>
						<li>班级: &nbsp;&nbsp;<input type="text" name="cname"
							id="ctext" /></li>
						<li><button onclick="addAcad()" class="btn green">添加
							</button>
							<button onclick="closenew()" class="btn red">关闭</button></li>
					</ul>

				</form>
			</div>
		</div>


		<!-- END FOOTER -->

		<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

		<!-- BEGIN CORE PLUGINS -->

		<script src="media/js/jquery-1.10.1.min.js" type="text/javascript"></script>

		<script src="media/js/jquery-migrate-1.2.1.min.js"
			type="text/javascript"></script>

		<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->

		<script src="media/js/jquery-ui-1.10.1.custom.min.js"
			type="text/javascript"></script>

		<script src="media/js/bootstrap.min.js" type="text/javascript"></script>

		<!--[if lt IE 9]>

	<script src="media/js/excanvas.min.js"></script>

	<script src="media/js/respond.min.js"></script>  

	<![endif]-->

		<script src="media/js/jquery.slimscroll.min.js" type="text/javascript"></script>

		<script src="media/js/jquery.blockui.min.js" type="text/javascript"></script>

		<script src="media/js/jquery.cookie.min.js" type="text/javascript"></script>

		<script src="media/js/jquery.uniform.min.js" type="text/javascript"></script>

		<!-- END CORE PLUGINS -->

		<!-- BEGIN PAGE LEVEL PLUGINS -->

		<script type="text/javascript" src="media/js/select2.min.js"></script>

		<script type="text/javascript" src="media/js/jquery.dataTables.js"></script>

		<script type="text/javascript" src="media/js/DT_bootstrap.js"></script>

		<!-- END PAGE LEVEL PLUGINS -->

		<!-- BEGIN PAGE LEVEL SCRIPTS -->

		<script src="media/js/app.js"></script>

		<script src="media/js/table-editable.js"></script>

		<script src="js/acadsetting.js"></script>

		<script>
			jQuery(document).ready(function() {

				App.init();

				TableEditable.init();

			});
		</script>
</body>

<!-- END BODY -->

</html>