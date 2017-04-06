package com.yc.ssm.us.handler;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.ssm.us.entity.B_comment;
import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.service.B_commentService;

@Controller
@RequestMapping("comment")
public class B_commentHandler {
	public B_commentHandler() {
		LogManager.getLogger().debug("我进入了commentHandler");
	}

	@Autowired
	private B_commentService b_commentService;

	// 通过用户id查找评论（相当于所有自己评论过的文章）
	@RequestMapping("findCommentByUsid")
	@ResponseBody
	public List<B_comment> findCommentByUsid(Integer usid, HttpSession session) {
		if (isLogin(session).equals(usid)) {
			return b_commentService.findCommentByUsid(usid);
		}
		return null;
	}

	// 通过文章id查找评论
	@RequestMapping("findCommentByCaid")
	@ResponseBody
	public List<B_comment> findCommentByCaid(Integer caid) {
		return b_commentService.findCommentByCaid(caid);
	}

	// 分页显示所有评论
	@RequestMapping(value = "list", method = RequestMethod.POST)
	@ResponseBody
	public PaginationBean<B_comment> list(String rows, String page) {
		LogManager.getLogger().debug("list:row==>" + rows + ",page==>" + page);
		return b_commentService.partComment(page, rows);// 异步数据响应
	}

	// 修改评论
	@RequestMapping("modify")
	@ResponseBody
	public boolean modify(B_comment b_comment) {
		LogManager.getLogger().debug("modify:b_comment==>" + b_comment);
		return b_commentService.modifyComment(b_comment);// 异步数据响应
	}

	// 添加评论
	@RequestMapping(value = "add", method = RequestMethod.POST)
	@ResponseBody
	public boolean insertComment(B_comment b_comment, HttpSession session) {
		if (isLogin(session).equals(b_comment.getUsid())) {
			return b_commentService.insertComment(b_comment);
		}
		return false;
	}

	// 判断用户是否登录
	public String isLogin(HttpSession session) {
		B_user user = (B_user) session.getAttribute("loginUser");
		if (user == null) {
			return "redirect:/login.jsp";
		} else {
			int usid = user.getUsid();
			return String.valueOf(usid);
		}

	}
}
