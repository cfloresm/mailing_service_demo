package mx.com.prosa.app.mail.services;

import mx.com.prosa.app.mail.beans.EmailContentType;
import mx.com.prosa.app.mail.beans.Message;
import mx.com.prosa.app.mail.beans.NotificationTarget;
import mx.com.prosa.app.mail.beans.Target;
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
	public void sendSingleMail(Target notificationRequest, Message message, EmailContentType notificationType) throws NotificationMailServiceException;
	
	/**
	 * Send batch email 
	 * @param notificationRequest
	 * @throws NotificationMailServiceException
	 */
	public void sendBatchMail(NotificationTarget notificationRequest) throws NotificationMailServiceException;
}