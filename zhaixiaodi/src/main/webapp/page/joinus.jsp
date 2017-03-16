<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="/zhaixiaodi/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>宅小递</title>
<link rel="icon" href="images/favicon.ico"
	type="image/x-icon">
<link rel="shortcut icon" href="images/favicon.ico"
	type="image/x-icon">
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
					商务合作<b class="sub-tab"></b>
				</h3>
				<div class="sub-shadow"></div>
				<img src="image/begins.jpg" width="233" height="60">
				<ul class="sub-menu">
					<li><a
						href="page/about.jsp">公司简介</a></li>
					<li><a
						href="page/services.jsp">服务介绍</a></li>
					<li><a href="page/news.jsp">媒体报道</a></li>
					<li><a
						href="page/cooperation.jsp">合作联系</a></li>
					<li class="on"><a
						href="#">加入我们</a></li>
				</ul>
			</div>
			<div class="mRight businessPage">
				<table width="100%" height="30" border="0">
					<tbody>
						<tr>
							<td class="intro-con" valign="bottom"><strong>您的位置：</strong>
								<a
								href="page/about.jsp">关于我们</a>
								&gt; <a
								href="#">加入我们</a></td>
						</tr>
					</tbody>
				</table>
				<h1>
					<img src="image/joinus.jpg" width="643" height="160">
				</h1>
				<!-- <h2 class="imgtitle" style="font-weight: lighter;color:#000;font-size:28px;line-height:50px;">加入我们</h2> -->
				<div class="joinusnew">
					<dl>
						<dt>在宅小递工作大有不同</dt>
						<dd>
							<p>在宅小递，创业的氛围让每个人都积极创新，为更快乐的生活而努力。在这里没有大公司的等级观念，每个人都可以随时提出自己的创意和想法。</p>
						</dd>
						<dd>
							<a href="http://www.shouhuobao.com/shooter/index%21job.html"
								target="_blank"><img src="image/joinus1.jpg"></a>
						</dd>
					</dl>
					<dl>
						<dt>一起做出让生活更简单的服务</dt>
						<dd>
							<p>让生活更简单。宅小递在国内首创了第三方代收快递的服务模式，致力于建设社区服务生态链。你现在就有机会参与这一切，让这项美好的服务惠及我们这一代人，我们上一代人，我们下一代甚至更多代人！</p>
						</dd>
						<dd>
							<a href="http://www.shouhuobao.com/shooter/index%21job.html"
								target="_blank"><img src="image/joinus2.jpg"></a>
						</dd>
					</dl>
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
	<div class="back">
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
