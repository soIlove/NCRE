<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<base href="/zhaixiaodi/">

<meta  charset="UTF-8">
<title>普通用户注册</title>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Cache-Control" content="no-cache">

<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">

<link rel="stylesheet" type="text/css" href="css/theme.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-select.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="css/docs.css">
<link rel="stylesheet" type="text/css" href="css/prettify.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/jquery.css">	

<script type="text/javascript" src="css/jquery-1.js"></script>

<title>商户中心 | 宅小递</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" type="text/css" href="css/order.css">
    <script src="js/wb.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery-1_002.js"></script>
    <script src="js/jquery-validate.js"></script>
    <script src="js/swiper.js" type="text/javascript"></script>
    <script src="js/base_002.js" type="text/javascript"></script>
    <script src="js/layer.js" type="text/javascript"></script><link rel="stylesheet" href="css/layer.css" id="layui_layer_skinlayercss" style="">
    <script src="js/uploadPreview.js" type="text/javascript"></script>
    <script src="js/wb.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/api" type="text/javascript"></script><script type="text/javascript" src="js/getscript"></script>
     <script src="js_1/Register.js" type="text/javascript"></script>
<link href="css/WdatePicker.css" rel="stylesheet" type="text/css">
<script charset="UTF-8" src="js/iframeWidget.js"></script>
<script type="text/javascript" src="js_1/jquery-1.12.4.js" ></script>


<body><iframe style="display: none;" id="sina_anywhere_iframe"></iframe>
	

