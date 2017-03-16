package com.yc.zxd.web.handler;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.zxd.entity.Express;
import com.yc.zxd.entity.ExpressType;
import com.yc.zxd.entity.PaginationBean;
import com.yc.zxd.service.ExpressService;

@Controller
@RequestMapping("/zxd")
// @SessionAttributes("loginUser")
public class ExpressHandler {

	@Autowired
	private ExpressService expressService;

	@RequestMapping("/list") // 处理分页
	@ResponseBody // @ResponseBody做json异步响应处理注解，响应的数据对象，springMVC会把此对象转换成json字符串响应
	public PaginationBean<Express> pageList(String page, String rows) {
		LogManager.getLogger().debug("请求ExpressHandler进行pageList的操作....");
		PaginationBean<Express> list = expressService.pageList(page, rows);
		System.out.println(list.toString());
		return list;
	}
	
	@RequestMapping("/searchOrder") // 处理分页  根据投单姓名查询订单
	@ResponseBody // @ResponseBody做json异步响应处理注解，响应的数据对象，springMVC会把此对象转换成json字符串响应
	public PaginationBean<Express> searchOrder(String name, String page, String rows) {
		LogManager.getLogger().debug("请求ExpressHandler进行searchOrder的操作....name:"+name+"\t page:"+page+"\t rows:"+rows);
		PaginationBean<Express> list = expressService.searchOrder(page, rows,name);
		System.out.println(list.toString());
		return list;
	}

	@RequestMapping("/type") // 生成快递菜单
	@ResponseBody
	public List<ExpressType> typeList() {
		LogManager.getLogger().debug("请求ExpressHandler进行typeList的操作....");
		return expressService.typeList();
	}

	@RequestMapping("/findType") // 按快递分类显示
	@ResponseBody
	public PaginationBean<Express> findType(String otype, String page, String rows) {
		LogManager.getLogger().debug("请求ExpressHandler进行findType的操作....");
		return expressService.findType(page,rows,otype);
	}
	
	@RequestMapping("/orderlist")
	@ResponseBody
	public PaginationBean<Express> orderlist(String page,String rows,String uuid){
		LogManager.getLogger().debug("请求ExpressHandler进行orderlist的操作....");
		return expressService.orderlist(page,rows,uuid);
	}
	
	@RequestMapping("/findDU")
	@ResponseBody
	public Express findDU(int did){
		LogManager.getLogger().debug("请求ExpressHandler进行findDU的操作....");
		return expressService.findDU(did);
	}
	
	@RequestMapping("/worderlist")
	@ResponseBody
	public PaginationBean<Express> worderlist(String page,String rows,String uuid){
		LogManager.getLogger().debug("请求ExpressHandler进行worderlist的操作....");
		return expressService.worderlist(page,rows,uuid);
	}

}
