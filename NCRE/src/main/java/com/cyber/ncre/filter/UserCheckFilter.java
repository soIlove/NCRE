package com.cyber.ncre.filter;

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
 * @author 7G-5HI7
 *
 */
@WebFilter("/*")
public class UserCheckFilter extends AbstractFilter {

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

		if (request.getSession().getAttribute("loginUser") == null) {//当没有登录时,为空.当其他用户登录时,这里会被清空
			if (requri.endsWith("profile.jsp") || requri.endsWith("order.jsp")  || requri.endsWith("RegisterDai.jsp") ) {
				// 2.满足过滤的过滤条件就终止继续请求,
				if(request.getSession().getAttribute("errorMsg") == null){//登录成功后errorMsg本身就为空
					request.setAttribute("errorMsg", "请登录后,再操作....");
					System.out.println("请登录");
				}
				
				LogManager.getLogger().debug("请先登录再操作");
				request.getRequestDispatcher("/page/Login.jsp").forward(request, response);
//				response.sendRedirect("/zhaixiaodi/page/Login.jsp");
				return;
			}
		}

		// 2.不满足过滤的过滤条件就继续请求,
		chain.doFilter(req, resp);

	}

}
