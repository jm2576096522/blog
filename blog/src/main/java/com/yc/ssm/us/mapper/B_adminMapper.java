package com.yc.ssm.us.mapper;

import com.yc.ssm.us.entity.B_admin;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_adminMapper {

	B_admin finUser(B_admin b_admin);

	void partUser(PaginationBean<B_admin> pb);

	int modifyUser(B_admin b_admin);
	
}