<style type="text/css">
.s_code_pickup {
	text-align: center;
	background-color: #fff;
	border-radius: 3px;
	position: fixed;
	width: 268px;
	height: auto;
	left: 806px;
	top: 34px;
	border: 1px solid #dddddd;
	box-shadow: 0 0 3px #ccc;
	padding:10px;
	z-index: 99999;
}
.s_code_pickup ul{ margin:0; padding: 0; height:160px; overflow-y:scroll;overflow-x:hidden; list-style:none;}
.s_code_pickup ul li{ height:auto; line-height:1.5;font-size:12px; color:#666; text-align:left; margin:0; padding:7px 10px 7px 10px; border-bottom:1px solid #eeeeee;} 
.s_code_pickup ul li a{text-decoration: none; color: #ff6600;}
.s_code_pickup ul li a:hover{color: #ff9900;}
</style>


<input id="h_userId" type="hidden">
<div id="pushMsgDiv" class="hide"></div>
 <div class="s_code_pickup" id="s_code_pickup" style="display:none">
            
            <ul id="s_code_pickup_id"> 
			
            </ul>
            
          </div>
<div id="header-top">
	<div id="header-top-content" class="clearfix">
		
		<div class="flr">
			<ul>
				<li style="border-left: none"><a href="http://www.shouhuobao.com/" target="_blank">宅小递首页</a></li>
				
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

				<a href="http://www.shouhuobao.com/merchant"><img alt="" src="image/merchant-logo.jpg"></a>
	
	</div>
	<div class="flr">

	</div>
	<input id="_merchantReceivePointId" value="" type="hidden"> <input id="merchantPhoneHidden" type="hidden">
</div>
<div id="maskLayer" class="modal-backdrop fade hide" style="z-index: 2000;">
	<img alt="" src="image/loading-big.gif" style="left: 50%; margin-left: -62px; margin-top: 18%; position: absolute;">
</div>



<!--  

-->
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

                    <div class="qq-tanchu"><b></b>

                        <p> 宅小递在线客服 <br>
                            <span class="gray">4007333390</span></p>
                        <a onclick="javascript:window.open('http://b.qq.com/webc.htm?new=0&amp;sid=4007333390&amp;o=http://www.shouhuobao.com/&amp;q=7', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');">点击交谈</a>
                    </div>
                </li>
                <!--未关注-->
                <li class="h-sina"><em></em>

                    <div class="sina-tanchu"><b></b>

                        <p> 宅小递官方微博： <br>
                            <img src="image/logo1.png"></p>
                        <wb:follow-button uid="2137795655" type="red_1" width="67" height="24" class="gz2"><iframe src="htm/followbutton_002.htm" scrolling="no" marginheight="0" width="67" height="24" frameborder="0"></iframe></wb:follow-button>
                    </div>
                </li>
                <!--已关注-->
                <li class="h-sina" style="display:none;">
                    <div class="sina-followed">
                        <wb:follow-button uid="2137795655" type="red_1" width="67" height="24" class="gz3"><iframe src="htm/followbutton_002.htm" scrolling="no" marginheight="0" width="67" height="24" frameborder="0"></iframe></wb:follow-button>
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
            <p><a href="http://www.shouhuobao.com/index.html"><img src="image/Logo.jpg"></a></p>
        </div>
        	<div class="menu_1">
				<ul>
					<li class="on"><a href="#">首页</a></li>
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
<div class="content">
    <div class="zln-banner_in"><a href=""> </a></div>
    <div class="zln-w970">
        <div class="zln-join">
            <div class="zln-join_in">
                <h4>请填写注册信息</h4>
             
                <form class="form-horizontal" action="" method="post" id="iform" enctype="multipart/form-data">
                    <div class="f14 mt20">请您认真填写下列信息，有助于提供审核通过几率，谢谢您的认真填写</div>
						
                    <div class="zln-join_box zln-c">
                        <div class="zln-join_title"><span>验证信息</span><font></font></div>
                        <ul>
                            <li class="zln-li1"><span>手机号</span>
                                <input id="uphone" name="uphone" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" class="zln-text1" maxlength="11" type="text">
                                <input style="width: 99px" class="yzm-btn disabled" id="getMsgBtn" value="获取验证码"  type="button" onclick="getCaptcha()">
                            </li>
                            <li class="zln-li1"><span>手机验证码</span>
                                <input class="zln-text1" id="vaildNum" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" name="vaildNum" maxlength="6" type="text">
                                <input id="vaild" name="vaild" type="hidden"></li>
                      			<span id="codeMsg" style="color: red"></span>
                              <li class="zln-li1"><span>登录密码</span>
                                <input class="zln-text1" id="upwd" name="upwd" maxlength="12" type="password" placeholder="请输入3-12位字母或数字">
                                <span id="PwdMsg" style="color: red;width: 20rem;"></span>
                              </li>
                                
                                 <li class="zln-li1"><span>确认密码</span>
                                <input class="zln-text1" id="password02" name="password02" maxlength="12" type="password" placeholder="请再次确认密码">
                                <span id="comfirPwdMsg" style="color: red;width: 10rem;"></span>
                               </li>
                             
                        </ul>
                    </div>
                  
                    <!-- 详细信息 -->
                    <div class="zln-join_box zln-c">
                        <div class="zln-join_title"><span>详细信息</span><font></font></div>
                        <ul>
                            <li class="zln-li1"><span>用户昵称</span>
                                <input id="uname" name="uname" class="zln-text1" type="text" placeholder="" > <font></font>
                            </li>
                             <li class="zln-li1"><span>用户性别</span>
                              &nbsp;<input type="radio" name="usex" value="男" checked="checked"> &nbsp;男&nbsp;&nbsp;<input type="radio" name="usex" value="女"/>  &nbsp; 女
                               
                            </li>
                           
                               <li class="zln-li1"><span>用户邮箱</span>
                                <input id="uemail" name="uemail" class="zln-text1" type="email"> 
                            </li>
                             
                               <li class="zln-li1"><span>所在学校</span>
                                <input id="uaddr" name="uaddr" class="zln-text1" type="text"> 
                            </li>
                            
                           <!--  <li class="zln-li1"><span>证件类型</span>
                                <input name="receivePointJoin.card_type" id="card_type" type="hidden">

                                <div class="zln-select zln-selectb">
                                    <div class="zln-select_box">请选择</div>
                                    <div class="zln-select_fola" style="display: none;">
                                        <p>
                                            <a onclick="javascript:$('#card_type').attr('value','身份证');">身份证</a>
                                        </p>

                                        <p>
                                            <a onclick="javascript:$('#card_type').attr('value','护照');">护照</a>
                                        </p>
                                    </div>
                                </div>
                                <span class="last">证件号码</span>
                                <input id="proposer_card_id" name="receivePointJoin.proposerCardId" class="zln-text1" type="text"> <font></font>
                            </li> -->
                            <li class="zln-li1"> <span>用户头像<br>
                          <b class="need">(点我)</b></span>

                                <div class="zw">
                                    <input name="upicdata" id="upicture"  multiple="multiple" type="file" style="display:none"onchange="addpic(this)">
                                    <a href="" onclick="document.getElementById('upicture').click();return false;"><div id="divdcardf"><img id="upicimage" src="image/zw.jpg"></div></a>
                                </div>
                          <!--   <span class="last">证件照片<br>
                                <b class="need">（背面）</b></span>

                                <div class="zw">
                                    <input name="idcardb1" id="idcardb" style="display:none" onclick="" multiple="" type="file">
                                    <a href="" onclick="document.getElementById('idcardb').click();return false;"><div id="dividcardb"><img id="imgidcardb" src="%E5%95%86%E6%88%B7%E4%B8%AD%E5%BF%83%20_%20%E6%94%B6%E8%B4%A7%E5%AE%9D_files/zw.jpg"></div></a>
                                </div>
                                <div class="zln-c hint1">*像素要求必须为640*340像素，支持.jpg .jpeg .bmp .png格式，大小不超过5M</div> -->
                            </li>
                            <li class="zln-li1" style="padding-left:153px;color:#000;font-size:14px">
                                <input id="isnot" name="isnot" type="checkbox" required="required"> 同意协议 <a href="javascript:void(null)" onclick="joinUs();" style="color:#00f">点击查看协议条款&gt;&gt;</a>
                            </li>
                            <li class="zln-dtest zln-li1"><span>&nbsp;</span>

                                <div class="zln-libt_a">
                                	
                                    <input id="submitOk" value="完成注册" class="zln-button" type="submit" >
									<!--  <button id="submitOk" value="完成注册" class="zln-button"  onclick="Register()">完成注册</button> -->
                                    <!-- 等待 -->
                         
                                    <!-- 完成 -->
                                    
                                </div>
                            </li>
                        </ul>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<div class="back" style="display: none;"><a href="#logo"></a></div>
<div id="confirm" class="content" style="width: 800px; height: 600px; background-color: #FFFFFF; overflow: auto; display: none;">
    <h3 align="center"><strong>宅小递客户协议</strong></h3>

    <h2 align="center">增值服务平台加入协议</h2>

    <p><strong>甲方：宅小递工作室（以下简称“甲方”）</strong><br>
        <strong>乙方：__________________________________（以下简称“乙方”）</strong>

    </p><p>&nbsp;&nbsp;&nbsp;&nbsp;宅小递是甲方建设、投资和运营的社区物流与生活服务平台（以下简称“宅小递平台”），
        致力于为有社区生活增值服务需求的个人或单位（以下简称“用户”）与提供增值服务的商户（以下简称“商户”）搭建第三方交易平台， 并提供相关的信息、管理等服务。
        同时，甲方为所有合作商户构建宅小递社区服务联盟（以下简称“宅小递联盟”），乙方希望正式加入宅小递平台并在该平台上开展相应的业务。 经甲乙双方友好协商， 就乙方加入宅小递平台开展相应业务等相关事宜订立如下一致协议：</p>
    <h4><strong>第一条 双方基本信息</strong></h4>

    <p>&nbsp;&nbsp;&nbsp;&nbsp;甲方系经工商行政管理局登记注册的合法法人，具有独立民事行为能力，能独立承担本协议全部的权利义务。 甲方有权授权甲方的关联公司处理与本协议相关的所有事项。<br>
        甲方的营业地址：北京市朝阳区小关北里甲2号渔阳置业大厦B403，<br> 电话: 010-59802933, 电子邮件:
        kf@shouhuobao.com，微信号：shouhuobao，甲方支付宝账户：alexluo@collectplus.cn
        甲方银行账户：户名：客恩瑞（北京）网络技术有限公司
        开户行：中国工商银行望京支行 账号：0200 0035 1900 0186 638
        乙方系具有独立民事行为能力的法人或个人，能独立承担本协议全部的权利义务。</p>
    <h4><strong>第二条 双方合作内容及合作条件</strong></h4>

    <p>1、合作内容：乙方门店申请成为甲方授权的增值服务网点, 自愿为其潜在用户提供社区增值生活服务或开展社区电子商务业务；<br>
        2、合作条件：<br>
        2.1、乙方需提供具备实时上网条件的智能手机、平板或电脑；<br>
        
        
        
        2.2、乙方必须具备独立存放包裹的货架或场所，并按要求张贴相关标识；<br>
        2.3、乙方的营业时间需至少满足每日09:00—21:00的正常营业时间；<br>
        2.4、乙方必须具备和提供冷藏/冷冻设备存放需低温保存的包裹或商品;<br>
        2.5、乙方在甲方平台系统产生服务费时，甲方可先行扣除500元作为合作保证金并予以冻结，当系统余额超过500元时，超额部分乙方可以根据实际情况提现。冻结的保证金，在双方合作结束且无异议时退还。</p>
    <h4><strong>第三条 收益与结算</strong></h4>

    <p>1. 在本协议有效期内，通过甲乙方双方的共同努力，达到促进乙方收益的持续增长（详见附件二）；<br>
        2. 收益结算方式：<br>
        &nbsp;&nbsp;&nbsp;&nbsp; a)每月18日（遇法定节假日顺延），甲方在系统中公布乙方前一个月的结算账单，并将账单对应的服务费用加入乙方在系统中的账户。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;
        b)乙方在系统中申请将服务费支付至指定的结算银行账户中，甲方将扣除相应的税金(乙方提供与本商户名称一致的服务费发票的除外)及转账手续费，同一提现人有多个合作网点将按税务局规定依当月累计提现总额计税。<br>
        &nbsp;&nbsp;&nbsp;&nbsp; c)甲方将会在申请后5个工作日内，对已提交的支付申请进行审核；如审核通过，将在5个工作日内向银行提请支付。具体到账时间以各银行规定为准。<br>
        3.
        
