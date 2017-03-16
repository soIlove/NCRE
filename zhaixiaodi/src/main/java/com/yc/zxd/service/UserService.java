package com.yc.zxd.service;

import java.util.List;

import com.yc.zxd.entity.Address;
import com.yc.zxd.entity.Duser;
import com.yc.zxd.entity.User;
public interface UserService {

	boolean isExistUN(String username);

	String getMail(String tel);
	
	User login(User user);

	boolean RegisterUser(User user);

	boolean editPwdByTel(String tel, String password);

	User getUserMsg(String phonenum);

	boolean updatemsg(User user);

	List<Address> getAddr(int  uuid);

	boolean deladdr(int zid);

	boolean addaddr(Address address);


	Integer getdidbyuuid(int uuid);

	List<User> searchUser(String tel);

	boolean delUserById(String uuid);

	boolean RegisterDai(Duser duser);






}
