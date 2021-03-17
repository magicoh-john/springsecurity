package com.magicoh.springmvc.service.aop;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

//@Service
//@Aspect
public class AfterAdvice {

	//����Ʈ��
	@Pointcut("execution(* com.magicoh.biz..*Impl.*(..))")
	public void allPointcut(){}

	//Aspect
	@After("allPointcut()")
	public void finallyLog(){
		System.out.println("���� ó�� - ����Ͻ� ���� ���� �� ������ ����");
	}
}
