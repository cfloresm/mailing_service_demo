package mx.com.prosa.app.mail.controller;

import mx.com.prosa.app.mail.beans.LoginForm;
import mx.com.prosa.app.mail.beans.User;
import mx.com.prosa.app.mail.services.impl.AuthenticationServiceImpl;
import mx.com.prosa.app.mail.services.impl.UserServiceImpl;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controller for web application .
 * @author carlos
 *
 */
public class WebAppController {

	/**
	 * Service for interaction existing users .
	 */
	@Autowired
	UserServiceImpl userService;

	/**
	 * Service for authentication
	 */
	@Autowired
	AuthenticationServiceImpl authcService;
	    
	/**
	 * Get login view 
	 * @param model
	 * 		  Allows for accessing the overall model 
	 * @return
	 * 		 login view name
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		model.addAttribute("loginForm", new LoginForm());
		return "mailing_login";
	}

	/**
	 * Authentication user through 
	 * @param loginForm
	 * 			Contains login parameters .
	 * @param model
	 * 		  	Allows for accessing the overall model 
	 * @return
	 * 		  	mailing view 
	 */
	@RequestMapping(value = "/authenticate", method = RequestMethod.POST)
	public String postLogin(
			@ModelAttribute(value = "loginForm") LoginForm loginForm,
			ModelMap model) {
		
		UsernamePasswordToken token = new UsernamePasswordToken();
		token.setUsername(loginForm.getUsername());
		token.setPassword(loginForm.getPassword().toCharArray());

		Subject currentUser = SecurityUtils.getSubject();

		try {
			currentUser.login(token);
		} catch (AuthenticationException ae) {
			model.addAttribute("error", true);
			model.addAttribute("message", ae.getMessage());
			return "maling_login";
		} catch (Exception e) {
			model.addAttribute("errorMsg", e.getMessage());
			return "mailing_login";
		}
		
		return "redirect:/mailing";
	}

	/**
	 * Implement logout method for 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		model.addAttribute("loginForm", new LoginForm());
		return "mailing_login";
	}
	
	/**
	 * Get register view  
	 * @param model
	 * 			Allows for accessing the overall model 
	 * @return
	 * 			Register view 
	 */
	@RequestMapping(value="/signin", method = RequestMethod.GET)
	public String getUserForm(ModelMap model) {
		model.addAttribute("userForm", new User());
		return "mailing_register";
	}

	/**
	 * Register a new user
	 * @param userForm
	 * 			Contains data for register user
	 * @param model
	 * 			Allows for accessing the overall model 
	 * @return
	 * 			register or login view
	 */
	@RequestMapping(value="/user", method = RequestMethod.POST)
	public String postUser(@ModelAttribute(value = "userForm") User userForm, ModelMap model){

		if(authcService.signin(userForm)){
			model.addAttribute("infoMsg", "User registered successfully.");
			model.addAttribute("loginForm", new LoginForm());
			return "mailing_login";
		}

		model.addAttribute("errorMsg", "User no registered.");
		model.addAttribute("userForm", new User());
		return "mailing_register";

	}
	
	/**
	 * Get mailing view
	 * @param model
	 * 			Allows for accessing the overall model
	 * @return
	 * 			Mailing View
	 */			
	
	@RequestMapping(value="/mailing", method = RequestMethod.GET)
	public String getMailingApp(ModelMap model) {
		return "mailing_main";
	}


}
