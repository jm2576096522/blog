package com.yc.ssm.us.mapper;

import java.util.List;

import com.yc.ssm.us.entity.B_comment;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_commentMapper {

	PaginationBean<B_comment> partComment(PaginationBean<B_comment> pb);

	boolean modifyComment(B_comment b_comment);

	boolean insertComment(B_comment b_comment);

	List<B_comment> findCommentByUsid(Integer usid);

	List<B_comment> findCommentByCaid(Integer caid);

}
