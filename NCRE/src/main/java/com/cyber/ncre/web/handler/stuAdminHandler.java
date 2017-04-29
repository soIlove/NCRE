package com.cyber.ncre.web.handler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.cyber.ncre.entity.news;
import com.cyber.ncre.service.sysAdminService;

@Component
@RequestMapping("/stuadmin")
@SessionAttributes(names="newsMsg")
public class stuAdminHandler {
	
	@Autowired
	private sysAdminService sysAdminService;
	
	/*  搜索新闻详情    */
	@RequestMapping("/findnews")
	public ModelAndView findnews(ModelAndView model){
		List<news> news = sysAdminService.donewsMsg();
		model.setViewName("page/stunews");
		model.addObject("newsMsg",news);
		return model;
	}

}
