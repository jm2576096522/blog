package com.yc.ssm.us.service;

import com.yc.ssm.us.entity.B_admin;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_adminService {
		B_admin login(B_admin b_admin);

		// 分页显示员工信息

		PaginationBean<B_admin> partUser(String page, String rows);

		// 修改员工信息
		int modifyUser(B_admin b_admin);

		
	}