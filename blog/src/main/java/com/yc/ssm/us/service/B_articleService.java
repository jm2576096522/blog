package com.yc.ssm.us.service;

import java.util.List;

import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_articleService {

	// 查询博客文章
	List<B_article> listArticles(String tagname);

	PaginationBean<B_article> partArticle(PaginationBean<B_article> pb);// 分页

	// 修改博客文章
	int modifyArticle(B_article b_article);// 更新博客信息

	// 通过用户昵称查询博客
	List<B_article> findArticleByUname(B_user b_user);

	// 添加博客文章
	boolean addArticle(B_article b_article);

}
