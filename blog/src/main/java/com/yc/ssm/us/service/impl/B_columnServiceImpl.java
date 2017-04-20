package com.yc.ssm.us.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.entity.B_column;
import com.yc.ssm.us.mapper.B_columnMapper;
import com.yc.ssm.us.service.B_columnService;

@Service("b_columnService")
public class B_columnServiceImpl implements B_columnService {
	@Autowired 
	private B_columnMapper b_columnMapper;

	@Override
	public PaginationBean<B_column> partColumn(String page, String rows) {
		PaginationBean<B_column> pb = new PaginationBean<>();
		if (page != null) {
			pb.setCurrPage(Integer.parseInt(page));
		}
		if (rows != null) {
			pb.setPageSize(Integer.parseInt(rows));
		}
		pb=b_columnMapper.partColumn(pb);
		return pb;
	}

	@Override
	public int addColumn(B_column b_column) {
		return b_columnMapper.addColumn(b_column);
	}

	@Override
	public int deleteColumn(String coid) {
		return b_columnMapper.deleteColumn(coid);
	}

	@Override
	public List<B_column> findColumnAll() {
		return b_columnMapper.findColumnAll();
	}

	@Override
	public String findCoaidByCotitle(String cotitle) {
		return b_columnMapper.findCoaidByCotitle(cotitle);
	}
	
	
}
