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
	
	// 선호도메뉴 리스트 조회 전담 처리함수
	public List<PreferenceVO> getMenuList() {
		return sqlSession.selectList("pSQL.menuList");
	}	
	// 참여하지 않은 설문 갯수 조회 전담 처리함수
	public int getCount(PreferenceVO pVO) {
		return sqlSession.selectOne("pSQL.remainSurvey", pVO);
	}
	
	// 진행중인 설문 리스트 조회 전담 처리함수
	public List<PreferenceVO> getIngList(String id){
		return sqlSession.selectList("pSQL.ingList", id);
	}
	
	// 종료된 설문 리스트 조회 전담 처리함수
	public List<PreferenceVO> getOldList(){
		return sqlSession.selectList("pSQL.oldList");
	}
	
	// 설문주제번호로 문항리스트 조회 전담 처리함수
	public List<PreferenceVO> getQuestList(int sino){
		return sqlSession.selectList("pSQL.questList", sino);
	}
	
	// 설문 문항번호로 설문보기리스트 조회 전담 처리함수
	public List<PreferenceVO> getBogiList(int upno){
		return sqlSession.selectList("pSQL.bogiList", upno);
	}
	
	// 계층형 질의로 설문문항보기리스트 조회 전담 처리함수
	public List<PreferenceVO> getQList(int sino){
		return sqlSession.selectList("pSQL.qList", sino);
	}
	
	// 설문응답 입력 전담 처리함수
	public int addSurvey(PreferenceVO pVO) {
		return sqlSession.insert("pSQL.addSurvey", pVO);
	}
	
	// 설문주제번호로 설문결과조회 전담 처리함수
	public List<PreferenceVO> getResultList(int sino){
		return sqlSession.selectList("pSQL.resultList", sino);
	}
	
	// 설문문항의 보기 결과 조회 전담 처리함수
	public List<PreferenceVO> getBogiResult(int sqno){
		return sqlSession.selectList("pSQL.bogiResult", sqno);
	}
}
