package com.yc.ssm.us.mapper;

import com.yc.ssm.us.entity.PaginationBean;

import java.util.List;

import com.yc.ssm.us.entity.B_user;

public interface B_userMapper {
	B_user userLogin(B_user b_user);// 用户登录

	PaginationBean<B_user> partUser(PaginationBean<B_user> pb);// 分页

	int updateUser(B_user b_user);// 更新用户信息
	//注册用户
	int insertUser(B_user b_user);

	boolean findUserByUname(String uname);

	boolean findUserByUsid(int usid);
	
	/*//更改用户密码
	boolean updatePWD(String upassword,String usid);*/
	//查询所有的用户
	List<B_user> findUserAll();
	
}
