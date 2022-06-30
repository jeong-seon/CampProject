package com.githrd.camp24.controller.freeBoard;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.githrd.camp24.dao.FreeDao;
import com.githrd.camp24.util.PageUtil;
import com.githrd.camp24.vo.BoardVO;

/**
 * 
 * 이 클래스는 자유게시판 관련 요청을 처리할 클래스
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
@RequestMapping("/freeBoard")
public class FreeBoard {
	@Autowired
	FreeDao fDao;
	
	// 자유게시판 리스트보기 요청
	@RequestMapping("/freeBoardList.cmp")
	public ModelAndView freeBoardList(ModelAndView mv, PageUtil page, String msg) {
		int cnt = fDao.getTotal();
		
		// PageUtil 세팅하기
		page.setPage(cnt);
		
		// 리스트 조회하기
		List<BoardVO> list = fDao.getList(page);
		
		if(msg != null) {
			mv.addObject("MSG", msg);
		}
		
		// 데이터 심기
		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		
		// 뷰 정하기
		mv.setViewName("freeBoard/freeBoardList");
		
		// 반환하기
		return mv;
	}
	
	// 자유게시판 글 작성 폼 보기 요청
	@RequestMapping(path="/freeBoardWrite.cmp", method=RequestMethod.POST, params={"id", "nowPage"})
	public ModelAndView freeBoardWrite(ModelAndView mv, String id, String nowPage, HttpSession session, RedirectView rv) {
		BoardVO bVO = fDao.getWriterInfo(id);
		
		// 데이터 심기
		mv.addObject("DATA", bVO);
		
		// 뷰 정하기
		mv.setViewName("freeBoard/freeBoardWrite");
		
		// 반환하기
		return mv;
	}
	
	// 댓글 작성 폼 보기 처리함수
	@RequestMapping("/freeComment.cmp")
	public ModelAndView commentWrite(ModelAndView mv, BoardVO bVO, String nowPage, String vw) {
		bVO = fDao.getCommentData(bVO);
		
		// 데이터 심기
		mv.addObject("DATA", bVO);
		
		// 뷰 정하기
		mv.setViewName("freeBoard/freeBoardComment");
		
		// 반환하기
		return mv;
	}
	
	// 자유게시판 글 등록 처리 요청
	@Transactional
	@RequestMapping("/fwriteProc.cmp")
	public ModelAndView fwriteProc(ModelAndView mv, String nowPage, BoardVO bVO) {
		int cnt = fDao.addBoard(bVO);
		String view = "/camp24/freeBoard/freeBoardList.cmp";
		if(cnt == 0) {
			// 게시글 등록에 실패한 경우 ==> 글쓰기로 돌려보내기
			view = "/camp24/freeBoard/freeBoardWrite.cmp";
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
		mv.setViewName("freeBoard/redirect");
		
		// 반환하기
		return mv;
	}
	
	// 게시글 수정 폼 보기 요청 처리함수
	@RequestMapping("/freeBoardEdit.cmp")
	public ModelAndView freeBoardEdit(ModelAndView mv, BoardVO bVO, String nowPage, String vw) {
		bVO = fDao.getEditData(bVO);
		
		mv.addObject("DATA", bVO);
		mv.setViewName("freeBoard/freeBoardEdit");
		return mv;
	}
		
	// 게시글 수정 처리 요청 처리함수
	@Transactional
	@RequestMapping("/freeBoardEditProc.cmp")
	public ModelAndView editProc(ModelAndView mv, BoardVO bVO, String nowPage, String vw) {
		int result = fDao.editProc(bVO);
		
		if(result == 1) {
			// 수정 성공
			mv.addObject("VIEW", "/camp24/freeBoard/freeBoardList.cmp");
			mv.addObject("MSG", "게시글이 수정되었습니다");
		} else {
			// 수정 실패
			mv.addObject("VIEW", "/camp24/freeBoard/freeBoardEdit.cmp");
		}
		// 데이터 심기
		mv.addObject("NOWPAGE", nowPage);
		
		// 뷰 정하기
		mv.setViewName("freeBoard/redirect");
		
		// 반환하기
		return mv;
	}
		
	// 게시글 삭제 요청 처리함수
	@RequestMapping("/freeBoardDel.cmp")
	public ModelAndView delFBoard(ModelAndView mv, BoardVO bVO, String nowPage, String vw) {
		fDao.delFBoard(bVO);
		
		// 데이터 심기
		mv.addObject("VIEW", vw);
		mv.addObject("NOWPAGE", nowPage);
		
		// 뷰 정하기
		mv.setViewName("freeBoard/redirect");
		
		// 반환하기
		return mv;
	}
}
