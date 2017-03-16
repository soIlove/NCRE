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
<link type="text/css" rel="stylesheet" href="easyui/themes/icon.css" />
<link type="text/css" rel="stylesheet"
	href="easyui/themes/default/easyui.css" />
<link type="text/css" rel="stylesheet" href="css/message.css">
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
							<%-- onclick="getOrders(1,${loginUser.uuid})"  --%>style="color:#666">订单记录</a></li>
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
					<span ng-bind="pageTitle" class="ng-binding">消息</span> <span
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

					<div class="order-nocontent nodata ng-isolate-scope ng-hide"
						ng-show="orderList &amp;&amp; !orderList.length" nodatatip=""
						content="暂无记录，现在就去&lt;a href='/place'&gt;订餐&lt;/a&gt;吧!">
						<p class="nodata-container ng-binding"
							ng-bind-html="content | toTrusted">
							暂无记录，现在就去<a href="https://www.ele.me/place">下单</a>吧!
						</p>
					</div>
					<table class="order-list ng-scope" ng-show="orderList.length">
						<thead>
							<tr>
								<th>同意时间</th>
								<th>快递类型</th>
								<th>取货码</th>
								<th>包裹大小</th>
								<th>地址</th>
								<th>费用</th>
								<th class="order-list-infoth">接单状态</th>
							</tr>
						</thead>
						<tbody id="message_order_tr_list">
							

							<!-- <tr onclick="show(this)" style="cursor: pointer;"
								class="timeline">
								<td class="ordertimeline-time">
									<p class="ng-binding">17:35</p> 
									<i
									class="ordertimeline-time-icon icon-uniE65D ng-scope unreview"></i>								
								</td>
								<td class="ordertimeline-handle"><label>正在查询快递类型</label></td>

								<td class="ordertimeline-handle"><label>正在查询取货码</label></td>

								<td class="ordertimeline-handle"><label>正在查询包裹类型</label></td>
								<td class="ordertimeline-handle"><label>正在查询地址这是无法呢违法款未付矿务局额if我看了福</label>
								</td>
								<td class="ordertimeline-handle"><label>正在查询费用</label></td>
								<td class="ordertimeline-handle"><label>正在查询备注矿务局诶我就付款李文静覅看矿务局额if
										文件附件为 窝IE</label></td>
							</tr> -->



						</tbody>
					</table>
					<div id="zxdmsg_mess" style="display: none">
						<div class="l_box_list" id="topic_list">
							<ul id="expressList">
								<!-- <li class="topic">
									<div class="u_photo">
										<img src="image/85_avatar_m.jpg" height="48" width="48">
									</div>
									<div class="u_post">
										<input type="button" id="btn-order_agr" class="btn_order" name="btn-order_agr" value="同意领取">
										<div class="li_1" style="line-height: 12px;">
											<a style="font-size: 13px; font-family: '微软雅黑';"
												class="i_title" href="javascript:void(0)">'黄小小州'</a>
										</div>
										<div class="li_2" style="margin-top: 15px;">
											<em class="li_s">信誉度：9.9</em>
											<em class="readNum li_s">抢单时间：10:00</em>
										</div>
										<div class="li_3"
											style="font-size: 14px; font-family: '微软雅黑'; padding-top: 10px;">小递捎话：大概会在12点帮你送达</div>

									</div>
								</li>	 -->	
								
							</ul>
				             <input type="button" class="zln-button" id="delAllApp" value="取消全部">
																
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
		<script src="js_1/jquery-1.12.4.js" type="text/javascript"></script>
		<script src="easyui/jquery.min.js" type="text/javascript"></script>
		<script src="easyui/locale/easyui-lang-zh_CN.js"
			type="text/javascript"></script>
		<script src="easyui/jquery.easyui.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="js_1/textStatic.js"></script>
		<script type="text/javascript" src="js_1/message.js"></script>
</body>
</html>
