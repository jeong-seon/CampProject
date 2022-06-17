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

@Controller
@RequestMapping("/qnaBoard")
public class QnaBoard {
	@Autowired
	QnaDao qDao;

	@RequestMapping("/qnaBoardList.cmp")
	public ModelAndView freeBoardList(ModelAndView mv, PageUtil page, HttpSession session) {
		int cnt = qDao.getTotal();
		
		page.setPage(cnt);
		
		List<BoardVO> list = qDao.getList(page);
		
		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		
		mv.setViewName("qnaBoard/qnaBoardList");
		return mv;
	}
}
