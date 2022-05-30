package com.uh.vo;

public class PostVo {

	int post_idx;
	int page_num;
	int start;
	int end;
	String post_board_name,post_date,post_title,post_member_nick,post_con,post_view,post_img;
	/* 위에가 테이블 변수 밑에가 추가 필요 변수 */
    String search_mode,search_str;
    int like_count;
    int reply_count;
	
	
	public int getReply_count() {
		return reply_count;
	}
	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public int getPost_idx() {
		return post_idx;
	}
	public void setPost_idx(int post_idx) {
		this.post_idx = post_idx;
	}
	public String getPost_board_name() {
		return post_board_name;
	}
	public void setPost_board_name(String post_board_name) {
		this.post_board_name = post_board_name;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_member_nick() {
		return post_member_nick;
	}
	public void setPost_member_nick(String post_member_nick) {
		this.post_member_nick = post_member_nick;
	}
	public String getPost_con() {
		return post_con;
	}
	public void setPost_con(String post_con) {
		this.post_con = post_con;
	}
	public String getPost_view() {
		return post_view;
	}
	public void setPost_view(String post_view) {
		this.post_view = post_view;
	}
	public String getPost_img() {
		return post_img;
	}
	public void setPost_img(String post_img) {
		this.post_img = post_img;
	}
	public int getPage_num() {
		return page_num;
	}
	public void setPage_num(int page_num) {
		this.page_num = page_num;
	}
	public String getSearch_mode() {
		return search_mode;
	}
	public void setSearch_mode(String search_mode) {
		this.search_mode = search_mode;
	}
	public String getSearch_str() {
		return search_str;
	}
	public void setSearch_str(String search_str) {
		this.search_str = search_str;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
}
