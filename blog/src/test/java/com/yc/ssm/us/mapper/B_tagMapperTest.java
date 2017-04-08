package com.yc.ssm.us.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.ssm.us.entity.B_tag;
import com.yc.ssm.us.service.B_tagService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class B_tagMapperTest {
	@Autowired
	private B_tagService tagService;
	
	@Test
	public void testFindAll() {
		List<B_tag> tag = tagService.findAll();
		LogManager.getLogger().debug(tag);
		assertNotNull(tag);
		
	}

}
