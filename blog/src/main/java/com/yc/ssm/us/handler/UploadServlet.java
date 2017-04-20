package com.yc.ssm.us.handler;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.service.B_userService;
import com.yc.ssm.us.util.ServletUtil;
import com.yc.ssm.us.util.UploadUtil;

import sun.misc.BASE64Decoder;
@Controller
@SuppressWarnings({ "serial", "restriction" })
@RequestMapping("camera")
public class UploadServlet extends HttpServlet {
	
	@Autowired
	private B_userService userService;
	private PrintWriter out;

	@RequestMapping(value="add",method = RequestMethod.POST)
	@ResponseBody
	public void camere(HttpServletRequest request, HttpServletResponse response,@RequestParam("imageData") MultipartFile imageData) throws ServletException, IOException {
		try {
			out=response.getWriter();
			UploadUtil uploadUtil=new UploadUtil();
			PageContext context=JspFactory.getDefaultFactory().getPageContext(this,request,response,null,true,8192,true);

			Map<String,String> map=uploadUtil.update(context);
			BASE64Decoder base64=new BASE64Decoder(); 
			
			//64位解码  
			byte[] buffer=base64.decodeBuffer(map.get("imageData"));

			String picPath = null;
			if (imageData != null && !imageData.isEmpty()) {// 判断是否有文件上传
				try {
					imageData.transferTo(ServletUtil.getUploadFile(imageData.getOriginalFilename()));
					picPath = ServletUtil.VIRTUAL_UPLOAD_DIR + imageData.getOriginalFilename();
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			/*//写进文件  
			String filPath="../dataInfo/"+new Date().getTime()+""+new Random().nextInt(100000)+".png";
			filPath=this.getServletContext().getRealPath(filPath);*/
			FileOutputStream fos=new FileOutputStream(picPath); 
			fos.write(buffer);  
			fos.flush();  
			fos.close();  
			fos=null;  
			out.print(1);
		} catch (Exception e) {
			e.printStackTrace();
			out.print(0);
		}
		out.flush();
		out.close();
		
	}

}
