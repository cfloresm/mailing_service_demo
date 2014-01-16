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

	@Override
	public void sendMail(PayloadMessage payloadMessage)
			throws NotificationMailServiceException {
		
		if (payloadMessage.getRecipients().size() > 1)
			smtpConnector.sendBatchMail(payloadMessage.getSubject(),
					payloadMessage.getRecipients(),
					payloadMessage.getMessage(), MediaType.TEXT_HTML);
			
		else
			smtpConnector.sendMail(payloadMessage.getSubject(), payloadMessage
					.getRecipients().get(0), payloadMessage.getMessage(),
					MediaType.TEXT_HTML);
	}

}
