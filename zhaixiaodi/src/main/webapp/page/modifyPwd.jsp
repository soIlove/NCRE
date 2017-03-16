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
<!-- 引入矢量图标 -->
<link href="css/icon/iconfont.css" type="text/css" rel="stylesheet">

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
					<h1>
						<a href="https://www.ele.me/" hardjump=""
							class="topbar-logo "><span>宅小遞</span></a>
					</h1>
					<a href="https://www.ele.me/" hardjump=""
						class="topbar-item topbar-homepage"
						ng-class="{'focus': $root.locationpath[0] === 'place'}">首页</a> <a
						href="https://www.ele.me/profile/order" hardjump=""
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
			page-name="order" page-title="近三个月订单">
			<div class="clearfix">
				<div class="location"
					ng-style="{visibility: geohash ? '' : 'hidden'}" role="navigation"
					location="" style="visibility: hidden;">
					<span>当前位置:</span> <span class="location-current"><a
						class="inherit ng-binding" ng-href="/place/" ubt-click="401"
						ng-bind="place.name || place.address"
						href="https://www.ele.me/place/"></a></span> <span
						class="location-change"
						ng-class="{ 'location-hashistory': user.username &amp;&amp; userPlaces &amp;&amp; userPlaces.length &gt; 0 }"><a
						ng-href="/home" ubt-click="400" hardjump=""
						href="https://www.ele.me/home">[切换地址]</a>
						<ul class="dropbox location-dropbox" ubt-visit="398">
							<li class="arrow"></li>
							<!-- ngRepeat: userPlace in userPlaces | filter:filterPlace | limitTo: 4 -->
							<li class="changelocation"><a ng-href="/home" hardjump=""
								href="https://www.ele.me/home">修改收货地址<span
									class="icon-location"></span></a></li>
						</ul></span> <span ng-transclude=""><i
						class="icon-arrow-right ng-scope"></i><span
						class="ng-binding ng-scope">近三个月订单</span></span>
				</div>
				<div search-input=""></div>
			</div>
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
				<!-- end ngIf: pageTitleVisible -->
				<div class="profile-panelcontent" ng-transclude="">
					<form class="changepwd ng-scope ng-pristine ng-valid"
						ng-submit="changePwdSubmit()" novalidate=""  id="modifyPwdForm" action="page/news.jsp">
						<input type="hidden" value="13237343452" name="tel"/>
						<p class="changepwd-tip">宅小递提示你：只能是3到6的数字或字母</p>
						<!-- ngIf: !firstSet -->
						<div class="formfield ng-isolate-scope"
							ng-class="{ 'validate-error': model.$hintTypes[property] === 'error' }"
							form-field="" label="新密码" model="changePwdData" property="newPwd">
							<label ng-bind="label" class="ng-binding">新密码</label>
							<input name="newPwd" id="newPwd" placeholder="请输入新密码"  
								type="password" onblur="checkPwd()" />
							 
								<span id="errorNew" style="color: red"></span>
							 
						</div>
						<div class="formfield ng-isolate-scope "
							ng-class="{ 'validate-error': model.$hintTypes[property] === 'error' }"
							form-field="" label="确认密码" model="changePwdData"
							property="confirmPwd">
							<label ng-bind="label" class="ng-binding">确认密码</label>
							<input	name="confirm" id="confirm" ng-model="changePwdData.confirmPwd"
								placeholder="请再次输入密码" class="ng-scope ng-valid ng-dirty"
								type="password" onblur="confirmPwd()" />
								
								<span id="errorconfirm" style="color: red"></span>
								
							 
						</div>
						<div class="form-group formfield ng-isolate-scope"
							ng-class="{ 'validate-error': model.$hintTypes[property] === 'error' }"
							form-field="">
							<label ng-bind="label" class="ng-binding"></label>
							<button type="submit" class="btn-primary btn-lg ng-scope" onclick="return  ensure()">确认</button>
							 
						</div>
					</form>
				</div>


			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="js_1/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="js_1/textStatic.js"></script>
	<script type="text/javascript" src="js_1/modifyPwd.js"></script>
</body>
</html>

