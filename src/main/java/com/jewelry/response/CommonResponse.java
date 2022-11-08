package com.jewelry.response;

import org.springframework.http.HttpStatus;

public class CommonResponse extends BasicResponse {
	

	private HttpStatus status;
	private String message;
	
	public CommonResponse(HttpStatus status, String message) {
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
