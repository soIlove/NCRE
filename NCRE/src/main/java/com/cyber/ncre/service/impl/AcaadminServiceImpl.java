package com.cyber.ncre.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.ncre.entity.CompuTestMsg;
import com.cyber.ncre.entity.academy;
import com.cyber.ncre.entity.academyAdmin;
import com.cyber.ncre.mapper.AcaadminMapper;
import com.cyber.ncre.service.AcaadminService;

@Service("acaservice")
public class AcaadminServiceImpl implements AcaadminService {

	
	@Autowired
	private AcaadminMapper acaadminMapper;

	@Override
	public academyAdmin login(academyAdmin acaadmin) {
		// TODO Auto-generated method stub
		
		return acaadminMapper.login(acaadmin);
	}

	@Override
	public List<CompuTestMsg> findappmsg(int acmyid) {
		// TODO Auto-generated method stub
		return acaadminMapper.findappmsg(acmyid);
	}

	@Override
	public boolean agreeApply(int cid) {
		// TODO Auto-generated method stub
		return acaadminMapper.agreeApply(cid)>0;
	}

	@Override
	public boolean addNPLog(int cid, String nocontent) {
		// TODO Auto-generated method stub
		return acaadminMapper.addNPLog(cid,nocontent)>0;
	}

	@Override
	public boolean disagreeApply(int cid) {
		// TODO Auto-generated method stub
		return acaadminMapper.disagreeApply(cid)>0;
	}

	@Override
	public List<CompuTestMsg> findNPmsg(int acmyid) {
		// TODO Auto-generated method stub
		return acaadminMapper.findNPmsg(acmyid);
	}

	@Override
	public boolean removeApply(int cid) {
		// TODO Auto-generated method stub
		return acaadminMapper.removeApply(cid)>0;
	}

	@Override
	public List<academy> findacademy() {
		// TODO Auto-generated method stub
		return acaadminMapper.findacademy();
	}

	/*注册院系管理员*/
	@Override
	public boolean RegistExaminee(academyAdmin academyAdmin) {
		// TODO Auto-generated method stub
		return acaadminMapper.RegistExaminee(academyAdmin)>0;
	}


}
