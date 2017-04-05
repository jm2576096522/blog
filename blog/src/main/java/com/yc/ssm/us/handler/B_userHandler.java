package com.yc.ssm.us.handler;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.entity.PaginationBean;
import com.yc.ssm.us.service.B_userService;
import com.yc.ssm.us.util.ImageUtil;
import com.yc.ssm.us.util.ServletUtil;


@Controller
@RequestMapping("blog")
public class B_userHandler {
	public B_userHandler() {
		LogManager.getLogger().debug("我进入了userHandler");
	}
	
	@Autowired
	private B_userService userService;
	
	@RequestMapping(value="login",method = RequestMethod.POST)
	public String userLogin(B_user user,@RequestParam("yzm") String yzm,HttpServletRequest request){
		user = userService.userLogin(user);
		HttpSession session = request.getSession();
		//获取图片验证码
		String imageCode = (String) session.getAttribute("imageCode");
		System.out.println("项目发布ming:"+session.getAttribute("deployName"));
		System.out.println("user的值是："+user);
		if (user == null) {
			request.setAttribute(ServletUtil.ERROR_MESSAGE,"用户名或密码错误！！！");
			return "redirect:/login.jsp";
		} else if(imageCode.equalsIgnoreCase(yzm) == false){
			request.setAttribute(ServletUtil.ERROR_MESSAGE,"验证码错误！！！");
			return "redirect:/login.jsp";
		}else{
			session.setAttribute(ServletUtil.LOGIN_USER, user);
			System.out.println("用户session"+session.getAttribute("loginUser"));
			return "redirect:/personPage.jsp";
		}
	}
	
	//生成验证码图片
	@RequestMapping("valicode") //对应/user/valicode.do请求
	@ResponseBody
	public void valicode(HttpServletResponse response,HttpSession session) throws Exception{
		//利用图片工具生成图片
		//第一个参数是生成的验证码，第二个参数是生成的图片
		Object[] objs = ImageUtil.createImage();
		System.out.println("输出"+objs[0]);
		//将验证码存入Session
		session.setAttribute("imageCode",objs[0]);
		//将图片输出给浏览器
		BufferedImage images = (BufferedImage) objs[1];
		response.setContentType("image/png");
		OutputStream os = response.getOutputStream();
		ImageIO.write(images, "png", os);
		
	}
	//注册
	@RequestMapping(value="register",method = RequestMethod.POST)
	@ResponseBody
	public int insertUser(B_user b_user){
		LogManager.getLogger().debug("我是register的处理");
		return userService.insertUser(b_user);
	}

	@RequestMapping(value = "list", method = RequestMethod.POST)
	@ResponseBody
	public PaginationBean<B_user> list(String rows, String page) {
		System.out.println("list:row==>" + rows + ",page==>" + page);
		return userService.partUser(page, rows);// 异步数据响应
	}

	@RequestMapping("modify")
	@ResponseBody
	public boolean modify(@RequestParam("picData") MultipartFile picData, B_user user) {
		System.out.println("modify:user==>" + user);
		String picPath = null;
		if (picData != null && !picData.isEmpty()) {// 判断是否有文件上传
				try {
					picData.transferTo(ServletUtil.getUploadFile(picData.getOriginalFilename()));
					picPath = ServletUtil.VIRTUAL_UPLOAD_DIR + picData.getOriginalFilename();
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		user.setUpic(picPath);
		System.out.println("上传图片==》user:" + user);
		return userService.updateUser(user);// 异步数据响应
	}
	
	//更改用户密码
	@RequestMapping("update_pwd")
	@ResponseBody
	public boolean update_pwd(@RequestParam("upassword") String upassword, HttpSession session){
		B_user user = new B_user();
		System.out.println("upassword的值是："+upassword);
		user.setUpassword(upassword);
		B_user user1 = (B_user) session.getAttribute("loginUser");
		user.setUsid(user1.getUsid());
		System.out.println("我是更改密码的操作");
		return userService.updateUser(user);
	}
	
	//显示用户信息
	@RequestMapping("showUserInfo")
	@ResponseBody
	public B_user showUserInfo(HttpSession session){
		B_user user= (B_user) session.getAttribute("loginUser");
		return user;
	}
}
