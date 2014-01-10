package mx.com.prosa.app.mail.controller;

import mx.com.prosa.app.mail.beans.LoginForm;
import mx.com.prosa.app.mail.beans.EmailInput;
import mx.com.prosa.app.mail.beans.User;
import mx.com.prosa.app.mail.services.impl.AuthenticationServiceImpl;
import mx.com.prosa.app.mail.services.impl.UserServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controller for web application .
 * @author carlos
 *
 */
@Controller
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
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login(ModelMap model) {
		model.addAttribute("loginForm", new LoginForm());
		return "login";
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
		try {
			authcService.login(loginForm.getUsername(),loginForm.getPassword());
		} catch (Exception e) {
			model.addAttribute("errorMsg", e.getMessage());
			return "login";
		}
		return "redirect:/mailing";
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
	    return "register";
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
			return "login";
		}

		model.addAttribute("errorMsg", "User no registered.");
		model.addAttribute("userForm", new User());
		return "register";

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
		model.addAttribute("users", userService.getUserKeys());
		model.addAttribute("mailInput", new EmailInput());
		model.addAttribute("saludo", "Jajajjajaja!!");
		return "mailing";
	}
	

}