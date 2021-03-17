package com.magicoh.springmvc.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

//@Service
//@Aspect
public class ArroundAdvice {

	//Æ÷ÀÎÆ®ÄÆ
//	@Pointcut("execution(* com.magicoh.biz..*Impl.*(..))")
//	public void allPointcut(){}
//
//	@Around("allPointcut()")
//	public Object aroundLog(ProceedingJoinPoint pjp) thorws Throwable{
//		String method = pjp.getSignature().getName();
//		
//		StopWatch stopWatch = new StopWatch();
//		stopWatch.start();
//	}
}
