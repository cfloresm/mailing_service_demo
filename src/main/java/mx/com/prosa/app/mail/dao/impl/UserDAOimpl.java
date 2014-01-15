package mx.com.prosa.app.mail.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Component;

import mx.com.prosa.app.mail.dao.UserDAO;
import mx.com.prosa.app.mail.dao.exception.UserDAOException;
import mx.com.prosa.app.mail.dao.model.User;


/**
 * 	implementation for custom methods defined in @UserDAO interface
 * @author carlos
 *
 */
@Component("userDAOimpl")
public class UserDAOimpl extends GenericDAOImpl<User> implements UserDAO {

	@Override
	public User getUserByName(String username) throws UserDAOException {
        Query query = this.entityManager
                .createQuery("select u FROM User u where u.username= :username");
        query.setParameter("username", username);
        List<?> users = query.getResultList();
        if (users != null && users.size() == 1) 
            return (User) users.get(0);
        
        else
        	throw new UserDAOException("User not found");
	}
	
}
