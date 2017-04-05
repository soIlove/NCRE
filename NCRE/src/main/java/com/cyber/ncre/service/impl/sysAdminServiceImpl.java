package com.cyber.ncre.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.ncre.entity.academyAdmin;
import com.cyber.ncre.entity.sysAdmin;
import com.cyber.ncre.mapper.sysAdminMapper;
import com.cyber.ncre.service.sysAdminService;

@Service("sysAdminService")
public class sysAdminServiceImpl implements sysAdminService {
	
	@Autowired
	private sysAdminMapper sysAdminMapper;

	@Override
	public sysAdmin dologin(sysAdmin admin) {
		return sysAdminMapper.findsysAdmin(admin);
	}

	@Override
	public List<academyAdmin> doapply() {
		return sysAdminMapper.findapply();
	}

}
