package com.yc.ssm.us.mapper;

import java.util.List;

import com.yc.ssm.us.entity.B_tag;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_tagMapper {
	List<B_tag> findALlTags();

	boolean findTag(String tagname);

	int insertTag(B_tag b_tag);

	boolean modifyTag(B_tag b_tag);

	PaginationBean<B_tag> partTag(PaginationBean<B_tag> pb);

	int deleteTag(int tagid);

}
