package com.jewelry.response;

import org.springframework.http.HttpStatus;

public class ErrorResponse extends BasicResponse {

	private HttpStatus status;
	private String message;
	
	
	public ErrorResponse(HttpStatus status) {
		this.status = status;
	}

	public ErrorResponse(HttpStatus status, String message) {
		this.status = status;
		this.message = message;
	}
	
	public HttpStatus getStatus() {
		return status;
	}
	
	public void setStatus(HttpStatus status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	
}
