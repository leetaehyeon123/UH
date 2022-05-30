package com.uh.vo;

public class BoardVo {

		int Board_idx;
		String board_category,board_name,board_img;
		//
		String search_str;
		public int getBoard_idx() {
			return Board_idx;
		}
		public void setBoard_idx(int board_idx) {
			Board_idx = board_idx;
		}
		public String getBoard_category() {
			return board_category;
		}
		public void setBoard_category(String board_category) {
			this.board_category = board_category;
		}
		public String getBoard_name() {
			return board_name;
		}
		public void setBoard_name(String board_name) {
			this.board_name = board_name;
		}
		public String getBoard_img() {
			return board_img;
		}
		public void setBoard_img(String board_img) {
			this.board_img = board_img;
		}
		public String getSearch_str() {
			return search_str;
		}
		public void setSearch_str(String search_str) {
			this.search_str = search_str;
		}
		
		
		
		
}
