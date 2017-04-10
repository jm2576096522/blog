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

	@Test
	public void testListArticles() {

		List<B_article> articles = bart.listArticles("java");
		System.out.println("查询结果==》");
		for (B_article b_article : articles) {
			System.out.println(b_article);
		}
		assertNotNull(articles);
	}
	@Test
	public void testModifyArticle() {
		B_article b_article = new B_article();
		b_article.setAid(1004);
		b_article.setAcontent("java的一个集成开发环境");
		b_article.setAtitle("eclispe");
		
		bart.modifyArticle(b_article);
	}
	@Test
	public void testFindArticle(){
		List<B_article> list = bart.findArticle();
		System.out.println(list);
		assertNotNull(list);
	
	}
	@Test
	public void testPartArticle(){
		PaginationBean<B_article> partArticle = bart.partArticle("10", "5");
		System.out.println(partArticle);
		assertNotNull(partArticle);
		
	}
	//新建博客
	@Test
	public void testInsertArticle() {
		B_article article = new B_article();
		article.setAtitle("eclispe");
		article.setTid(2);
		article.setTagid(1);
		article.setUsid(10007);
		article.setAcontent("java的一个集成开发环境");
		article.setApic("");
		boolean result = bart.insertArticle(article);
		System.out.println(result);
		assertEquals(result, true);
	}

}
