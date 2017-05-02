package com.cyber.ncre.web.handler;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cyber.ncre.entity.CompuTestMsg;
import com.cyber.ncre.entity.academyAdmin;
import com.cyber.ncre.entity.academy;
import com.cyber.ncre.service.AcaadminService;
import com.cyber.ncre.util.ServletUtil;

@Component
@RequestMapping("/acaadmin")
@SessionAttributes(names = { "acaAdmin", "StuApplyMsg", "StuNPApplyMsg" })
public class AcaAdminHandler {

	@Autowired
	private AcaadminService acaservice;

	@RequestMapping("/login")
	@ResponseBody
	public boolean acalogin(academyAdmin acaadmin, Model model) {
		LogManager.getLogger().debug("院系管理员登录操作");
		academyAdmin admin = acaservice.login(acaadmin);
		if (admin != null) {
			model.addAttribute("acaAdmin", admin);
			return true;
		}
		return false;

	}

	@RequestMapping("/findappmsg")
	@ResponseBody()
	public ModelAndView findappmsg(ModelAndView model, int acmyid) {
		System.out.println(acmyid);
		List<CompuTestMsg> ComMsgList = acaservice.findappmsg(acmyid);

		model.setViewName("page/acaApply");
		model.addObject("StuApplyMsg", ComMsgList);

		return model;

	}

	@RequestMapping("/agreeApply")
	@ResponseBody
	public boolean agreeApply(int cid) {
		boolean agree = acaservice.agreeApply(cid);
		return agree;
	}

	@RequestMapping("/addNPLog")
	@ResponseBody
	public boolean addNPLog(int cid, String nocontent) {

		return acaservice.addNPLog(cid, nocontent);
	}

	@RequestMapping("/disagreeApply")
	@ResponseBody
	public boolean disagreeApply(int cid) {

		return acaservice.disagreeApply(cid);
	}

	@RequestMapping("/findNPmsg")
	@ResponseBody()
	public ModelAndView findNPmsg(ModelAndView model, int acmyid) {
		List<CompuTestMsg> ComMsgList = acaservice.findNPmsg(acmyid);

		model.setViewName("page/acaNPMan");
		model.addObject("StuNPApplyMsg", ComMsgList);

		return model;

	}

	@RequestMapping("/removeApply")
	@ResponseBody
	public boolean removeApply(int cid) {

		return acaservice.removeApply(cid);
	}

	@RequestMapping("/findacademy")
	@ResponseBody
	public List<academy> findacademy() {

		return acaservice.findacademy();
	}

	@RequestMapping("/RegistExaminee")
	@ResponseBody
	public boolean RegistExaminee(@RequestParam(name = "acpicdata", required = false) MultipartFile acpicture,
			academyAdmin academyAdmin) {

		if ( acpicture != null&&!acpicture.isEmpty() ) {

			try {
				File file = new File(ServletUtil.UPLOAD_DIR, acpicture.getOriginalFilename());
				acpicture.transferTo(file);// 上传文件
				academyAdmin.setAcpicture("/" + ServletUtil.UPLOAD_DIR_NAME + "/" + acpicture.getOriginalFilename());

				System.out.println("当前对象为：" + academyAdmin);
				LogManager.getLogger().debug("头像上传成功，上传地址为:" + file);
			} catch (IllegalStateException | IOException e) {
				LogManager.getLogger().debug("头像上传失败：", e);
			}
		} else {
			academyAdmin.setAcpicture("");
		}
		return acaservice.RegistExaminee(academyAdmin);
	}

}
