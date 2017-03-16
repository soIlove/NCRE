package com.yc.zxd.web.handler;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.zxd.entity.Applyorder;
import com.yc.zxd.entity.Order;
import com.yc.zxd.entity.ProOrder;
import com.yc.zxd.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderHandler {

	@Autowired
	private OrderService orderService;

	// public OrderHandler() {
	// orderService = new OrderServiceImpl();
	// }

	@RequestMapping("/submit") // 提交投单
	@ResponseBody
	public boolean submit(Order order) {
		boolean result = false;
		LogManager.getLogger().debug("进入UserHandler 处理order,检查用户的投单,order:" + order.toString());
		result = orderService.order(order);// 检查用户是否存在
		return result;
	}
	
	@RequestMapping("/addzaccept")
	@ResponseBody
	public boolean addzaccept(Applyorder applyorder){
		System.out.println(applyorder+"能获取对象吗");	
		return orderService.addzaccept(applyorder);
		
	}
	
	@RequestMapping("/getapporderbyoid")
	@ResponseBody
	public List<ProOrder> getapporderbyoid(Integer oid){
		LogManager.getLogger().debug("获取该人所有的投单信息");
		return orderService.getapporderbyoid(oid);
		
	}

	@RequestMapping("/addorder")
	@ResponseBody
	public boolean addorder(Integer aid){
		LogManager.getLogger().debug("添加新的订单表");
		return orderService.addorder(aid);
		
	}
	
	@RequestMapping("/updatezac")
	@ResponseBody
	public boolean updatezac(Integer aid){
		LogManager.getLogger().debug("正在修改接单表");	
		return orderService.updatezac(aid);
		
	}
	@RequestMapping("/deletezac")
	@ResponseBody
	public boolean deletezac(Integer oid){
		LogManager.getLogger().debug("正在删除所有额外接单表");	
		return orderService.deletezac(oid);
		
	}
	
	@RequestMapping("/getzordersByuuid")
	@ResponseBody
	public List<Order> getzordersByuuid(Integer uuid){
		LogManager.getLogger().debug("正在查找该用户所有投单表");	
		return orderService.getzordersByuuid(uuid);	
	}
	
	@RequestMapping("/updateorder")
	@ResponseBody
	public boolean updateorder(Integer oid){
		LogManager.getLogger().debug("正在删除所有额外接单表");	
		return orderService.updateorder(oid);
		
	}
	@RequestMapping("/zxdgetordersbyuuid")
	@ResponseBody
	public List<Order> zxdgetordersbyuuid(Integer uuid){
		LogManager.getLogger().debug("正在查找该用户所有已被同意的定单表");	
		return orderService.zxdgetordersbyuuid(uuid);	
	}
}
