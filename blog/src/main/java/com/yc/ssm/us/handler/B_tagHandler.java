package com.yc.ssm.us.handler;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.ssm.us.entity.B_tag;
import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.service.B_tagService;

@Controller
@RequestMapping("tag")
public class B_tagHandler {
	public B_tagHandler() {
		LogManager.getLogger().debug("我进入了B_tagHandler");
	}

	@Autowired
	private B_tagService b_tagService;

	// 分页显示标签
	@RequestMapping(value = "list", method = RequestMethod.POST)
	@ResponseBody
	public PaginationBean<B_tag> list(String rows, String page) {
		LogManager.getLogger().debug("list:row==>" + rows + ",page==>" + page);
		return b_tagService.partTag(page, rows);// 异步数据响应
	}

	// 修改标签
	@RequestMapping("modify")
	@ResponseBody
	public boolean modify(B_tag b_tag) {
		LogManager.getLogger().debug("modify:b_tag==>" + b_tag);
		return b_tagService.modifyTag(b_tag);// 异步数据响应
	}

	// 添加标签
	@RequestMapping(value = "add", method = RequestMethod.POST)
	@ResponseBody
	public int insertTag(B_tag b_tag) {
		LogManager.getLogger().debug("我是add tag的处理");
		return b_tagService.insertTag(b_tag);
	}

	// 删除标签
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public int deleteTag(String tagid) {
		LogManager.getLogger().debug("我是delete type的处理");
		return b_tagService.deleteTag(tagid);
	}
	//结合文章表（返回所引用对应类别的文章数）查询所有的标签
	@RequestMapping("findAll")
	@ResponseBody
	public List<B_tag> findAll(){
		LogManager.getLogger().debug("结合文章表查询所有的标签的处理");
		return b_tagService.findAll();
	}

}
