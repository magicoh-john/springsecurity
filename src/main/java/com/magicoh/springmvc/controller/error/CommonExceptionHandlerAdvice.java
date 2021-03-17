package com.magicoh.springmvc.controller.error;

import java.nio.file.AccessDeniedException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
//@Order(Ordered.LOWEST_PRECEDENCE)	//두 개 중에서 우선 순서 정하기
/**
 * [예외 처리 전용 컨트롤러]
 * @ControllerAdvice : @Controller를 포함한 전역에서 발생한 예외를 공통으로 처리하는 클래스
 * @ControllerAdvice : @Contro와 마찬가지로 component-scan 되면서 자동으로 Bean으로 생성된다.
 * @ControllerAdvice 를 통해서 예외를 처리하는 방법과 스프링 AOP를 통해서 처리하는 방법 두가지 혼용되어 있음.
 * 위의 두 가지 방법 중에서 한 가지를 선택해서 해야될 듯. 그리고 Ajax Call에 대한 예외 처리는 구현되어 있지 않음.
 * component-scan 해서 Bean 으로 생성되어야 함.
 * @ExceptionHandler 는 @Controller, @RestController가 적용된 Bean내에서 발생하는 예외를 잡아서 하나의 메서드에서 처리
 * @author Administrator
 *
 */
public class CommonExceptionHandlerAdvice {
	
	/**
	 * @ExceptionHandler 
	 * Exception 예외 처리 메서드
	 * @param e
	 * @param model
	 * @return /error/exception
	 */
	@ExceptionHandler(Exception.class)
	public String exception(Exception ex, Model model, HttpServletRequest req) {
		log.error("CommonExceptionAdvice Exception()에서 예외 Catch Exception........" + ex.getMessage());
		model.addAttribute("exception", ex);
		log.error(model);
		return "/error/exception";
	}
	
	/**
	 * SQLException 예외처리 메서드
	 * @param ex
	 * @param model
	 * @param req
	 * @return
	 */
	@ExceptionHandler(SQLException.class)
	public String sqlException(Exception ex, Model model, HttpServletRequest req) {
		log.error("CommonExceptionAdvice SQLException()에서 예외 Catch Exception........" + ex.getMessage());
		model.addAttribute("exception", ex);
		log.error(model);
		return "/error/exception";
	}
	
	/**
	 * RuntimeException 예외 처리 메서드
	 * @param e
	 * @param model
	 * @return
	 */
	@ExceptionHandler(RuntimeException.class)
	public String errorException(Exception ex, Model model) {
		log.error("CommonExceptionAdvice >>>>>>>>> RuntimeException........" + ex.getMessage());
		model.addAttribute("exception", ex);
		log.error(model);
		return "/error/exception";
	}
	
	/**
	 * NullPointerException 예외 처리 메서드
	 * @param e
	 * @param model
	 * @return
	 */
	@ExceptionHandler(NullPointerException.class)
	public String nullPointerException(NullPointerException ex, Model model) {
		log.error("CommonExceptionAdvice >>>>>>>>> nullPointerException........" + ex.getMessage());
		model.addAttribute("exception", ex);
		log.error(model);
		return "/error/exception";
	}
	
	/*
	
	
	@ExceptionHandler({NoHandlerFoundException.class}) 
	@ResponseStatus(code = HttpStatus.NOT_FOUND) 
	public String handleNoHandlerFoundException(NoHandlerFoundException ex, Model model) { 
		model.addAttribute("exception", ex);
		return "/error/custom404";
	}
	*/
	
	 //일반적인 응답이 아닌 Rest와 같은 Ajax call에 대한 예외처리 핸들링 메소드인가???
//    @ExceptionHandler({RuntimeException.class})
//    public ResponseEntity<Object> BadRequestException(final RuntimeException ex) {
//        log.warn("error", ex);
//        return ResponseEntity.badRequest().body(ex.getMessage());
//    }

    // 401
//    @ExceptionHandler({ AccessDeniedException.class })
//    public ResponseEntity handleAccessDeniedException(final AccessDeniedException ex) {
//        log.warn("error", ex);
//        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(ex.getMessage());
//    }

    // 500
//    @ExceptionHandler({ Exception.class })
//    public ResponseEntity<Object> handleAll(final Exception ex) {
//        log.info(ex.getClass().getName());
//        log.error("error", ex);
//        return new ResponseEntity<>(ex.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
//    }

    /**
     * @ModelAttribut 으로 binding error 발생시 BindException 발생한다.
     * ref https://docs.spring.io/spring/docs/current/spring-framework-reference/web.html#mvc-ann-modelattrib-method-args
     */
//    @ExceptionHandler(BindException.class)
//    protected ResponseEntity<ErrorResponse> handleBindException(BindException e) {
//        log.error("handleBindException", e);
//        final ErrorResponse response = ErrorResponse.of(ErrorCode.INVALID_INPUT_VALUE, e.getBindingResult());
//        return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
//    }

}
