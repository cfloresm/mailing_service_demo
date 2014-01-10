package mx.com.prosa.app.mail.beans;

import java.util.List;

public class NotificationTarget {

	Message message;
	EmailContentType emailContentType;
	List<String> recipients;
     
	public List<String> getRecipients() {
		return recipients;
	}
	public void setRecipients(List<String> recipients) {
		this.recipients = recipients;
	}
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public EmailContentType getEmailContentType() {
		return emailContentType;
	}
	public void setEmailContentType(EmailContentType emailContentType) {
		this.emailContentType = emailContentType;
	}
}
