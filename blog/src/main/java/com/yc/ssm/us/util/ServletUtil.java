package com.yc.ssm.us.util;

import java.io.File;

public class ServletUtil {
	public static String  DEPLOY_NAME;//项目发布名  将发布名存到application中
	public static final String LOGIN_USER="loginUser";//登录用户  存在session中
	public static final String ERROR_MESSAGE="errorMsg";//错误信息  存在session中
	public static final String VIRTUAL_UPLOAD_DIR="/upload/";
	public static String UPLOAD_DIR;

	public static File getUploadFile(String fileName) {
		File file = new File(UPLOAD_DIR, fileName);// 上传文件
		if (!file.getParentFile().exists()) {
			file.getParentFile().mkdirs();
		}
		return file;
	}
}
