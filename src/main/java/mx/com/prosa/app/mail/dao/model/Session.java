package mx.com.prosa.app.mail.dao.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the SESSION database table.
 * 
 */
@Entity
@Table(name="SESSION")
@NamedQuery(name="Session.findAll", query="SELECT s FROM Session s")
public class Session implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="IDSESSION")
	private int idsession;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="EXPIREDAT")
	private Date expiredat;

	//bi-directional many-to-one association to User
	@OneToOne
	@JoinColumn(name="USER_IDUSER")
	private User user;

	public Session() {
	}

	public int getIdsession() {
		return this.idsession;
	}

	public void setIdsession(int idsession) {
		this.idsession = idsession;
	}

	public Date getExpiredat() {
		return this.expiredat;
	}

	public void setExpiredat(Date expiredat) {
		this.expiredat = expiredat;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}