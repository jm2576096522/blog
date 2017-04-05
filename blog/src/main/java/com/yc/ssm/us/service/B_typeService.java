package com.yc.ssm.us.service;

import com.yc.ssm.us.entity.B_type;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_typeService {

	PaginationBean<B_type> partType(String page, String rows);

	boolean modifyType(B_type b_type);

	int insertType(B_type b_type);

}
