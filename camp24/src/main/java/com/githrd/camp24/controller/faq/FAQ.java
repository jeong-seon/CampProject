package com.githrd.camp24.controller.faq;
/**
 * 
 * @author	김희승
 * @since	2022.06.17
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 
 * 				2022.06.17	-	담당자 : 김희승
 * 									클래스 제작
 * 
 * 				2022.07.07	-	담당자 : 정선우
 * 
 * 									FAQ 수정 및 뷰 변경
 *
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class FAQ {

	@RequestMapping("/faqList.cmp")
	public ModelAndView faqList(ModelAndView mv) {
		mv.setViewName("board/faqList");
		return mv;
	}
}