package mx.com.prosa.app.mail.dao;


import mx.com.prosa.app.mail.dao.exception.UserDAOException;
import mx.com.prosa.app.mail.dao.model.User;

import org.springframework.transaction.annotation.Transactional;

/**
 * Methods exposed for access through service
 * @author carlos
 *
 */
public interface ServiceUserDAO {
	/**
	 * Operation for creating user
	 */
	@Transactional(readOnly=false)
	void  createUser(User user) throws UserDAOException;
	
	/**
	 * Operation for geting  user 
	 * @param userID
	 * @return
	 */
	@Transactional(readOnly=true)
	User getUser(String userName) throws UserDAOException;

	/**
	 * Operation for geting  user 
	 * @param userID
	 * @return
	 */
	@Transactional(readOnly=true)
	User getUserByName(String userName) throws UserDAOException;
	/**
	 * Operation for deleting user
	 * @param userID
	 */
	@Transactional(readOnly=false)
	void deleteUser(String userName) throws UserDAOException;
}
