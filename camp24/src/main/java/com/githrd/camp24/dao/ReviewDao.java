package com.githrd.camp24.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.camp24.util.PageUtil;
import com.githrd.camp24.vo.BoardVO;
import com.githrd.camp24.vo.FileVO;

/**
 * 이 클래스는 리뷰게시판 관련 데이터베이스 전담 처리함수들로 구성된 클래스
 * @author	정선우
 * @since	2022.06.22
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 
 * 				2022.06.22	-	담당자 : 정선우
 * 									클래스 제작
 *
 */
public class ReviewDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 총 게시글 수 조회 전담 처리함수
	public int getTotal() {
		return sqlSession.selectOne("rSQL.getTotal");
	}
	// 게시글 리스트 조회 전담 처리함수
	public List<BoardVO> getList(PageUtil page){
		return sqlSession.selectList("rSQL.getList", page);
	}
	// 이미지 리스트 조회 전담 처리함수
	public List<BoardVO> imgList(){
		return sqlSession.selectList("rSQL.imgList");
	}
	// 게시글 번호로 게시글 정보 상세보기 전담 처리함수
	public BoardVO getDetail(int rno) {
		return sqlSession.selectOne("rSQL.reviewDetail", rno);
	}
	// 리뷰 등록 전담 처리함수
	public int addReview(BoardVO bVO) {
		return sqlSession.insert("rSQL.insertReview", bVO);
	}
	// 첨부파일 정보 입력 전담 처리함수
	public int addFile(FileVO fVO) {
		return sqlSession.insert("rSQL.insertImage", fVO);
	}
	// 첨부파일 삭제 전담 처리함수
	public int delFile(int ino) {
		return sqlSession.update("rSQL.delFile", ino);
	}
	// 게시글 수정 전담 처리함수
	public int editBoard(BoardVO bVO) {
		return sqlSession.update("rSQL.editBoard", bVO);
	}
	// 게시글 삭제 전담 처리함수
	public int delBoard(int rno) {
		return sqlSession.update("rSQL.delBoard", rno);
	}
}
