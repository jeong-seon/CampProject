package com.githrd.camp24.controller.login;
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
	
	
	@RequestMapping("/loginProc.cmp")
	public ModelAndView loginProc(ModelAndView mv, MemberVO mVO, String id, String pw, HttpSession session) {
		
		int cnt = mDao.getLogin(mVO);
		mVO.setCnt(cnt);
		String view = "";
		if(cnt == 1) {
			session.setAttribute("SID", mVO.getId());
			session.setAttribute("MSG_CHECK", "OK");
			view = "redirect:../main.cmp";
		} else {
			view = "redirect:login.cmp";
		}
		mv.setViewName(view);
		return mv;
	}

	@RequestMapping("/logout.cmp")
	public ModelAndView logout(ModelAndView mv, HttpSession session, MemberVO mVO, String vw, String nowPage) {
		session.removeAttribute("SID");
		mVO.setResult("OK");
		
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
	
	@RequestMapping("/myInfo.cmp")
	public ModelAndView myInfo(ModelAndView mv, String id) {
		// 데이터 가져오고
		MemberVO mVO = mDao.getIdInfo(id);
		// 뷰에 데이터 심고
		mv.addObject("DATA" , mVO);
		// 뷰 정하고
		mv.setViewName("member/memberInfo");
		
		return mv;
	}
	
	@RequestMapping("/delMember.cmp")
	public ModelAndView delMember(ModelAndView mv, String id, RedirectView rv, HttpSession session) {
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/camp24/member/login.cmp");
			mv.setView(rv);
			return mv;
		}
		 
		if(!id.equals(sid)) {
			rv.setUrl("/camp24/member/myInfo.cmp");
			mv.setView(rv);
			return mv;
		}
		
		int cnt = mDao.delMember(id);
		
		if(cnt == 1) {
			// 세션에 기억시켜둔 데이터를 삭제하고
			session.removeAttribute("SID");
			rv.setUrl("/camp24/");
		} else {
			rv.setUrl("/camp24/member/myInfo.cmp");
		}
		
		mv.setView(rv);
		return mv;
	} 
}