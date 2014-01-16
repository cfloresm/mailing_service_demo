package mx.com.prosa.app.mail.services.impl;


import java.util.List;

import mx.com.prosa.app.mail.beans.EmailContentType;
import mx.com.prosa.app.mail.beans.PayloadMessage;
import mx.com.prosa.app.mail.connectors.SMTPConnector;
import mx.com.prosa.app.mail.exceptions.NotificationMailServiceException;
import mx.com.prosa.app.mail.exceptions.NotificationServiceException;
import mx.com.prosa.app.mail.services.EmailService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;


/**
 * Email Service implementation for 
 * @author carlos
 *
 */
public class EmailServiceImpl  implements EmailService {

	/**
	 * smtpconnector for sendgrid
	 */
	@Autowired
	private SMTPConnector smtpConnector;

	/**
	 * Implementation for send single mail 
	 */
	@Override
	public void sendSingleMail(String subject, PayloadMessage payloadMessage)
			throws NotificationMailServiceException {
		this.sendMessage(subject, payloadMessage);
	}

	/**
	 * Implementation for send batch mail
	 */
	@Override
	public void sendBatchMail(List<String> subjects,
			PayloadMessage payloadMessage)
			throws NotificationMailServiceException {

		for(String subject: subjects){
			this.sendMessage(subject, payloadMessage);
		}
	}
	
	private void sendMessage(String subject, PayloadMessage payloadMessage)
			throws NotificationMailServiceException {
		if (payloadMessage.getEmailContentType().equals(EmailContentType.TEXTPLAIN)) {
			smtpConnector.sendMail(subject,payloadMessage.getMessage(), MediaType.TEXT_PLAIN);
		} else if (payloadMessage.getEmailContentType().equals(EmailContentType.TEXTPLAIN)) {
			smtpConnector.sendMail(subject,payloadMessage.getMessage(), MediaType.TEXT_HTML);
		} else {
			NotificationServiceException statusMessage = new NotificationServiceException();
			statusMessage.setCode(400);
			statusMessage.setMessage("The " + payloadMessage.getEmailContentType().toString() + " is not valid.");
			throw new NotificationMailServiceException("Bad request", statusMessage);
		}

	}

}
