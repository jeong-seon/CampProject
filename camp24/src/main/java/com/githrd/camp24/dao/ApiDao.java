package com.githrd.camp24.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.camp24.vo.ApiVO;


public class ApiDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// api 데이터 DB Insert
	public int insertApiData(ApiVO apiVO) {
		return sqlSession.insert("aSQL.insertApiData", apiVO);
	}
	
	// 스케줄러 업데이트
	public int updateApiData(ApiVO apiVO) {
		return sqlSession.update("aSQL.updateApiData", apiVO);
	}
	
	// 캠핑장 이름으로 검색 (검색게시판)
	public List<ApiVO> searchCamp(String facltNm){
		return sqlSession.selectList("aSQL.searchCamp", facltNm);
	}
	
	// 캠핑장 이름으로 검색 (지도)
	public List<ApiVO> searchMap(String facltNm){
		return sqlSession.selectList("aSQL.searchMap", facltNm);
	}
	
	// 캠핑장 데이터 삭제
	public int deleteData() {
		return sqlSession.delete("aSQL.deleteData");
	}
}
