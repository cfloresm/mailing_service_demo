package mx.com.prosa.app.mail.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import mx.com.prosa.app.mail.beans.User;
import org.springframework.beans.factory.annotation.Autowired;
/**
 * Service for managament user operations . 
 * @author carlos
 *
 */
public class UserServiceImpl {

	/**
	 * Temporaly memory storage for register users
	 */
	@Autowired
	HashMap<String, Map<String, Object>> memoryStore;

	public ArrayList<String> getUsers() {
		ArrayList<String> users = new ArrayList<String>(0);
		Set<String> set = memoryStore.keySet();
		for (String userId : set) {
			User user = (User) memoryStore.get(userId).get("user");
			if (user.getEmail()!= null) {
				users.add(user.getEmail());
			}
		}
		return users;
	}

	/**
	 * Get all users keys
	 * @return
	 * 		user keys
	 */
	public Set<String> getUserKeys() {
		return memoryStore.keySet();
	}
}
