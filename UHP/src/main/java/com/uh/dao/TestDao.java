package com.uh.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.uh.vo.TestVo;

public class TestDao {
SqlSession sqlSession;
	
	TestDao(SqlSession sqlSession){
		this.sqlSession=sqlSession;
	}
	public List<TestVo> select(){
		return sqlSession.selectList("com.uh.mappers.test_mapper.select");
	}
}
