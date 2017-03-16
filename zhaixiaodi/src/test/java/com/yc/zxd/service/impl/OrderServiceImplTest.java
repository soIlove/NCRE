package com.yc.zxd.service.impl;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.zxd.entity.Express;
import com.yc.zxd.entity.Order;
import com.yc.zxd.entity.PaginationBean;
import com.yc.zxd.service.ExpressService;
import com.yc.zxd.service.OrderService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class OrderServiceImplTest {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ExpressService expressService;
	
	@Test
	public void testOrder() {
/*		Date date = null;
		Order ord=new Order(null, 1,1, date, "肖坤跻", "3698", "大包裹", "快点", "湖南工学院D6-318", "10", "邮政");
		System.out.println(orderService.order(ord));*/
	}
	
	@Test
	public void testSearchOrderByName() {
		PaginationBean<Express> list = expressService.searchOrder("1","3","肖坤跻");
		System.out.println(list.toString());
	}

}
