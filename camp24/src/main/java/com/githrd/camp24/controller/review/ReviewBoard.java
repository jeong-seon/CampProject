package com.githrd.camp24.controller.review;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.camp24.dao.ReviewDao;
import com.githrd.camp24.service.ReviewBoardService;
import com.githrd.camp24.util.PageUtil;
import com.githrd.camp24.vo.BoardVO;
import com.githrd.camp24.vo.FileVO;

/**
 * 이 클래스는 리뷰게시판 관련 요청을 처리할 클래스
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

@Controller
@RequestMapping("/reviewBoard")
public class ReviewBoard {
	@Autowired
	ReviewDao rDao;
	
	@Autowired
	ReviewBoardService rSrvc;
	
	@RequestMapping("/reviewBoardList.cmp")
	public ModelAndView reviewBoardList(ModelAndView mv, PageUtil page, HttpSession session) {
		int total = rDao.getTotal();
		page.setPage(total);
		List<BoardVO> list = rDao.getList(page);
		List<BoardVO> image = rDao.imgList();
		
		mv.addObject("LIST", list);
		mv.addObject("IMAGE", image);
		mv.addObject("PAGE", page);
		mv.setViewName("board/reviewBoardList");
		return mv;
	}
	@RequestMapping(path="/reviewBoardList.cmp", params="cname")
	public ModelAndView reviewBoardList(ModelAndView mv, PageUtil page, HttpSession session, BoardVO bVO, String cname) {
		int total = rDao.getTotal();
		page.setPage(total);
		List<BoardVO> list = rDao.searchCname(bVO);
		List<BoardVO> image = rDao.imgList();
		
		mv.addObject("LIST", list);
		mv.addObject("IMAGE", image);
		mv.addObject("PAGE", page);
		mv.setViewName("board/reviewBoardList");
		return mv;
	}
	
	@RequestMapping("/reviewBoardWrite.cmp")
	public ModelAndView reviewBoardWrite(ModelAndView mv, HttpSession session) {
		List<BoardVO> image = rDao.imgList();
		
		String id = (String) session.getAttribute("SID");
		BoardVO bVO = rDao.getWriterInfo(id);
		mv.addObject("IMAGE", image);
		mv.addObject("DATA", bVO);
		mv.setViewName("board/reviewBoardWrite");
		return mv;
	}
	
	@RequestMapping(path="/reviewBoardEdit.cmp", method=RequestMethod.POST, params= {"nowPage", "rno"})
	public ModelAndView reviewBoardEdit(ModelAndView mv, BoardVO bVO, FileVO fVO, HttpSession session) {
		bVO = rDao.getDetail(bVO.getRno());
		List<FileVO> image = rDao.imagenoList(bVO.getRno());
		mv.addObject("IMAGE", image);
		mv.addObject("DATA", bVO);
		mv.setViewName("board/reviewBoardEdit");
		return mv;
	}
	
	// 첨부파일 삭제 요청 처리함수
	@RequestMapping(path="/fileDel.json", method=RequestMethod.POST, params="ino")
	@ResponseBody
	public HashMap<String, String> fileDel(FileVO fVO){
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "OK";
		int cnt = rDao.delFile(fVO.getIno());
		if(cnt != 1) {
			result = "NO";
		}
		map.put("result", result);
		return map;
	}
	
	// 게시글 수정 요청 처리함수
	@RequestMapping("/reviewBoardEditProc.cmp")
	public ModelAndView boardEditProc(ModelAndView mv, BoardVO bVO, String nowPage) {
		String view = "/camp24/reviewBoard/reviewBoardDetail.cmp";
		try {
			rSrvc.editBoard(bVO);
		} catch(Exception e) {
			e.printStackTrace();
			view = "/camp24/reviewBoard/reviewBoardEdit.cmp";
		}
		mv.addObject("VIEW", view);
		mv.addObject("NOWPAGE", nowPage);
		mv.setViewName("board/redirect");
		return mv;
	}
	
	@RequestMapping("/reviewBoardWriteProc.cmp")
	public ModelAndView reviewBoardWriteProc(ModelAndView mv, BoardVO bVO, String nowPage) {
		String view = "/camp24/reviewBoard/reviewBoardList.cmp";
		try {
			rSrvc.addBoardData(bVO);
			// 정상등록 성공
			bVO.setResult("OK");
			nowPage = "1";
		} catch (Exception e) {
			bVO.setResult("NO");
			view = "/camp24/reviewBoard/reviewBoardWrite.cmp";
			e.printStackTrace();
		}
		mv.addObject("NOWPAGE", nowPage);
		mv.addObject("VIEW", view);
		mv.setViewName("board/redirect");
		return mv;
	}
	
	@RequestMapping("/reviewBoardDetail.cmp")
	public ModelAndView reviewBoardDetail(ModelAndView mv, BoardVO bVO) {
		List<BoardVO> image = rDao.imgList();
		
		int cnt = rSrvc.click(bVO.getRno());
		
		if(cnt == 1) {
			bVO = rDao.getDetail(bVO.getRno());
		}
		mv.addObject("DATA", bVO);
		mv.addObject("IMAGE", image);
		mv.setViewName("board/reviewBoardDetail");
		return mv;
	}
	
	// 게시글 삭제 요청 처리함수
	@RequestMapping("/reviewBoardDelete.cmp")
	public ModelAndView delBoard(ModelAndView mv, BoardVO bVO, String nowPage) {
		int cnt = rDao.delBoard(bVO.getRno());
		String view = "/camp24/reviewBoard/reviewBoardList.cmp";
		if(cnt != 1) {
			view = "/camp24/reviewBoard/reviewBoardList.cmp";				
		}
		mv.addObject("VIEW", view);
		mv.addObject("NOWPAGE", nowPage);
		mv.setViewName("board/redirect");
		return mv;
	}
	
	@Transactional
	@RequestMapping("/likeCnt.json")
	@ResponseBody
	public int updateLike(BoardVO bVO){
	
		int likeCheck = rSrvc.likeCheck(bVO);
		if(likeCheck == 0) {
			//좋아요 처음누름
			rSrvc.insertLike(bVO); //like테이블 삽입
			rSrvc.updateLike(bVO);	//게시판테이블 +1
			rSrvc.updateLikeCheck(bVO);//like테이블 구분자 1
		}else if(likeCheck == 1) {
			rSrvc.updateLikeCheckCancel(bVO); //like테이블 구분자0
            rSrvc.updateLikeCancel(bVO); //게시판테이블 - 1
			rSrvc.deleteLike(bVO); //like테이블 삭제
		}
		return likeCheck;
	}
	
	
	
	@RequestMapping("/searchList.json")
	@ResponseBody
	public List<BoardVO> searchCname(BoardVO bVO) {
		List<BoardVO> list = rDao.searchCname(bVO);
		return list;
	}
}
