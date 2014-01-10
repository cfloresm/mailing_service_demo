package mx.com.prosa.app.mail.exceptions;

public class NotificationServiceException extends Exception {

	/**
	 * Serial UID for class
	 */
	private static final long serialVersionUID = 1913332207402460376L;
	
	/**
	 * Error code
	 */
	private int code;
	
	/**
	 * Error message
	 */
	private String message;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	

}
