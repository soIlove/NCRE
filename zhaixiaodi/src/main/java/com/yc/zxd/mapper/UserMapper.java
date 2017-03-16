package com.yc.zxd.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yc.zxd.entity.Address;
import com.yc.zxd.entity.Duser;
import com.yc.zxd.entity.User;


public interface UserMapper {

	String findUser(String tel);

	String getMail(String tel);

	Integer editPwdByTel(@Param("tel") String tel, @Param("password")String password);
	
	User getUser(User user);

	boolean RegisterUser(User user);

	User getUserMsg(String phonenum);

	boolean updatemsg(User user);

	List<Address> getAddr(int uuid);

	boolean deladdr(int zid);

	boolean addaddr(Address address);

	Integer getdidbyuuid(int uuid);

	List<User> searchUser(@Param("uphone") String uphone);

	Integer delUserById(String uuid);

	Integer RegisterDai(Duser duser);

	Integer setUserToDai(Duser duser);



}
