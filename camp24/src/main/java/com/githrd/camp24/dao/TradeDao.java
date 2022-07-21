package com.githrd.camp24.dao;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.camp24.util.PageUtil;
import com.githrd.camp24.vo.BoardVO;
import com.githrd.camp24.vo.FileVO;

public class TradeDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 총 게시글 갯수 조회 전담 처리함수
	public int getTotal() {
		return sqlSession.selectOne("tSQL.getTotal");
	}
	
	// 게시글 리스트 조회 전담 처리함수
	public List<BoardVO> getList(PageUtil page){
		return sqlSession.selectList("tSQL.getList", page);
	}
	
	// 게시글 번호로 첨부파일 리스트 조회 전담 처리함수
	public List<FileVO> getFileList(int ino){
		return sqlSession.selectList("tSQL.fileList", ino);
	}
	
	// 게시글 번호로 게시글 정보 조회 전담 처리함수
	public BoardVO getDetail(int tno) {
		return sqlSession.selectOne("tSQL.tradeDetail", tno);
	}
	
	// 이미지 리스트 조회 전담 처리함수
	public List<BoardVO> imgList(){
		return sqlSession.selectList("tSQL.imgList");
	}

	// 회원번호조회 전담 처리함수
	public int getMno(String id) {
		return sqlSession.selectOne("tSQL.selMno", id);
	}
	
	// 게시글 입력 전담 처리함수
	public int addBoard(BoardVO bVO) {
		return sqlSession.insert("tSQL.insertBoard", bVO);
	}
	
	// 첨부파일 정보 입력 전담 처리함수
	public int addFile(FileVO fVO) {
		return sqlSession.insert("tSQL.insertFile", fVO);
	}
	
	// 첨부파일 삭제 전담 처리함수
	public int delFile(int ino) {
		return sqlSession.update("tSQL.delFile", ino);
	}
	
	// 게시글 수정 전담 처리함수
	public int editBoard(BoardVO bVO) {
		return sqlSession.update("tSQL.editBoard", bVO);
	}
	
	// 게시글 삭제 전담 처리함수
	public int delBoard(int tno) {
		return sqlSession.update("tSQL.delBoard", tno);
	}
	
	public List<BoardVO> getCateList(){
		return sqlSession.selectList("tSQL.startCate");
	}
	
	public List<BoardVO> getCateList(BoardVO bVO){
		return sqlSession.selectList("tSQL.cateList", bVO);
	}
	
	public List<FileVO> imagenoList(int tno){
		return sqlSession.selectList("tSQL.imgList2", tno);
	}
	// 상품 리스트 조회 전담 처리함수
		public List<BoardVO> gettradeList(BoardVO bVO){
			return sqlSession.selectList("tSQL.tList", bVO);
		}
		// 조회수 +1
		public int clickUp(int tno) {
			return sqlSession.update("tSQL.clickUp", tno);
		}
	public BoardVO Kakaopay(int tno) {
		return sqlSession.selectOne("tSQL.kakaopay",tno); 
	}
}
