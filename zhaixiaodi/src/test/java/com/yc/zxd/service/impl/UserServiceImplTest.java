package com.yc.zxd.service.impl;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.zxd.entity.Duser;
import com.yc.zxd.entity.User;
import com.yc.zxd.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class UserServiceImplTest {

	@Autowired
	private UserService userService;
//	private UserService userService = new UserServiceImpl();

	
	@Test
	public void TestisExistUN() {
		boolean str = userService.isExistUN("xkj");
		assertNotNull(str);
		System.out.println(str);
		
	}
	
	@Test
	public void TestReDai() {
		Duser duser = new Duser();
		duser.setUuid(1);
		duser.setDspic("123456789");
		boolean str = userService.RegisterDai(duser);
		assertNotNull(str);
		System.out.println(str);
		
	}
	
	@Test
	public void TestDelUser() {
		boolean str = userService.delUserById("1000");
		System.out.println(str);
		
	}
	
	@Test
	public void TestGetMail() {
		String str = userService.getMail("13237343452");
		assertNotNull(str);
		System.out.println(str);
		
	}
	
	@Test
	public void TestsearchUserByTel() {
		List<User> str = userService.searchUser(null);
//		assertNotNull(str);
		System.out.println(str);
		
	}
	
	@Test
	public void TesteditPwdByTel() {
		boolean str = userService.editPwdByTel("13237343452", "123");
//		assertNotNull(str);
		System.out.println("结果:"+str);
		
	}

}
