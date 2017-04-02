package com.yc.ssm.us.mapper;

import java.util.List;

import com.yc.ssm.us.entity.B_tag;

public interface B_tagMapper {
	List<B_tag> findALlTags();

	boolean findTag(String tagname);

	boolean insertTag(String tagname);

}
