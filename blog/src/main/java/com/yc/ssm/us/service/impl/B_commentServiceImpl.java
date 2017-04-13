package com.yc.ssm.us.service.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.ssm.us.entity.B_comment;
import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.mapper.B_commentMapper;
import com.yc.ssm.us.service.B_commentService;

@Service("b_commentService")
public class B_commentServiceImpl implements B_commentService {
	@Autowired
	private B_commentMapper b_commentMapper;

	@Override
	public PaginationBean<B_comment> partComment(String page, String rows) {
		PaginationBean<B_comment> pb = new PaginationBean<>();
		if (page != null) {
			pb.setCurrPage(Integer.parseInt(page));
		}
		if (rows != null) {
			pb.setPageSize(Integer.parseInt(rows));
		}
		pb=b_commentMapper.partComment(pb);
		return pb;
	}


/*	@Override
	public boolean addComment(B_comment b_comment) {
		int usid = b_comment.getUsid();
		if (!b_userService.findUserByUsid(usid)) {
			// 注册
			// b_userService.insertUser(b_user);
		}
		return b_commentMapper.addComment(b_comment);
	}*/

	@Override
	public boolean modifyComment(B_comment b_comment) {
		return b_commentMapper.modifyComment(b_comment);
	}

	@Override
	public boolean insertComment(B_comment b_comment) {
		return b_commentMapper.insertComment(b_comment);
	}

	@Override
	public List<B_comment> findCommentByUsid(Integer usid) {
		return b_commentMapper.findCommentByUsid(usid);
	}

	@Override
	public List<B_comment> findCommentByCaid(Integer caid) {
		return b_commentMapper.findCommentByCaid(caid);
	}
	
	//查询指定文章的评论数
	@Override
	public int selectCommentNum(Integer caid){
		LogManager.getLogger().debug("查询指定文章的评论数"+caid);
		return b_commentMapper.selectCommentNum(caid);
	}


}
