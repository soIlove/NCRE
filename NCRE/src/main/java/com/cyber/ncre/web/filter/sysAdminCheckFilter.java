/*package com.cyber.ncre.web.filter;

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

*//**
 * 鏍￠獙鐢ㄦ埛鐧诲綍杩囨护鍣�
 * 
 * @author random
 *
 *//*
@WebFilter("/*")
public class sysAdminCheckFilter extends AbstractFilter {

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		LogManager.getLogger().debug("浣跨敤鏍￠獙鐢ㄦ埛鐧诲綍杩囨护鍣�杩涜鏉冮檺鎺у埗,鎴戝湪UserCheckFilter閲�..");
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// 1.杩囨护鍝簺璇锋眰椤甸潰
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response =(HttpServletResponse) resp;
		String requri = request.getRequestURI();

		if (request.getSession().getAttribute("sysUser") == null) {//褰撴病鏈夌櫥褰曟椂,涓虹┖.褰撳叾浠栫敤鎴风櫥褰曟椂,杩欓噷浼氳娓呯┖
			if (requri.endsWith("sysmanage.jsp") || requri.endsWith("sysapply.jsp")) {
				LogManager.getLogger().debug("璇峰厛鐧诲綍鍐嶆搷浣�");
				request.getRequestDispatcher("/page/syslogin.jsp").forward(request, response);
				return;
			}
		}

		// 2.涓嶆弧瓒宠繃婊ょ殑杩囨护鏉′欢灏辩户缁姹�
		chain.doFilter(req, resp);
	}

}
*/