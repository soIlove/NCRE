package com.cyber.ncre.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cyber.ncre.entity.Computest;
import com.cyber.ncre.entity.Eenrollmsg;
import com.cyber.ncre.entity.Student;
import com.cyber.ncre.entity.Testclas;
import com.cyber.ncre.entity.academy;
import com.cyber.ncre.entity.clazz;

public interface StudentMapper {

	Student login(@Param("sxid")String sxid, @Param("spwd")String spwd);

	String getemail(@Param("sxid")String sxid);

	boolean updatePassword(@Param("student")Student student);

	List<academy> getAcademy();

	List<clazz> getClasses(String academy);

	int register(Student student);

	List<Testclas> getTest();

	boolean apply(Eenrollmsg apply);

	int modify(@Param("sname")String sname,@Param("ssex") String ssex);

	int select(String sname);

	Eenrollmsg show(int sid);

	int selecteid(int sid);

	int find(String tename);

	Boolean apply2(Computest co);

	int findteid(int eid);

	List<String> selectename(int teid);

	String getstuation(int eid);

}
