package com.magicoh.springmvc.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

//@Service
//@Aspect
public class LogAdvice {
	@Pointcut("execution(* com.magicoh.biz..*Impl.*(..))")
	public void allPointcut(){}
	
	@Pointcut("execution(* com.magicoh.biz..*Impl.get*(..))")
	public void getPointcut(){}
	
	@Before("allPointcut()")
	public void printLog(){
	System.out.println("공통로그 - 비즈니스 로직 수행 ");
}
	
//	public LogAdvice() {
//	}
//
//	//공통관심 메소드(Advice)
//	public void printLog(){
//		System.out.println("공통로그 - 비즈니스 로직 수행 ");
//	}
}
