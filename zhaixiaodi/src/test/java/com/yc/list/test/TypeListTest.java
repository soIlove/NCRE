package com.yc.list.test;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.zxd.entity.ExpressType;
import com.yc.zxd.service.ExpressService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring.xml", "classpath:spring-mvc.xml"})
public class TypeListTest {

	@Autowired
	private ExpressService expressService;
	@Test
	public void test() {
		List<ExpressType> type=expressService.typeList();
		System.out.println(type);
		assertNotNull(type);
	}

}
