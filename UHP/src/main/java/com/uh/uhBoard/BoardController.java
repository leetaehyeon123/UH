package com.uh.uhBoard;


import java.util.Locale;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class BoardController {
	

	@RequestMapping(value = "/board_kit", method = RequestMethod.GET)
	public String board_kit(Locale locale, Model model) {

		
		return "/board_view/board_kit";
	}

	@RequestMapping(value = "/board_main", method = RequestMethod.GET)
	public String board_main(Locale locale, Model model) {

		
		return "/board_view/board_main";
	}

	
}
