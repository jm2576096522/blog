package com.yc.ssm.us.handler;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
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
import com.yc.ssm.us.entity.B_drafets;
import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.service.B_articleService;
import com.yc.ssm.us.service.B_columnService;
import com.yc.ssm.us.service.B_drafetsService;
import com.yc.ssm.us.util.ServletUtil;
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
	@Autowired
	private B_columnService b_columnService;

	// 草稿的Service
	@Autowired
	private B_drafetsService drafetsService;

	// 所有的文章查询
	@RequestMapping("find")
	@ResponseBody
	public List<B_article> findArticle(){
		LogManager.getLogger().debug("我进来了。。。");
		return articleService.findArticle();
	}
	// 分页显示所有的文章（按时间）
	@RequestMapping("findArticle")
	@ResponseBody
	public List<B_article> findArticleByTime(B_article b_article){
		LogManager.getLogger().debug("我进来了。。。");
		return articleService.findArticleByTime(b_article);
	}
	
	//首页按评论数显示热度文章
	@RequestMapping("findByHot")
	@ResponseBody
	public List<B_article> findArticleByHot(B_article b_article) {
		LogManager.getLogger().debug("B_articleHandler+首页按评论数显示热度文章");
		return articleService.findArticleByHot(b_article);
	}

	// 查询个人文章（用户id）
	@RequestMapping("findPerson")
	@ResponseBody
	public List<B_article> findPersonArticle(Integer usid, HttpSession session) {
		B_user user = (B_user) session.getAttribute("loginUser");
		usid = user.getUsid();
		LogManager.getLogger().debug("我是个人的文章。。。");
		return articleService.findPersonArticle(usid);
	}

	// 查询博客文章(通过文章id)
	@RequestMapping(value = "findArticleByAid", method = RequestMethod.POST)
	@ResponseBody
	public B_article findArticleByAid(String aid) {
		LogManager.getLogger().debug(" 查询博客文章(通过文章id)");
		int articleId = Integer.parseInt(aid);
		return articleService.findArticleByAid(articleId);
	}

	// 分页查询文章
	@RequestMapping(value = "list", method = RequestMethod.POST)
	@ResponseBody
	public PaginationBean<B_article> list(String rows, String page) {
		LogManager.getLogger().debug("list:row==>" + rows + ",page==>" + page);
		return articleService.partArticle(page, rows);// 异步数据响应
	}

	// 指定用户id分页查询文章
	@RequestMapping(value = "listById", method = RequestMethod.POST)
	@ResponseBody
	public List<B_article> listById(B_article b_article, HttpSession session) {
		Integer usid = b_article.getUsid();
		if (usid == null) {
			B_user user = (B_user) session.getAttribute("loginUser");
			usid = user.getUsid();
		}
		b_article.setUsid(usid);
		LogManager.getLogger().debug("我是通过id分页查询的文章。。。");
		return articleService.partArticleById(b_article);
	}

	// 查询用户id所作的文章数及总页数
	@RequestMapping(value = "listNum", method = RequestMethod.POST)
	@ResponseBody
	public B_article listNum(B_article b_article, HttpSession session) {
		Integer usid = b_article.getUsid();
		if (usid == null) {
			B_user user = (B_user) session.getAttribute("loginUser");
			usid = user.getUsid();
		}
		b_article.setUsid(usid);
		LogManager.getLogger().debug("查询用户id所作的文章数及总页数");
		return articleService.findArticleNum(b_article);
	}

	// 查询文章的所有总数和总页数
	@RequestMapping(value = "articleTotal", method = RequestMethod.POST)
	@ResponseBody
	public B_article articleTotal() {
		LogManager.getLogger().debug("查询文章的所有总数和总页数");
		return articleService.findArticleTotal();
	}

	// 更改博客文章
	@RequestMapping(value = "updateArticle", method = RequestMethod.POST)
	@ResponseBody
	public int modifyArticle(@RequestParam("upicDate") MultipartFile upicDate, B_article b_article) {
		LogManager.getLogger().debug("更改博客文章：");
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
		}
		return articleService.modifyArticle(b_article);
	}

	// 浏览量的增加
	@RequestMapping(value = "updateAviewNum", method = RequestMethod.POST)
	@ResponseBody
	public int updateAviewNum(@RequestParam("aid") Integer aid) {
		return articleService.updateAviewNum(aid);
	}

	// 删除文章
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public int deleteUser(Integer aid) {
		LogManager.getLogger().debug("我是delete 的处理");
		return articleService.deleteArticle(aid);
	}

	// 添加新文章
	@RequestMapping(value = "addArticle", method = RequestMethod.POST)
	@ResponseBody
	public boolean insertArticle(@RequestParam("upicDate") MultipartFile upicDate, B_article b_article,
			HttpSession session) {
		B_user currentUser = (B_user) session.getAttribute("loginUser");
		Integer usid = currentUser.getUsid();
		String picPath = null;
		Integer drid = b_article.getDrid();

		if (usid != null) {
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
			} else {
				if (drid != null) {
					B_drafets drafets = drafetsService.findDrafetByDrid(drid);
					String apic = drafets.getDrpic();
					b_article.setApic(apic);
				} else {
					LogManager.getLogger().debug("我是空的");
					b_article.setApic("");
				}
			}
			b_article.setUsid(usid);
			LogManager.getLogger().debug("B_articleHandler 添加新文章：");
			return articleService.insertArticle(b_article);
		} else {
			return false;
		}

	}

	// 后台数据对文章的条件查询
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
		} else if (mkid.trim().equals("cotitle")) {
			return (List<T>) b_columnService.findColumnAll();
		} else {
			return (List<T>) articleService.findArticle();
		}
	}

	// 后台通过条件查询(name为条件查询参数名 ，param为条件查询的参数值 例如:{name: tname,param:'原创')
	@RequestMapping(value = "findByParam", method = RequestMethod.POST)
	@ResponseBody
	public List<B_article> findArticleByParam(String name, String param, String rows, String page)
			throws UnsupportedEncodingException {
		// param = new String(param.getBytes("ISO-8859-1"), "UTF-8");
		LogManager.getLogger().debug("条件查询  neme:" + name + ",param :" + param);
		if (name.trim().equals("uname")) {
			return articleService.findArticleByuname(param);
		} else if (name.trim().equals("tname")) {
			return articleService.findArticleBytname(param);
		} else if (name.trim().equals("tagname")) {
			return articleService.listArticleBytagname(param);
		} else if (name.trim().equals("cotitle")) {
			// 先通过板块标题查询板块文章的id
			String coaid = b_columnService.findCoaidByCotitle(param);
			if (coaid.equals("") || coaid == null) {
				return articleService.findArticle();
			}
			String[] array = coaid.split(",");
			List<String> listcoaid = new ArrayList<String>();
			for (String str : array) {
				listcoaid.add(str);
			}
			// 通过板块文章id 查询文章信息
			return articleService.listArticleByCoaid(listcoaid);
		}
		return articleService.findArticle();
	}

	// 后台查询用户文章发表的排行（文章统计）
	@RequestMapping(value = "analytics", method = RequestMethod.POST)
	@ResponseBody
	public List<B_article> ArticleAnalytics() {
		return articleService.ArticleAnalytics();
	}

}
