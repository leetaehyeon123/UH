package com.uh.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.uh.vo.PostVo;

import com.uh.vo.PostVo;
import com.uh.vo.ReplyVo;



public class PostDao {

SqlSession sqlSession;
	
	PostDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}
	
	public List<PostVo> select(PostVo vo){
		return sqlSession.selectList("com.uh.mappers.post_mapper.select",vo);
	}
	public List<PostVo> select_this(PostVo vo){
		return sqlSession.selectList("com.uh.mappers.post_mapper.select_this",vo);
	}
	public List<PostVo> select_searchAll(PostVo vo){
		return sqlSession.selectList("com.uh.mappers.post_mapper.select_searchAll",vo);
	}
	public PostVo select_content(PostVo vo){
		return sqlSession.selectOne("com.uh.mappers.post_mapper.select_content",vo);
	}
	public int select_my_idx(PostVo vo){
		int idx=0;

		List<PostVo> list = sqlSession.selectList("com.uh.mappers.post_mapper.select_my_idx",vo);
		
		idx=list.get(0).getPost_idx();
		
		return idx;
	}
	public void insert(PostVo vo) {
		sqlSession.insert("com.uh.mappers.post_mapper.insert",vo);
	}
	public int getRowTotal(PostVo vo) {
		int count = sqlSession.selectOne("com.uh.mappers.post_mapper.getRowTotal",vo);
		return count;
	}
	public int getRowThis(PostVo vo) {
		int count = sqlSession.selectOne("com.uh.mappers.post_mapper.getRowThis",vo);
		return count;
	}
	public int getRowSearchAll(PostVo vo) {
		int count = sqlSession.selectOne("com.uh.mappers.post_mapper.getRowSearchAll",vo);
		return count;
	}
	public void update(PostVo vo) {
		sqlSession.update("com.uh.mappers.post_mapper.update",vo);
	
	}
	public void delete(PostVo vo) {
		sqlSession.update("com.uh.mappers.post_mapper.delete",vo);
	
	}
	public void view_up(PostVo vo) {
		sqlSession.update("com.uh.mappers.post_mapper.view_up",vo);
	
	}
	// 댓글 검색
	public List<ReplyVo> select_reply(int post_idx){
		
		return sqlSession.selectList("com.uh.mappers.post_mapper.select_reply", post_idx);
	}
	
	// 댓글 추가
	public void insert_reply(ReplyVo vo) {
		sqlSession.insert("com.uh.mappers.post_mapper.insert_reply",vo);
	}
	
	
}
