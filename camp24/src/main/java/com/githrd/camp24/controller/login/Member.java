package com.githrd.camp24.controller.login;
/**
 * 이 클래스는 자유게시판 관련 요청을 처리할 클래스
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
public class Member {

	@Autowired
	MemberDao mDao;
	
	@RequestMapping("/login.cmp")
	public ModelAndView loginForm(ModelAndView mv, HttpSession session) {
		mv.setViewName("member/login");
		return mv;
	}
	@RequestMapping(path="/login.cmp", params={"vw", "nowPage"})
	public ModelAndView loginForm(ModelAndView mv, HttpSession session, String vw, String nowPage) {
		mv.setViewName("member/login");
		return mv;
	}
	
	
	@RequestMapping(path="/loginProc.cmp")
	public ModelAndView loginProc(String id, String pw, MemberVO mVO, HttpSession session, ModelAndView mv) {
		
		int cnt = mDao.getLogin(mVO);
		String view = "";
		if(cnt == 1) {
			session.setAttribute("SID", mVO.getId());
			view = "redirect:../main.cmp";
		} else {
			view = "redirect:login.cmp";
		}
		mv.setViewName(view);
		return mv;
	}

	@RequestMapping("/logout.cmp")
	public ModelAndView logout(ModelAndView mv, HttpSession session, String vw, String nowPage) {
		String sid = (String) session.getAttribute("SID");
		session.removeAttribute("SID");
		
		if(vw == null) {
			vw = "/camp24/";
		}
		
		if(nowPage != null) {
			mv.addObject("NOWPAGE", nowPage);
		}
		
		mv.addObject("VIEW", vw);
		
		mv.setViewName("redirect:../main.cmp");
		return mv;
	}
}