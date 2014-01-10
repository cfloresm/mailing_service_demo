package mx.com.prosa.app.mail.services.impl;

import java.util.HashMap;
import java.util.Map;

import mx.com.prosa.app.mail.beans.User;

import org.springframework.beans.factory.annotation.Autowired;

/**
 * Authentication service for users
 * @author carlos
 *
 */
public class AuthenticationServiceImpl {

	/**
	 * Temporaly memory storage for register users
	 */
    @Autowired
    HashMap<String, Map<String, Object>> memoryStore;

    /**
     * Authenticate user in memory storage .
     * @param username
     * 			username name for user
     * @param password
     * 			password for user
     * @return
     * 			the  current user instance . 
     * @throws Exception
     */
	public User login(String username, String password) throws Exception {
		User user = null;

		if(!memoryStore.containsKey(username)){
			throw new Exception("Account no exits");
		}

		user = (User) memoryStore.get(username).get("user");

		if(!user.getPassword().equals(password)){
			throw new Exception("Username and Password invalid.");
		}

		return user;
	}

	/**
	 * Register new user in memory storage
	 * @param user
	 * 			the User instance to persist 
	 * @return
	 * 			boolean result successful operation
	 */
	public boolean signin(User user){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);
		memoryStore.put(user.getEmail(), map);

		return true;
	}
}
