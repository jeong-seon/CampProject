package com.githrd.camp24.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.camp24.vo.MemberVO;

/**
 * 
 * 	이 클래스는 아이디, 비밀번호 찾기 관련 전담 처리함수들로 구성된 클래스
 * @author	백서진
 * @since	2022.07.13
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 
 * 				2022.07.13	- 담당자 : 백서진
 * 									클래스 제작, 아이디 찾기
 *
 */

public class UserDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 아이디 조회 전담 처리함수
	public int findId(MemberVO mVO) {
		return sqlSession.selectOne("uSQL.findId", mVO);
	}
	
	// 아이디 찾기 전담 처리함수
	public MemberVO idResult(MemberVO mVO) {
		return sqlSession.selectOne("uSQL.idResult", mVO);
	}
	
	// 비밀번호 찾기 전담 처리함수
	public MemberVO findPw(MemberVO mVO) {
		return sqlSession.selectOne("uSQL.selectMember", mVO);
	}
	
	// 비밀번호 수정 전담 처리함수
	public int pwUpdate(MemberVO mVO) {
		return sqlSession.update("uSQL.pwUpdate", mVO);
	}
}
