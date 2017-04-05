package com.cyber.ncre.web.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;

/**
 * 校验用户登录过滤器
 * 
 * @author random
 *
 */
@WebFilter("/*")
public class sysAdminCheckFilter extends AbstractFilter {

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		LogManager.getLogger().debug("使用校验用户登录过滤器,进行权限控制,我在UserCheckFilter里...");
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// 1.过滤哪些请求页面
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response =(HttpServletResponse) resp;
		String requri = request.getRequestURI();

		if (request.getSession().getAttribute("sysUser") == null) {//当没有登录时,为空.当其他用户登录时,这里会被清空
			if (requri.endsWith("sysmanage.jsp") || requri.endsWith("sysapply.jsp")) {
				LogManager.getLogger().debug("请先登录再操作");
				request.getRequestDispatcher("/page/syslogin.jsp").forward(request, response);
				return;
			}
		}

		// 2.不满足过滤的过滤条件就继续请求,
		chain.doFilter(req, resp);
	}

}
