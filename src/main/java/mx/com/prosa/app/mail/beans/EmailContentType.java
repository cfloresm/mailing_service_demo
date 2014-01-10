package mx.com.prosa.app.mail.beans;

public enum EmailContentType {
	HTML,
	TEXTPLAIN;
	
	public String value() {
	    return name();
	}
	
	public static EmailContentType fromValue(String v) {
	    return valueOf(v);
	}
	
}
