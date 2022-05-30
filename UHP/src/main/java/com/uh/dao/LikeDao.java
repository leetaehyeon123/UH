package com.uh.dao;

import org.apache.ibatis.session.SqlSession;

import com.uh.vo.LikeVo;

public class LikeDao {
	SqlSession sqlSession;
	
	LikeDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}
	public void like_up(LikeVo vo) {
		sqlSession.insert("com.uh.mappers.like_mapper.like_up", vo);
	}
	public void like_down(LikeVo vo) {
		sqlSession.delete("com.uh.mappers.like_mapper.like_down", vo);
	}
	public int select_idx(LikeVo vo) {
		return sqlSession.selectOne("com.uh.mappers.like_mapper.select_idx", vo);
	}
	public int has_like(LikeVo vo) {
		return sqlSession.selectOne("com.uh.mappers.like_mapper.has_like", vo);
	}
	public int count_like(LikeVo vo) {
		return sqlSession.selectOne("com.uh.mappers.like_mapper.count_like", vo);
	}
	
	
	
}
