package com.magicoh.springmvc.service.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Service;

//@Service
//@Aspect
public class BeforeAdvice {

	public BeforeAdvice() {
	}
	
//	@Pointcut("execution(* com.magicoh.biz..*Impl.*(..))")
//	public void allPointcut(){}
	
	//PointCutCommon Ŭ������ �ִ� allPointCut ����Ʈ�� �޼ҵ带 ����ϰڴ�.
	@Before("PointCutCommon.allPointcut()")
	public void beforeLog(JoinPoint jp){
		String method = jp.getSignature().getName();
		Object[] args = jp.getArgs();
		
		System.out.println("����ó�� " + method + "() �޼ҵ� Args ���� : " + args[0].toString());
	}

}
