package com.cyber.ncre.service;

import java.util.List;

import com.cyber.ncre.entity.Eenrollmsg;
import com.cyber.ncre.entity.Student;
import com.cyber.ncre.entity.Testclas;
import com.cyber.ncre.entity.academy;
import com.cyber.ncre.entity.clazz;

public interface StudentService {

	Student login(String sxid, String spwd);

	String getemail(String sxid);

	void resetPassword(String sxid, String randPassword);

	List<academy> getAcademy();

	List<clazz> getClasses(String academy);

	boolean register(Student student);

	List<Testclas> getTest();

	Boolean apply(Eenrollmsg apply, String sname, String ssex, String tenames);

	Eenrollmsg show(String sname);

	List<String> testes(String sname);

	String getstuation(String sname);

}
