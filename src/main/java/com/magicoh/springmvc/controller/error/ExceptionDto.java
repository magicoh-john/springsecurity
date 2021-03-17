package com.magicoh.springmvc.controller.error;

/**
 * Exception 처리를 위한 클래스
 * @author Administrator
 *
 */
public class ExceptionDto {
    private String msg;
    private String cause;
    private ExceptionType type;
    public ExceptionDto(String msg, String cause, ExceptionType type) {
        super();
        this.msg = msg;
        this.cause = cause;
        this.type = type;
    }

    @Override
    public String toString() {
        return msg + ", " + type.getTitle() + ": " + cause;
    }

    public String getMsg() {
        return msg;
    }

    public String getCause() {
        return cause;
    }

    public ExceptionType getType() {
        return type;
    }
}