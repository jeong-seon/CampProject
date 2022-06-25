package com.githrd.camp24.controller.myinfo;
/**

 * @author	김희승

 * @since	2022.06.19
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 
 * 				2022.06.17	-	담당자 : 김희승
 * 				
 * 									마이페이지
 *
 */




import java.util.*;


import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.*;

import com.githrd.camp24.dao.*;
import com.githrd.camp24.vo.*;


@Controller
@RequestMapping("/member")
public class Myinfo {
	
	@Autowired
	MemberDao mDao;
	
	@RequestMapping("/myInfo.cmp")
	public ModelAndView myInfo(ModelAndView mv, String id) {
		// 데이터 가져오고
		MemberVO mVO = mDao.getIdInfo(id);
		// 뷰에 데이터 심고
		mv.addObject("DATA" , mVO);
		// 뷰 정하고
		mv.setViewName("member/MyInfo");
		
		return mv;
	}
}