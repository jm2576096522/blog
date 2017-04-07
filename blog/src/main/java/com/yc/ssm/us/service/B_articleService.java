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
	List<B_article> listArticles(String tagname);

	// 分页显示文章
	PaginationBean<B_article> partArticle(String page, String rows);

	// 修改博客文章
	int modifyArticle(B_article b_article);// 更新博客信息

	/*
	 * // 添加博客文章 boolean addArticle(B_article b_article);
	 */

}
