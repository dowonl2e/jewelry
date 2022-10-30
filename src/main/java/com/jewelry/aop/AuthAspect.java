package com.jewelry.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Aspect
@Component
public class AuthAspect {

  @Pointcut(
		  "execution(* com.jewelry.manager..*.*Controller.*(..)) && " + 
		  "!execution(* com.ineast.manager..*.UserController.*(..))"
  )
  public void authority(JoinPoint joinPoint) throws Exception {
	  if (log.isDebugEnabled()) 
		  log.debug("[******************************관리자 권한 체크(admin auth check)***********************************");
  }
}
