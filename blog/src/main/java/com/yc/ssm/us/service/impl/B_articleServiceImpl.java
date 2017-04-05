package com.yc.ssm.us.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.mapper.B_articleMapper;
import com.yc.ssm.us.service.B_articleService;
import com.yc.ssm.us.service.B_tagService;
import com.yc.ssm.us.service.B_userService;

@Service("b_articleService") 

public class B_articleServiceImpl implements B_articleService {
	@Autowired 
	private B_articleMapper b_articleMapper;

	@Autowired 
	private B_tagService b_tagService;
	
	@Autowired 
	private B_userService b_userService;

	@Override
	public List<B_article> listArticles(String tagname) {
		// 通过标签名查询博客文章
		return b_articleMapper.listArticles(tagname);
	}

	@Override
	public int modifyArticle(B_article b_article) {
		return b_articleMapper.modifyArticle(b_article);
	}

	/*@Override
	public boolean addArticle(B_article b_article) {
		b_article.setTagname(b_article.getTagname().replace(" ", ""));// 标签去空格
		// 1.添加博客文章或者更新
		String[] tagnames = b_article.getTagname().split(",");
		for (String tagname : tagnames) {
			LogManager.getLogger().debug(tagname);
			if (!b_tagService.findTag(tagname)) {// 判断是否存在标签
				// 不存在，增加书签
				b_tagService.insertTag(tagname);
			}
		}
		return b_articleMapper.insertArticle(b_article) > 0;
	}*/

	//通过用户id查询查询个人文章
	@Override
	public List<B_article> findPersonArticle(Integer usid) {
		System.out.println("我是通过usid查询来的");
		return b_articleMapper.findPersonArticle(usid);
	}

	@Override
	public List<B_article> findArticle() {
		System.out.println("我是articleService里的：");
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

}
