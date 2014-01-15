package mx.com.prosa.app.mail.dao;

import mx.com.prosa.app.mail.dao.exception.UserDAOException;
import mx.com.prosa.app.mail.dao.model.User;

/**
 * Custom implementation for methods for interaction with model users .
 * @author carlos
 *
 */
public interface UserDAO extends GenericDAO<User> {
	//Custom methods for managament DAO with users
	public User getUserByName(String name)throws UserDAOException;
}
