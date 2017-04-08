package com.yc.ssm.us.mapper;

import java.util.List;

import com.yc.ssm.us.entity.B_tag;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_tagMapper {
	//查询所有的类别标签
	List<B_tag> findALlTags();
	
	//结合文章表（返回所引用对应类别的文章数）查询所有的标签
	List<B_tag> findAll();
		
	boolean findTag(String tagname);

	//添加类别标签
	int insertTag(B_tag b_tag);

	boolean modifyTag(B_tag b_tag);

	PaginationBean<B_tag> partTag(PaginationBean<B_tag> pb);

	int deleteTag(int tagid);

}
