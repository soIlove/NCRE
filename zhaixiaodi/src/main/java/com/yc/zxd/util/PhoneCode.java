package com.yc.zxd.util;

import java.util.Date;
import java.util.Random;

import org.springframework.stereotype.Component;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

@Component("phonecode")
public class PhoneCode  {

	public String getPhonemsg(String mobile){

	// 手机号 //"18188970546"
	final Integer NUM = 6;
		System.out.println(mobile);
		if (mobile == null || mobile == "") {
			System.out.println("手机号为空");
			return  "";
		}
		/**
		 * 短信验证---阿里大于工具
		 */

		// 官网的URL---必须是这个
		String url = "http://gw.api.taobao.com/router/rest";

		// 成为开发者，创建应用后系统会自动生成--前面图片中有说明
		String appkey = "23471496";

		// 创建应用后系统会自动生成--前面图片中有说明
		String secret = "59d530be9b2cf205525e260009e30e16";

		// 随机生成 num 位验证码
		String code = "";
		Random r = new Random(new Date().getTime());
		for (int i = 0; i < NUM; i++) {
			code = code + r.nextInt(10);
		}
		// 需要log4j的Jar包--日志-可删
		

		// 将验证码加入容器中---用户输入验证码之后验证
		/*request.getSession().setAttribute("messageCode", code);*/

		TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);

		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		// 公共回传参数，在“消息返回”中会透传回该参数；
		// 举例：用户可以传入自己下级的会员ID，在消息返回时，该会员ID会包含在内，用户可以根据该会员ID识别是哪位会员使用了你的应用

		req.setExtend("");
		// 短信类型，传入值请填写normal
		req.setSmsType("normal");

		// 签名名称
		req.setSmsFreeSignName("肖坤跻制作");

		// 短信模板的内容
		// String json = "{\"测试\":\"" + code + "\"}";
		String json = "{\"code\":\"" + code + "\",\"测试用例\":\"某某网\"}";

		// 短信模板变量，传参规则{"key":"value"}，key的名字须和申请模板中的变量名一致，多个变量之间以逗号隔开。
		req.setSmsParamString(json);

		// 短信接收号码
		req.setRecNum(mobile);

		// 短信模板ID (验证码)模版
		req.setSmsTemplateCode("SMS_21815016");
		AlibabaAliqinFcSmsNumSendResponse rsp = null;
		try {
			rsp = client.execute(req);
			System.out.println(rsp);
			return code;
		} catch (ApiException e) {
			e.printStackTrace();
		}
		return "";

	

	}

}

