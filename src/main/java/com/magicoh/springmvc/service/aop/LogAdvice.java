package com.magicoh.springmvc.service.aop;

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
	System.out.println("����α� - ����Ͻ� ���� ���� ");
}
	
//	public LogAdvice() {
//	}
//
//	//������� �޼ҵ�(Advice)
//	public void printLog(){
//		System.out.println("����α� - ����Ͻ� ���� ���� ");
//	}
}
