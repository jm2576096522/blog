package com.yc.ssm.us.mapper;

import java.util.List;

import com.yc.ssm.us.entity.B_comment;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_commentMapper {

	PaginationBean<B_comment> partComment(PaginationBean<B_comment> pb);

	//添加评论
	boolean insertComment(B_comment b_comment);

	List<B_comment> findCommentByUsid(Integer usid);
	
	//通过文章id 查询所有的评论（分页）
	List<B_comment> findCommentByCaid(B_comment b_comment);
	
	//查询指定文章的评论数(返回评论总数和评论的页码)
	B_comment selectCommentNum(B_comment b_comment);

	//删除评论
	int deleteComment(Integer cid);

}
