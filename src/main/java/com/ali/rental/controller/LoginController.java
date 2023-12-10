package com.ali.rental.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ali.rental.models.LoginUser;
import com.ali.rental.models.User;
import com.ali.rental.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userserv;
	
	
	@GetMapping("/login")
	public String loginForm(@ModelAttribute("newUser") User newUser,
							@ModelAttribute("newLogin") LoginUser newLogin, 
							Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		
		

		return "user.jsp";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
			HttpSession session) {
		userserv.register(newUser, result);	
			
		// TO-DO Later -- call a register method in the service
		// to do some extra validations and create a new user!

		if (result.hasErrors()) {
			// Be sure to send in the empty LoginUser before
			// re-rendering the page.
			model.addAttribute("newLogin", new LoginUser());
			return "user.jsp";
		}

		// No errors!
		// TO-DO Later: Store their ID from the DB in session,
		// in other words, log them in.
			session.setAttribute("user_id", newUser.getId());
			session.setAttribute("user_name", newUser.getFirstName());
			
		return "redirect:/dashboard";
	}
	
	
	// Login 
	//Action route
	@PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
         
        // Add once service is implemented:
		User user = userserv.login(newLogin, result);
		
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "user.jsp";
        }
    
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("user_id", user.getId());
        session.setAttribute("user_name", user.getFirstName());
		return "redirect:/dashboard";
        
    }
    
	@GetMapping("/dashboard")
	public String dashboard () {
		return "redirect:/";
	}
	

	@GetMapping("/logout")
	public String logout(HttpSession s) {
		s.invalidate();
		return "redirect:/login";
	}	
}