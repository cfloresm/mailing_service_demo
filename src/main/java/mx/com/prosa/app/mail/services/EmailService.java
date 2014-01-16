package mx.com.prosa.app.mail.services;

import java.util.List;

import mx.com.prosa.app.mail.beans.PayloadMessage;
import mx.com.prosa.app.mail.exceptions.NotificationMailServiceException;

/**
 * Definition methods for send emails .
 * @author carlos
 *
 */
public interface EmailService {
	/**
	 * Send singe email
	 * @param notificationRequest
	 * @param message
	 * @param notificationType
	 * @throws NotificationMailServiceException
	 */
	public void sendMail(PayloadMessage payloadMessage) throws NotificationMailServiceException;
	
}