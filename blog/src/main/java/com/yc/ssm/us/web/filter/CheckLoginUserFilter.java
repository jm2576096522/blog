package com.yc.ssm.us.web.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yc.ssm.us.util.ServletUtil;

@WebFilter("/*")
public class CheckLoginUserFilter extends AbstractFilter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		String reqUriStr = req.getRequestURI();
		if (reqUriStr.endsWith("list.jsp")) {
			Object user = req.getSession().getAttribute(ServletUtil.LOGIN_USER);
			if (user == null) {
				HttpSession session = req.getSession();
				if (session.getAttribute("errorMsg") == null) {
					session.setAttribute("errorMsg", "请先登录！！！");
				}

				resp.sendRedirect(req.getServletContext().getContextPath() + "/page/login.jsp");
				return;
			}
		}
		chain.doFilter(request, response);
	}
}
