package com.githrd.camp24.controller.member2;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.githrd.camp24.dao.*;
import com.githrd.camp24.vo.*;

/**
 * 이 클래스는 회원 관련 요청을 처리할 클래스
 * @author	김은선
 * @since	2022.06.27
 * @version	v.1.0
 * 
 * 			작업이력 ]
 
 * 				2022.06.27	-	담당자 : 김은선
 * 									 회원가입/내정보수정 처리
 * 									
 *
 */

@Controller
@RequestMapping("/member")
public class Member2 {

	@Autowired
	MemberDao2 mDao2;
	
	@RequestMapping(path="/idCheck.json", method=RequestMethod.POST, params="id")
	@ResponseBody
	public Map<String, String> idCheck(String id) {
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "NO";
		
		int cnt = mDao2.getIdCnt(id);
		
		if(cnt == 0) {
			result = "OK";
		}
		
		map.put("result", result);
		return map;
	}
	
	// 회원가입 폼보기 요청
	@RequestMapping("/join.cmp")
	public ModelAndView joinForm(ModelAndView mv, RedirectView rv) {
	
		List<MemberVO2> list = mDao2.getAvtList();
	
		// 데이터 심고
		mv.addObject("LIST", list);
		mv.setViewName("member/join");
		return mv;
	}
	
	// 회원가입 처리요청
	@RequestMapping(path="/joinProc.cmp", method=RequestMethod.POST)
	public ModelAndView joinProc(MemberVO2 mVO, ModelAndView mv, 
								RedirectView rv, HttpSession session) {
		//System.out.println("########### before mno : " + mVO.getMno());
		int cnt = mDao2.addMember(mVO);
		//System.out.println("########### after mno : " + mVO.getMno());
		
		if(cnt == 1) {
			// 성공한 경우
			session.setAttribute("SID", mVO.getId());
			session.setAttribute("MSG_CHECK", "OK");
			rv.setUrl("/camp24/main.cmp");
		} else {
			rv.setUrl("/camp24/member/join.cmp");
		}
		
		mv.setView(rv);
		
		return mv;
	}
	
	// 회원정보 수정 폼보기 요청 처리함수
	@RequestMapping("/myInfoEdit.cmp")
	public ModelAndView myInfoEdit(ModelAndView mv, String id, HttpSession session, RedirectView rv) {
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/camp24/member/login.cmp");
			mv.setView(rv);
			return mv;
		}
		
		if(!id.equals(sid)) {
			rv.setUrl("/camp24/main.cmp");
			mv.setView(rv);
			return mv;
		}
		
		// 데이터베이스 조회
		MemberVO mVO = mDao2.getIdInfo(id);
		List<MemberVO2> list = mDao2.getAvtList(id);
		mv.addObject("DATA", mVO);
		mv.addObject("LIST", list);
		// 뷰 정하고
		mv.setViewName("member/editInfo");
		return mv;
	}
	
	// 내정보 수정 처리요청 처리 함수
	@RequestMapping("/infoEditProc.cmp")
	public ModelAndView infoEditProc(ModelAndView mv, MemberVO2 mVO, RedirectView rv) {
		int cnt = mDao2.editMyInfo(mVO);
		String view = "member/redirect";
		if(cnt == 0) {
			mv.addObject("VIEW", "/camp24/member/myInfoEdit.cmp");
		} else {
			mv.addObject("VIEW", "/camp24/member/myInfo.cmp");
		}
		
		mv.setViewName(view);
		return mv;
	}
}
