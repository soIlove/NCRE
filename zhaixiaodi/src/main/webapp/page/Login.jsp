<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="/zhaixiaodi/">
<title>商户中心|宅小递</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/jquery-1.js" type="text/javascript"></script>
<script src="js/swiper.js" type="text/javascript"></script>
<script src="js/base_002.js" type="text/javascript"></script>
<script src="js/wb.js" type="text/javascript" charset="utf-8"></script>

<link href="css/WdatePicker.css" rel="stylesheet" type="text/css">
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
								宅小递在线客服<br> <span class="gray">1914588314</span>
							</p>
							<a onclick='KF.closeIMC(this,"SOFTWARE")' class="btn"
								target="_blank" href="#">点击交谈</a>
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
								<iframe src="htm/followbutton_002.htm" scrolling="no"
									marginheight="0" width="67" height="24" frameborder="0"></iframe>
							</wb:follow-button>
						</div></li>
					<!--已关注-->
					<li class="h-sina" style="display: none;">
						<div class="sina-followed">
							<wb:follow-button uid="2137795655" type="red_1" width="67"
								height="24" class="gz3">
								<iframe src="htm/followbutton_002.htm" scrolling="no"
									marginheight="0" width="67" height="24" frameborder="0"></iframe>
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
					<a href="http://www.shouhuobao.com/index.html"><img
						src="image/Logo.jpg"></a>
				</p>
			</div>
				<div class="menu_1">
				<ul>
					<li class="on"><a href="#" >首页</a></li>
					<li><a href="page/about.jsp">关于我们</a></li>
					<li><a href="page/Login.jsp" style="color: #e76d26;border-bottom: 2px solid #e76d26;">商户中心</a></li>
					<li><a href="page/order.jsp">我要投单</a></li>
					<li><a href="page/profile.jsp" target="_blank">个人中心</a></li>
				</ul>
			</div>
			<div class="navShow"></div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="shop-banner">
		<div class="com-w">
			<div class=" " style="width: 50%px;margin-top:4rem; display: inline-block;" >
				<h3></h3>
				 
				<a	href="page/RegisterDai.jsp">我要申请成为待递员</a>
			</div>
			<div class="login-form">
				<div class="login-bg"></div>
				<form method="post" id="loginForm"
					action="zxd/login" >
					<h3>登录商户中心</h3>
					<p><label style="color:red;" >${errorMsg }&nbsp;</label></p><c:remove var="errorMsg" scope="session"/>
					<div class="bh-item">
						<input id="j_username" name="uphone" placeholder="请输入手机号" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"
							type="text">
					</div>
					<div class="bh-item">
						<input id="j_password" name="upwd" placeholder="密码"
							type="password">
					</div>
					<div class="bh-posRlt mt5">
						<label for="remember" id="cbRemberMe"><a
							href="htm/findPwd.html">忘记密码?</a></label> <label for="remember"
							id="cbRemberMe"><a href="page/Register.jsp">注册新用户</a></label>
					</div>
					<input class="btn" style="cursor: pointer;" onclick="loginSub()"
						value="快速登录" type="submit">
				</form>
			</div>
		</div>
	</div>
	<div class="shop-intro">
		<div class="com-w">
			<h3 class="com-title1">什么是宅小递联盟</h3>
			<p style="line-height: 240%; font-size: 16px;">
				2011年4月，宅小递在北京从第三方代收货平台开始做起；<br>2013年，宅小递的服务已经覆盖北京、上海、广州、深圳四个城市，网点不断增长，用户迅速翻倍，社区物流与生活服务平台初见雏形；
				<br>2014年6月，正式成立宅小递联盟，我们为盟友量身打造全方位发展服务计划，
				让商户“赚钱更轻松，生意更省心，生活更有尊严”，<br> 逐步完善社区服务生态链，更好的为用户服务。
			</p>
		</div>
	</div>
	<div class="five-price">
		<div class="com-w">
			<h3 class="com-title1">五大盟友服务</h3>
			<img src="image/service-1.png"
				style="width: 991px; height: auto; margin: 15px auto; display: block; padding-bottom: 35px;">
		</div>
	</div>
	<div class="five-price" style="background-color: #f6f6f6">
		<div class="com-w">
			<h3 class="com-title1">五大加盟优势</h3>
			<ul class="bh-overf">
				<li class="price-1"><img src="image/advantage-1.png">
					<p>
						<span>领先020</span> <span>运营模式</span>
					</p></li>
				<li class="price-2"><img src="image/advantage-2.png">
					<p>
						<span>专业系统</span> <span>平台共享</span>
					</p></li>
				<li class="price-3"><img src="image/advantage-3.png">
					<p>
						<span>优质网点</span> <span>高频服务</span>
					</p></li>
				<li class="price-4"><img src="image/advantage-4.png">
					<p>
						<span>精英团队</span> <span>草根管理</span>
					</p></li>
				<li class="price-5"><img src="image/advantage-5.png">
					<p>
						<span>门槛低</span> <span>收益高</span>
					</p></li>
			</ul>
		</div>
	</div>
	<div class="three-join">
		<div class="com-w">
			<h3 class="com-title1">三大加盟条件</h3>
			<div class="three-joins">
				<dl>
					<dt>
						<img src="image/join1.png">
					</dt>
					<dd>
						<span>店面位置</span>一线城市住宅社区一层
					</dd>
				</dl>
				<dl>
					<dt>
						<img src="image/join2.png">
					</dt>
					<dd>
						<span>店铺类别</span>便利店、洗衣店、3C数码店等
					</dd>
				</dl>
				<dl>
					<dt>
						<img src="image/join3.png">
					</dt>
					<dd>
						<span>服务口碑</span>诚信亲民，无邻里投诉
					</dd>
				</dl>
			</div>
		</div>
	</div>
	<div class="cooperative cooperative1 bh-posRlt">
		<div class="com-w">
			<h3 class="com-title">宅小递加盟政策&amp;费用</h3>
			<img src="image/cost-1.png"
				style="margin: 15px auto; display: block;">
			<!-- <div class="coop-wrap">
      <div class="autoDiv bh-overf">
        <ul class="bh-overf">
          <li><img src="res2/images/s-coop1.jpg" /></li>
          <li><img src="res2/images/s-coop2.jpg" /></li>
          <li><img src="res2/images/s-coop3.jpg" /></li>
          <li><img src="res2/images/s-coop4.jpg" /></li>
          <li><img src="res2/images/s-coop5.jpg" /></li>
          <li><img src="res2/images/s-coop6.jpg" /></li>
          <li><img src="res2/images/s-coop7.jpg" /></li>
          <li><img src="res2/images/s-coop8.jpg" /></li>
          <li><img src="res2/images/s-coop9.jpg" /></li>
          <li><img src="res2/images/s-coop10.jpg" /></li>
          <li><img src="res2/images/s-coop11.jpg" /></li>
          <li><img src="res2/images/s-coop12.jpg" /></li>
          <li><img src="res2/images/s-coop13.jpg" /></li>
          <li><img src="res2/images/s-coop14.jpg" /></li>
          <li><img src="res2/images/s-coop15.jpg" /></li>
          <li><img src="res2/images/s-coop16.jpg" /></li>
          <li><img src="res2/images/s-coop17.jpg" /></li>
          <li><img src="res2/images/s-coop18.jpg" /></li>
          <li><img src="res2/images/s-coop19.jpg" /></li>
          <li><img src="res2/images/s-coop20.jpg" /></li>
        </ul>
      </div>
      <div class="Bslidetabs"></div>
    </div> -->
		</div>
	</div>
	<div class="join">
		<div class="com-w">
			<h3 class="com-title">加盟流程</h3>
			<img src="image/steps-1.png"
				style="margin: 15px auto; display: block; margin-bottom: 50px;">
		</div>
	</div>
	<div class="big-yellow-btn">
		<a
			href="http://www.shouhuobao.com/merchant/merchant/disp-merchant-add.html">加入宅小递联盟，用互联网+赚钱更轻松</a>
	</div>
	<div class="footer">
		<div class="com-w">
			<div class="bh-overf">

				<div class="clearfix"></div>
			</div>
			<!-- <div class="pad-help"> <a href="http://www.shouhuobao.com/index!introduction.html">宅小递简介</a> <a href="http://www.shouhuobao.com/index!service.html">什么是代收货服务</a> <a href="http://www.shouhuobao.com/index!cooperation.html">对外合作</a> <a href="http://www.shouhuobao.com/index!join.html">网点加盟</a> </div> -->
			<div class="copyRight bh-overf">
				<p>
					<span>Copyright?2011-2015 Shouhuobao.com 版权所有</span><span
						class="copyright-icp">京ICP证110890号 京ICP备11018594号-1<b>京公网安备编号：110105013415</b></span>
					<span class="copyAddress">公司地址：北京市朝阳区小关北里甲2号渔阳置业大厦B403室</span>
				</p>
				<img src="image/copyRight.jpg" class="bh-fr">
			</div>
		</div>
	</div>
	<div class="back">
		<a href="#logo"></a>
	</div>
	<!-- <script>
		$(function() {
			function getCookie(name) {
				var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
				if (arr = document.cookie.match(reg))
					return unescape(arr[2]);
				else
					return null;
			}
			$(".log-in").click(function() {
				if ($(this).html() == "立即登录") {
					$(this).html("取消");
					$(".login-form").show();
				} else {
					$(this).html("立即登录");
					$(".login-form").hide();
				}
			});
			$(".bh-item input").focus(function() {
				$(this).css("border", "1px solid #f29405");
			});
			$(".bh-item input").blur(function() {
				$(this).css("border", "1px solid #dee2e7");
			});
			var ln = $('.coop-wrap ul:first li').length
			var s = {
				w : Number($(window).width()),
				l : $('.coop-wrap li').length,
				ul : $('.coop-wrap ul:first'),
				appTo : function(k, l) {
					var ul = $('<ul class="createUl bh-overf bh-fl"></ul>');
					for (var i = 0; i < ln; i++) {
						if (i >= k && i <= l) {
							$('.coop-wrap ul:first li').eq(i).clone().appendTo(
									ul);
						}
					}
					$('div.autoDiv').append(ul);
					if ($(window).width() > 650 && $(window).width() <= 970) {
						$('.createUl').addClass('w501')
					} else if ($(window).width() <= 650) {
						$('.createUl').addClass('w320')
					}
				},
				b : '',
				span : $('<span></span>'),
				i : 0,
				px : ''
			}

			var tabl = 0;
			function ipad() {
				s.ul.hide();
				if (s.l <= 11) {
					s.appTo(0, 11);
					tabl = 1;
				} else if (s.l > 11 && s.l <= 23) {
					s.appTo(0, 11);
					s.appTo(12, 23);
					tabl = 2;
				} else if (s.l > 23 && s.l <= 35) {
					s.appTo(0, 11);
					s.appTo(12, 23);
					s.appTo(24, 35);
					tabl = 3;
				} else if (s.l > 35 && s.l <= 47) {
					s.appTo(0, 11);
					s.appTo(12, 23);
					s.appTo(24, 35);
					s.appTo(36, 47);
					tabl = 4;
				} else if (s.l > 47 && s.l <= 59) {
					s.appTo(0, 11);
					s.appTo(12, 23);
					s.appTo(24, 35);
					s.appTo(36, 47);
					s.appTo(48, 59);
					tabl = 5;
				}
			}

			function phone() {
				s.ul.hide();
				if (s.l <= 11) {
					s.appTo(0, 11);
					tabl = 1;
				} else if (s.l > 11 && s.l <= 23) {
					s.appTo(0, 11);
					s.appTo(12, 23);
					tabl = 2;
				} else if (s.l > 23 && s.l <= 35) {
					s.appTo(0, 11);
					s.appTo(12, 23);
					s.appTo(24, 35);
					tabl = 3;
				} else if (s.l > 35 && s.l <= 47) {
					s.appTo(0, 11);
					s.appTo(12, 23);
					s.appTo(24, 35);
					s.appTo(36, 47);
					tabl = 4;
				} else if (s.l > 47 && s.l <= 59) {
					s.appTo(0, 11);
					s.appTo(12, 23);
					s.appTo(24, 35);
					s.appTo(36, 47);
					s.appTo(48, 59);
					tabl = 5;
				}
			}
			if (s.w > 650 && s.w <= 970) {
				ipad();
				s.b = true;
				s.px = true;
				addtab();
			} else if (s.w <= 650) {
				phone();
				s.b = true;
				s.px = true;
				addtab();
			} else {
				s.b = false;
				s.px = false;
			}
			function addtab() {
				if (tabl !== 1) {
					for (var j = 0; j < tabl; j++) {
						if (j == 0) {
							$('div.Bslidetabs').append(
									s.span.clone().addClass('current'));
						} else {
							$('div.Bslidetabs').append(s.span.clone());
						}
					}
				}
			}

			function prev() {
				if (s.b) {
					if (s.i > tabl - 2) {
						s.i = 0;
					} else {
						s.i++;
					}
					$('div.autoDiv').animate({
						marginLeft : -s.i * $('.createUl').width()
					})
					$('.Bslidetabs span').removeClass('current').eq(s.i)
							.addClass('current');
				}
			}

			function next() {
				if (s.b) {
					if (s.i == 0) {
						s.i = tabl - 1;
					} else {
						s.i--;
					}
					$('div.autoDiv').animate({
						marginLeft : -s.i * $('.createUl').width()
					})
					$('.Bslidetabs span').removeClass('current').eq(s.i)
							.addClass('current');
				}
			}

			setInterval(function() {
				next();
			}, 4000)

			$('div.Bslidetabs span').live(
					'click',
					function() {
						var index_ = $(this).index();
						s.b = false;
						s.i = index_;
						$('div.autoDiv').animate({
							marginLeft : -s.i * $('.createUl').width()
						})
						$('.Bslidetabs span').removeClass('current').eq(s.i)
								.addClass('current');
						setTimeout(function() {
							s.b = true;
						}, 4000)
					})

			$('div.coop-wrap').touchwipe({
				wipeLeft : function() {
					if (s.px) {
						prev();
						s.b = false;
						setTimeout(function() {
							s.b = true;
						}, 1000)
					}

				},
				wipeRight : function() {
					if (s.px) {
						next();
						s.b = false;
						setTimeout(function() {
							s.b = true;
						}, 1000)
					}
				}
			})

			$(window).resize(
					function() {
						setTimeout(function() {
							s.w = $(window).width();
							if (s.w <= 650) {
								if ($('.autoDiv ul').length === 1) {
									phone();
								} else {
									$('.createUl').show();
									s.ul.hide();
									$('.createUl').attr(
											'class',
											$('.createUl').attr('class')
													.replace('w501', 'w320'));
								}
								s.b = true;
								s.px = true;
							} else if (s.w > 650 && s.w <= 970) {
								if ($('.autoDiv ul').length === 1) {
									ipad();
								} else {
									$('.createUl').show();
									s.ul.hide();
									$('.createUl').attr(
											'class',
											$('.createUl').attr('class')
													.replace('w320', 'w501'));
								}
								s.b = true;
								s.px = true;
							} else if (s.w > 970) {
								if ($('.autoDiv ul').length !== 1) {
									$('.createUl').hide();
									s.ul.show();
								}
								s.b = false;
								s.px = false;
								$('.autoDiv').css({
									marginLeft : 0
								})
							}
							if ($('.Bslidetabs span').length == 0) {
								addtab();
							}
						}, 500)
					})
		});
	</script> -->



	<script type="text/javascript" src="js/map.js"></script>
	<script type="text/javascript" src="js/tripledes.js"></script>
	<script type="text/javascript" src="js/jquery_004.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/bootstrap-select.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/appbuilder.js"></script>
	<script type="text/javascript" src="js/global.js"></script>
	<script type="text/javascript" src="js/subTabSwitch.js"></script>
	<script type="text/javascript" src="js/validate.js"></script>
	<script type="text/javascript" src="js_1/login.js"></script>
	<script type="text/javascript" src="js/WdatePicker.js"></script>
	<script type="text/javascript" src="js/jquery_002.js"></script>
	<script type="text/javascript" src="js/jquery_003.js"></script>
	<script type="text/javascript" src="js/base.js"></script>
	<script type="text/javascript" src="js/qrcode.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>

	<!-- <script type="text/javascript">
		app.ctx = '/merchant';
		app.staticUrlPrefix = '/merchant';
		var __currentLoginUserIno = '';

		//  $("#j_username").blur(testerCheck);

		/* function loginSub() {
			login.login();
		} */

		function GetQueryString(name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
			var r = window.location.search.substr(1).match(reg);
			if (r != null)
				return (r[2]);
			return null;
		}

		var u = GetQueryString("u");
		if (u) {
			$("#j_username").val(u);
			$("#j_password").focus();
		}
	</script>
	<div id="_my97DP"
		style="position: absolute; top: -1970px; left: -1970px;">
		<iframe style="width: 186px; height: 198px;"
			src="htm/My97DatePicker.htm" border="0" scrolling="no"
			frameborder="0"></iframe>
	</div> -->
</body>
</html>
