package com.githrd.camp24.controller.faq;
/**

 * @author	김희승

 * @since	2022.06.19
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 
 * 				2022.06.17	-	담당자 : 김희승
 * 				
 * 									로그인처리 로그아웃 처리
 *
 */




import java.util.*;


import javax.servlet.http.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.camp24.util.PageUtil;
import com.githrd.camp24.vo.*;

@Controller
@RequestMapping("/board")
public class faqList {

	@RequestMapping("/faqList.cmp")
	public ModelAndView faqList(ModelAndView mv, HttpSession session) {
		mv.setViewName("board/faqList");
		return mv;
	}
}