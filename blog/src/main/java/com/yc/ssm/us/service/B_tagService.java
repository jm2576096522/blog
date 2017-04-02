package com.yc.ssm.us.service;

import java.util.List;

import com.yc.ssm.us.entity.B_tag;

public interface B_tagService {
	List<B_tag> findALlTags();

	boolean findTag(String tagname);

	boolean insertTag(String tagname);

}
