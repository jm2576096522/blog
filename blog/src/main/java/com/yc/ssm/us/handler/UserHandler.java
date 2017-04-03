package com.yc.ssm.us.handler;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.entity.PaginationBean;
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

	@RequestMapping("list")
	@ResponseBody
	public List<B_user> list() {
		LogManager.getLogger().debug("我是userhandler 中的List处理");
		return b_userService.findUserAll();
	}
	/*
	 * public PaginationBean<B_user> list(String rows, String page) {
	 * PaginationBean<B_user> pb=new PaginationBean<B_user>();
	 * pb.setCurrPage(Integer.parseInt(page));
	 * pb.setPageSize(Integer.parseInt(rows)); System.out.println("list:row==>"
	 * + rows + ",page==>" + page); return b_userService.partUser(pb);// 异步数据响应
	 * }
	 */

	@RequestMapping("modify")
	@ResponseBody
	public boolean modify(@RequestParam("picData") MultipartFile picData, B_user user) {
		System.out.println("modify:user==>" + user);
		String picPath = null;
		if (picData != null && !picData.isEmpty()) {// 判断是否有文件上传
			try {
				picData.transferTo(ServletUtil.getUploadFile(picData.getOriginalFilename()));
				picPath = ServletUtil.VIRTUAL_UPLOAD_DIR + picData.getOriginalFilename();
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		user.setUpic(picPath);
		System.out.println("上传图片==》user:" + user);
		return b_userService.modifyUser(user);// 异步数据响应
	}
}