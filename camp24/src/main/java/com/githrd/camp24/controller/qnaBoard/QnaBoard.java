package com.githrd.camp24.controller.qnaBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.camp24.dao.QnaDao;
import com.githrd.camp24.util.PageUtil;
import com.githrd.camp24.vo.BoardVO;

/**
 * 
 * 이 클래스는 QnA게시판 관련 요청을 처리할 클래스
 * @author	백서진
 * @since	2022.06.17
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 
 * 				2022.06.17	-	담당자 : 백서진
 * 									클래스 제작, 
 * 									리스트보기 요청 처리
 *
 */


@Controller
@RequestMapping("/qnaBoard")
public class QnaBoard {
	@Autowired
	QnaDao qDao;
	
	// QnA 게시판 리스트보기 요청
	@RequestMapping("/qnaBoardList.cmp")
	public ModelAndView qnaBoardList(ModelAndView mv, PageUtil page, String msg) {
		// 총 게시글 수 가져오기
		int cnt = qDao.getTotal();
		
		// PageUtil 세팅하기
		page.setPage(cnt);
		
		// 리스트 조회하기
		List<BoardVO> list = qDao.getList(page);
		
		if(msg != null) {
			mv.addObject("MSG", msg);
		}
		
		// 데이터 심기
		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		
		// 뷰 정하기
		mv.setViewName("qnaBoard/qnaBoardList");
		
		// 반환하기
		return mv;
	}
	
	// QnA 게시판 글 작성 폼 보기 요청
	@RequestMapping(path="/qnaBoardWrite.cmp", method=RequestMethod.POST, params={"id", "nowPage"})
	public ModelAndView qnaBoardWrite(ModelAndView mv, String id, String nowPage) {
		BoardVO bVO = qDao.getWriterInfo(id);
		// 데이터 심기
		mv.addObject("DATA", bVO);
		
		// 뷰 정하기
		mv.setViewName("qnaBoard/qnaBoardWrite");
		
		// 반환하기
		return mv;
	}
	
	// 댓글 작성 폼 보기 처리함수
	@RequestMapping("/qnaComment.cmp")
	public ModelAndView commentWrite(ModelAndView mv, BoardVO bVO, String nowPage, String vw) {
		bVO = qDao.getCommentData(bVO);
		
		// 데이터 심기
		mv.addObject("DATA", bVO);
		
		// 뷰 정하기
		mv.setViewName("qnaBoard/qnaBoardComment");
		
		// 반환하기
		return mv;
	}

	// QnA 게시판 글 등록 처리 요청
	@Transactional
	@RequestMapping("/qwriteProc.cmp")
	public ModelAndView qwriteProc(ModelAndView mv, String nowPage, BoardVO bVO) {
		int cnt = qDao.addBoard(bVO);
		String view = "/camp24/qnaBoard/qnaBoardList.cmp";
		if(cnt == 0) {
			// 게시글 등록에 실패한 경우 ==> 글쓰기로 돌려보내기
			view = "/camp24/qnaBoard/qnaBoardWrite.cmp";
			bVO.setResult("NO");
		} else {
			// 게시글 등록에 성공한 경우
			nowPage = "1";
			mv.addObject("MSG", "게시글이 등록되었습니다");
			bVO.setResult("OK");
		}
		
		// 데이터 심기
		mv.addObject("VIEW", view);
		mv.addObject("NOWPAGE", nowPage);
		
		// 뷰 정하기
		mv.setViewName("qnaBoard/redirect");
		
		// 반환하기
		return mv;
	}
	
	// 게시글 수정 폼 보기 요청 처리함수
	@RequestMapping("/qnaBoardEdit.cmp")
	public ModelAndView qnaBoardEdit(ModelAndView mv, BoardVO bVO, String nowPage, String vw) {
		bVO = qDao.getEditData(bVO);
		
		// 데이터 심기
		mv.addObject("DATA", bVO);
		
		// 뷰 정하기
		mv.setViewName("qnaBoard/qnaBoardEdit");
		
		// 반환하기
		return mv;
	}
	
	// 게시글 수정 처리 요청 처리함수
	@Transactional
	@RequestMapping("/qnaBoardEditProc.cmp")
	public ModelAndView editProc(ModelAndView mv, BoardVO bVO, String nowPage, String vw) {
		int result = qDao.editProc(bVO);
		
		if(result == 1) {
			// 수정 성공
			mv.addObject("VIEW", "/camp24/qnaBoard/qnaBoardList.cmp");
			mv.addObject("MSG", "게시글이 수정되었습니다");
		} else {
			// 수정 실패
			mv.addObject("VIEW", "/camp24/qnaBoard/qnaBoardEdit.cmp");
		}
		
		// 데이터 심기
		mv.addObject("NOWPAGE", nowPage);
		
		// 뷰 정하기
		mv.setViewName("freeBoard/redirect");
		
		// 반환하기
		return mv;
	}
	
	// 게시글 삭제 요청 처리함수
	@RequestMapping("/qnaBoardDel.cmp")
	public ModelAndView delQBoard(ModelAndView mv, BoardVO bVO, String nowPage, String vw) {
		qDao.delQBoard(bVO);
		
		// 데이터 심기
		mv.addObject("VIEW", vw);
		mv.addObject("NOWPAGE", nowPage);
		
		// 뷰 정하기
		mv.setViewName("qnaBoard/redirect");
		
		// 반환하기
		return mv;
	}
}