package mx.com.prosa.app.mail.beans;

import java.util.ArrayList;

public class Mail {
	public ArrayList<String> getDestinataries() {
		return destinataries;
	}
	public void setDestinataries(ArrayList<String> destinataries) {
		this.destinataries = destinataries;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	private ArrayList<String> destinataries;
	private String subject="";
	private String body;
	
}
