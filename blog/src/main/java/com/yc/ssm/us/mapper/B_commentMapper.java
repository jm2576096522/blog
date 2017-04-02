package com.yc.ssm.us.mapper;

import java.util.List;

import com.yc.ssm.us.entity.B_comment;

public interface B_commentMapper {

	List<B_comment> listComment(int caid);

	boolean addComment(B_comment b_comment);

}
