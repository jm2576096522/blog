package com.yc.ssm.us.service;

import java.util.List;

import com.yc.ssm.us.entity.B_comment;

public interface B_commentService {

	// 通过文章id ,查询评论
	List<B_comment> listComment(int caid);

	/*// 添加评论文章
	boolean addComment(B_comment b_comment);*/

}
