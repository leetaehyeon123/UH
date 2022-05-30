package com.uh.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.uh.vo.BoardVo;


public class BoardDao {

SqlSession sqlSession;
	
	BoardDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}
	

	public List<BoardVo> select() {
		return sqlSession.selectList("com.uh.mappers.board_mapper.select");
	}
	
	public BoardVo select_car(BoardVo vo) {
		return sqlSession.selectOne("com.uh.mappers.board_mapper.select_car",vo);
	}
	
	public List<BoardVo> select_board(BoardVo vo) {
		return sqlSession.selectList("com.uh.mappers.board_mapper.select_board",vo);
	}
	
	
}
