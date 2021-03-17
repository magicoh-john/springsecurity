package com.magicoh.springmvc.service.aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
/**
 * 포인트컷 재사용을 위한 독립된 포인트컷 클래스
 * @author Administrator
 *
 */
public class CommonPointcut {
	
	//전체 Impl 클래스에 적용될 포인트컷
	@Pointcut("execution(* com.magicoh.springmvc.service..*Impl.*(..))")
	public void allPointcut(){}
	
	//전체 Impl 클래스의 get으로 시작하는 이름의 메소드에만 적용될 포인트컷
	@Pointcut("execution(* com.magicoh.springmvc.service..*Impl.get*(..))")
	public void getPointcut(){}

}
