package com.cyber.ncre.mapper;

import java.util.List;

import com.cyber.ncre.entity.CompuTestMsg;
import com.cyber.ncre.entity.academy;
import com.cyber.ncre.entity.academyAdmin;
import com.cyber.ncre.entity.clazz;
import com.cyber.ncre.entity.kaoroom;
import com.cyber.ncre.entity.news;
import com.cyber.ncre.entity.sysAdmin;

public interface sysAdminMapper {

	sysAdmin findsysAdmin(sysAdmin admin);

	List<academyAdmin> findapply();

	int modifyAcstatusPass(academyAdmin admin);

	int modifyAcstatusNPass(academyAdmin admin);

	List<clazz> findacadMsg();
	
	int setacadMsg(academy acad);

	int setclazzMsg(clazz clazz);

	int delclazzMsg(clazz clazz);

	academy selectAcadByName(academy acad);

	int addAcademy(academy acad);

	int addClazz(clazz clazz);

	int addExistClazz(clazz clazz);

	clazz selectClazz(clazz clazz);

	List<news> getnewMsg();

	int delnewMsg(news news);

	int updatenews(news news);

	int addnews(news news);

	List<kaoroom> findkaoMsg();

	int modifykaoRoom(kaoroom kaoroom);

	int delkaoRoom(kaoroom kaoroom);

	int addkaoRoom(kaoroom kaoroom);

	List<CompuTestMsg> findbaoMsg();

}
