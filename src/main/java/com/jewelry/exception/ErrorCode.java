package com.jewelry.exception;

import org.springframework.http.HttpStatus;

public enum ErrorCode {

	SUCCESS(HttpStatus.OK, "정상처리되었습니다."),
    FAIL(HttpStatus.INTERNAL_SERVER_ERROR, "처리 중 오류가 발생하였습니다."),

	/*
     * 400 BAD_REQUEST: 잘못된 요청
     */
    BAD_REQUEST(HttpStatus.BAD_REQUEST, "잘못된 요청입니다."),

    /*
     * 404 NOT_FOUND: 리소스를 찾을 수 없음
     */
    POSTS_NOT_FOUND(HttpStatus.NOT_FOUND, "게시글 정보를 찾을 수 없습니다."),

    /*
     * 405 METHOD_NOT_ALLOWED: 허용되지 않은 Request Method 호출
     */
    METHOD_NOT_ALLOWED(HttpStatus.METHOD_NOT_ALLOWED, "허용되지 않은 메서드입니다."),

    /*
     * 500 INTERNAL_SERVER_ERROR: 내부 서버 오류
     */
    INTERNAL_SERVER_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "내부 서버 오류입니다."),
    
    /**
     * 주문 관련 오류 코드
     */
    ORDERS_NOT_SELECTED(HttpStatus.BAD_REQUEST, "선택된 주문 이력이 없습니다."),
    ORDERS_NO_CUSTOMERS(HttpStatus.BAD_REQUEST, "고객정보가 없는 주문이력이 있습니다.")
    ;
	
	/*
	 * HTTP 상태 코드를 상수로 선언해둔 HttpStatus 타입 멤버로,
	 * 예외에 대한 상태 코드(status)와 이름(error)를 처리하는데 사용한다.
	 */
    private final HttpStatus status;
    
    /*
     * 에외에 대한 응답 메세지(message)를 처리하는데 사용되는 멤버
     */
    private final String message;

	private ErrorCode(HttpStatus status, String message) {
		this.status = status;
		this.message = message;
	}

	public HttpStatus getStatus() {
		return status;
	}

	public String getMessage() {
		return message;
	}
    
    
}
