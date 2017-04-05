package com.cyber.ncre.service;

import java.util.List;

import com.cyber.ncre.entity.academyAdmin;
import com.cyber.ncre.entity.sysAdmin;

public interface sysAdminService{

	sysAdmin dologin(sysAdmin admin);

	List<academyAdmin> doapply();
	
}