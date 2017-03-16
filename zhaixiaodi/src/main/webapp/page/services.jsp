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
						<div class="sina-tanchu" style="left: 845px; display: none;">
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
					<a href="#"><img src="image/Logo.jpg"></a>
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
					我们的服务<b class="sub-tab"></b>
				</h3>
				<div class="sub-shadow"></div>
				<img src="image/begins.jpg" width="233" height="60">
				<ul class="sub-menu">
					<li><a href="page/about.jsp">公司简介</a></li>
					<li class="on"><a href="page/services.jsp">服务介绍</a></li>
					<li><a href="page/news.jsp">媒体报道</a></li>
					<li><a href="page/cooperation.jsp">合作联系</a></li>
					<li><a href="page/joinus.jsp">加入我们</a></li>
				</ul>
			</div>
			<div class="mRight servicePage">
				<table width="100%" height="30" border="0">
					<tbody>
						<tr>
							<td class="intro-con" valign="bottom"><strong>您的位置：</strong>
								<a
								href="http://www.shouhuobao.com/shooter/index%21introduction.html">关于我们</a>
								&gt; <a
								href="http://www.shouhuobao.com/shooter/index%21service.html">服务介绍</a></td>
						</tr>
					</tbody>
				</table>

				<h1>
					<img src="image/fuwu.jpg" width="643" height="160">
				</h1>
				<h2 class="imgtitle"
					style="font-weight: lighter; color: #000; font-size: 28px; line-height: 50px;">服务介绍</h2>
				<h3 class="imgtitle2" style="font-weight: lighter;">快递管家服务</h3>
				<p>
					<strong>代收服务：专为网购用户提供的一项第三方代收快递服务。宅小递</strong>
				</p>
				<p>当网购用户在家或者公司收货不方便时，将离用户地址最近的宅小递网点作为收货地址；当包裹到达网点后，用户去网点自取即可。</p>
				<p>四大服务特色：</p>
				<p>
					便捷：网点离家最近，约两三百米，就在回家路边；<br> 安全：无需填写家庭地址，规避快递上门的各种潜在风险；<br>
					温馨：半熟人式的邻里社交服务，无陌生感；<br> 舒适：省心、省力，解决快递打扰、无人代收快递的烦恼。
				</p>
				<p>&nbsp;</p>
				<p>
					<strong>代寄服务：专注剁手党用（mei）户（zhi）退货的快递服务。</strong>
				</p>
				<p>当用户有寄件（退货）服务需求时，通过裹儿APP在线下单，呼叫快递员上门取件；或在裹儿APP完成寄件流程，把退货包裹放到宅小递寄件合作网点即可。</p>
				<p></p>
				<p>六大服务特色：</p>
				<p>便捷：快递1小时上门或者到店自寄，怎么方便怎么用；</p>
				<p>安全：用网点地址代替私人地址，规避隐私泄露的各种潜在风险；</p>
				<p>实惠：呼叫快递员上门寄件，包裹越多越划算；</p>
				<p>省心：在线下单，再也不用手写快递面单了；</p>
				<p>贴心：每天服务到22:00，再也不用担心下班回家没法寄快递了；</p>
				<p>细心：提供快递包装服务，并会拍照回传用户。</p>
				<br>
				<p>
					<strong>查询服务：查询追踪包裹物流信息，查询服务网点信息。</strong>
				</p>
				<br>
				<h3 class="imgtitle2" style="font-weight: lighter;">生活管家服务</h3>
				<p>宅小递网点——社区便利店、洗衣店、3C数码店</p>
				<p>
					网点本身有丰富的生活用品和生活服务。<br>各大社区网点提供品类丰富的食品、饮料、香烟、啤酒、新鲜蔬果、厨房用品、居家用品等各种生活日用品和3C数码产品，还提供包括洗衣、家电维修等生活服务。
				</p>
				<p>宅小递微信——提供各种生活实惠福利，精选超值美食、日用品、家居用品为用户提供更便捷的生活服务。</p>
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
					<span class="copyAddress">公司地址：湖南省衡阳市珠晖区湖南工学院</span>
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