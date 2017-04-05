package com.yc.ssm.us.mapper;


import com.yc.ssm.us.entity.B_type;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_typeMapper {

	PaginationBean<B_type> partType(PaginationBean<B_type> pb);

	int modifyType(B_type b_type);

	int insertType(B_type b_type);

}
