package com.githrd.camp24.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.githrd.camp24.vo.*;

public class PreferenceDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 선호도정보 데이터베이스 추가작업 전담 처리함수
	public int addPreference(PreferenceVO pVO) {
		return sqlSession.insert("pSQL.addPreference", pVO);
	}
	// 선호도조사 결과 리스트 조회 전담 처리함수
	public PreferenceVO getPreferenceList(String id) {
		return sqlSession.selectOne("pSQL.preferenceList", id);
	}	
	
	// 선호도메뉴 리스트 조회 전담 처리함수
	public List<PreferenceVO> getMenuList() {
		return sqlSession.selectList("pSQL.menuList");
	}
	public List<PreferenceVO> getMenuList(String id) {
		return sqlSession.selectList("pSQL.menuList", id);
	}
	
	public List<PreferenceVO> getPreferList(String id){
		return sqlSession.selectList("pSQL.preferList", id);
	}
	
	// 선호도정보 수정 데이터베이스 작업 전담 처리함수
	public int editPreferenceInfo(PreferenceVO pVO) {
		return sqlSession.update("pSQL.preferenceEditInfo", pVO);
	}
}
