package mx.com.prosa.app.mail.connectors;

import java.util.Properties;
import java.util.logging.Logger;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import mx.com.prosa.app.mail.beans.Target;
import mx.com.prosa.app.mail.exceptions.NotificationMailServiceException;
import mx.com.prosa.app.mail.exceptions.NotificationServiceException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;

/**
 * Implementation smtpconnector for differents mail service .
 * @author osalinas
 *
 */
public class SMTPConnector {

	private static final Logger LOG = Logger.getLogger(SMTPConnector.class.getName());

	private Session session = null;
	
	@Value("${mail.smtp.host:smtp.gmail.com}")
	private String mailSmtpHost;
	@Value("${mail.smtp.socketFactory.port:465}")
	private String mailSmtpSocketFactoryPort;
	@Value("${mail.smtp.socketFactory.class:javax.net.ssl.SSLSocketFactory}")
	private String mailSmtpSocketFactoryClass;
	@Value("${mail.smtp.auth:true}")
	private String mailSmtpAuth;
	@Value("${mail.smtp.port:465}")
	private String mailSmtpPort;
	@Value("${mail.smtp.user}")
	private String mailSmtpUser;
	@Value("${mail.smtp.password}")
	private String mailSmtpPassword;
	@Value("${mail.debug:true}")
	private String mailDebug;

	/**
	 *  method for connect with service mail provider
	 */
	@PostConstruct
	public void connect() {
		
		Properties props = new Properties();
		props.put("mail.smtp.host", mailSmtpHost);
		props.put("mail.smtp.socketFactory.port", mailSmtpSocketFactoryPort);
		props.put("mail.smtp.socketFactory.class", mailSmtpSocketFactoryClass);
		props.put("mail.smtp.auth", mailSmtpAuth);
		props.put("mail.smtp.port", mailSmtpPort);
		props.put("mail.smtp.user", mailSmtpUser);
		props.put("mail.smtp.password", mailSmtpPassword);
		props.put("mail.debug", mailDebug);
		
		session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(mailSmtpUser,
								mailSmtpPassword);
					}
				});		
	}

	/**
	 * Generic method for send mail
	 * @param target
	 * 			
	 * @param subject
	 * 			Receiver user email
	 * @param msg
	 * 			Message content 
	 * @param mediaType
	 *			Type content TEXTPLAIN or HTML
	 * @throws NotificationMailServiceException
	 * 			Fault exception
	 */
	public void sendMail(Target target, String subject, String msg,

			MediaType mediaType) throws NotificationMailServiceException {
		String recipient = target.getId();
		Message message = new MimeMessage(session);
		InternetAddress from, to;

		try {

			from = new InternetAddress(mailSmtpUser);
			to = new InternetAddress(recipient);

		} catch (MessagingException e) {
			LOG.info("Exception [AddressException] : [" + recipient + "|"
					+ mailSmtpUser + "] = " + e);
			NotificationServiceException statusMessage = new NotificationServiceException();
			statusMessage.setCode(400);
			statusMessage.setMessage("Email address bad syntax.");
			throw new NotificationMailServiceException(
					"Bad syntax exception", statusMessage);
		}

		try {

			message.setFrom(from);
			message.setRecipient(Message.RecipientType.TO, to);
			message.setSubject(subject);
			message.setContent(msg, mediaType.toString() + "; charset=utf-8");

			Transport.send(message);

		} catch (MessagingException e) {
			LOG.info("Exception [MessagingException] : " + e);
			NotificationServiceException statusMessage = new NotificationServiceException();
			statusMessage.setCode(500);
			statusMessage.setMessage("Email Server unreach.");
			throw new NotificationMailServiceException(
					"Email Server exception", statusMessage);
		}
	}
	
	/**
	 * Clear session instance
	 */
	@PreDestroy
	public void close(){
		this.session = null;
	}
}
