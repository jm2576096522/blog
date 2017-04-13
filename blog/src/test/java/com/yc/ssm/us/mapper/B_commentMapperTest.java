package com.yc.ssm.us.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.ssm.us.service.B_commentService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class B_commentMapperTest {

	@Autowired
	private B_commentService b_commentService;
	@Test
	public void testSelectCommentNum() {
		int caid = 22;
		int result = b_commentService.selectCommentNum(caid);
		System.out.println(result);
		assertNotNull(result);
	}

}
