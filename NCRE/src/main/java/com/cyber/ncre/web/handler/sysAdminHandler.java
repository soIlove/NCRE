package com.cyber.ncre.web.handler;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.cyber.ncre.entity.academyAdmin;
import com.cyber.ncre.entity.sysAdmin;
import com.cyber.ncre.service.sysAdminService;

@Component
@RequestMapping("/sysadmin")
@SessionAttributes(names = { "sysUser","applyMsg"})
public class sysAdminHandler {

	@Autowired
	private sysAdminService sysAdminService;

	@RequestMapping("/login")
	@ResponseBody
	public boolean login(sysAdmin admin, Model model) {
		sysAdmin user = sysAdminService.dologin(admin);
		if (user != null) {
			LogManager.getLogger().debug("系统管理员==>" + admin + "登录成功");
			model.addAttribute("sysUser", user);
			return true;
		}
		return false;
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout(ModelAndView model){
		model.addObject("sysUser", "");
		model.setViewName("page/syslogin");
		return model;
	}
	
	@RequestMapping("/findapply")
	@ResponseBody
	public ModelAndView findapply(ModelAndView model){
		List<academyAdmin> applyinfo = sysAdminService.doapply();
		model.setViewName("page/sysapply");
		model.addObject("applyMsg",applyinfo);
		return model;
	}

}
