package com.yc.ssm.us.service.impl;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.mapper.B_drafetsMapper;
import com.yc.ssm.us.service.B_drafetsService;

@Service("b_drafetsService")
public class B_drafetsServiceImpl implements B_drafetsService {
	
	@Autowired
	private B_drafetsMapper drafetsMapper;
	
	//添加草稿
	@Override
	public int addDrafet(B_article b_article) {
		LogManager.getLogger().debug("添加草稿");
		return drafetsMapper.addDrafet(b_article);
	}

}
