package mx.com.prosa.app.mail.dao.impl;

import mx.com.prosa.app.mail.dao.ServiceUserDAO;
import mx.com.prosa.app.mail.dao.exception.UserDAOException;
import mx.com.prosa.app.mail.dao.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("serviceUserDAO")
public class ServiceUserDAOImpl implements ServiceUserDAO {

	@Autowired
	UserDAOimpl userDAOimpl;

	@Override
	public void createUser(User user) throws UserDAOException {
		userDAOimpl.create(user);
	}

	@Override
	public User getUser(String userID)  throws UserDAOException {
		return userDAOimpl.find(userID);
	}

	@Override
	public void deleteUser(String userID)  throws UserDAOException {
		userDAOimpl.delete(userID);
	}

	@Override
	public User getUserByName(String userName) throws UserDAOException {
		return userDAOimpl.getUserByName(userName);
	}
	

}
