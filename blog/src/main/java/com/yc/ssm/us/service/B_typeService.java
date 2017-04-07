package com.yc.ssm.us.service;

import com.yc.ssm.us.entity.B_type;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_typeService {
	// 分页显示文章类型
	PaginationBean<B_type> partType(String page, String rows);

	// 修改文章类型
	boolean modifyType(B_type b_type);

	// 插入文章类型
	int insertType(B_type b_type);

}
