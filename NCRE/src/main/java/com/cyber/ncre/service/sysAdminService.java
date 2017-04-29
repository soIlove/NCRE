package com.cyber.ncre.service;

import java.util.List;

import com.cyber.ncre.entity.CompuTestMsg;
import com.cyber.ncre.entity.academy;
import com.cyber.ncre.entity.academyAdmin;
import com.cyber.ncre.entity.clazz;
import com.cyber.ncre.entity.kaoroom;
import com.cyber.ncre.entity.news;
import com.cyber.ncre.entity.sysAdmin;

public interface sysAdminService{

	sysAdmin dologin(sysAdmin admin);

	List<academyAdmin> doapply();

	boolean doagree(academyAdmin admin);

	boolean dodisagree(academyAdmin admin);

	boolean dosetting(academy acad, clazz clazz);

	List<clazz> doacadMsg();

	boolean dosetting(clazz clazz);

	academy findacad(academy acad);

	void doAddacad(academy acad, clazz clazz);

	boolean doAddclazz(clazz clazz);

	boolean findclazz(clazz clazz);

	List<news> donewsMsg();

	boolean delnews(news news);

	boolean modifynews(news news);

	boolean addnews(news news);

	List<kaoroom> dokaoMsg();

	boolean dosavekao(kaoroom kaoroom);

	boolean dodelkao(kaoroom kaoroom);

	boolean doaddkao(kaoroom kaoroom);

	List<CompuTestMsg> dobaoMsg();
	
}