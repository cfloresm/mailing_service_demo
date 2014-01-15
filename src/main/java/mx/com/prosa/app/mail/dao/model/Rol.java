package mx.com.prosa.app.mail.dao.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the ROL database table.
 * 
 */
@Entity
@Table(name="ROL")
@NamedQuery(name="Rol.findAll", query="SELECT r FROM Rol r")
public class Rol implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="IDROL")
	private int idrol;

	@Column(name="NAME")
	private String name;

	//bi-directional many-to-one association to User
	@OneToMany(mappedBy="rol")
	private List<User> users;

	public Rol() {
	}

	public int getIdrol() {
		return this.idrol;
	}

	public void setIdrol(int idrol) {
		this.idrol = idrol;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<User> getUsers() {
		return this.users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public User addUser(User user) {
		getUsers().add(user);
		user.setRol(this);

		return user;
	}

	public User removeUser(User user) {
		getUsers().remove(user);
		user.setRol(null);

		return user;
	}

}