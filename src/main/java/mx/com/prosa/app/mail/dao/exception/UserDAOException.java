package mx.com.prosa.app.mail.dao.exception;

public class UserDAOException extends Exception{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2247137390484179614L;

	public UserDAOException(String message, Throwable parent){
		super(message, parent);
	}
	
	public UserDAOException(String message){
		super(message);
	}
}
