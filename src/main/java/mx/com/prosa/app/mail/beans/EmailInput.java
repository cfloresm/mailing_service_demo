package mx.com.prosa.app.mail.beans;

/**
 * Bean for  send email 
 * @author carlos
 *
 */
public class EmailInput {
    private String userId;
    private String message;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
}