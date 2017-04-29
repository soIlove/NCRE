package com.cyber.ncre.web.handler;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import com.cyber.ncre.entity.academy;
import com.cyber.ncre.entity.academyAdmin;
import com.cyber.ncre.entity.clazz;
import com.cyber.ncre.entity.kaoroom;
import com.cyber.ncre.entity.news;
import com.cyber.ncre.entity.sysAdmin;
import com.cyber.ncre.service.sysAdminService;
import com.cyber.ncre.util.DateFormatUtil;
import com.cyber.ncre.util.ServletUtil;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

@Component
@RequestMapping("/sysadmin")
@SessionAttributes(names = { "sysUser", "applyMsg", "acadMsg", "newsMsg", "kaoMsg" })
public class sysAdminHandler {

	@Autowired
	private sysAdminService sysAdminService;

	/* 登录 */
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

	/* 注销 */
	@RequestMapping("/logout")
	public ModelAndView logout(ModelAndView model) {
		model.addObject("sysUser", "");
		model.setViewName("page/syslogin");
		return model;
	}

	/* 搜索院系管理员注册申请 */
	@RequestMapping("/findapply")
	public ModelAndView findapply(ModelAndView model) {
		List<academyAdmin> applyinfo = sysAdminService.doapply();
		model.setViewName("page/sysapply");
		model.addObject("applyMsg", applyinfo);
		return model;
	}

	/* 同意院系管理员申请 */
	@RequestMapping("/agree")
	@ResponseBody
	public boolean agree(academyAdmin admin) {
		return sysAdminService.doagree(admin);
	}

	/* 不同意院系管理员申请 */
	@RequestMapping("/disagree")
	@ResponseBody
	public boolean disagree(academyAdmin admin) {
		return sysAdminService.dodisagree(admin);
	}

	/* 搜索院系详情 */
	@RequestMapping("/findacad")
	@ResponseBody
	public ModelAndView findacadMsg(ModelAndView model) {
		List<clazz> clazz = sysAdminService.doacadMsg();
		model.setViewName("page/acadsetting");
		model.addObject("acadMsg", clazz);
		return model;
	}

	/* 修改学院班级信息 */
	@RequestMapping("/savesetting")
	@ResponseBody
	public boolean savesetting(academy acad, clazz clazz) {
		return sysAdminService.dosetting(acad, clazz);
	}

	/* 删除学院班级信息 */
	@RequestMapping("/delsetting")
	@ResponseBody
	public boolean delsetting(clazz clazz) {
		return sysAdminService.dosetting(clazz);
	}

	/* 添加学院班级信息 */
	@RequestMapping("/addsetting")
	@ResponseBody
	public boolean addsetting(academy acad, clazz clazz) {
		LogManager.getLogger().debug("添加学院信息==>" + acad);
		LogManager.getLogger().debug("添加班级信息==>" + clazz);
		// 判断添加学院是否已经存在
		academy findacad = sysAdminService.findacad(acad);
		if (findacad != null) {
			clazz.setAcacademyid(findacad.getAid());
			// 存在则只创建新班级（判断新添加班级是否已经存在）
			boolean isExist = sysAdminService.findclazz(clazz);
			if (isExist) {
				return sysAdminService.doAddclazz(clazz);
			}
			return false;
		} else {
			// 不存在则创建新学院新班级
			sysAdminService.doAddacad(acad, clazz);
			return true;
		}
	}

	/* 搜索新闻详情 */
	@RequestMapping("/findnews")
	public ModelAndView findnews(ModelAndView model) {
		List<news> news = sysAdminService.donewsMsg();
		model.setViewName("page/sysnews");
		model.addObject("newsMsg", news);
		return model;
	}

	/* 搜索新闻详情 */
	@RequestMapping("/delnews")
	@ResponseBody
	public boolean delnews(news news) {
		return sysAdminService.delnews(news);
	}

	/* 保存新闻内容 */
	@RequestMapping("/savenews")
	@ResponseBody
	public boolean savenews(@RequestParam(name = "picData", required = false) MultipartFile picData, news news) {
		if (picData != null && !picData.isEmpty()) {
			try {
				File file = new File(ServletUtil.UPLOAD_DIR, picData.getOriginalFilename());
				picData.transferTo(file);
				news.setNews_pic("/" + ServletUtil.UPLOAD_DIR_NAME + "/" + picData.getOriginalFilename());
				LogManager.getLogger().debug("头像上传成功，上传地址为:" + file);
			} catch (Exception e) {
				LogManager.getLogger().debug("头像上传失败：", e);
			}
		} else {
			news.setNews_pic("");
		}
		LogManager.getLogger().debug(news);
		return sysAdminService.modifynews(news);
	}

	/* 添加新闻内容 */
	@RequestMapping("/addnews")
	@ResponseBody
	public boolean addnews(@RequestParam(name = "picData", required = false) MultipartFile picData, news news) {
		if (picData != null && !picData.isEmpty()) {
			try {
				File file = new File(ServletUtil.UPLOAD_DIR, picData.getOriginalFilename());
				picData.transferTo(file);
				news.setNews_pic("/" + ServletUtil.UPLOAD_DIR_NAME + "/" + picData.getOriginalFilename());
				LogManager.getLogger().debug("头像上传成功，上传地址为:" + file);
			} catch (Exception e) {
				LogManager.getLogger().debug("头像上传失败：", e);
			}
		} else {
			news.setNews_pic("");
		}
		LogManager.getLogger().debug(news);
		return sysAdminService.addnews(news);
	}

