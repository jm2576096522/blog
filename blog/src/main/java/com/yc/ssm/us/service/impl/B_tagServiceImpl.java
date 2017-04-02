package com.yc.ssm.us.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.ssm.us.entity.B_tag;
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
	public boolean insertTag(String tagname) {
		return b_tagMapper.insertTag(tagname);
	}

	@Override
	public List<B_tag> findALlTags() {
		return b_tagMapper.findALlTags();
	}
}
