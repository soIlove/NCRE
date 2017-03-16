<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<base href="/zhaixiaodi/">

<meta charset="UTF-8">
<title>信息填写</title>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Cache-Control" content="no-cache">

<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">

<link rel="stylesheet" type="text/css" href="css/theme.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-select.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="css/docs.css">
<link rel="stylesheet" type="text/css" href="css/prettify.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/jquery.css">
<link type="text/css" rel="stylesheet" href="easyui/themes/icon.css" />
<link type="text/css" rel="stylesheet"
	href="easyui/themes/default/easyui.css" />
<script type="text/javascript" src="css/jquery-1.js"></script>

<title>商户中心 | 宅小递</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="css/join.css">
<script src="js/wb.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery-1_002.js"></script>
<script src="js/jquery-validate.js"></script>
<script src="js/swiper.js" type="text/javascript"></script>
<script src="js/base_002.js" type="text/javascript"></script>
<script src="js/layer.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/layer.css"
	id="layui_layer_skinlayercss" style="">
<script src="js/uploadPreview.js" type="text/javascript"></script>
<script src="js/wb.js" type="text/javascript" charset="utf-8"></script>


<link href="css/WdatePicker.css" rel="stylesheet" type="text/css">
<link href="css/order.css" rel="stylesheet" type="text/css">
<script charset="UTF-8" src="js/iframeWidget.js"></script>
<script type="text/javascript" src="js_1/jquery-1.12.4.js"></script>
<body>
	<iframe style="display: none;" id="sina_anywhere_iframe"></iframe>


	<input id="h_userId" type="hidden">
	<div id="pushMsgDiv" class="hide"></div>
	<div class="s_code_pickup" id="s_code_pickup" style="display: none">

		<ul id="s_code_pickup_id">

		</ul>

	</div>
	<div id="header-top">
		<div id="header-top-content" class="clearfix">

			<div class="flr">
				<ul>
					<li style="border-left: none"><a
						href="http://www.shouhuobao.com/" target="_blank">宅小递首页</a></li>

					<li style="border-right: medium none;">
						<!--  <script charset="utf-8"
						type="text/javascript"
						src="http://wpa.b.qq.com/cgi/wpa.php?key=XzkzODA0Nzc3Ml82MjIzNF80MDA3MzMzMzkwXw"></script>
					 -->
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="header-logo" class="clearfix">
		<div class="fll">

			<a href="http://www.shouhuobao.com/merchant"><img alt=""
				src="image/merchant-logo.jpg"></a>

		</div>
		<div class="flr"></div>
		<input id="_merchantReceivePointId" value="" type="hidden"> <input
			id="merchantPhoneHidden" type="hidden">
	</div>
	<div id="maskLayer" class="modal-backdrop fade hide"
		style="z-index: 2000;">
		<img alt="" src="image/loading-big.gif"
			style="left: 50%; margin-left: -62px; margin-top: 18%; position: absolute;">
	</div>



	<!--  

