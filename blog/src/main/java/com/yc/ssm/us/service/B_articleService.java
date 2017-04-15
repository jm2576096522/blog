package com.yc.ssm.us.service;

import java.util.List;

import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_articleService {
	// 首页显示博客的热度文章
	List<B_article> findArticle();

	// 通过用户id查询个人文章
	List<B_article> findPersonArticle(Integer usid);

	// 通过标签名查询博客文章
	List<B_article> listArticleBytagname(String tagname);
	
	// 查询博客文章(通过文章id)
	B_article findArticleByAid(Integer aid);

	// 通过用户昵称查找博客文章
	List<B_article> findArticleByuname(String uname);

	// 通过文章类型名查找文章
	List<B_article> findArticleBytname(String tname);

	// 分页显示文章
	PaginationBean<B_article> partArticle(String page, String rows);
	
	// 通过用户id分页
	List<B_article> partArticleById(B_article b_article);
	
	//查询用户id所作的文章数及总页数
	B_article findArticleNum(B_article b_article);

	// 修改博客文章
	int modifyArticle(B_article b_article);// 更新博客信息
	// 删除博客文章
	int deleteArticle(Integer aid);

	// 添加博客文章
	boolean insertArticle(B_article b_article);

	List<B_article> ArticleAnalytics();
	 

}
