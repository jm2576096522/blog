package com.yc.ssm.us.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.service.B_drafetsService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class B_drafetsMapperTest {

	@Autowired
	private B_drafetsService drafets;
	
	@Test
	public void testAddDrafet() {
		B_article b_article = new B_article();
		b_article.setUsid(10007);
		b_article.setAtitle("你好");
		b_article.setTid(1);
		b_article.setTagid(2);
		b_article.setAcontent("hello world");
		b_article.setApic("");
		
		int result = drafets.addDrafet(b_article);
		System.out.println(result);
		
		assertNotNull(result);

	}

}
