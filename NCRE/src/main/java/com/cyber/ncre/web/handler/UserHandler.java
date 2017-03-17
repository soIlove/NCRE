package com.cyber.ncre.web.handler;
/*package com.yc.zxd.web.handler;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.yc.zxd.entity.Address;
import com.yc.zxd.entity.Duser;
import com.yc.zxd.entity.User;
import com.yc.zxd.service.UserService;
import com.yc.zxd.service.impl.UserServiceImpl;
import com.yc.zxd.util.PhoneCode;
import com.yc.zxd.util.ServletUtil;

@Controller
@RequestMapping("/zxd")
@SessionAttributes({ "loginUser" })
public class UserHandler {

	@Autowired
	private UserService userService;

	@Autowired
	private JavaMailSender mailSender;

	private String code = "";

	public UserHandler() {
		userService = new UserServiceImpl();
	}

	@RequestMapping("/check") // 检查用户是否存在
	@ResponseBody
	public boolean check(String tel) {
		boolean result = false;
		LogManager.getLogger().debug("进入UserHandler 处理isExistUN,检查用户是否存在,username:" + tel);
		result = userService.isExistUN(tel);// 检查用户是否存在
		return result;
	}

	@RequestMapping("/verifyCode") // 检查用户是否存在
	@ResponseBody
	public boolean verifyCode(String code, ServletRequest request) {
		boolean result = false;
		HttpSession session = ((HttpServletRequest) request).getSession();
		String realCode = (String) session.getAttribute("rand"); // 取到原始验证码
		LogManager.getLogger().debug("进入UserHandler 处理verifyCode,检查验证码是否正确,code:" + code + "\t真的验证码:" + realCode);
		if (realCode != null && code != null) {
			if (realCode.intern() == code.intern()) {
				result = true;
			}
		}
		return result;
	}

	@RequestMapping("/del") // 根据id删除用户
	@ResponseBody
	public boolean delUserById(String uuid) {
		boolean result = false;
		LogManager.getLogger().debug("进入UserHandler 处理delUserById,检查验证码是否正确,uuid:" + uuid);
		result = userService.delUserById(uuid);
		return result;
	}

	@RequestMapping("/editPwd") // 修改密码
	public String editPwdByTel(String tel, String password, ServletRequest request) {
		boolean result = false;
		LogManager.getLogger().debug("进入UserHandler 处理editPwd,检查验证码是否正确,tel:" + tel + "\t密码:" + password);
		if (tel.length() > 0 && password.length() > 0) {
			result = userService.editPwdByTel(tel, password);
		} else {
			result = false;
		}
		if (result) {
			return "redirect:/page/Login.jsp";
		} else {
			return "redirect:/htm/findPwd3.html?tel=" + tel;
		}

	}

	@RequestMapping("/getMail") // 得到邮箱
	@ResponseBody
	public String getMail(String tel) {
		String email = "";
		LogManager.getLogger().debug("进入UserHandler 处理getMail,根据电话得到邮箱,tel:" + tel);
		if (tel != null) {
			email = userService.getMail(tel);
		}

		return new Gson().toJson(email);
	}

	@RequestMapping("/search") // 根据用户电话查询或者查询全部
	@ResponseBody
	public List<User> searchUser(String tel) {
		List<User> user = new ArrayList<User>();
		LogManager.getLogger().debug("进入UserHandler 处理searchUserByTel,通过电话查找用户,tel:" + tel);
		user = userService.searchUser(tel);

		return user;
	}

	@RequestMapping("/sendMail") // 发送邮件
	@ResponseBody
	public String sendMail(String email, HttpServletRequest request) {
		LogManager.getLogger().debug("请求UserHandler 进行sendMail操作");
		LogManager.getLogger().debug("请求数据  email:" + email);
		if (email == null) {
			LogManager.getLogger().debug(" 要发送的邮件为空 ");
			return "";
		}
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

			helper.setFrom("13237343452@163.com");
			helper.setTo(email);
			helper.setSubject("找回密码");
			code = new ImageCodeServelt().verifyCode(request);
			helper.setText("宅小递的验证码:" + code, true);
			System.out.println("真的验证码:" + code);
			mailSender.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
			return new Gson().toJson("false");
		}

		return new Gson().toJson("true");
	}

	@RequestMapping("/login")
	public String login(User user, ModelMap map) {
		LogManager.getLogger().debug("请求UserHandler进行login的操作....");
		user = userService.login(user);
		if (user != null) {
			map.put("loginUser", user);// 存在session中
			return "redirect:/index.jsp";
		}
		map.put("errorMsg", "用户名或密码错误");// 存在request中
		return "forward:/page/Login.jsp";
	}

	@Autowired
	PhoneCode phonecode;

	@RequestMapping("/captcha")
	@ResponseBody
	public String RegisterUser(String uphone) {
		LogManager.getLogger().debug("注册用户请求获取短信验证码操作");
		String IfGetCo = phonecode.getPhonemsg(uphone);

		if (IfGetCo != "" & IfGetCo != null) {
			LogManager.getLogger().debug("恭喜你,验证码发送成功,您的验证码为：" + IfGetCo);
			return IfGetCo;
		} else {
			LogManager.getLogger().debug("验证码发送失败,请重新获取");
		}
		return null;
	}

	@RequestMapping("/Register")
	@ResponseBody
	public boolean RegisterUser(@RequestParam(name = "upicdata", required = false) MultipartFile upicture, User user) {
		LogManager.getLogger().debug("用户申请注册");

		System.out.println(upicture + "upicture****************");
		if (upicture != null && !upicture.isEmpty()) {
			try {
				File file = new File(ServletUtil.UPLOAD_DIR, upicture.getOriginalFilename());
				upicture.transferTo(file);
				user.setUpicture("/" + ServletUtil.UPLOAD_DIR_NAME + "/" + upicture.getOriginalFilename());
				LogManager.getLogger().debug("头像上传成功，上传地址为:" + file);
			} catch (IllegalStateException | IOException e) {
				LogManager.getLogger().debug("头像上传失败：", e);
			}
		}
		return userService.RegisterUser(user);
	}
	
	@RequestMapping("/RegisterDai")
	@ResponseBody
	public boolean RegisterDai(@RequestParam(name = "uuid", required = false) Integer uuid,@RequestParam(name = "dspic", required = false) MultipartFile dspic, String dsid) {
		LogManager.getLogger().debug("待递员申请注册...uuid:"+uuid+"\t dsid:"+dsid);
		boolean result =false;
		Duser duser=new Duser();
		if (dspic != null && !dspic.isEmpty()) {
			try {
				File file = new File(ServletUtil.UPLOAD_DIR, dspic.getOriginalFilename());
				dspic.transferTo(file);
				duser.setDspic("/" + ServletUtil.UPLOAD_DIR_NAME + "/" + dspic.getOriginalFilename());
				LogManager.getLogger().debug("学生证图片上传成功，上传地址为:" + file);
			} catch (IllegalStateException | IOException e) {
				LogManager.getLogger().debug("学生证图片上传失败：", e);
			}
		}
		duser.setDsid(dsid);
		duser.setUuid(uuid);
		duser.setDscore("100");
		duser.setDnum("0");
		result=userService.RegisterDai(duser);
		return result;
	}

	@RequestMapping("/getusermsg")
	@ResponseBody
	public User getUserMsg(String phonenum) {
		return userService.getUserMsg(phonenum);
	}

	@RequestMapping("/updatemsg")
	@ResponseBody
	public boolean updatemsg(@RequestParam(name = "upicdata", required = false) MultipartFile upicture, User user) {
		LogManager.getLogger().debug("用户申请修改个人资料");
		if (upicture != null && !upicture.isEmpty()) {
			try {
				File file = new File(ServletUtil.UPLOAD_DIR, upicture.getOriginalFilename());
				upicture.transferTo(file);// 上传文件
				user.setUpicture("/" + ServletUtil.UPLOAD_DIR_NAME + "/" + upicture.getOriginalFilename());
				LogManager.getLogger().debug("头像上传成功，上传地址为:" + file);
			} catch (IllegalStateException | IOException e) {
				LogManager.getLogger().debug("头像上传失败：", e);
			}
		}
		return userService.updatemsg(user);
	}

	@RequestMapping("/getaddr")
	@ResponseBody
	public List<Address> getAddr(int uuid) {
		return userService.getAddr(uuid);
	}

	@RequestMapping("/deladdr")
	@ResponseBody
	public boolean deladdr(int zid) {
		return userService.deladdr(zid);
	}

	@RequestMapping("/addaddr")
	@ResponseBody
	public boolean addaddr(Address address) {
		return userService.addaddr(address);
	}
	
	
	@RequestMapping("/getdidbyuuid")
	@ResponseBody
		public Integer getdidbyuuid(int uuid){
		LogManager.getLogger().debug("判断用户是否为代递员身份");
		return userService.getdidbyuuid(uuid);
	}
}
*/