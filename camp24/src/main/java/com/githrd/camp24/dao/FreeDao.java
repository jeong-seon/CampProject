package com.githrd.camp24.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.camp24.util.PageUtil;
import com.githrd.camp24.vo.BoardVO;

/**
 * 
 * 	이 클래스는 자유게시판 관련 데이터베이스 전담 처리함수들로 구성된 클래스
 * @author	백서진
 * @since	2022.06.17
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 
 * 				2022.06.17	- 담당자 : 백서진
 * 									클래스 제작, 리스트 조회
 *
 */

public class FreeDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 총 게시글 수 조회 전담 처리함수
	public int getTotal() {
		return sqlSession.selectOne("fSQL.total");
	}
	
	// 자유게시판 리스트 폼 보기 요청 전담 처리함수
	public List<BoardVO> getList(PageUtil page){
		return sqlSession.selectList("fSQL.freeList", page);
	}
	
	// 작성자 데이터 조회 전담 처리함수
	public BoardVO getWriterInfo(String id) {
		return sqlSession.selectOne("fSQL.getWriteInfo", id);
	}
	
	// 댓글 폼 데이터 조회 전담 처리함수
	public BoardVO getCommentData(BoardVO bVO) {
		return sqlSession.selectOne("fSQL.commentData", bVO);
	}
		
	// 게시글 추가 데이터베이스 작업 전담 처리함수 (댓글 포함)
	public int addBoard(BoardVO bVO) {
		return sqlSession.insert("fSQL.addBoard", bVO);
	}
	
	// 게시글 수정데이터 조회 전담 처리함수
	public BoardVO getEditData(BoardVO bVO) {
		return sqlSession.selectOne("fSQL.editData", bVO);
	}
	
	// 게시글 수정 등록 전담 처리함수
	public int editProc(BoardVO bVO) {
		return sqlSession.update("fSQL.editFBoard", bVO);
	}
	
	// 게시글 삭제 처리 전담함수
	public int delFBoard(BoardVO bVO) {
		return sqlSession.update("fSQL.delFBoard", bVO);
	}
	
}
