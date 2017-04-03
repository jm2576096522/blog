package com.yc.ssm.us.mapper;

import com.yc.ssm.us.entity.PaginationBean;

import java.util.List;
import java.util.Map;

import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.entity.B_user;

public interface B_articleMapper {
	//首页显示博客的热度文章
	List<B_article> findArticle();
	
	// 通过用户id查询个人文章
	List<B_article> findPersonArticle(Integer usid);
	
	// 查询博客文章(通过标签)
	List<B_article> listArticles(String tagname);

	PaginationBean<B_article> partArticle(PaginationBean<B_article> pb);// 分页

	// 更新博客文章
	int modifyArticle(B_article b_article);

	

	// 写博客
	int insertArticle(B_article b_article);
}
