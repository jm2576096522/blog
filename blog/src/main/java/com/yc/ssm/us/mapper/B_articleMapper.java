package com.yc.ssm.us.mapper;

import com.yc.ssm.us.entity.PaginationBean;

import java.util.List;

import com.yc.ssm.us.entity.B_article;

public interface B_articleMapper {
	// 查询所有的文章
	List<B_article> findArticle();
	//首页按评论数显示热度文章
	List<B_article> findArticleByHot(B_article b_article);
	// 通过用户id查询个人文章
	List<B_article> findPersonArticle(Integer usid);

	// 查询博客文章(通过标签)
	List<B_article> listArticles(String tagname);

	// 查询博客文章(通过文章id)
	B_article findArticleByAid(Integer aid);

	// 分页
	PaginationBean<B_article> partArticle(PaginationBean<B_article> pb);

	// 通过用户id分页
	List<B_article> partArticleById(B_article b_article);
	//查询用户id所作的文章数及总页数
	B_article findArticleNum(B_article b_article);
	
	//查询文章的所有总数和总页数
	B_article findArticleTotal();
	
	//

	List<B_article> listArticleBytagname(String tagname);

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

	// 查询每个用户发表文章的数量（后台数据分析）
	List<B_article> articleAnalytics();
	
	//浏览量的增加
	int updateAviewNum(Integer aid);
}
