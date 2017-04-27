package com.cyber.ncre.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cyber.ncre.entity.CompuTestMsg;
import com.cyber.ncre.entity.academyAdmin;
import com.cyber.ncre.entity.academy;


public interface AcaadminService {

	academyAdmin login(academyAdmin acaadmin);

	List<CompuTestMsg> findappmsg(int acmyid);

	boolean agreeApply(int cid);

	boolean addNPLog(int cid, String nocontent);

	boolean disagreeApply(int cid);

	List<CompuTestMsg> findNPmsg(int acmyid);

	boolean removeApply(int cid);

	List<academy> findacademy();

	boolean RegistExaminee(academyAdmin academyAdmin);
	


}
