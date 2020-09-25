package com.uh.uhBoard;


import java.util.Locale;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SignController {
	

	@RequestMapping(value = "/sign_in", method = RequestMethod.GET)
	public String sign_in(Locale locale, Model model) {

		
		return "/sign_view/sign_in";
	}
	

	@RequestMapping(value = "/sign_up", method = RequestMethod.GET)
	public String sign_up(Locale locale, Model model) {

		
		return "/sign_view/sign_up";
	}
	
}
