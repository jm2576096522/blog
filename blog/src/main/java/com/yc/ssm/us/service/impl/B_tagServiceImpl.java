package com.yc.ssm.us.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.ssm.us.entity.B_tag;
import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.mapper.B_tagMapper;
import com.yc.ssm.us.service.B_tagService;

/*@Component//一般bean
@Controller//控制分发层的bean
@Repository//数据访问层bean
*/
@Service("b_tagService") // 业务处理层 相当于配置中的 <bean id="userService"
							// class="com.yc.mybatis.us.service.impl.UserServiceImpl">
public class B_tagServiceImpl implements B_tagService {
	@Autowired // 相当于spring.xml中的<property name="userMapper" ref="userMapper" />
	private B_tagMapper b_tagMapper;

	@Override
	public boolean findTag(String tagname) {
		return b_tagMapper.findTag(tagname);
	}

	@Override
	public int insertTag(B_tag b_tag) {
		return b_tagMapper.insertTag(b_tag);
	}

	@Override
	public List<B_tag> findALlTags() {
		return b_tagMapper.findALlTags();
	}


	@Override
	public boolean modifyTag(B_tag b_tag) {
		return b_tagMapper.modifyTag(b_tag);
	}

	@Override
	public PaginationBean<B_tag> partTag(String page, String rows) {
		PaginationBean<B_tag> pb = new PaginationBean<>();
		if (page != null) {
			pb.setCurrPage(Integer.parseInt(page));
		}
		if (rows != null) {
			pb.setPageSize(Integer.parseInt(rows));
		}
		pb = b_tagMapper.partTag(pb);
		return pb;
	}

	@Override
	public int deleteTag(String tagid) {
		int tagid1=Integer.parseInt(tagid);
		return b_tagMapper.deleteTag(tagid1);
	}
}