-->
	<div class="header-top">
		<div class="com-w">
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
								<a
									onclick="javascript:window.open('http://b.qq.com/webc.htm?new=0&amp;sid=4007333390&amp;o=http://www.shouhuobao.com/&amp;q=7', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');">点击交谈</a>
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
					
						<li><a href="index.jsp">首页</a></li>
						<li><a href="page/about.jsp">关于我们</a></li>
						<li class="on"><a href="page/Login.jsp">商户中心</a></li>
						<li><a href="page/order.jsp"
							style="color: #e76d26; border-bottom: 2px solid #e76d26;">我要投单</a>
						</li>
						<li><a href="page/profile.jsp">个人中心</a></li>
					
				</ul>
			</div>
			<div class="navShow"></div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="content">
		<div class="zln-banner_in">
			<a href=""> </a>
		</div>
		<div class="zln-w970">
			<div class="zln-join">
				<div class="zln-join_in">
					<h4>请填写快递相关信息</h4>

					<form class="form-horizontal" action="" method="post" id="iform">
						<input id="uuid" name="uuid" type="hidden"
							value="${loginUser.uuid }">
						<div class="f14 mt20">请您认真填写下列信息，有助于更快为您领取快递，谢谢您的认真填写</div>

						<!-- 详细信息 -->
						<div class="zln-join_box zln-c">
							<div class="zln-join_title">
								<span>详细信息</span><font></font>
							</div>
							<ul>
								<li class="zln-li1"><span>真实名字</span> <input id="orelname"
									value="" required="required" name="orelname"
									autofocus="autofocus" class="zln-text1" type="text"
									placeholder=""> <font></font></li>

								<li class="zln-li1"><span>取货码</span> <input id="ocode"
									name="ocode" value="" required="required" class="zln-text1"
									type="text" placeholder="请输入取货码"> <font></font></li>

								<li class="zln-li1"><span>包裹大小</span> &nbsp;<input
									type="radio" name="osize" value="小包裹" checked="checked">
									&nbsp;小包裹&nbsp;&nbsp; <input type="radio" name="osize"
									value="大包裹" /> &nbsp; 大包裹</li>

								<li class="zln-li1"><span>投单描述</span> <!--  <input id="uemail" name="uemail" class="zln-text1" type="text">  -->
									<textarea rows="5" cols="25" name="odesc" id="odesc"> </textarea>
								</li>

								<li class="zln-li1"><span>地址</span> <input id="oaddr"
									name="oaddr" readonly="readonly" class="zln-text1" type="text"
									value="">&nbsp;&nbsp;<input type="button"
									value="更改地址" id="modify_addr" name="modify_addr"
									onclick="selectaddr()" /></li>

								<li class="zln-li1"><span>代递金额</span> <input id="oprice"
									name="oprice" value="10" required="required" class="zln-text1"
									type="text"></li>
								<li class="zln-li1"><span>快递类型</span> <input id="otype"
									name="otype" value="中通" required="required" class="zln-text1"
									type="text"></li>


								<li class="zln-dtest zln-li1"><span>&nbsp;</span>
									<div class="zln-libt_a">
										<input id="submitOk" value="我要投单" class="zln-button"
											type="button" onclick="order()">

										<!-- 完成 -->

									</div></li>
							</ul>
						</div>
					</form>
				</div>
				<div id="seleaddrDIV" style="dispaly:none">
					<div class="mainmsg">
						<ul id="profile_ul_addr">
							 <!-- <li class="profile_li_addr_1">
																<div class="profile_div_addr_1" >
																		<span>湖南工学院D6-312寝室</span>&nbsp;&nbsp;
																								<a  href="javaScript:deladdr(this)" class="profile_a_addr" >选择</a>										
																</div>								
														</li>	  -->
						</ul>
						

						<div class="profile_div_addr_2">
								<input type="text" name="addr_2_inp" id="addr_2_inp"/>
							<a href="javaScript:addaddr()"><span>+添加新地址</span></a><br />
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="back" style="display: none;">
		<a href="#logo"></a>
	</div>



	<div class="footer">
		<div class="com-w">

			<div class="copyRight bh-overf">
				<p>
					<span>©2017-2027 Zhaixiaodi.com 版权所有</span><span
						class="copyright-icp">湘ICP证110890号 湘ICP备11018594号-1<b>京公网安备编号：110105013415</b></span>
					<span class="copyAddress">公司地址：湖南省衡阳市珠晖区湖南工学院</span>
				</p>
				<img src="image/copyRight.jpg" class="bh-fr">
			</div>
		</div>
	</div>


	<script type="text/javascript" src="js/map.js"></script>
	<script type="text/javascript" src="js/tripledes.js"></script>
	<script type="text/javascript" src="js/jquery_003.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/bootstrap-select.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/appbuilder.js"></script>
	<script type="text/javascript" src="js/global.js"></script>
	<script type="text/javascript" src="js/validate.js"></script>
	<script type="text/javascript" src="js/login.js"></script>
	<script type="text/javascript" src="js/WdatePicker.js"></script>
	<script type="text/javascript" src="js/jquery_004.js"></script>
	<script type="text/javascript" src="js/jquery_002.js"></script>
	<script type="text/javascript" src="js/base.js"></script>
	<script type="text/javascript" src="js/qrcode.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script src="js_1/jquery-1.12.4.js" type="text/javascript"></script>
	<script src="easyui/jquery.min.js" type="text/javascript"></script>
	<script src="easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
	<script src="easyui/jquery.easyui.min.js" type="text/javascript"></script>
	<script>
		function joinUs() {
			layer.open({
				type : 0,
				title : '加盟协议',
				area : [ '800px', '360px' ],
				//btn: ['接受', '拒绝'],
				shadeClose : false, //点击遮罩关闭
				content : $('#confirm').html(),
				yes : function(index, layero) {
					//layer.msg('您已同意加盟协议，请填写加盟信息');
					layer.close(index);
					$("#isnot").attr("checked", true);
				},
				cancel : function(index) {
					//layer.msg('您未同意加盟协议，回到首页');
					//location.href = "/";
				}
			});
		}
	</script>
	<script src="js_1/order.js" type="text/javascript"></script>
	<div id="_my97DP"
		style="position: absolute; top: -1970px; left: -1970px;">
		<iframe style="width: 186px; height: 198px;"
			src="htm/My97DatePicker.htm" border="0" scrolling="no"></iframe>
	</div>
</body>
</html>
