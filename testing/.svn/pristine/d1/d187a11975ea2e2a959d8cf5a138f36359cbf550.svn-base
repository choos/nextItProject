package com.zero.common.exception;

public class BizDuplicateException extends BizException{


	private static final long serialVersionUID = -8432193029470866048L;
	
	private String key;
	
	
	

	public BizDuplicateException() {
		super();
	}
	
	public BizDuplicateException(String message, String key) {
		super(message + ", Key:" + key);
		this.key =key;
	}

	public BizDuplicateException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public BizDuplicateException(String message, Throwable cause) {
		super(message, cause);
	}

	public BizDuplicateException(String message) {
		super(message);
	}

	public BizDuplicateException(Throwable cause) {
		super(cause);
	}
	
	
	public String getKey() {
		return key;
	}
	
	public void setKey(String key) {
		this.key = key;
	}
}
