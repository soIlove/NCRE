package com.cyber.ncre.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.logging.log4j.LogManager;

public class MyBatisUtil {
	private static SqlSessionFactory factory;

	static {
		InputStream in = null;
		try {
			// 加载类路径下的mybatis框架的配置文件
			in = Resources.getResourceAsStream("mybatis.xml");
		} catch (IOException e) {
			LogManager.getLogger().error("加载类路径下的mybatis框架的配置文件出错!!" + e);
			e.printStackTrace();
		}
		// 根据加载上来的mybatis配置的文件信息,构建 SqlSessionFactory 对象
		factory = new SqlSessionFactoryBuilder().build(in);
		LogManager.getLogger().debug("根据加载上来的mybatis配置的文件信息,构建  SqlSessionFactory  对象!!");
	}

	// 取到数据库会话连接
	public static SqlSession getAutoCommitSession() {
		if (factory != null) {
			LogManager.getLogger().debug("取到数据库连接!!");
			return factory.openSession(true);
		}
		return null;
	}

}
