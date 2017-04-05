package com.yc.ssm.us.handler;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.service.B_articleService;

@Controller
@RequestMapping("article")
public class B_articleHandler {
	public B_articleHandler() {
		LogManager.getLogger().debug("我进入了articleHandler");
	}

	@Autowired
	private B_articleService articleService;

	@RequestMapping("find")
	@ResponseBody
	public List<B_article> findArticle() {
		System.out.println("我进来了。。。");
		return articleService.findArticle();
	}

	@RequestMapping("findPerson")
	@ResponseBody
	public List<B_article> findPersonArticle(Integer usid, HttpSession session) {
		B_user user = (B_user) session.getAttribute("loginUser");
		usid = user.getUsid();
		System.out.println("我是个人的文章。。。");
		return articleService.findPersonArticle(usid);
	}
	
	@RequestMapping(value = "list", method = RequestMethod.POST)
	@ResponseBody
	public PaginationBean<B_article> list(String rows, String page) {
		LogManager.getLogger().debug("list:row==>" + rows + ",page==>" + page);
		return articleService.partArticle(page, rows);// 异步数据响应
	}
}
