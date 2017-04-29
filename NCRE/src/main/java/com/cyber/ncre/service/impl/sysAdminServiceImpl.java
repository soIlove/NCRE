package com.cyber.ncre.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cyber.ncre.entity.CompuTestMsg;
import com.cyber.ncre.entity.academy;
import com.cyber.ncre.entity.academyAdmin;
import com.cyber.ncre.entity.clazz;
import com.cyber.ncre.entity.kaoroom;
import com.cyber.ncre.entity.news;
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

	@Override
	public boolean doagree(academyAdmin admin) {
		return sysAdminMapper.modifyAcstatusPass(admin)>0;
	}
	
	@Override
	public List<clazz> doacadMsg() {
		return sysAdminMapper.findacadMsg();
	}

	@Override
	public boolean dodisagree(academyAdmin admin) {
		return sysAdminMapper.modifyAcstatusNPass(admin)>0;
	}

	@Override
	public boolean dosetting(academy acad, clazz clazz) {
		return sysAdminMapper.setacadMsg(acad)>0 & sysAdminMapper.setclazzMsg(clazz)>0;
	}

	@Override
	public boolean dosetting(clazz clazz) {
		return sysAdminMapper.delclazzMsg(clazz)>0;
	}

	@Override
	public academy findacad(academy acad) {
		return sysAdminMapper.selectAcadByName(acad);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW) //插入事务操作
	public void doAddacad(academy acad, clazz clazz) {
		//插入学院信息
		sysAdminMapper.addAcademy(acad);
		//插入班级信息
		sysAdminMapper.addClazz(clazz);
	}

	@Override
	public boolean doAddclazz(clazz clazz) {
		//插入已存在学院班级
		return sysAdminMapper.addExistClazz(clazz)>0;
	}

	@Override
	public boolean findclazz(clazz clazz) {
		return sysAdminMapper.selectClazz(clazz)==null;
	}

	@Override
	public List<news> donewsMsg() {
		return sysAdminMapper.getnewMsg();
	}

	@Override
	public boolean delnews(news news) {
		return sysAdminMapper.delnewMsg(news)>0;
	}

	@Override
	public boolean modifynews(news news) {
		return sysAdminMapper.updatenews(news)>0;
	}

	@Override
	public boolean addnews(news news) {
		return sysAdminMapper.addnews(news)>0;
	}

	@Override
	public List<kaoroom> dokaoMsg() {
		return sysAdminMapper.findkaoMsg();
	}

	@Override
	public boolean dosavekao(kaoroom kaoroom) {
		return sysAdminMapper.modifykaoRoom(kaoroom)>0;
	}

	@Override
	public boolean dodelkao(kaoroom kaoroom) {
		return sysAdminMapper.delkaoRoom(kaoroom)>0;
	}

	@Override
	public boolean doaddkao(kaoroom kaoroom) {
		return sysAdminMapper.addkaoRoom(kaoroom)>0;
	}

	@Override
	public List<CompuTestMsg> dobaoMsg() {
		return sysAdminMapper.findbaoMsg();
	}

	

}
