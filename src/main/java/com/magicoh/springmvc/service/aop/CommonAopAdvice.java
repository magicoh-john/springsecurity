package com.magicoh.springmvc.service.aop;

import java.sql.SQLDataException;
import java.sql.SQLException;
import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;
import com.magicoh.springmvc.dto.User;
import lombok.extern.slf4j.Slf4j;

/**
 * @Service 빈 생성
 * @Aspect : Spring AOP 관리/적용 클래스(application-context.xml에서 설정 안해서 @Aspect 붙여줌.)
 * @author Administrator
 *
 */

@Service
@Aspect
@Slf4j
public class CommonAopAdvice {

	public CommonAopAdvice() {
	}

	/**
	 * 포인트 컷은 CommonPointcut으로 분리시킴
	 */
	
	/**
	 * [어드바이스 - Before] 포인트컷 메소드 수행전 의무 실행 어드바이스
	 * @param jp
	 */
	@Before("CommonPointcut.allPointcut()")
	public void beforeLog(JoinPoint jp){
		String method = jp.getSignature().getName();
		Object[] args = jp.getArgs();
		//log.info("[어드바이스 - 사전처리] " + method + "() 메소드 인자 정보 : " + args[0].toString());
		log.info("[어드바이스 - 사전처리] SpringSecurityAdvice" + "() 메소드명과 인자정보 : " + method + " " + Arrays.toString(jp.getArgs()));
	}
	
	/**
	 * [어드바이스 - AfterThrowing] 포인트컷 메소드 수행중 예외 발생시 실행될 어드바이스
	 * @param joinPoint
	 * @param exceptObj
	 */
	@AfterThrowing(pointcut="CommonPointcut.allPointcut()", throwing="exceptObj")
	public void exceptionLog(JoinPoint joinPoint, Exception exceptObj){
		
		Signature signature = joinPoint.getSignature();
		String methodName = signature.getName();
		String stuff = signature.toString();
		String arguments = Arrays.toString(joinPoint.getArgs());
		
		log.error("[SpringSecurityAdvice - 수행중예외] exceptObj.getMessage() : " + exceptObj.getMessage());
		
		if(exceptObj instanceof IllegalArgumentException){
			log.error("[SpringSecurityAdvice - 수행중예외]  >> IllegalArgumentException " + " 부적합한 값이 입력되었습니다. 예외발생 메소드명 : " + methodName);
		}else if(exceptObj instanceof NumberFormatException){
			log.error("[SpringSecurityAdvice - 수행중예외]  >> NumberFormatException " + " 숫자 형식의 값이 아닙니다. 예외발생 메소드명 : " + methodName);
		}else if(exceptObj instanceof SQLDataException){
			log.error("[SpringSecurityAdvice - 수행중예외]  >> SQLDataException " + " SQL 문제가 발생했습니다. exceptObj.toString() : " + exceptObj.toString() + " 예외발생 메소드명 : " + methodName);
		}else if(exceptObj instanceof SQLException){
			log.error("[SpringSecurityAdvice - 수행중예외]  >> SQLException " + " SQL 문제가 발생했습니다. exceptObj.toString() : " + exceptObj.toString() + " 예외발생 메소드명 : " + methodName);
		}else if(exceptObj instanceof RuntimeException){
			log.error("[SpringSecurityAdvice - 수행중예외]  >> RuntimeException " + "문제가 발생했습니다. exceptObj.toString() : " + exceptObj.toString() +  " 예외발생 메소드명 : " + methodName);
		}else if(exceptObj instanceof Exception){
		log.error("[SpringSecurityAdvice - 수행중예외]  >> Exception " + "문제가 발생했습니다. exceptObj.toString() : " + exceptObj.toString() +  " 예외발생 메소드명 : " + methodName);
	}
	}
	
	/**
	 * [어드바이스 - AfterReturning] 포인트컷 메소드 정상 리턴된 후에 실행될 어드바이스
	 * @param jp
	 * @param returnObj
	 */
	@AfterReturning(pointcut="CommonPointcut.getPointcut()", returning="returnObj")
	public void afterLog(JoinPoint jp, Object returnObj){
		String method = jp.getSignature().getName();
		
		if(returnObj instanceof User){
			User user = (User) returnObj;
			if(user.getRole_id().equals("Admin")){
				log.info(user.getRole_id() + "로그인(Admin)");
			}
		}
		
		//log.info("[어드바이스 - 정상사후처리]" + method + "() 메소드 리턴값 : " + returnObj.toString());
	}
	
	
	/**
	 * [어드바이스 - After] 포인트컷 메소드 수행 후 무조건 실행될 어드바이스
	 */
	@After("CommonPointcut.allPointcut()")
	public void finallyLog(){
		log.info("[어드바이스 - 무조건사후처리] 비즈니스 로직 수행 후 무조건 동작");
	}
	
	/**
	 * [어드바이스 - Around] 포인트컷 메소드 수행 전후에 무조건 실행될 어드바이스
	 * @param pjp
	 * @return
	 * @throws Throwable
	 */
	@Around("CommonPointcut.allPointcut()")
	public Object aroundLog(ProceedingJoinPoint pjp) throws Throwable{
		String method = pjp.getSignature().getName();
		
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		Object obj = pjp.proceed();
		
		stopWatch.stop();
		System.out.println("[어드바이스 - 전후처리]" + method + "() 메소드 수행 시간 : " + stopWatch.getTotalTimeMillis() + "(ms)초");
		
		return obj;
	}
	
}
