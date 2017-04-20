package com.yc.ssm.us.service;

import java.util.List;

import com.yc.ssm.us.entity.B_column;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_columnService {
	// 分页查询板块
	PaginationBean<B_column> partColumn(String page, String rows);

	// 添加板块
	int addColumn(B_column b_column);

	// 删除板块
	int deleteColumn(String coid);

	// 查询所有板块
	List<B_column> findColumnAll();

	// 通过板块名查询板块文章id
	String findCoaidByCotitle(String cotitle);

}
