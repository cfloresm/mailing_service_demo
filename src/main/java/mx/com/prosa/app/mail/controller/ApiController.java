package mx.com.prosa.app.mail.controller;

import java.util.List;

import mx.com.prosa.app.mail.beans.EmailContentType;
import mx.com.prosa.app.mail.beans.Mail;
import mx.com.prosa.app.mail.beans.PayloadMessage;
import mx.com.prosa.app.mail.exceptions.NotificationMailServiceException;
import mx.com.prosa.app.mail.services.impl.EmailServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * Controller for API RESTful  .
 * @author carlos
 *
 */
@Controller("/api")
public class ApiController {

	/**
	 * Service for mailing
	 */
    @Autowired
	EmailServiceImpl mailingService;
    
    /**
     * Send mail operation 
     * @param mail
     * @return
     * @throws JsonProcessingException
     */
	@RequestMapping(value="/sendmail", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> postMails(@RequestBody Mail mail) throws JsonProcessingException {
				
		PayloadMessage payloadMessage =  new PayloadMessage();
		payloadMessage.setMessage(mail.getBody());
		payloadMessage.setEmailContentType(EmailContentType.TEXTPLAIN);

		if(mail.getDestinataries().size() > 1){
			List<String> subjects = mail.getDestinataries();
			try {
				mailingService.sendBatchMail(subjects, payloadMessage);
			} catch (NotificationMailServiceException e) {
				return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} else
			try {
				mailingService.sendSingleMail(mail.getDestinataries().get(0), payloadMessage);
			} catch (NotificationMailServiceException e) {
				return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			}

		return new ResponseEntity<String>(HttpStatus.OK);
	}
	
}
