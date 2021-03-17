package com.magicoh.springmvc.service.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Pointcut;


public class AfterThrowingAdvice {

//	@Pointcut("execution(* com.magicoh.biz..*Impl.*(..))")
//	public void allPointcut(){}
//	
//	@AfterThrowing(pointcut="allPointcut()", throwing="exceptObj")
//	public void exceptionLog(JoinPoint jp, Exception exceptObj){
//		String method = jp.getSignature().getName();
//		System.out.println(method + "() �޼ҵ� ���� �� ���� �߻�");
//		if(exceptObj instanceof IllegalArgumentException){
//			System.out.println("�������� ���� �ԷµǾ����ϴ�.");
//		}else if(exceptObj instanceof NumberFormatException){
//			System.out.println("���� ������ ���� �ƴմϴ�.");
//		}else if(exceptObj instanceof Exception){
//			System.out.println("������ �߻��߽��ϴ�.");
//		}
//	}

}
