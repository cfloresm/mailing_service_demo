package mx.com.prosa.app.mail.services.impl;


import mx.com.prosa.app.mail.beans.EmailContentType;
import mx.com.prosa.app.mail.beans.Message;
import mx.com.prosa.app.mail.beans.NotificationTarget;
import mx.com.prosa.app.mail.beans.Target;
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
	 * Implementation for send single Mail
	 */
	@Override
	public void sendSingleMail(Target target, Message msg,EmailContentType emailContentType ) throws NotificationMailServiceException {

		if (emailContentType.equals(emailContentType.TEXTPLAIN)) {
			smtpConnector.sendMail(target, "[aBanking]", msg.getContent(), MediaType.TEXT_PLAIN);
		} else if (emailContentType.equals(emailContentType.HTML)) {
			smtpConnector.sendMail(target, "[aBanking]", msg.getContent(), MediaType.TEXT_HTML);
		} else {
			NotificationServiceException statusMessage = new NotificationServiceException();
			statusMessage.setCode(400);
			statusMessage.setMessage("The " + emailContentType.toString() + " is not valid.");
			throw new NotificationMailServiceException("Bad request", statusMessage);
		}
	}

	/**
	 * Implementation for send batch mail 
	 */
	@Override
	public void sendBatchMail(NotificationTarget notificationRequest)
			throws NotificationMailServiceException {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException();
	}


}
