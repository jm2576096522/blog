package com.yc.ssm.us.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.entity.B_comment;
import com.yc.ssm.us.service.B_commentService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class B_commentMapperTest {

	@Autowired
	private B_commentService b_commentService;
	
	//查询指定文章的评论数(返回评论总数和评论的页码)
	@Test
	public void testSelectCommentNum() {
		B_comment b_comment = new B_comment();
		b_comment.setCaid(181);
		B_comment list = b_commentService.selectCommentNum(b_comment);
		System.out.println(list);
		assertNotNull(list);
	}
	
	@Test
	public void testFindCommentByCaid() {
		B_comment b_comment = new B_comment();
		b_comment.setCaid(181);
		b_comment.setPageSize(10);
		b_comment.setCurrPage(1);
		List<B_comment> list = b_commentService.findCommentByCaid(b_comment);
		System.out.println(list);
		assertNotNull(list);
	}

}
