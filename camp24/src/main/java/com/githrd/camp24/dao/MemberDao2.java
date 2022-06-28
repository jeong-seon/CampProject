package com.githrd.camp24.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.githrd.camp24.vo.*;

public class MemberDao2 {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 아이디 카운트 조회
	public int getIdCnt(String id) {
		return sqlSession.selectOne("mSQL2.idCnt", id);
	}
		
	// 아바타 리스트 조회 전담 처리함수
	public List<MemberVO2> getAvtList(){
		return sqlSession.selectList("mSQL2.avtList");
	}
	public List<MemberVO2> getAvtList(String id){
		return sqlSession.selectList("mSQL2.genAvtList", id);
	}
	
	// 회원정보 데이터베이스 추가작업 전담 처리함수
	public int addMember(MemberVO2 mVO) {
		return sqlSession.insert("mSQL2.addMember", mVO);
	}
	
	// 아이디로 회원정보 조회 전담 처리 함수
	public MemberVO getIdInfo(String id) {
		return sqlSession.selectOne("mSQL2.getIdInfo", id);
	}
	
	// 내 정보 수정 데이터베이스 작업 전담 처리함수
	public int editMyInfo(MemberVO2 mVO) {
		return sqlSession.update("mSQL2.editInfo", mVO);
	}
}
