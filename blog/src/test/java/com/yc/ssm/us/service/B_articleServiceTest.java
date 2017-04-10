package com.yc.ssm.us.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.entity.PaginationBean;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class B_articleServiceTest {
	@Autowired
	private B_articleService bart;

	// 条件查询文章
	@Test
	public void testListArticles() {
		List<B_article> articles = bart.listArticles("java");
		System.out.println("查询结果==》");
		for (B_article b_article : articles) {
			System.out.println(b_article);
		}
		assertNotNull(articles);
	}

	// 修改通过文章id修改文章
	@Test
	public void testModifyArticle() {
		B_article b_article = new B_article();
		b_article.setAid(1004);
		b_article.setAcontent("java的一个集成开发环境");
		b_article.setAtitle("eclispe");

		bart.modifyArticle(b_article);
	}

	// 查找所有文章
	@Test
	public void testFindArticle() {
		List<B_article> list = bart.findArticle();
		System.out.println(list);
		assertNotNull(list);
	}

	// 分页查询
	@Test
	public void testPartArticle() {
		PaginationBean<B_article> lists = bart.partArticle("1", "10");
		System.out.println(lists);
		assertNotNull(lists);
	}
	@Test
	public void testPartArticle(){
		PaginationBean<B_article> partArticle = bart.partArticle("10", "5");
		
		System.out.println(partArticle);
		assertNotNull(partArticle);
		
	}

}
