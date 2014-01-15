package mx.com.prosa.app.mail.security;

import mx.com.prosa.app.mail.dao.ServiceUserDAO;
import mx.com.prosa.app.mail.dao.exception.UserDAOException;
import mx.com.prosa.app.mail.dao.model.User;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Implementation for Authorizatiion and authentication
 * @author carlos
 *
 */
public class BankingRealm extends AuthorizingRealm {

	@Autowired
	ServiceUserDAO serviceUserDAO;
		
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token)
			throws AuthenticationException {
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;

		String userID = new String(upToken.getUsername());
		String password = new String(upToken.getPassword());
		User user = null;

		try {
		 user = serviceUserDAO.getUserByName(userID);
		} catch (UserDAOException e) {
			throw new AuthenticationException(e.getMessage());
		}
		
		if (user != null) {
			if (user.getPassword().equals(Encrypt.getStringMessageDigest(password))) {
				throw new AuthenticationException("Password incorrect");
			}
		}
		
		return new SimpleAuthenticationInfo(user, password, getName());
	}

}
