package com.yc.zxd.service;

import com.yc.zxd.entity.Admin;
import com.yc.zxd.entity.PaginationBean;
import com.yc.zxd.entity.User;

public interface AdminService {

	Admin login(Admin admin);

	PaginationBean<User> getAllUser(String page, String rows);

	boolean modifyPwd(String newPwd, String adid);

}
