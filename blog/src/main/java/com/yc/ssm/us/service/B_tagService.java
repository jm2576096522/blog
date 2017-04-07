package com.yc.ssm.us.service;

import java.util.List;

import com.yc.ssm.us.entity.B_tag;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_tagService {
	// 查询所有标签
	List<B_tag> findALlTags();

	// 通过标签名查询是否存在标签
	boolean findTag(String tagname);

	// 插入标签
	boolean insertTag(B_tag b_tag);

	// 修改标签
	boolean modifyTag(B_tag b_tag);

	// 分页显示标签
	PaginationBean<B_tag> partTag(String page, String rows);

	int deleteTag(String tagid);

}
