package com.githrd.camp24.controller.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.camp24.dao.ReviewDao;
import com.githrd.camp24.util.PageUtil;
import com.githrd.camp24.vo.BoardVO;

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
	
	@RequestMapping("/reviewBoardWrite.cmp")
	public ModelAndView reviewBoardWrite(ModelAndView mv) {
		mv.setViewName("board/reviewBoardWrite");
		return mv;
	}
}
