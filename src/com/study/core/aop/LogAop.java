package com.study.core.aop;

import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class LogAop {
	
	@AfterThrowing(pointcut="execution(* com.study.core.controller.*.*.*(*))", throwing="ex")
	public void errorLog(Throwable ex) {
		System.out.println("123456" + ex.toString());
	}
}
