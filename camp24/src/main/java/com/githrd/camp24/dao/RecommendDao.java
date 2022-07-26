package com.githrd.camp24.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.githrd.camp24.vo.*;

public class RecommendDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 선호도조사 결과 리스트 조회 전담 처리함수
	public List<RecommendVO> getRecommendList() {
		return sqlSession.selectList("rcSQL.recommendList");
	}	
	
	// 선호도조사 결과 리스트 조회 전담 처리함수
	public List<RecommendVO> getRecommend(PreferenceVO pVO) {
		return sqlSession.selectList("rcSQL.recommend", pVO);
	}	
	
}
