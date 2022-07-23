package com.githrd.camp24.controller.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.camp24.dao.ApiDao;
import com.githrd.camp24.vo.ApiVO;

/**
 * 캠핑장정보 검색을 위한 클래스
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
@RequestMapping("/board")
public class SearchBoardList {

	@Autowired
	ApiDao aDao;
	
	@RequestMapping("/searchBoardList.cmp")
	public ModelAndView searchBoard(ModelAndView mv, String facltNm) {
        
		mv.setViewName("board/searchBoardList");
		return mv;
	}
	
	@RequestMapping(path="/searchBoardList.cmp", params="facltNm")
	public ModelAndView searchCampName(ModelAndView mv, String facltNm) {
		List<ApiVO> list = aDao.searchCamp(facltNm);
		mv.addObject("LIST", list);
		
		mv.setViewName("board/searchBoardList");
		return mv;
	}
}
