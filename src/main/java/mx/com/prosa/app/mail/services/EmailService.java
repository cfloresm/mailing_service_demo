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
	public void sendSingleMail(String subject, PayloadMessage payloadMessage) throws NotificationMailServiceException;
	
	/**
	 * Send batch email 
	 * @param notificationRequest
	 * @throws NotificationMailServiceException
	 */
	public void sendBatchMail(List<String> subjects, PayloadMessage payloadMessage) throws NotificationMailServiceException;
}