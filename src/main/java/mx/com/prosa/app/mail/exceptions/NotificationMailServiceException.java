package mx.com.prosa.app.mail.exceptions;

public class NotificationMailServiceException extends Exception {
    public static final long serialVersionUID = 20131227112105L;
    
    private NotificationServiceException notificationServiceException;

    public NotificationMailServiceException() {
        super();
    }
    
    public NotificationMailServiceException(String message) {
        super(message);
    }
    
    public NotificationMailServiceException(String message, Throwable cause) {
        super(message, cause);
    }

    public NotificationMailServiceException(String message, NotificationServiceException notificationServiceException) {
        super(message);
        this.notificationServiceException = notificationServiceException;
    }

    public NotificationMailServiceException(String message, NotificationServiceException notificationServiceException, Throwable cause) {
        super(message, cause);
        this.notificationServiceException = notificationServiceException;
    }

    public NotificationServiceException getFaultInfo() {
        return this.notificationServiceException;
    }
}