乙方应妥善保管甲方提供的平台账户和密码，并对账户和密码的安全，以及对通过乙方的账户和密码实施的行为/操作负责。如果发现任何人不当使用您的账户或有
任何其他可能危及您的账户安全的情形时，您应当立即以有效方式通知甲方，要求甲方暂停相关服务，甲方对在采取行动前已经产生的后果不承担责任。
    </p>
    <h4><strong>第四条 甲方的权利与义务</strong></h4>

    <p>1、甲方负责提供自身研发的宅小递平台及终端应用软件（以下简称“系统”）， 并负责系统的定期维护与更新，保证其良好的工作状态。<br>
        2、甲方将协助乙方进行增值业务的宣传、推广，并设立专职客服，协助乙方解决相关问题。<br>
        3、甲方将根据乙方的业务情况与乙方的选择逐步开通增值业务。<br>
        4、甲方将为乙方在宅小递平台上建立宣传平台，供乙方发布打折、促销、招聘等信息。但乙方必须确保发布信息的真实性、合法性，否则甲方有权删除并追究乙方的法律责任。<br>
        5、甲方有权在宅小递平台上更新与商户有关的协议、条款或收益标准，若乙方不接受该等更新即视为乙方提前解除本协议并退出宅小递平台。 <br>
        6、甲方有权为符合其评估条件的门店配备相应的展示物料，乙方应予以配合。</p>
    <h4><strong>第五条 乙方的权利与义务</strong></h4>

    <p>1、在本协议约定的期限内，乙方不得与其他公司或个人再签订与本协议类似的协议或文件，不得以任何形式再加入任何与宅小递平台类似的增值服务平台，一经发现，甲方有权立即中止合作并扣除账户所有余额。<br>
        2、乙方应积极向用户宣传与推广开通的增值服务，利用自有资源开展更多的延展性服务。<br>
        3、若乙方开通的增值服务中涉及货物实体的存放，自乙方签收货物之时起至货物被用户或快递取走之时止（即“保管期内”）,乙方应当妥善保管货物并确保其安全，以系统中完成全部流程的订单为结算依据。<br>
        4、乙方应严格按照甲方的要求在经营场所悬挂统一字样的标识，甲方将根据乙方业务的开展情况提供有偿或无偿的业务物料及宣传品，但物料送至乙方的运输费用由乙方承担。<br>
        5、乙方必须保证严格按照甲方提供的操作手册或网站操作指引执行； <br>
        6、乙方有权向甲方申请相应的基础物料，甲方将根据乙方业务的开展情况提供有偿或无偿的业务物料及宣传品，但物料送至乙方的运输费用由乙方承担。</p>
    <h4><strong>第六条 违约责任</strong></h4>

    <p>任何一方均不得违反本协议的约定，否则对方有权要求违约方限期改正，逾期仍未改正的，对方有权解除本协议并追究其违约责任。常见的违约情况包含但不限于如下列表：<br>
        违约情况&nbsp;&nbsp;&nbsp;&nbsp; 违约及赔偿责任<br>
        货物丢失&nbsp;&nbsp;&nbsp;&nbsp; 货物的实际价值<br>
        临时暂停服务而未提前通知甲方 首次警告，再次罚款100元<br>
        人为损坏设备或物料&nbsp;&nbsp;&nbsp;&nbsp; 按设备或物料的实际价值进行赔偿<br>
        弄虚作假、伪造订单等行为&nbsp;&nbsp;&nbsp;&nbsp; 首次扣除所有虚假订单收益，再次以当月服务费用作为罚款<br>
        擅自向用户重复收费或多收费 &nbsp;&nbsp;&nbsp;&nbsp; 首次罚款50元，再次以当月服务费用作为罚款</p>
    <h4><strong>第七条 续约与解约</strong></h4>

    <p>1、本协议有效期三年，双方完成签署后自甲方审核通过并开通运营之日起正式生效。协议期满双方均未提出异议时，本协议自动延续。<br>
        2、甲乙双方均有权提前30日书面通知对方解除本协议，协议自一方发出书面通知之日起第30日即解除；<br>
        3、若出现以下情形之一，甲方有权书面通知乙方解除本协议并不予结算相关费用：<br>
        &nbsp;&nbsp;&nbsp;&nbsp; a)乙方存在非法侵占、擅自拆开、擅自使用用户货物的行为。<br>
        &nbsp;&nbsp;&nbsp;&nbsp; b)乙方变更经营地址而未通知甲方。<br>
        &nbsp;&nbsp;&nbsp;&nbsp; c)乙方单方面停止合作而未通知甲方。<br>
        &nbsp;&nbsp;&nbsp;&nbsp; d)乙方同时与宅小递平台类似的增值服务提供商合作。<br>
        &nbsp;&nbsp;&nbsp;&nbsp; e)乙方存在弄虚作假、伪造订单等行为达到3次及以上。<br>
        4、合作终止后,双方应在15个工作日内结清所有往来款项和货物，且乙方应销毁甲方所有标志和宣传资料。 </p>
    <h4><strong>第八条 特别条款</strong></h4>

    <p>
        双方确认，甲方并不从事增值服务业务，而仅仅是为用户及商户提供第三方技术平台。乙方与甲方不存在加盟关系，不是甲方的经营网点，与甲方亦不存在隶属关系、雇佣关系或挂靠关系。双方各自经济上独立核算，法律上独立承担责任，税赋各自承担。</p>
    <h4><strong>第九条 附则</strong></h4>

    <p>1、本协议以及本协议履行过程中一切相关资料应当进行严格的保密。</p>
    <p></p>