	/* 搜索考场详情 */
	@RequestMapping("/findkao")
	@ResponseBody
	public ModelAndView findkao(ModelAndView model) {
		List<kaoroom> room = sysAdminService.dokaoMsg();
		model.setViewName("page/syskao");
		model.addObject("kaoMsg", room);
		return model;
	}

	/* 修改考场信息 */
	@RequestMapping("/savekao")
	@ResponseBody
	public boolean savekao(kaoroom kaoroom) {
		LogManager.getLogger().debug(kaoroom);
		return sysAdminService.dosavekao(kaoroom);
	}

	/* 删除考场信息 */
	@RequestMapping("/delkao")
	@ResponseBody
	public boolean delkao(kaoroom kaoroom) {
		LogManager.getLogger().debug(kaoroom);
		return sysAdminService.dodelkao(kaoroom);
	}

	/* 添加考场信息 */
	@RequestMapping("/addkao")
	@ResponseBody
	public boolean addkao(kaoroom kaoroom) {
		LogManager.getLogger().debug(kaoroom);
		return sysAdminService.doaddkao(kaoroom);
	}

	@RequestMapping("exportKaoMsg")
	@ResponseBody
	public void exportKaoMsg() {
		try {
			WritableWorkbook wwb = null;

			// 创建可写入的Excel工作簿
			String fileName = "D://考场信息安排表.xls";
			File file = new File(fileName);
			if (!file.exists()) {
				file.createNewFile();
			}
			// 以fileName为文件名来创建一个Workbook
			wwb = Workbook.createWorkbook(file);

			// 创建工作表
			WritableSheet ws = wwb.createSheet("考场信息安排表", 0);

			// 查询数据库中所有的数据
			List<kaoroom> room = sysAdminService.dokaoMsg();
			
			// 要插入到的Excel表格的行号，默认从0开始
			Label label0 = new Label(0, 0, "考场编号");
			Label label1 = new Label(1, 0, "考场名称");
			Label label2 = new Label(2, 0, "考场容量");
			Label label3 = new Label(3, 0, "所属楼层");
			Label label4 = new Label(4, 0, "具体位置");

			ws.addCell(label0);
			ws.addCell(label1);
			ws.addCell(label2);
			ws.addCell(label3);
			ws.addCell(label4);

			for (int i = 0; i < room.size(); i++) {
				Label label0_i = new Label(0, i + 1, room.get(i).getKrid() + "");
				Label label1_i = new Label(1, i + 1, room.get(i).getKrclass() + "");
				Label label2_i = new Label(2, i + 1, room.get(i).getKrtotal() + "");
				Label label3_i = new Label(3, i + 1, room.get(i).getKrlou() + "");
				Label label4_i = new Label(4, i + 1, room.get(i).getKraddr() + "");
				ws.addCell(label0_i);
				ws.addCell(label1_i);
				ws.addCell(label2_i);
				ws.addCell(label3_i);
				ws.addCell(label4_i);
			}

			// 写进文档
			wwb.write();
            wwb.close();

		} catch (Exception e) {
		}
	}
	
	
	@RequestMapping("exportbaoMsg")
	@ResponseBody
	public void exportbaoMsg() {
		try {
			WritableWorkbook wwb = null;

			// 创建可写入的Excel工作簿
			String fileName = "D://湖南工学院报考统计表.xls";
			File file = new File(fileName);
			if (!file.exists()) {
				file.createNewFile();
			}
			// 以fileName为文件名来创建一个Workbook
			wwb = Workbook.createWorkbook(file);

			// 创建工作表
			WritableSheet ws = wwb.createSheet("湖南工学院报考统计表", 0);

			// 查询数据库中所有的数据
			List<CompuTestMsg> ComMsgList = sysAdminService.dobaoMsg();
			
			// 要插入到的Excel表格的行号，默认从0开始
			Label label0 = new Label(0, 0, "报考编号");
			Label label1 = new Label(1, 0, "姓名");
			Label label2 = new Label(2, 0, "性别");
			Label label3 = new Label(3, 0, "班级");
			Label label4 = new Label(4, 0, "民族");
			Label label5 = new Label(5, 0, "身份证号");
			Label label6 = new Label(6, 0, "电话");
			Label label7 = new Label(7, 0, "考试类别");

			ws.addCell(label0);
			ws.addCell(label1);
			ws.addCell(label2);
			ws.addCell(label3);
			ws.addCell(label4);
			ws.addCell(label5);
			ws.addCell(label6);
			ws.addCell(label7);

			for (int i = 0; i < ComMsgList.size(); i++) {
				Label label0_i = new Label(0, i + 1, ComMsgList.get(i).getCid() + "");
				Label label1_i = new Label(1, i + 1, ComMsgList.get(i).getSname() + "");
				Label label2_i = new Label(2, i + 1, ComMsgList.get(i).getSsex() + "");
				Label label3_i = new Label(3, i + 1, ComMsgList.get(i).getSclass() + "");
				Label label4_i = new Label(4, i + 1, ComMsgList.get(i).getEnation() + "");
				Label label5_i = new Label(5, i + 1, ComMsgList.get(i).getEidentif() + "");
				Label label6_i = new Label(6, i + 1, ComMsgList.get(i).getEphone() + "");
				Label label7_i = new Label(7, i + 1, ComMsgList.get(i).getTename() + "");
				ws.addCell(label0_i);
				ws.addCell(label1_i);
				ws.addCell(label2_i);
				ws.addCell(label3_i);
				ws.addCell(label4_i);
				ws.addCell(label5_i);
				ws.addCell(label6_i);
				ws.addCell(label7_i);
			}

			// 写进文档
			wwb.write();
            wwb.close();

		} catch (Exception e) {
		}
	}

}
