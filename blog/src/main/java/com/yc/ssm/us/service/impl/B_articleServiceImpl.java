package com.yc.ssm.us.service.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.mapper.B_articleMapper;
import com.yc.ssm.us.service.B_articleService;

@Service("b_articleService") 

public class B_articleServiceImpl implements B_articleService {
	@Autowired 
	private B_articleMapper b_articleMapper;

	@Override
	public List<B_article> listArticles(String tagname) {
		// 通过标签名查询博客文章
		return b_articleMapper.listArticles(tagname);
	}

	@Override
	public int modifyArticle(B_article b_article) {
		return b_articleMapper.modifyArticle(b_article);
	}

	//添加新文章
	@Override
	public boolean insertArticle(B_article b_article) {
		b_article.setAtitle(b_article.getAtitle().replace(" ", ""));// 标签去空格
		LogManager.getLogger().debug("添加新文章：");
		return b_articleMapper.insertArticle(b_article) > 0;
	}

	//通过用户id查询查询个人文章
	@Override
	public List<B_article> findPersonArticle(Integer usid) {
		LogManager.getLogger().debug("我是通过usid查询来的");
		return b_articleMapper.findPersonArticle(usid);
	}

	@Override
	public List<B_article> findArticle() {
		LogManager.getLogger().debug("我是articleService里的：");
		return b_articleMapper.findArticle();
		
	}

	@Override
	public PaginationBean<B_article> partArticle(String page, String rows) {
		PaginationBean<B_article> pb = new PaginationBean<>();
		if (page != null) {
			pb.setCurrPage(Integer.parseInt(page));
		}
		if (rows != null) {
			pb.setPageSize(Integer.parseInt(rows));
		}
		pb=b_articleMapper.partArticle(pb);
		return pb;
	}

	@Override
	public int deleteArticle(String aid) {
		int aid1=Integer.parseInt(aid);
		return b_articleMapper.deleteArticle(aid1);
	}

}
