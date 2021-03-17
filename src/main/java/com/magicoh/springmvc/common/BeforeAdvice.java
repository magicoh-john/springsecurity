package com.magicoh.springmvc.common;

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
	
	//PointCutCommon 클래스에 있는 allPointCut 포인트컷 메소드를 사용하겠다.
	@Before("PointCutCommon.allPointcut()")
	public void beforeLog(JoinPoint jp){
		String method = jp.getSignature().getName();
		Object[] args = jp.getArgs();
		
		System.out.println("사전처리 " + method + "() 메소드 Args 정보 : " + args[0].toString());
	}

}
