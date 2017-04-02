package com.yc.ssm.us.service;

import com.yc.ssm.us.entity.PaginationBean;

import java.util.List;

import com.yc.ssm.us.entity.B_user;

public interface B_userService {
	B_user login(B_user b_user);// 用户使用邮箱或者昵称进行登录
	
	List<B_user> findUserAll();
	// 分页显示用户信息

	PaginationBean<B_user> partUser(PaginationBean<B_user> pb);

	// 修改用户信息
	boolean modifyUser(B_user b_user);

	// 通过用户昵称查找用户
	boolean findUserByUname(String uname);

	//插入用户
	boolean insertUser(B_user b_user);
	// 通过用户id查找用户
	boolean findUserByUsid(int usid);
}
