package com.magicoh.springmvc.common;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

//@Service
//@Aspect
public class AfterAdvice {

	//포인트컷
	@Pointcut("execution(* com.magicoh.biz..*Impl.*(..))")
	public void allPointcut(){}

	//Aspect
	@After("allPointcut()")
	public void finallyLog(){
		System.out.println("사후 처리 - 비즈니스 로직 수행 후 무조건 실행");
	}
}
