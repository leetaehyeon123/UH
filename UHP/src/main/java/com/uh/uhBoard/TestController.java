package com.uh.uhBoard;


import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uh.dao.TestDao;
import com.uh.vo.TestVo;


@Controller
public class TestController {
	@Autowired
	TestDao test_dao;
	@Autowired
	TestVo test_vo;

	@RequestMapping(value = {"/test01","test"}, method = RequestMethod.GET)
	public String test01(Locale locale, Model model) {

		
		return "/test_view/test01";
	}
	@RequestMapping(value = "/db_test", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		model.addAttribute("list",test_dao.select());
		return "/test_view/db_test";
	}
	@RequestMapping(value = "/test2222", method = RequestMethod.GET)
	public String test2222(Locale locale, Model model) {

		return "/test_view/test2222";
	}
	@RequestMapping(value = "/test1111", method = RequestMethod.GET)
	public String test1111(Locale locale, Model model) {

		
		return "/test_view/test1111";
	}
}
