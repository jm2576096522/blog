package com.yc.ssm.us.handler;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.service.B_articleService;
import com.yc.ssm.us.util.ServletUtil;

@Controller
@RequestMapping("article")
public class B_articleHandler {
	
	public B_articleHandler() {
		LogManager.getLogger().debug("我进入了articleHandler");
	}
	
	@Autowired
	private B_articleService articleService;

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
	
	//添加新文章
	@RequestMapping(value = "addArticle", method = RequestMethod.POST)
	@ResponseBody
	public boolean insertArticle(@RequestParam("upicDate") MultipartFile upicDate,B_article b_article,HttpSession session){
		B_user currentUser = (B_user) session.getAttribute("loginUser"); 
		int usid = currentUser.getUsid();
		String picPath = null;
		if (upicDate != null && !upicDate.isEmpty()) {// 判断是否有文件上传
			try {
				upicDate.transferTo(ServletUtil.getUploadFile(upicDate.getOriginalFilename()));
				picPath = ServletUtil.VIRTUAL_UPLOAD_DIR + upicDate.getOriginalFilename();
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			b_article.setApic(picPath);
		}else{
			System.out.println("我是空的");
			b_article.setApic("");
		}
		b_article.setUsid(usid);
		LogManager.getLogger().debug("B_articleHandler 添加新文章：");
		return articleService.insertArticle(b_article);
	}
}
