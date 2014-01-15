package mx.com.prosa.app.mail.dao.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the USER database table.
 * 
 */
@Entity
@Table(name="USER")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="IDUSER")
	private String iduser;

	@Column(name="PASSWORD")
	private String password;

	@Column(name="USERNAME")
	private String username;

	//bi-directional many-to-one association to Session
	@OneToOne(mappedBy="user")
	private Session session;

	//bi-directional many-to-one association to Rol
	@ManyToOne
	@JoinColumn(name="ROL_IDROL")
	private Rol rol;

	public User() {
	}

	public String getIduser() {
		return this.iduser;
	}

	public void setIduser(String iduser) {
		this.iduser = iduser;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Session getSession() {
		return session;
	}

	public void setSession(Session session) {
		this.session = session;
	}

	public Rol getRol() {
		return this.rol;
	}

	public void setRol(Rol rol) {
		this.rol = rol;
	}

}