package com.yc.ssm.us.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.ssm.us.entity.B_comment;
import com.yc.ssm.us.mapper.B_commentMapper;
import com.yc.ssm.us.service.B_commentService;
import com.yc.ssm.us.service.B_userService;

@Service("b_commentService") // 业务处理层 相当于配置中的 <bean id="userService"
								// class="com.yc.mybatis.us.service.impl.UserServiceImpl">
public class B_commentServiceImpl implements B_commentService {
	@Autowired // 相当于spring.xml中的<property name="userMapper" ref="userMapper" />
	private B_commentMapper b_commentMapper;

	@Autowired // 相当于spring.xml中的<property name="userMapper" ref="userMapper" />
	private B_userService b_userService;

	@Override
	public List<B_comment> listComment(int caid) {
		return b_commentMapper.listComment(caid);
	}

	@Override
	public boolean addComment(B_comment b_comment) {
		int usid = b_comment.getUsid();
		if (!b_userService.findUserByUsid(usid)) {
			// 注册
			// b_userService.insertUser(b_user);
		}
		return b_commentMapper.addComment(b_comment);
	}

}
