package com.yc.zxd.web.handler;


import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yc.zxd.entity.Admin;
import com.yc.zxd.entity.PaginationBean;
import com.yc.zxd.entity.User;
import com.yc.zxd.service.AdminService;


@Controller
@RequestMapping("/admin")
@SessionAttributes({"loginAdmin"})
public class AdminHandler {

	@Autowired
	private AdminService adminService;
	

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
	
	@RequestMapping("/modifyPwd") // 检查用户是否存在
	@ResponseBody
	public String modifyPwd(String newPwd,String comfirPwd, ServletRequest request, String adid) {
		boolean result = false;
		LogManager.getLogger().debug("进入UserHandler 处理verifyCode,检查验证码是否正确,newPwd:" + newPwd  );
		result=adminService.modifyPwd(newPwd,adid);
		return result+"";
	}
	
	@RequestMapping("/list")//处理分页,得到所有的用户
	@ResponseBody//@ResponseBody做json异步响应处理注解，响应的数据对象，springMVC会把此对象转换成json字符串响应
	public PaginationBean<User> getAllUser(String page,String rows){
		LogManager.getLogger().debug("请求UserHandler进行getAllUser的操作....page:"+page+"\t rows:"+rows);
		PaginationBean<User> user = adminService.getAllUser(page,rows);
		return user;
	}

	@RequestMapping("/login")
	public String login(Admin admin, ModelMap map) {
		LogManager.getLogger().debug("请求AdminHandler进行login的操作....  admin"+admin.toString());
		admin = adminService.login(admin);
		if (admin != null) {
			map.put("loginAdmin", admin);// 存在session中
			return "redirect:/page/manage.jsp";
		}
		map.put("errorMsg", "用户名或密码错误");// 存在request中
		return "forward:/page/loginAdmin.jsp";
	}
	 
}
