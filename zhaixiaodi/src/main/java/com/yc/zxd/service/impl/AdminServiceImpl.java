package com.yc.zxd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.zxd.entity.Admin;
import com.yc.zxd.entity.PaginationBean;
import com.yc.zxd.entity.User;
import com.yc.zxd.mapper.AdminMapper;
import com.yc.zxd.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	

	@Autowired
	private AdminMapper adminMapper;

	 
	
	@Override
	public Admin login(Admin admin) {
		
		return adminMapper.getAdmin(admin);	
	}



	@Override
	public PaginationBean<User> getAllUser(String currPage, String pageSize) {
		PaginationBean<User> userBean=new PaginationBean<User>();
		if(currPage!=null){
			userBean.setCurrPage(Integer.parseInt(currPage));
		}
		if(pageSize!=null){
			userBean.setPageSize(Integer.parseInt(pageSize));
		}
		userBean=adminMapper.getUserPagination(userBean);
		return userBean;
	}



	@Override
	public boolean modifyPwd(String newPwd, String adid) {
		
		return adminMapper.modifyPwd(newPwd,adid) >0;	
	}

}
