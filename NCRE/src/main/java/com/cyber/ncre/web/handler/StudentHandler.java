package com.cyber.ncre.web.handler;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
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

import com.cyber.ncre.entity.CompuTestMsg;
import com.cyber.ncre.entity.Eenrollmsg;
import com.cyber.ncre.entity.Student;
import com.cyber.ncre.entity.Testclas;
import com.cyber.ncre.entity.academy;
import com.cyber.ncre.entity.clazz;
import com.cyber.ncre.service.StudentService;
import com.cyber.ncre.util.ServletUtil;

@Controller
@RequestMapping("/user")
@SessionAttributes("loginUser")
public class StudentHandler {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping("/login") // 用户登录
	@ResponseBody
	public boolean login(String sxid,String spwd,ModelMap map) {
		boolean result;
		LogManager.getLogger().debug("进入StudentHandler 处理login()");
		Student student = studentService.login(sxid,spwd);
		if(student!=null){
			map.put("loginUser",student );
			result=true;
		}else{
			result=false;
		}
		return result;
	}

	@RequestMapping("/getEmail") // 通过账号获取密码
	@ResponseBody
	public String getEmail(String sxid) {
		LogManager.getLogger().debug("进入StudentHandler 处理getEmail()");
		String email= studentService.getemail(sxid);
		return email;
	}
	
	@RequestMapping("/forget") // 重置密码
	@ResponseBody
	public boolean forget(String sxid,String semail,HttpServletRequest request) {
		LogManager.getLogger().debug("进入StudentHandler 处理forget()");
		LogManager.getLogger().debug("请求数据sxid:" + sxid + ", semail:" + semail);
		boolean flag=false;
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom("18216062440@163.com");
			helper.setTo(semail);
			helper.setSubject("找回密码");
			String hrefStr = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getServletContext().getContextPath() + "/user/getpassword?sxid=" + sxid;
			System.out.println(hrefStr);
			helper.setText("<a href='" + hrefStr + "'>找回密码</a><br>如果连接不可用拷贝" + hrefStr + " 到地址栏...", true);
			mailSender.send(message);
			flag=true;
		} catch (MessagingException e) {
			e.printStackTrace();
			flag=false;
		}

		return flag;
	}
	
	@RequestMapping("/getpassword")//重置密码
	public String getpassword(String sxid, HttpSession session) {
		Random rand = new Random();
		String randPassword = rand.nextInt(900000) + 100000 + "";
		//业务处理重置密码
		studentService.resetPassword(sxid, randPassword);
		
		session.setAttribute("newPassword", randPassword);
		return "redirect:/page/getpasswordSuccess.jsp";
	}
	
	@RequestMapping("getAcademy")//获取数据库中的学院信息
	@ResponseBody
	public List<academy> getAcademy(){
		LogManager.getLogger().debug("进入StudentHandler 处理getAcademy()");
		List<academy> academies=new ArrayList<academy>();
		academies=studentService.getAcademy();
		return academies;
	}
	
	@RequestMapping("getClasses")//根据学院获取班级信息
	@ResponseBody
	public List<clazz> getClasses(String academy){
		LogManager.getLogger().debug("进入StudentHandler 处理getClasses()");
		List<clazz> classes=new ArrayList<clazz>();
		classes=studentService.getClasses(academy);
		return classes;
	}
	
	@RequestMapping("register")//用户注册
	@ResponseBody
	public String register(Student student){
		LogManager.getLogger().debug("进入StudentHandler 处理register()");
		Random rand = new Random();
		String randSxid = rand.nextInt(900000000) + 100000000 + "";
		student.setSxid(randSxid);
		boolean flag=studentService.register(student);
		if(flag){
		}else{
			randSxid=null;
		}
		return randSxid;
	}
	
	@RequestMapping("/getTest") // 页面加载时加载考试等级信息
	@ResponseBody
	public List<Testclas> getTest(){
		LogManager.getLogger().debug("进入StudentHandler 处理getTest()");
		List<Testclas> test=new ArrayList<Testclas>();
		test=studentService.getTest();
		return test;
	}
	
	@RequestMapping("/apply") // 报名申请
	@ResponseBody
	public boolean apply(Eenrollmsg apply,int sid,String ssex,String tename,@RequestParam(name="epicdata", required=false)MultipartFile epicture){
		
		System.err.println(epicture+"************************************************************88");
		
		if(epicture!=null && !epicture.isEmpty()){
			try {
				File file = new File(ServletUtil.UPLOAD_DIR, epicture.getOriginalFilename());
				epicture.transferTo(file);// 上传文件
				apply.setEpicture("/" + ServletUtil.UPLOAD_DIR_NAME + "/" + epicture.getOriginalFilename());

				System.out.println("当前对象为：" + apply);
				LogManager.getLogger().debug("头像上传成功，上传地址为:" + file);
			} catch (IllegalStateException | IOException e) {
				LogManager.getLogger().debug("头像上传失败：", e);
			}
		} else {
			apply.setEpicture("");
		}
		
		LogManager.getLogger().debug("进入StudentHandler 处理apply()");
		Boolean result=studentService.apply(apply,sid, ssex,tename);
		return result;
	}
	

	
	
	@RequestMapping("/ifbaomin") // 判断是否完善信息
	@ResponseBody
	public CompuTestMsg ifbaomin(int sid){
		LogManager.getLogger().debug("进入StudentHandler 处理ifbaomin()");
		CompuTestMsg cS= studentService.ifbaomin(sid);
		System.out.println("CS"+cS);
		return cS;
		
	
	}
	@RequestMapping("/getmsg") // 判断是否完善信息
	@ResponseBody
	public Eenrollmsg getmsg(int sid){
		LogManager.getLogger().debug("进入StudentHandler 处理ifbaomin()");
		return studentService.getmsg(sid);
	
	}
	
}
