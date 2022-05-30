package com.uh.uhBoard;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uh.dao.BoardDao;
import com.uh.dao.LikeDao;
import com.uh.dao.MemberDao;
import com.uh.dao.PostDao;
import com.uh.vo.BoardVo;
import com.uh.vo.LikeVo;
import com.uh.vo.PostVo;
import com.uh.vo.ReplyVo;


@Controller
public class PostController {
	@Autowired
	PostDao post_dao;
	@Autowired
	PostVo post_vo;
	@Autowired
	BoardDao board_dao;
	@Autowired
	BoardVo board_vo;
	@Autowired
	LikeDao like_dao;
	@Autowired
	LikeVo like_vo;
	@Autowired
	MemberDao member_dao;
	@Autowired
	ReplyVo reply_vo;
	

	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public String post(Locale locale, Model model,int post_idx,HttpSession session) throws Exception {
		
		
		String nick=(String)session.getAttribute("nick");
		if(nick==null) {nick="";}
		
		post_vo.setPost_idx(post_idx);
		post_dao.view_up(post_vo);
		post_vo=post_dao.select_content(post_vo);
		model.addAttribute("post_vo", post_vo);
		
		
		like_vo.setLike_member_nick(nick);
		like_vo.setLike_post_idx(post_idx);
		int idx=like_dao.has_like(like_vo);
		model.addAttribute("like",idx);
		
	
		
		
		
		return "/post_view/post";
	}

	@RequestMapping(value = "/post_create", method = RequestMethod.GET)
	public String board_create(Locale locale, Model model) {
		
		
		return "/post_view/post_create";
	}
	@RequestMapping(value = "/post_update", method = RequestMethod.GET)
	public String board_update(Locale locale, Model model,int post_idx) {
		post_vo.setPost_idx(post_idx);
		post_vo=post_dao.select_content(post_vo);
		model.addAttribute("post_vo", post_vo);
		
		return "/post_view/post_update";
	}
	@RequestMapping(value = "/post_update.do", method = RequestMethod.GET)
	public String post_updateDo( Model model,int post_idx,String page_num,String post_board_name,String search_mode,String search_str,String car,String post_con) {
		
		post_vo.setPost_idx(post_idx);
		post_vo.setPost_con(post_con);
		post_dao.update(post_vo);
		
		
		return "redirect:post?post_idx="+post_idx+"&page_num="+page_num+"&post_board_name="+URLEncoder.encode(post_board_name)
		+"&search_mode="+search_mode+"&search_str="+search_str+"&car="+URLEncoder.encode(car);
	}
	@RequestMapping(value = "/post_delete.do", method = RequestMethod.GET)
	public String post_delete( Model model,int post_idx,String page_num,String post_board_name,String search_mode,String search_str,String car) {
		
		post_vo.setPost_idx(post_idx);
		post_dao.delete(post_vo);
		
		
		return "redirect:board_main?&post_board_name="+URLEncoder.encode(post_board_name)
		+"&search_mode="+search_mode+"&search_str="+search_str;
	}
	@RequestMapping(value = "/insert.do", method = RequestMethod.GET)
	public String insert_do(Model model,String post_board_name,String post_title,String post_con,String search_mode,String search_str,String page_num, HttpSession session) throws UnsupportedEncodingException {
		String post_member_nick=(String)session.getAttribute("nick");
		post_vo.setPost_member_nick(post_member_nick);
		post_vo.setPost_board_name(post_board_name);
		post_vo.setPost_title(post_title);
		post_vo.setPost_con(post_con);
		post_vo.setPost_img(null);
		post_vo.setPost_view("0");
		post_dao.insert(post_vo);
		
		
		System.out.println(1+post_board_name);
		System.out.println(2+search_mode);
		System.out.println(3+search_str);
		System.out.println(4+page_num);
		
		int idx=post_dao.select_my_idx(post_vo);
		
		return "redirect:/post?post_idx="+idx+"&page_num="+page_num+"&post_board_name="+URLEncoder.encode(post_board_name,"UTF-8")+"&search_mode="+search_mode+"&search_str="+URLEncoder.encode(search_str);
	}
	
	@RequestMapping(value = "/like_up", method = RequestMethod.GET)
	public void like_up(Locale locale, Model model,int post_idx,String nick) {
		like_vo.setLike_member_nick(nick);
		like_vo.setLike_post_idx(post_idx);
		like_dao.like_up(like_vo);
		
			System.out.println("좋아용"+post_idx+nick);
			
	}
	@RequestMapping(value = "/like_down", method = RequestMethod.GET)
	public void like_down(Locale locale, Model model,int post_idx,String nick) {
		like_vo.setLike_member_nick(nick);
		like_vo.setLike_post_idx(post_idx);
		int idx=like_dao.select_idx(like_vo);
		like_vo.setLike_idx(idx);
		like_dao.like_down(like_vo);
		
		System.out.println("않 좋아용"+post_idx+nick);
	}
	
	@RequestMapping(value = "/like_count", method = RequestMethod.GET)
	@ResponseBody
	public String like_count(Locale locale, Model model,int post_idx,String nick) {
		int count;
		count= like_dao.count_like(like_vo);
		return count+"";
	}
	@RequestMapping(value="/reply_select.do")
	public String reply_select(Model model,String member_idx, String post_idx, String post_board_name,String page_num,String search_mode,String search_str ) {
		
		
		ArrayList<ReplyVo> reply_list = new ArrayList<ReplyVo>();
		int p_idx = Integer.parseInt(post_idx);
		
		reply_list = (ArrayList<ReplyVo>) post_dao.select_reply(p_idx);
		model.addAttribute("reply_list", reply_list);
		
		return "/reply_view/reply_kit";
	}
	
	
	@RequestMapping(value="/reply_insert.do")
	public void reply_insert_do(Model model,String post_idx, String reply_con, HttpSession session) throws Exception {
		
		String nick = (String)session.getAttribute("nick");
		
		reply_vo.setReply_post_idx(Integer.parseInt(post_idx));
		reply_vo.setReply_member_nick(nick);
		reply_vo.setReply_con(reply_con);
		
		//System.out.println(post_idx+"   12311123111111111");
		//System.out.println(reply_con+"   12311123111111111");
		//System.out.println(nick+"   12311123111111111");
		
		post_dao.insert_reply(reply_vo);
		
		
	}

	
}
