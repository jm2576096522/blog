package com.yc.ssm.us.handler;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yc.ssm.us.entity.B_column;
import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.service.B_columnService;
import com.yc.ssm.us.util.ServletUtil;

@Controller
@RequestMapping("column")
public class B_columnHandler {
	public B_columnHandler() {
		LogManager.getLogger().debug("我进入了columnHandler");
	}

	@Autowired
	private B_columnService columnService;

	// 分页显示板块
	@RequestMapping(value = "list", method = RequestMethod.POST)
	@ResponseBody
	public PaginationBean<B_column> list(String rows, String page) {
		System.out.println("list:row==>" + rows + ",page==>" + page);
		return columnService.partColumn(page, rows);// 异步数据响应
	}

	//添加板块
	@RequestMapping(value="add",method = RequestMethod.POST)
	@ResponseBody
	public int addColumn(@RequestParam("picData") MultipartFile picData, B_column b_column) {
		System.out.println("add:b_column==>" + b_column);
		String picPath = null;
		if (picData != null && !picData.isEmpty()) {// 判断是否有文件上传
			try {
				picData.transferTo(ServletUtil.getUploadFile(picData.getOriginalFilename()));
				picPath = ServletUtil.VIRTUAL_UPLOAD_DIR + picData.getOriginalFilename();
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		b_column.setCopic(picPath);
		System.out.println("上传图片==》b_column:" + b_column);
		return columnService.addColumn(b_column);// 异步数据响应
	}


	// 删除板块
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public int deleteColumn(String coid) {
		LogManager.getLogger().debug("我是delete Column的处理");
		return columnService.deleteColumn(coid);
	}

	//添加板块
	@RequestMapping(value="addColumn",method = RequestMethod.POST)
	@ResponseBody
	public boolean addColumnByUsid(@RequestParam("upicData") MultipartFile upicData, B_column b_column,HttpSession session) {
		B_user currUser = (B_user) session.getAttribute("loginUser");
		Integer usid = currUser.getUsid();

		String picPath = null;
		if (upicData != null && !upicData.isEmpty()) {// 判断是否有文件上传
			try {
				upicData.transferTo(ServletUtil.getUploadFile(upicData.getOriginalFilename()));
				picPath = ServletUtil.VIRTUAL_UPLOAD_DIR + upicData.getOriginalFilename();
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		b_column.setCopic(picPath);
		b_column.setUsid(usid);
		return columnService.addColumnByUsid(b_column)>0;
	}

	//查询个人模板
	@RequestMapping(value="findColumnByUsid",method = RequestMethod.POST)
	@ResponseBody
	public List<B_column> findColumnByUsid(B_column b_column,HttpSession session){
		B_user currUser = (B_user) session.getAttribute("loginUser");
		Integer usid = currUser.getUsid();
		b_column.setUsid(usid);
		return columnService.findColumnByUsid(b_column);
	}
	
	//删除个人板块
	@RequestMapping(value="deleteColumnByCoid",method = RequestMethod.POST)
	@ResponseBody
	public boolean deleteColumnByCoid(Integer coid){
		return columnService.deleteColumnByCoid(coid) > 0;
	}


}
