package com.jewelry.exception;


public class CustomException extends RuntimeException {
	
	private final ErrorCode errorCode;

	public CustomException(ErrorCode errorCode) {
		super();
		this.errorCode = errorCode;
	}

	public ErrorCode getErrorCode() {
		return errorCode;
	}
	
}
