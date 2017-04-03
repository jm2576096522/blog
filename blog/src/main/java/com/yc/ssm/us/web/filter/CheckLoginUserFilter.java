package com.yc.ssm.us.web.filter;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("login_check")
public class CheckLoginUserFilter{

	/*public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)throws IOException, ServletException {
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
	}*/
	@RequestMapping()
	@ResponseBody
	public String CheckLogin(HttpSession session){
		System.out.println("我是检查登陆类");
		System.out.println(session.getAttribute("loginUser"));
		if(session.getAttribute("loginUser") == null || session.getAttribute("loginUser") ==""){
			return "redirect:/login.jsp";
		}else{
			return "redirect:/login.jsp";
		}
	}
}
