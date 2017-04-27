package com.cyber.ncre.mapper;

import java.util.List;

import com.cyber.ncre.entity.CompuTestMsg;
import com.cyber.ncre.entity.academy;
import com.cyber.ncre.entity.academyAdmin;

public interface AcaadminMapper {

	

	academyAdmin login(academyAdmin acaadmin);

	List<CompuTestMsg> findappmsg(int acmyid);

	int agreeApply(int cid);

	int addNPLog(int cid, String nocontent);

	int disagreeApply(int cid);

	List<CompuTestMsg> findNPmsg(int acmyid);

	int removeApply(int cid);

	List<academy> findacademy();


	int RegistExaminee(academyAdmin academyAdmin);

}
