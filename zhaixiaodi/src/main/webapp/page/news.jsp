<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="/zhaixiaodi/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>宅小递</title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="Keywords"
	content="宅小递,代收货,发件,网购代收货,自提点,代收点,O2O,淘宝自提点,当当自提点,顺丰合作,社区店">
<meta name="description"
	content="宅小递 – 国内首家代收货服务提供者, 通过遍布城市各大角落的社区店，为您提供最便捷的收货服务体验。让您不用再担心家中没有人不能收快递；不用担心大件物品送到公司，但不方便挤公交车带回家；不用担心快递不准时，只能在家干等。还有手机App能够更快地为您找到附近的代收点哦！">
<meta property="qc:admins" content="2550506277630750572176375">

<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="js/jquery-1.js" type="text/javascript"></script>
<script src="js/swiper.js" type="text/javascript"></script>
<script src="js/base.js" type="text/javascript"></script>
<script src="js/page.js" type="text/javascript"></script>
<script src="js/wb.js" type="text/javascript" charset="utf-8"></script>
<!--[if lt IE 9]>
		<script type="text/javascript" src="/shooter/js/respond.min.js"></script>
<![endif]-->
<script charset="UTF-8" src="js/bundle.js"></script>
<script charset="UTF-8" src="js/iframeWidget.js"></script>
</head>
<body>
	<iframe style="display: none;" id="sina_anywhere_iframe"></iframe>
	<div class="header-top">
		<div class="com-w">
			<c:choose>
				<c:when test="${loginUser eq null }">
					<p class="h-wel">
						<a href="page/Login.jsp">[请登录]</a>宅小递
					</p>
				</c:when>
				<c:otherwise>
					<p class="h-wel">
						<span
							style="color: #E76D26; font-size: 14px; font-weight: bold; font-style: italic;">${loginUser.uname}</span>,&nbsp;欢迎你来到宅小递!
					</p>
					
					<input type="hidden" id="uuidhidden" name="uuidhidden" value="${loginUser.uuid}" />
				</c:otherwise>
			</c:choose>
			<div class="h-r">
				<ul>
					<li class="h-qq"><em></em>
						<div class="qq-tanchu">
							<b></b>
							<p>
								宅小递在线客服 <br> <span class="gray">4007333390</span>
							</p>
							<a onclick='KF.closeIMC(this,"SOFTWARE")' class="btn"
								target="_blank"
								href="http://crm2.qq.com/page/portalpage/wpa.php?uin=4007333390&amp;f=1&amp;ty=1&amp;">点击咨询</a>
						</div></li>
					<!--未关注-->
					<li class="h-sina"><em></em>
						<div class="sina-tanchu">
							<b></b>
							<p>
								宅小递官方微博： <br> <img src="image/logo1.png">
							</p>
							<wb:follow-button uid="2137795655" type="red_1" width="67"
								height="24" class="gz2">
								<iframe
									src="%E6%94%B6%E8%B4%A7%E5%AE%9D_files/followbutton_002.htm"
									scrolling="no" marginheight="0" width="67" height="24"
									frameborder="0"></iframe>
							</wb:follow-button>
						</div></li>
					<!--已关注-->
					<li class="h-sina" style="display: none;">
						<div class="sina-followed">
							<wb:follow-button uid="2137795655" type="red_1" width="67"
								height="24" class="gz3">
								<iframe
									src="%E6%94%B6%E8%B4%A7%E5%AE%9D_files/followbutton_002.htm"
									scrolling="no" marginheight="0" width="67" height="24"
									frameborder="0"></iframe>
							</wb:follow-button>
						</div>
					</li>
					<li class="h-tel"><em></em><img src="image/tel.jpg"></li>
				</ul>
			</div>
		</div>
	</div>







	<div class="header-mid">
		<div class="com-w bh-posRlt">
			<div class="logo" id="logo">
				<p>
					<a href="http://www.shouhuobao.com/shooter/index.html"><img
						src="image/Logo.jpg"></a>
				</p>
			</div>
				<div class="menu_1">
				<ul>
					<li class="on"><a href="#">首页</a></li>
					<li><a href="page/about.jsp" style="color: #e76d26;border-bottom: 2px solid #e76d26;">关于我们</a></li>
					<li><a href="page/Login.jsp">商户中心</a></li>
					<li><a href="page/order.jsp">我要投单</a></li>
					<li><a href="page/profile.jsp" target="_blank">个人中心</a></li>
				</ul>
			</div>
			<div class="navShow"></div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="content aboutBody">
		<div class="com-w bh-overf">
			<div class="siderLeft">
				<h3>
					媒体报道<b class="sub-tab"></b>
				</h3>
				<div class="sub-shadow"></div>
				<img src="image/begins.jpg" width="233" height="60">
				<ul class="sub-menu">
					<li><a href="page/about.jsp">公司简介</a></li>
					<li><a href="page/services.jsp">服务介绍</a></li>
					<li class="on"><a href="page/news.jsp">媒体报道</a></li>
					<li><a href="page/cooperation.jsp">合作联系</a></li>
					<li><a href="page/joinus.jsp">加入我们</a></li>
				</ul>
			</div>
			<div class="mRight newsPage">
				<table width="100%" height="30" border="0">
					<tbody>
						<tr>
							<td class="intro-con" valign="bottom"><strong>您的位置：</strong>
								关于我们 &gt; 媒体报道</td>
						</tr>
					</tbody>
				</table>

				<h1>
					<img src="image/meiti.jpg" width="643" height="160">
				</h1>
				<h2 class="imgtitle"
					style="font-weight: lighter; color: #000; font-size: 28px; line-height: 50px;">媒体报道</h2>

				<div class="news-con">
					<ul>
						<form id="mainForm" name="mainForm" mothod="post">
							<input name="pageNo" id="pageNo" value="2" type="hidden">
							<input name="totalCount" id="totalCount" value="64" type="hidden">
							<input name="totalPages" id="totalPages" value="7" type="hidden">
							<input name="pageSize" id="pageSize" value="10" type="hidden">
							<input name="prePage" id="prePage" value="1" type="hidden">
							<input name="nextPage" id="nextPage" value="3" type="hidden">
						</form>

						 

						<li><a
							href="http://www.shouhuobao.com/shooter/news%21info.html?id=149">宅小递黄福州：切入社区最后一公里
						</a>
							<p class="time">2015-06-24 14:45:40.0 来源：搜狐焦点家居网</p>
							2016年9月18、19日，夏季世界O2O博览会在北京国家会议中心举行，会议期间，行业主流媒体对本次参会的重要嘉宾进行了专访。</li>

						<li><a
							href="http://www.shouhuobao.com/shooter/news%21info.html?id=150">WOO理事会公布五份《O2O行业服务规范标准》</a>
							<p class="time">2015-06-24 14:45:40.0 来源：光明网</p>
							2015年6月17日-19日，由世界O2O组织、光合资本主办的夏季世界O2O博览会（O2OEXPO）在北京国家会议中心盛大召开。今天晚上，世界O2O组织（WOO）第三次理事会在北京国际饭店率先召开。
						</li>

						<li><a
							href="http://www.shouhuobao.com/shooter/news%21info.html?id=151">2015全球移动互联网大会观察：销售易以移动技术改变企业管理</a>
							<p class="time">2015-06-24 14:45:40.0 来源：中国新闻网</p>
							随着“移动互联网”载体愈来愈多样化，人们对移动设备的依赖程度越来越高，这催生了“万物皆移动，移动生万物”的新趋势，于是移动互联网成为当前推动产业乃至经济社会发展最强有力的技术力量。
						</li>

						<li><a
							href="http://www.shouhuobao.com/shooter/news%21info.html?id=145">社区小店存最大可挖掘潜力</a>
							<p class="time">2015-05-04 18:01:32.0 来源：微媒体</p>

							宅小递是社区物流和生活服务平台，服务覆盖代收、代寄、退货所有包裹服务，致力于为网购用户提供最后一公里服务，让生活更简单。据黄福州介绍，宅小递创立
							于2016年，当时正直电商市场爆发期，电商对传统小微店面的冲击很厉害。宅小递成立初衷是希望融合小微商家和网购，解决小微商家的经营难题。
						</li>

						<li><a
							href="http://www.shouhuobao.com/shooter/news%21info.html?id=153">帮着取快递就能挣钱？
								网络销售物流末端有商机</a>
							<p class="time">2015-04-27 15:12:39.0 来源：人民日报</p> 有一种创业，
							只要搭上互联网思维，不需要多么高的门槛，就能让你有所收获。从今天起，我们将连续几期给大家讲述“平凡的他或她”借助互联网创业的故事。让我们从中感受激情、汲取力量，并学会把握机遇吧。他们行，你也能行！
						</li>

						 

						<li><a
							href="http://www.shouhuobao.com/shooter/news%21info.html?id=142">代收货业务兴起
								便利之余仍存短板</a>
							<p class="time">2015-04-23 16:08:59.0 来源：中国贸易新闻网</p> 本报记者 胡心媛
							近年来，社区、便利店代收货成了一个新生意。许多成熟电商企业和创业企业都纷纷瞄准物流最后500米。 
						</li>

						 

					</ul>
					<div class="pageList" id="pageList">
						<div id="pageList">
							<div class="mod_pagenav">
								<p class="mod_pagenav_main">
									<span class="mod_pagenav_count"><a
										href="javascript:void(0)" onclick="gotopage(0,7,10,1,3)">
											&lt;&lt; </a>&nbsp;<a href="javascript:void(0)"
										onclick="javascript:jumpPage(1)"> &lt; </a>&nbsp;<a
										href="javascript:void(0)" onclick="gotopage(1,7,10,1,3)">1</a>&nbsp;<a
										class="active">2</a>&nbsp;<a href="javascript:void(0)"
										onclick="gotopage(3,7,10,1,3)">3</a>&nbsp;<a
										href="javascript:void(0)" onclick="gotopage(4,7,10,1,3)">4</a>&nbsp;<a
										href="javascript:void(0)" onclick="gotopage(5,7,10,1,3)">5</a>&nbsp;<a
										href="javascript:void(0)" onclick="gotopage(6,7,10,1,3)">6</a>&nbsp;<a
										href="javascript:void(0)" onclick="gotopage(7,7,10,1,3)">7</a>&nbsp;<a
										href="javascript:void(0)" onclick="javascript:jumpPage(3)">
											&gt; </a>&nbsp;<a href="javascript:void(0)"
										onclick="gotopage(8,7,10,1,3)"> &gt;&gt; </a>&nbsp;</span>
								</p>
								<p class="mod_pagenav_option"></p>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="footer">
		<div class="com-w">
			<div class="bh-overf">

				<!-- <div class="f-aboutUs">
        <h3>关注我们</h3>
        <ul>
          <li><img src="images/er3.jpg" />
            <p> 宅小递官方微信 </p>
          </li>
          <li><img src="images/er4.jpg" />
            <p> 社区服务联盟官方微信 </p>
          </li>
          <div class="clearfix"></div>
        </ul>
      </div> -->
				<div class="clearfix"></div>
			</div>
			<!-- <div class="pad-help"> <a href="http://www.shouhuobao.com/index!introduction.html">宅小递简介</a> <a href="http://www.shouhuobao.com/index!service.html">什么是代收货服务</a> <a href="http://www.shouhuobao.com/index!cooperation.html">对外合作</a> <a href="http://www.shouhuobao.com/index!join.html">网点加盟</a> </div> -->
			<div class="copyRight bh-overf">
				<p>
					<span>©2011-2015 Shouhuobao.com 版权所有</span><span
						class="copyright-icp">京ICP证140708号 京ICP备11018594号-1<b>京公网安备编号：11010502026840</b></span>
					<span class="copyAddress">公司地址：北京市朝阳区小关北里甲2号渔阳置业大厦B418室</span>
				</p>
				<img src="image/copyRight.jpg" class="bh-fr">
			</div>
		</div>
	</div>
	<div class="back" style="display: none;">
		<a href="#logo"></a>
	</div>


	<script type="text/javascript">
		/**
		 百度统计* 
		 */
		var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://"
				: " http://");
		document
				.write(unescape("%3Cscript src='"
						+ _bdhmProtocol
						+ "hm.baidu.com/h.js%3F9822e568556ad7e8e899fff38b907343' type='text/javascript'%3E%3C/script%3E"));
	</script>
	<script src="js/h.js" type="text/javascript"></script>
</body>
</html>
