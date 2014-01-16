package mx.com.prosa.app.mail.beans;

import java.util.List;

/**
 * 
 * @author carlos
 *
 */
public class PayloadMessage {
	List<String> recipients;
	
	String  subject;
	
	String message;
	
	EmailContentType emailContentType;


	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public List<String> getRecipients() {
		return recipients;
	}

	public void setRecipients(List<String> recipients) {
		this.recipients = recipients;
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
