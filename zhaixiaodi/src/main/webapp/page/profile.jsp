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
<link href="css/icon/iconfont.css" type="text/css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="easyui/themes/icon.css">
<link type="text/css" rel="stylesheet"
	href="easyui/themes/default/easyui.css">


<script src="js_1/perf.js" type="text/javascript"
	crossorigin="anonymous"></script>
<script src="js_1/vendor.juerys" type="text/javascript"
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
									class="topbar-profilebox-username ng-binding">黄小小小州</span> <!-- ngIf: $root.topbarType !== 'checkout' -->
									<span class="topbar-profilebox-btn icon-arrow-down ng-scope"
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
						<i class="icon-line-home"></i><a href="page/profile.jsp">个人中心</a>
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
						<%-- <input type="hidden" id="uuidhidden" name="uuidhidden" value="${loginUser.uuid}" /> --%>
						<li ng-class="{ active: pageName === 'order' }" class="active"><a
							href="javascript:void(0)"
							onclick="getOrders(1,${loginUser.uuid})" style="color:#666">订单记录</a></li>
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
					<span ng-bind="pageTitle" class="ng-binding">近三个月订单</span> <span
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
					<!-- <div class="loading ng-binding ng-isolate-scope ng-hide" loading=""
						ng-show="!orderList">
						ngIf: type==='profile'
						<img ng-if="type==='profile'" src="image/profile-loading.gif"
							alt="正在加载" class="ng-scope">
						end ngIf: type==='profile'
						ngIf: type==='normal'
						正在载入数据...
					</div> -->
					<!-- 	<div class="order-nocontent nodata ng-isolate-scope ng-hide"
						ng-show="orderList &amp;&amp; !orderList.length" nodatatip=""
						content="暂无记录，现在就去&lt;a href='/place'&gt;订餐&lt;/a&gt;吧!">
						<p class="nodata-container ng-binding"
							ng-bind-html="content | toTrusted">
							暂无记录，现在就去<a href="https://www.ele.me/place">订餐</a>吧!
						</p>
					</div> -->
					<table class="order-list ng-scope" ng-show="orderList.length">
						<thead>
							<tr>
								<th>订单号</th>
								<th>订单内容</th>
								<th></th>
								<th>支付金额（元）</th>
								<th>接单人</th>
								<th>状态</th>
							</tr>
						</thead>
						<div id="win">
							<p>用户名：<div  id="uuid" style="margin-top:10px;"></div></p><br>
							<p>昵称：<div id="uname"></div></p><br>
							<p>性别：<div id="usex"></div></p><br>
							<p>电话：<div id="uphone"></div></p><br>
							<p>邮箱：<div id="uemail"></div></p><br>
							<p>地理位置：<div id="uaddr" ></div></p><br>
						</div>
						<tbody id="orderlist">
							<tr></tr>
							<tr class="timeline" order-timeline=""
								ng-repeat="item in orderList">
								<td class="ordertimeline-time"><i
									class="ordertimeline-time-icon icon-uniE65D ng-scope unreview"
									ng-if="item.realStatus !== 5"
									ng-class="{'unfinish': item.realStatus !== 4, 'unreview': item.realStatus === 4}"></i>
								</td>
								<td class="ordertimeline-avatar"><img src="image/pic.jpg"></td>
								<td class="ordertimeline-info"><h3
										class="ordertimeline-title">
										<a ng-href="/shop/562286" ng-bind="item.restaurant.name"
											class="ng-binding" href="javascript:void(0)">圆通快递</a>
										<!-- ngIf: item.is_book -->
									</h3>
									<p class="ordertimeline-info-food">
										<span class="ordertimeline-food ng-binding"
											ng-bind="item.product">小包裹</span>&nbsp;&nbsp;<span
											class="ordertimeline-info-productnum ng-binding"
											ng-bind="item.productnum">D4-325</span>&nbsp;&nbsp;<span>2017-02-28</span>
									</p>
									<p>
										订单号: <a ng-href="order/id/1202435690561146071"
											ng-bind="item.unique_id" class="ng-binding"
											href="javascript:void(0)">1202435690561146071</a>
									</p></td>
								<td class="ordertimeline-amount"><h3
										class="ordertimeline-title ordertimeline-price ui-arial ng-binding"
										ng-bind="item.total_amount.toFixed(2)">￥7.00</h3></td>
								<td class="ordertimeline-status"><h3
										ng-bind="item.statusText"
										ng-class="{'waitpay': (item.realStatus === 1), 'end': (item.realStatus === 5)}"
										class="ng-binding">等待评价</h3></td>
								<td class="ordertimeline-handle"><a
									class="ordertimeline-handle-detail"
									ng-href="order/id/1202435690561146071"
									href="https://www.ele.me/profile/order/id/1202435690561146071">订单详情</a>
									<span ng-if="item.realStatus === 4"
									class="ordertimeline-handle-group ng-scope"><a
										ng-href="order/rate/1202435690561146071"
										href="https://www.ele.me/profile/order/rate/1202435690561146071">评价订单
											<i class="icon-arrow-down"></i>
									</a> <a href="javascript:" ng-click="bundle.restore(item)">再来一份</a></span>
								</td>
							</tr>

							<!-- end ngRepeat: item in orderList -->
							<tr class="timeline" order-timeline=""
								ng-repeat="item in orderList">
								<td class="ordertimeline-time"><p
										class="ordertimeline-title ng-binding"
										ng-bind="item.created_at | parseDate">12-23</p>
									<p ng-bind="item.created_at | date:'HH:mm'" class="ng-binding">12:03</p>
									<i class="ordertimeline-time-icon icon-uniE65E finish ng-scope"
									ng-if="item.realStatus === 5"></i></td>
								<td class="ordertimeline-avatar"><a ng-href="/shop/78196"
									href="https://www.ele.me/shop/78196"><img
										ng-src="//fuss10.elemecdn.com/5/31/8ea569b864a9fce7394a61082605bjpeg.jpeg?imageMogr2/thumbnail/70x70"
										src="%E4%B8%AA%E4%BA%BA%E4%B8%AD%E5%BF%83_%E8%AE%A2%E5%8D%95%E8%AF%A6%E6%83%85%E5%88%97%E8%A1%A8%20_%20%E9%A5%BF%E4%BA%86%E4%B9%88%E7%BD%91%E4%B8%8A%E8%AE%A2%E9%A4%90_files/8ea569b864a9fce7394a61082605bjpeg.jpg"></a></td>
								<td class="ordertimeline-info"><h3
										class="ordertimeline-title">
										<a ng-href="/shop/78196" ng-bind="item.restaurant.name"
											class="ng-binding" href="https://www.ele.me/shop/78196">九好外卖(工院店)</a>
										<!-- ngIf: item.is_book -->
									</h3>
									<p class="ordertimeline-info-food">
										<a ng-href="order/id/101804030039697549"
											href="https://www.ele.me/profile/order/id/101804030039697549"><span
											class="ordertimeline-food ng-binding" ng-bind="item.product">腐竹炒肉（煲仔饭）1份</span>
											<!-- ngIf: item.productnamenum > 2 --> <span
											class="ordertimeline-info-productnum ng-binding"
											ng-bind="item.productnum">1</span> <span>个菜品</span></a>
									</p>
									<p>
										订单号: <a ng-href="order/id/101804030039697549"
											ng-bind="item.unique_id" class="ng-binding"
											href="https://www.ele.me/profile/order/id/101804030039697549">101804030039697549</a>
									</p></td>
								<td class="ordertimeline-amount"><h3
										class="ordertimeline-title ordertimeline-price ui-arial ng-binding"
										ng-bind="item.total_amount.toFixed(2)">11.06</h3>
									<p ng-bind="item.is_online_paid ? '在线支付' : '货到付款'"
										class="ng-binding">在线支付</p></td>
								<td class="ordertimeline-status"><h3
										ng-bind="item.statusText"
										ng-class="{'waitpay': (item.realStatus === 1), 'end': (item.realStatus === 5)}"
										class="ng-binding end">订单已完成</h3>
									<p
										class="ordertimeline-status-time ng-binding ordertimeline-status-warning"
										ng-class="{'ordertimeline-status-warning' : item.realStatus !== 1}"
										ng-bind="statusText"></p></td>
								<td class="ordertimeline-handle"><a
									class="ordertimeline-handle-detail"
									ng-href="order/id/101804030039697549"
									href="https://www.ele.me/profile/order/id/101804030039697549">订单详情</a>
									<!-- ngIf: item.realStatus === 1 --> <!-- ngIf: item.realStatus === 2 -->
									<!-- ngIf: item.realStatus === 3 --> <!-- ngIf: item.realStatus === 4 -->
									<!-- ngIf: item.realStatus === 5 --> <a
									ng-if="item.realStatus === 5"
									class="ordertimeline-handle-a ng-scope" href="javascript:"
									ng-click="bundle.restore(item)">再来一份</a> <!-- end ngIf: item.realStatus === 5 -->
									<!-- ngIf: item.realStatus === 6 --></td>
							</tr>

						</tbody>
					</table>
					<!-- <div pagination="order" pagination-context="pageContext"
						pagination-onchange="onOrderPageChange()"
						class="ng-scope pagination">
						<ul>
							<li class="current">1</li>
							<li>2</li>
							<li>3</li>
							<li>4</li>
							<li>5</li>
						</ul>
					</div> -->
					<div pagination="order" pagination-context="pageContext"
						pagination-onchange="onOrderPageChange()"
						class="ng-scope pagination">
						<ul id="orderPage"></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer" role="contentinfo">
		<div class="container clearfix">
			<div class="footer-link">
				<h3 class="footer-link-title">用户帮助</h3>
				<a class="footer-link-item" href="https://www.ele.me/support/center"
					target="_blank">服务中心</a> <a class="footer-link-item"
					href="https://www.ele.me/support/question/default" target="_blank">常见问题</a>
				<a class="footer-link-item" online-service="" href="javascript:"
					style="visibility: visible;">在线客服</a>
			</div>
			<div class="footer-link">
				<h3 class="footer-link-title">商务合作</h3>
				<a class="footer-link-item" href="https://kaidian.ele.me/"
					target="_blank">我要开店</a> <a class="footer-link-item"
					href="https://www.ele.me/support/about/jiameng" target="_blank">加盟指南</a>
				<a class="footer-link-item"
					href="https://www.ele.me/support/about/contact" target="_blank">市场合作</a>
				<a class="footer-link-item" href="http://openapi.eleme.io/"
					target="_blank">开放平台</a>
			</div>
			<div class="footer-link">
				<h3 class="footer-link-title">关于我们</h3>
				<a class="footer-link-item" href="https://www.ele.me/support/about"
					target="_blank">饿了么介绍</a> <a class="footer-link-item"
					href="http://jobs.ele.me/" target="_blank">加入我们</a> <a
					class="footer-link-item"
					href="https://www.ele.me/support/about/contact" target="_blank">联系我们</a>
				<a class="footer-link-item"
					href="https://www.ele.me/support/rules/default" target="_blank">规则中心</a>
			</div>
			<div class="footer-contect">
				<div class="footer-contect-item">
					24小时客服热线 : <a class="inherit" href="tel:10105757">10105757</a>
				</div>
				<div class="footer-contect-item">
					意见反馈 : <a class="inherit" href="mailto:feedback@ele.me">feedback@ele.me</a>
				</div>
				<div class="footer-contect-item">
					关注我们 :
					<div href="JavaScript:" class="icon-wechat" ubt-click="402">
						<div class="dropbox dropbox-bottom footer-contect-dropbox"
							ubt-visit="402">
							<img
								src="%E4%B8%AA%E4%BA%BA%E4%B8%AD%E5%BF%83_%E8%AE%A2%E5%8D%95%E8%AF%A6%E6%83%85%E5%88%97%E8%A1%A8%20_%20%E9%A5%BF%E4%BA%86%E4%B9%88%E7%BD%91%E4%B8%8A%E8%AE%A2%E9%A4%90_files/wexinqc1002x.png"
								alt="微信号: elemeorder">
							<p>微信号: elemeorder</p>
							<p>饿了么网上订餐</p>
						</div>
					</div>
					<a href="http://e.weibo.com/elemeorder" class="icon-weibo"
						target="_blank"></a>
				</div>
			</div>
			<div class="footer-mobile">
				<a href="https://h.ele.me/landing" target="_blank"><img
					src="%E4%B8%AA%E4%BA%BA%E4%B8%AD%E5%BF%83_%E8%AE%A2%E5%8D%95%E8%AF%A6%E6%83%85%E5%88%97%E8%A1%A8%20_%20%E9%A5%BF%E4%BA%86%E4%B9%88%E7%BD%91%E4%B8%8A%E8%AE%A2%E9%A4%90_files/appqc.png"
					class="footer-mobile-icon" alt="扫一扫下载饿了么手机 App"></a>
				<div class="footer-mobile-content">
					<h3>下载手机版</h3>
					<p>扫一扫,手机订餐方便</p>
				</div>
			</div>
			<div class="footer-copyright serif">
				<h5 class="owner">所有方：上海拉扎斯信息科技有限公司</h5>
				<p>
					增值电信业务许可证 : <a href="http://www.shca.gov.cn/" target="_blank">沪B2-20150033</a>
					| <a href="http://www.miibeian.gov.cn/" target="_blank">沪ICP备
						09007032</a> | <a
						href="http://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&amp;entyId=20120305173227823"
						target="_blank">上海工商行政管理</a> Copyright ©2008-2017 ele.me, All
					Rights Reserved.
				</p>
			</div>
			<div class="footer-police container">
				<a href="http://www.zx110.org/picp/?sn=310100103568" rel="nofollow"
					target="_blank"><img alt="已通过沪公网备案，备案号 310100103568"
					src="%E4%B8%AA%E4%BA%BA%E4%B8%AD%E5%BF%83_%E8%AE%A2%E5%8D%95%E8%AF%A6%E6%83%85%E5%88%97%E8%A1%A8%20_%20%E9%A5%BF%E4%BA%86%E4%B9%88%E7%BD%91%E4%B8%8A%E8%AE%A2%E9%A4%90_files/picp_bg.jpg"
					height="30"></a>
			</div>
		</div>

	</footer>

	<script src="js_1/jquery-1.12.4.js" type="text/javascript"></script>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script src="js_1/profile_1.js" type="text/javascript"></script>



	<script
		src="%E4%B8%AA%E4%BA%BA%E4%B8%AD%E5%BF%83_%E8%AE%A2%E5%8D%95%E8%AF%A6%E6%83%85%E5%88%97%E8%A1%A8%20_%20%E9%A5%BF%E4%BA%86%E4%B9%88%E7%BD%91%E4%B8%8A%E8%AE%A2%E9%A4%90_files/textStatic.js"></script>
	<script
		src="%E4%B8%AA%E4%BA%BA%E4%B8%AD%E5%BF%83_%E8%AE%A2%E5%8D%95%E8%AF%A6%E6%83%85%E5%88%97%E8%A1%A8%20_%20%E9%A5%BF%E4%BA%86%E4%B9%88%E7%BD%91%E4%B8%8A%E8%AE%A2%E9%A4%90_files/textStatic.js"></script>
</body>
</html>
