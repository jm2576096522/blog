package com.yc.ssm.us.service.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.entity.B_article;
import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.mapper.B_articleMapper;
import com.yc.ssm.us.service.B_articleService;
import com.yc.ssm.us.service.B_tagService;
import com.yc.ssm.us.service.B_userService;

/*@Component//一般bean
@Controller//控制分发层的bean
@Repository//数据访问层bean
*/
@Service("b_articleService") // 业务处理层 相当于配置中的 <bean id="userService"
								// class="com.yc.mybatis.us.service.impl.UserServiceImpl">
public class B_articleServiceImpl implements B_articleService {
	@Autowired // 相当于spring.xml中的<property name="userMapper" ref="userMapper" />
	private B_articleMapper b_articleMapper;

	@Autowired // 相当于spring.xml中的<property name="userMapper" ref="userMapper" />
	private B_tagService b_tagService;
	@Autowired // 相当于spring.xml中的<property name="userMapper" ref="userMapper" />
	private B_userService b_userService;

	@Override
	public List<B_article> listArticles(String tagname) {
		// 通过标签名查询博客文章
		return b_articleMapper.listArticles(tagname);
	}

	@Override
	public PaginationBean<B_article> partArticle(PaginationBean<B_article> pb) {

		return null;
	}

	@Override
	public int modifyArticle(B_article b_article) {
		return b_articleMapper.modifyArticle(b_article);
	}

	/*@Override
	public boolean addArticle(B_article b_article) {
		b_article.setTagname(b_article.getTagname().replace(" ", ""));// 标签去空格
		// 1.添加博客文章或者更新
		String[] tagnames = b_article.getTagname().split(",");
		for (String tagname : tagnames) {
			LogManager.getLogger().debug(tagname);
			if (!b_tagService.findTag(tagname)) {// 判断是否存在标签
				// 不存在，增加书签
				b_tagService.insertTag(tagname);
			}
		}
		return b_articleMapper.insertArticle(b_article) > 0;
	}*/

	@Override
	public List<B_article> findArticleByUname(B_user b_user) {
		String uname=b_user.getUname();
		if (!b_userService.findUserByUname(uname)) {
			//注册
			b_userService.insertUser(b_user);
		}
		return b_articleMapper.findArticle(b_user);
	}

}
