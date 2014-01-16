package mx.com.prosa.app.mail.beans;

/**
 * 
 * @author carlos
 *
 */
public class PayloadMessage {
	String sender;
	
	String message;
	
	EmailContentType emailContentType;

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public EmailContentType getEmailContentType() {
		return emailContentType;
	}

	public void setEmailContentType(EmailContentType emailContentType) {
		this.emailContentType = emailContentType;
	}
	
	
}
