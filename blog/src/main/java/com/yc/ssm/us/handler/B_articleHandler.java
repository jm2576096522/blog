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
import com.yc.ssm.us.service.B_tagService;
import com.yc.ssm.us.service.B_typeService;
import com.yc.ssm.us.service.B_userService;

@Controller
@RequestMapping("article")
public class B_articleHandler<T> {
	public B_articleHandler() {
		LogManager.getLogger().debug("我进入了articleHandler");
	}

	@Autowired
	private B_articleService articleService;

	@Autowired
	private B_userService b_userService;

	@Autowired
	private B_tagService b_tagService;
	@Autowired
	private B_typeService b_typeService;

	// 文章查询
	@RequestMapping("find")
	@ResponseBody
	public List<B_article> findArticle() {
		System.out.println("我进来了。。。");
		return articleService.findArticle();
	}

	// 查询个人文章（用户id）
	@RequestMapping("findPerson")
	@ResponseBody
	public List<B_article> findPersonArticle(Integer usid, HttpSession session) {
		B_user user = (B_user) session.getAttribute("loginUser");
		usid = user.getUsid();
		System.out.println("我是个人的文章。。。");
		return articleService.findPersonArticle(usid);
	}

	// 分页查询文章
	@RequestMapping(value = "list", method = RequestMethod.POST)
	@ResponseBody
	public PaginationBean<B_article> list(String rows, String page) {
		LogManager.getLogger().debug("list:row==>" + rows + ",page==>" + page);
		return articleService.partArticle(page, rows);// 异步数据响应
	}

	// 删除文章
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public int deleteUser(String aid) {
		LogManager.getLogger().debug("我是delete admin的处理");
		return articleService.deleteArticle(aid);
	}

	//后台数据对文章的条件查询
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "", method = RequestMethod.GET)
	@ResponseBody
	public List<T> comboselect(String mkid) {
		if (mkid.trim().equals("uname")) {
			return (List<T>) b_userService.findUserAll();
		} else if (mkid.trim().equals("tname")) {
			return (List<T>) b_typeService.findTypeAll();
		} else if (mkid.trim().equals("tagname")) {
			return (List<T>) b_tagService.findAll();
		} else {
			return (List<T>) articleService.findArticle();
		}
	}

}
