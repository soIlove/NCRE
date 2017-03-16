package com.yc.list.test;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.zxd.entity.Express;
import com.yc.zxd.entity.PaginationBean;
import com.yc.zxd.service.ExpressService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring.xml", "classpath:spring-mvc.xml"})//可插拔式
public class ExpressServiceImplTest {

	@Autowired
	private ExpressService expressService;
	@Test
	public void testFindType() {
		PaginationBean<Express> expresses=expressService.findType("1","2","圆通快递");
		System.out.println(expresses);
		assertNotNull(expresses);
	}
	
	

}
