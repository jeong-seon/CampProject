package com.githrd.camp24.qnaBoard;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.camp24.dao.QnaDao;
import com.githrd.camp24.util.PageUtil;
import com.githrd.camp24.vo.BoardVO;

/**
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

	@RequestMapping("/qnaBoardList.cmp")
	public ModelAndView qnaBoardList(ModelAndView mv, PageUtil page, HttpSession session) {
		int cnt = qDao.getTotal();
		
		page.setPage(cnt);
		
		List<BoardVO> list = qDao.getList(page);
		
		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		
		mv.setViewName("qnaBoard/qnaBoardList");
		return mv;
	}
}
