package com.uh.uhBoard;


import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uh.dao.BoardDao;
import com.uh.vo.BoardVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	BoardDao board_dao;
	@Autowired
	BoardVo board_vo;
	

	@RequestMapping(value = {"/","/main"}, method = RequestMethod.GET)
	public String main(Locale locale, Model model,HttpSession session) {
		System.out.println(session.getAttribute("nick"));
		
		return "/main_view/main";
	}

	@RequestMapping(value = "/left_bar", method = RequestMethod.GET)
	public String leftBar(Locale locale, Model model) {
		ArrayList<BoardVo> list;
		list=(ArrayList<BoardVo>)board_dao.select();
		
		ArrayList<BoardVo> subList=new ArrayList<BoardVo>();
		ArrayList <ArrayList<BoardVo>> returnList=new ArrayList<ArrayList<BoardVo>>();
		String str=list.get(0).getBoard_category();
		
		for(int i=0;i<list.size();i++) {
							
				
				if(!list.get(i).getBoard_category().equals(str)) {
					returnList.add(subList);
					subList=new ArrayList<BoardVo>();
					str=list.get(i).getBoard_category();
				}
					
	
				subList.add(list.get(i));
				
				
			
		}
		returnList.add(subList);
		model.addAttribute("list",returnList);
		
	

		
		return "/bar_view/left_bar";
	}
		
	@RequestMapping(value = "/top_bar", method = RequestMethod.GET)
	public String topBar(Locale locale, Model model) {
	
		
		
		
		
		
		return "/bar_view/top_bar";
	}
	@RequestMapping(value = "/search_bar", method = RequestMethod.GET)
	public String searchBar(Locale locale, Model model,String search_str) {

		System.out.println("123====="+search_str);
		board_vo.setSearch_str("%"+search_str+"%");
		model.addAttribute("list",board_dao.select_board(board_vo));		
		
		return "/bar_view/search_bar";
	}
	@RequestMapping(value = "/displayTag", method = RequestMethod.GET)
	public void displayTag(Locale locale, Model model,String j,HttpServletResponse response,HttpServletRequest request) {
		System.out.println(j);	
		boolean hasCookie=false;
		Cookie cookies[]=request.getCookies();
		
		for(int i=0;i<cookies.length;i++) {
			
			if(cookies[i].getName().equals("carTag"+j)) {
				
				hasCookie=true;
			}
		}
		
		if(hasCookie) {
			for(int i=0;i<cookies.length;i++) {
				if(cookies[i].getName().equals("carTag"+j)) {
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
					System.out.println("carTag"+j+" 쿠키삭제");
				}
			}
		}else{
			Cookie cookie ;
			cookie = new Cookie("carTag"+j, "1");
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
			System.out.println("carTag"+j+" 쿠키추가");
		}
		
		
	
	}
			
}
