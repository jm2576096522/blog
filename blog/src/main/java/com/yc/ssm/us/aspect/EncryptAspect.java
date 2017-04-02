package com.yc.ssm.us.aspect;

import org.apache.logging.log4j.LogManager;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import com.yc.ssm.us.entity.B_user;
import com.yc.ssm.us.util.Encrypt;

@Component("encryptAspect")
@Aspect
public class EncryptAspect {
	@Before("execution ( * com.yc.ssm.us.service.impl.B_userServiceImpl.login(com.yc.ssm.us.entity.B_user))") // com.yc.ssm.us.entity.B_user
	public void beforeLoginMethod(JoinPoint joinPoint) {
		LogManager.getLogger().debug("--------前置Login：EncryptAspect---------");
		B_user b_user = (B_user) joinPoint.getArgs()[0];
		LogManager.getLogger().debug("对密码加密前==》" + b_user);
		b_user.setUpassword(Encrypt.md5AndSha(b_user.getUpassword()));
		LogManager.getLogger().debug("对密码加密后==》" + b_user);
	}

	@Before("execution ( * com.yc.ssm.us.service.impl.B_userServiceImpl.insertUser(com.yc.ssm.us.entity.B_user))") // 指定链接点和切点
	public void beforeinsertUserMethod(JoinPoint joinPoint) {
		LogManager.getLogger().debug("--------前置insertUser：EncryptAspect---------");
		B_user b_user = (B_user) joinPoint.getArgs()[0];
		LogManager.getLogger().debug("对密码加密前==》" + b_user);
		b_user.setUpassword(Encrypt.md5AndSha(b_user.getUpassword()));
		LogManager.getLogger().debug("对密码加密后==》" + b_user);
	}

	@Before("execution ( * com.yc.ssm.us.service.impl.B_userServiceImpl.modifyUser(com.yc.ssm.us.entity.B_user))") // 指定链接点和切点
	public void beforemodifyUserMethod(JoinPoint joinPoint) {
		LogManager.getLogger().debug("--------前置modifyUser：EncryptAspect---------");
		B_user b_user = (B_user) joinPoint.getArgs()[0];
		LogManager.getLogger().debug("对密码加密前==》" + b_user);
		b_user.setUpassword(Encrypt.md5AndSha(b_user.getUpassword()));
		LogManager.getLogger().debug("对密码加密后==》" + b_user);
	}
}
