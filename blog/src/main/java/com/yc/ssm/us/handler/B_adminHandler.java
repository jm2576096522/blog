package com.yc.ssm.us.handler;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yc.ssm.us.entity.B_admin;
import com.yc.ssm.us.service.B_adminService;
import com.yc.ssm.us.util.ServletUtil;

@Controller
@RequestMapping("admin")
public class B_adminHandler {
	public B_adminHandler() {
		LogManager.getLogger().debug("我进入了B_adminHandler");
	}

	@Autowired
	private B_adminService b_adminService;

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(B_admin b_admin, HttpServletRequest request) {
		LogManager.getLogger().debug("login:admin===>" + b_admin);
		b_admin = b_adminService.login(b_admin);
		if (b_admin == null) {
			request.setAttribute(ServletUtil.ERROR_MESSAGE, "用户名或密码错误！！！");
			return "redirect:/back/login.jsp";
		} else {
			request.getSession().setAttribute(ServletUtil.LOGIN_ADMIN, b_admin);
			return "redirect:/back/manage.jsp";
		}
	}

	/*@RequestMapping("list")
	  
	  @ResponseBody public PaginationBean<B_admin> list(String rows, String
	  page) { System.out.println("list:row==>" + rows + ",page==>" + page);
	  return b_adminService.partUser(page, rows);// 异步数据响应 }

	@RequestMapping("modify")
	  
	  @ResponseBody public int modify(B_admin user) {
	  System.out.println("modify:user==>" + user); return
	  b_adminService.modifyUser(user);// 异步数据响应 }
	 */
}
