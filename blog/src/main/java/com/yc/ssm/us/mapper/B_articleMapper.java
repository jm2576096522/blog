package com.yc.ssm.us.mapper;

import com.yc.ssm.us.entity.PaginationBean;

import java.util.List;

import com.yc.ssm.us.entity.B_article;

public interface B_articleMapper {
	// 首页显示博客的热度文章
	List<B_article> findArticle();

	// 通过用户id查询个人文章
	List<B_article> findPersonArticle(Integer usid);

	// 查询博客文章(通过标签)
	List<B_article> listArticleBytagname(String tagname);

	// 分页查询文章
	PaginationBean<B_article> partArticle(PaginationBean<B_article> pb);// 分页

	// 更新博客文章
	int modifyArticle(B_article b_article);

	// 写博客
	int insertArticle(B_article b_article);

	// 删除文章
	int deleteArticle(int aid);

	// 通过用户名查找文章
	List<B_article> listArticleByuname(String uname);

	// 通过文章类型查找文章
	List<B_article> listArticleBytname(String tname);
}
