package com.uh.dao;




import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.uh.vo.MemberVo;


public class MemberDao {


SqlSession sqlSession;
	
	MemberDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}
	

	public void insert(MemberVo vo) {
		sqlSession.insert("com.uh.mappers.member_mapper.insert",vo);
	}
	public void updateSignUp(MemberVo vo) throws Exception {
		
		 sqlSession.update("com.uh.mappers.member_mapper.updateSignUp", vo);
	}
	
	public MemberVo login(MemberVo vo) throws Exception {		
		return sqlSession.selectOne("com.uh.mappers.member_mapper.login", vo);
	}
	
	public List<MemberVo> selectPlatform(MemberVo vo) throws Exception {	
		return sqlSession.selectList("com.uh.mappers.member_mapper.selectPlatform", vo);
	}
	
	public List<MemberVo> selectByPhone(MemberVo vo) throws Exception {	
		return sqlSession.selectList("com.uh.mappers.member_mapper.selectByPhone", vo);
	}
	
	public void updateYesNick(MemberVo vo) throws Exception {
		
		 sqlSession.update("com.uh.mappers.member_mapper.updateYesNick", vo);
	}
	
	public List<MemberVo> checkNick(MemberVo vo) throws Exception {
		
		return sqlSession.selectList("com.uh.mappers.member_mapper.checkNick", vo);
	}
	public List<MemberVo> checkId(MemberVo vo) throws Exception {
		
		return sqlSession.selectList("com.uh.mappers.member_mapper.checkId", vo);
	}
	public void insertNoNick(MemberVo vo) throws Exception {
		
		sqlSession.insert("com.uh.mappers.member_mapper.insertNoNick", vo);
	}
	public int select_member_idx(String nick) throws Exception{
		return sqlSession.selectOne("com.uh.mappers.member_mapper.select_member_idx", nick);
	}
	
}