</div>
	

<div class="footer">
    <div class="com-w">
        
       <div class="copyRight bh-overf">
            <p><span>©2017-2027 Zhaixiaodi.com 版权所有</span><span class="copyright-icp">湘ICP证110890号   湘ICP备11018594号-1<b>京公网安备编号：110105013415</b></span>
                <span class="copyAddress">公司地址：湖南省衡阳市珠晖区湖南工学院</span></p>
            <img src="image/copyRight.jpg" class="bh-fr"></div>
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
<script type="text/javascript" src="js/subTabSwitch.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/WdatePicker.js"></script>
<script type="text/javascript" src="js/jquery_004.js"></script>
<script type="text/javascript" src="js/jquery_002.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="js/qrcode.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>

<script>
function joinUs(){
		layer.open({
    type: 0,
    title: '加盟协议',
    area: ['800px', '360px'],
    //btn: ['接受', '拒绝'],
    shadeClose: false, //点击遮罩关闭
    content: $('#confirm').html(),
    yes: function (index, layero) {
        //layer.msg('您已同意加盟协议，请填写加盟信息');
        layer.close(index);
        $("#isnot").attr("checked",true);
    },
    cancel: function (index) {
        //layer.msg('您未同意加盟协议，回到首页');
        //location.href = "/";
    }
});	
}
</script>
<script src="easyui/jquery.min.js" type="text/javascript"></script>
<script src="easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
<script src="easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="js_1/Register.js" type="text/javascript"></script>
 <div id="_my97DP" style="position: absolute; top: -1970px; left: -1970px;">
 <iframe style="width: 186px; height: 198px;" src="htm/My97DatePicker.htm" border="0" scrolling="no" ></iframe></div>
</body></html> 
