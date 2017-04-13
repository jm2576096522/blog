package com.yc.ssm.us.service;

import java.util.List;

import com.yc.ssm.us.entity.B_comment;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_commentService {
	// 评论分页
	PaginationBean<B_comment> partComment(String page, String rows);

	// 修改评论
	boolean modifyComment(B_comment b_comment);


	/*// 添加评论文章
	boolean addComment(B_comment b_comment);*/

	// 添加评论
	boolean insertComment(B_comment b_comment);

	// 通过用户id查询评论
	List<B_comment> findCommentByUsid(Integer usid);

	// 通过文章id查询评论
	List<B_comment> findCommentByCaid(Integer caid);
	
	//查询指定文章的评论数
	int selectCommentNum(Integer caid);


}
