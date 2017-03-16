<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<base href="/zhaixiaodi/">
<title>个人中心</title>

<link href="css/vendor.css" rel="stylesheet">

<link href="css/profile.css" rel="stylesheet">
<link href="css/profile_msg.css" rel="stylesheet">



<script src="js_1/perf.js" type="text/javascript"
	crossorigin="anonymous"></script>
<script src="js_1/vendor.js" type="text/javascript"
	crossorigin="anonymous"></script>
<script src="js_1/profile.js" type="text/javascript"
	crossorigin="anonymous"></script>

</head>

<body cute-title=""
	ng-class="{hidesidebar: layoutState &amp;&amp; layoutState.hideSidebar, smallbody: layoutState.smallBody, whitebody: layoutState.whiteBody}"
	style="position: relative;" lim:visitorcapacity="1">

	<input type="hidden" id="uuidhidden" name="uuidhidden" value="${loginUser.uuid}" />
	<div ng-switch="state.type" state="layoutState"
		class="ng-isolate-scope">
		<!-- ngSwitchWhen: checkout -->
		<!-- ngSwitchDefault:  -->
		<div ng-switch-default="" topbar-default="" state="state"
			class="ng-scope ng-isolate-scope">
			<header class="topbar" role="navigation"
				ng-class="{shoptopbar: state.type === 'shop'}">
				<div class="container clearfix">
						<a href="index.jsp" hardjump=""
						class="topbar-item topbar-homepage"
						ng-class="{'focus': $root.locationpath[0] === 'place'}">首页</a> <a
						href="page/profile_order.jsp" hardjump=""
						class="topbar-item"
						ng-class="{'focus': $root.locationpath[1] === 'order'}">我的订单</a>
					<nav class="topbar-nav">
						<div topbar-profilebox="">
							<div class="topbar-profilebox">
								<!-- ngIf: $root.user.avatar && $root.topbarType !== 'checkout' -->
								<span class="topbar-profilebox-avatar icon-profile ng-hide"
									ng-show="!$root.user.username"></span> <span
									ng-show="!$root.user.username" class="ng-hide"> <a
									ng-href="https://account.ele.me/login" target="_blank"
									href="https://account.ele.me/login">登录</a>/<a
									ng-href="https://account.ele.me/register" target="_blank"
									href="https://account.ele.me/register">注册</a></span> <span
									class="topbar-profilebox-wrapper" ng-show="$root.user.username">
									<!-- ngIf: $root.topbarType === 'checkout' --> <span
									class="topbar-profilebox-username ng-binding">黄小小小州</span> <!-- ngIf: $root.topbarType === 'checkout' -->
									<!-- ngIf: $root.topbarType !== 'checkout' --> <span
									class="topbar-profilebox-btn icon-arrow-down ng-scope"
									ng-if="$root.topbarType !== 'checkout'"></span>
									<div class="dropbox topbar-profilebox-dropbox">
										<a class="icon-profile" href="https://www.ele.me/profile"
											hardjump="">个人中心</a> <a class="icon-location"
											href="https://www.ele.me/profile/address" hardjump="">我的地址</a>
										<a class="icon-logout" href="javascript:" ng-click="logout()">退出登录</a>
									</div>
								</span>
							</div>
						</div>
					</nav>
				</div>
			</header>
		</div>
	</div>
	<div class="importantnotification container" role="banner">
		<!-- ngIf: enable -->
	</div>
	<!-- ngView:  -->
	<div ng-view="" role="main" class="ng-scope">
		<div class="profile-container container" profile-container=""
			page-name="order" page-title="资料信息">

			<ul class="profile-sidebar" role="navigation" profile-sidebar="">
				<li class="profile-sidebar-section"><h2
						class="profile-sidebar-sectiontitle"
						ng-class="{ active: pageName === 'profile' }">
						<i class="icon-line-home"></i><a href="https://www.ele.me/profile">个人中心</a>
					</h2></li>
					
					<li class="profile-sidebar-section"><h2
						class="profile-sidebar-sectiontitle">
						<i class="iconfont">&#xe649;</i><a href="page/message_1.jsp">小本经营</a>
					</h2></li>
					
				  <li class="profile-sidebar-section"><h2
						class="profile-sidebar-sectiontitle">
						<i class="iconfont">&#xe649;</i><a href="page/message.jsp">接单通知</a>
					</h2></li>
				<li class="profile-sidebar-section"><h2
						class="profile-sidebar-sectiontitle">
						<i class="icon-line-order"></i>我的订单
					</h2>
					<ul>
						<li ng-class="{ active: pageName === 'order' }" class="active"><a
							href="page/profile.jsp"
							style="color:#666">订单记录</a></li>
						<li ng-class="{ active: pageName === 'order-unrated' }"><a
							href="javascript:void(0)"
							onclick="getWaitOrders(1,${loginUser.uuid})">待评价订单<!-- ngIf: unratedNumber -->
								<span class="moreinfo ng-binding ng-scope" ng-if="unratedNumber"
								ng-bind="unratedNumber">6</span> <!-- end ngIf: unratedNumber --></a></li>
						<li ng-class="{ active: pageName === 'order-refunding' }"><a
							href="page/profile.jsp">退单记录</a></li>
					
					</ul></li>

				<li class="profile-sidebar-section"><h2
						class="profile-sidebar-sectiontitle">
						<i class="icon-line-profile"></i>我的资料
					</h2>
					<ul>
						<li><a href="page/profile_msg.jsp">个人资料</a></li>
						<li><a href="page/profile_addrmanage.jsp">地址管理</a></li>
						<li><a href="page/modifyPwd.jsp">修改密码</a></li>
					</ul></li>

			</ul>



			<div class="profile-panel" role="main">
				<!-- ngIf: pageTitleVisible -->
				<h3 ng-if="pageTitleVisible" class="profile-paneltitle ng-scope">
					<span ng-bind="pageTitle" class="ng-binding">个人资料信息</span> <span
						class="subtitle ng-binding"
						ng-bind-html="pageSubtitle | toTrusted"></span>
				</h3>
				<!-- end ngIf: pageTitleVisible -->
				<div class="profile-panelcontent" ng-transclude="">
					<div class="order-fetchtakeout ng-scope ng-isolate-scope"
						show-fetch-takeout-dialog="">
						<img src="image/takeout.png">
					</div>
					<div class="order-extra ng-scope">
						<a href="https://www.ele.me/support/question/hotissue"
							target="_blank">热门问题</a> <a
							href="https://static11.elemecdn.com/eleme/desktop/mobile/index.html"
							target="_blank">随时关注订单状态</a>
					</div>

				</div>
				<div class="mainmsg">
					<form id="profile_msg" class="profile_msg" method="post"
						enctype="multipart/form-data">

						<table class="profile_tab">
							<tr class="profile_tr">
								<td class="profile_name">用户头像</td>
								<td class="profile_td_msg"><input name="upicdata"
									id="upicture" style="display: none" multiple="multiple"
									type="file" onchange="addpic(this)"> <a href=""
									onclick="document.getElementById('upicture').click();return false;">
										<div id="divdcardf">
											<img id="upicimage" src="image/4.jpg" />
										</div>
								</a><span class="profile_span_1">点击修改头像</span></td>

							</tr>

							<tr class="profile_tr">
								<td class="profile_name">用 户 名</td>
								<td class="profile_td_msg"><input type="text" name="uname"
									id="uname" class="editform" value=""></td>

							</tr>
							<tr class="profile_tr">
								<td class="profile_name">手机号码</td>
								<td class="profile_td_msg"><input type="text" name="uphone"
									id="uphone" class="editform" value="" ></td>

							</tr>

							<tr class="profile_tr">
								<td class="profile_name">性 别</td>
								<td class="profile_td_msg"><input type="text" name="usex"
									id="usex" class="editform" value=""></td>

							</tr>

							<tr class="profile_tr">
								<td class="profile_name">用户邮箱</td>
								<td class="profile_td_msg"><input type="text" name="uemail"
									id="uemail" class="editform" value=""></td>

							</tr>

							<tr class="profile_tr">
								<td class="profile_name">所在学校</td>
								<td class="profile_td_msg"><input type="text" name="uaddr"
									id="uaddr" class="editform" value=""></td>
							</tr>
						</table>
						<input id="editprofilemsg" type="submit" name="editprofilemsg"
							value="确认修改">
					</form>
				</div>

			</div>
			<footer> </footer>

			<script src="js_1/jquery-1.12.4.js" type="text/javascript"></script>
			<script src="easyui/jquery.min.js" type="text/javascript"></script>
			<script src="easyui/locale/easyui-lang-zh_CN.js"
				type="text/javascript"></script>
			<script src="easyui/jquery.easyui.min.js" type="text/javascript"></script>

			<script src="js_1/textStatic.js"></script>
			<script src="js_1/textStatic.js"></script>
			
			<script src="js_1/profile_msg.js" type="text/javascript"></script>
</body>
</html>

