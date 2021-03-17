package com.magicoh.springmvc.controller.error;

/**
 * Exception Type을 정의하기 위한 클래스
 * @author Administrator
 *
 */
public enum ExceptionType {
    SQL("Code"), SERVER("Exception");
    final private String title;

    private ExceptionType(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }
}