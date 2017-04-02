package com.yc.ssm.us.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.service.B_userService;
import com.yc.ssm.us.util.ServletUtil;

@Controller
@RequestMapping("blog")
public class UserHandler {

	public UserHandler() {
		LogManager.getLogger().debug("我进入了userHandler");
	}

	@Autowired
	private B_userService b_userService;

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(B_user user, HttpServletRequest request) {
		user = b_userService.login(user);
		HttpSession session = request.getSession();
		LogManager.getLogger().debug("login:user的值是：" + user);
		if (user == null) {
			session.setAttribute(ServletUtil.ERROR_MESSAGE, "用户名或密码错误！！！");
			return "redirect:/login.jsp";
		} else {
			session.setAttribute(ServletUtil.LOGIN_USER, user);
			return "redirect:/personPage.jsp";
		}
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	@ResponseBody
	public boolean insertUser(B_user user) {
		LogManager.getLogger().debug("我是register的处理");
		return b_userService.insertUser(user);
	}
}
