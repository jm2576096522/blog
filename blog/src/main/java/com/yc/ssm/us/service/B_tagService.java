package com.yc.ssm.us.service;

import java.util.List;

import com.yc.ssm.us.entity.B_tag;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_tagService {
	List<B_tag> findALlTags();

	boolean findTag(String tagname);

	boolean insertTag(B_tag b_tag);

	boolean modifyTag(B_tag b_tag);

	PaginationBean<B_tag> partTag(String page, String rows);

}
