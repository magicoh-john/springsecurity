package com.magicoh.springmvc.service.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

import com.magicoh.springmvc.dto.User;



//@Service
//@Aspect
public class AfterReturningAdvice {

	public AfterReturningAdvice() {
	}
	
	@Pointcut("execution(* com.magicoh.biz..*Impl.get*(..))")
	public void getPointcut(){}
	
	@AfterReturning(pointcut="getPointcut()", returning="returnObj")
	public void afterLog(JoinPoint jp, Object returnObj){
		String method = jp.getSignature().getName();
		
		if(returnObj instanceof User){
			User user = (User) returnObj;
			if(user.getRole_id().equals("Admin")){
				System.out.println(user.getRole_id() + " �α���(Admin)");
			}
		}
		System.out.println("����ó�� " + method + "() �޼ҵ� return ���� : " + returnObj.toString());
	}

	
	public void afterLog(){
		System.out.println("����ó�� - ����Ͻ� ���� ���� �� ����");
	}

}
