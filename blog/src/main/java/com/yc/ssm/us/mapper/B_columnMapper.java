package com.yc.ssm.us.mapper;

import java.util.List;

import com.yc.ssm.us.entity.B_column;
import com.yc.ssm.us.entity.PaginationBean;

public interface B_columnMapper {
	
	//分页显示板块信息
	PaginationBean<B_column> partColumn(PaginationBean<B_column> pb);
	
	//添加板块
	int addColumn(B_column b_column);
	
	//删除板块
	int deleteColumn(String coid);
	
	//查询所有板块
	List<B_column> findColumnAll();
	
	//通过板块标题查询板块所有文章id
	String findCoaidByCotitle(String cotitle);
	
	//添加个人板块
	int addColumnByUsid(B_column b_column);
	
	//查询个人模板
	List<B_column> findColumnByUsid(B_column b_column);
	
	//删除个人板块
	int deleteColumnByCoid(Integer coid);
}
