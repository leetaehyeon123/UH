package com.uh.uhBoard;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uh.dao.BoardDao;
import com.uh.dao.PostDao;
import com.uh.vo.BoardVo;
import com.uh.vo.PostVo;

import util.PageUtil;
import util.Paging;


@Controller
public class BoardController {
	@Autowired
	PostDao post_dao;
	@Autowired
	PostVo post_vo;
	@Autowired 
	BoardDao boardDao;
	@Autowired
	BoardVo boardVo;

	@RequestMapping(value = "/board_kit", method = RequestMethod.GET)
	public String board_kit( Model model,String post_board_name,String page_num,String search_mode,String search_str) {
		/*
		 * board_kit이 호출 되는 파라미터에 따른 경우의 수
		 *  1.전체 게시판에서 작성자 or 제목으로 검색 (post_board_name=all , search_mode=notnull)
		 *  	호출 dao메서드 : select_all(vo{search_mode,search_str,page_num})
		 *  
		 *  2.특정 게시판에서 작성자 or 제목으로 검색 (post_board_name=notALL,search_mode=notnull)
		 *  	호출 dao메서드 : select_this(vo{post_board_name,search_mode,search_str,page_num})
		 *  
		 *  3.기본적으로 특정 게시판을 클릭하고 들어왔을시(post_board_name=notnull,search_mode=null)
		 *  	호출 dao메서드 : select(vo{post_board_name,page_num})
		 *  
		 *  4.페이징처리시 (page_num==null이면 1로 초기화)
		 */

		ArrayList<PostVo> list=new ArrayList<PostVo>();
		ArrayList<PostVo> resultList=new ArrayList<PostVo>();
		
		System.out.println(post_board_name);
		System.out.println(page_num);
		System.out.println(search_mode);
		System.out.println(search_str);
		
		/* 4. */
		int nowPage = 1; // 기본 페이지
		
		if(page_num.equals("null"))
			nowPage = 1; // 기본 페이지
		else
			nowPage = Integer.parseInt(page_num);
		// 한 페이지에 표시되는 게시물의 시작과 끝번호를 계산 즉, 페이지당 몇개의 게시물을 보여줄건지 정하는 코드
		int start = (nowPage - 1) * PageUtil.Board.BLOCKLIST + 1;
		int end = start + PageUtil.Board.BLOCKLIST -1 ;
		
		

		
		System.out.println(search_mode+search_str);
		/* 1. */
		if(post_board_name.equals("ALL")) {
			System.out.println(1+"!!!!!!!!!!!!");
			post_vo.setSearch_mode(search_mode);
			post_vo.setSearch_str("%"+search_str+"%");
			post_vo.setStart(start);
			post_vo.setEnd(end);
			list=(ArrayList<PostVo>)post_dao.select_searchAll(post_vo);
			
			
			int row_total = post_dao.getRowSearchAll(post_vo);
			System.out.println(123+row_total);
			String pageMenu = Paging.getPaging("/uhp/board_main?post_board_name=" + post_board_name, nowPage, row_total, PageUtil.Board.BLOCKLIST, PageUtil.Board.BLOCKPAGE);
			model.addAttribute("pageMenu",pageMenu);
		}
		
		
		/* 2. */
		if(!search_mode.equals("null")&&!post_board_name.equals("ALL")) {
			System.out.println(2+"!!!!!!!!!!!!");
			post_vo.setPost_board_name(post_board_name);
			post_vo.setSearch_mode(search_mode);
			post_vo.setSearch_str("%"+search_str+"%");
			post_vo.setStart(start);
			post_vo.setEnd(end);
			list=(ArrayList<PostVo>)post_dao.select_this(post_vo);
			
			int row_total = post_dao.getRowThis(post_vo);
			String pageMenu = Paging.getPaging("/uhp/board_main?post_board_name=" + post_board_name, nowPage, row_total, PageUtil.Board.BLOCKLIST, PageUtil.Board.BLOCKPAGE);
			model.addAttribute("pageMenu",pageMenu);
		}
		
		
		/* 3. */
		if(search_mode.equals("null")&&search_str.equals("null")) {
			System.out.println(3+"!!!!!!!!!!!!");

			post_vo.setPost_board_name(post_board_name);
			
			post_vo.setStart(start);
			post_vo.setEnd(end);
			
			/*
			 * Map<String, Integer> map = new HashMap<String, Integer>(); map.put("start",
			 * start); map.put("end", end);
			 */
			
			// 해당 게시글 전체 목록 가져오기

			list = (ArrayList<PostVo>)post_dao.select(post_vo);	
			
			
			// 해당 게시판 전체 게시물 수 구하기( ex: 오버워치 게시물, 스포츠 게시물...등등 )
			int row_total = post_dao.getRowTotal(post_vo);
			System.out.println(row_total+"!!!");
			
			
			// 하단 페이지 메뉴 생성하기
			String pageMenu = Paging.getPaging("/uhp/board_main?post_board_name=" + post_board_name, nowPage, row_total, PageUtil.Board.BLOCKLIST, PageUtil.Board.BLOCKPAGE);
			model.addAttribute("pageMenu",pageMenu);
			
			
		}
		
		
		
			
		
	
				for(int i=0; i<list.size();i++) {		
					String resultTime="";
					SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");				
					Date time = new Date();					
					String time1 = format1.format(time);
					String time2=list.get(i).getPost_date();
					String str[]=list.get(i).getPost_date().split(" ");
					if((time1.split(" ")[0]).equals(time2.split(" ")[0])) {			
						resultTime=str[1].split(":")[0]+":"+str[1].split(":")[1];				
					}else{
						resultTime=str[0];
					}
					post_vo=list.get(i);
					post_vo.setPost_date(resultTime);
					resultList.add(post_vo);		
				}
		
		
		String car;
		if(!post_board_name.equals("ALL")) {
			System.out.println(post_board_name);
			System.out.println(boardVo);
			boardVo.setBoard_name(post_board_name);
			boardVo=boardDao.select_car(boardVo);
			car=boardVo.getBoard_category();
		}else {
			car="검색";
		}
		
		
	
		model.addAttribute("list",resultList);
		model.addAttribute("car",car);
		
		
		return "/board_view/board_kit";
	}

	@RequestMapping(value = "/board_main", method = RequestMethod.GET)
	public String board_main(Locale locale, Model model) {

		
		return "/board_view/board_main";
	}
	

	
}
