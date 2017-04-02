package com.yc.ssm.us.mapper;

import com.yc.ssm.us.entity.PaginationBean;

import java.util.List;

import com.yc.ssm.us.entity.B_user;

public interface B_userMapper {
	B_user finUser(B_user b_user);// 用户登录

	PaginationBean<B_user> partUser(PaginationBean<B_user> pb);// 分页

	int updataUser(B_user b_user);// 更新用户信息

	boolean insertUser(B_user b_user);

	boolean findUserByUname(String uname);

	boolean findUserByUsid(int usid);

	List<B_user> findUserAll();
	
}
