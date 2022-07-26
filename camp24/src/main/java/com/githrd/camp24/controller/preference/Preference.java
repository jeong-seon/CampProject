package com.githrd.camp24.controller.preference;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.githrd.camp24.dao.*;
import com.githrd.camp24.vo.*;

/**
 * 이 클래스는 회원 관련 요청을 처리할 클래스
 * @author	김은선
 * @since	2022.06.30
 * @version	v.1.0
 * 
 * 			작업이력 ]
 
 * 				2022.06.30	-	담당자 : 김은선
 * 									 선호도조사 처리
 * 									
 *
 */

@Controller
@RequestMapping("/preference")
public class Preference {
	
	private static final Logger preferenceLog = LoggerFactory.getLogger(Preference.class);
	private static final Logger pLog = LoggerFactory.getLogger("preferenceLog");
	@Autowired
	PreferenceDao pDao;

	/**
	 * 선호도조사 폼보기 요청 처리함수
	 */
	@RequestMapping("/preference.cmp")
	public ModelAndView preferenceform(ModelAndView mv, RedirectView rv) {
		List<PreferenceVO> list = pDao.getMenuList();
		
		// 데이터 심고
		mv.addObject("LIST", list);
		
		// 뷰 설정
		mv.setViewName("preference/preference");
		return mv;
	}
	
	// 선호도조사 처리요청
	@RequestMapping(path="/preferenceProc.cmp", method=RequestMethod.POST)
	public ModelAndView joinProc(PreferenceVO pVO, ModelAndView mv, 
								RedirectView rv, HttpSession session) {
		List<PreferenceVO> list = pDao.getMenuList();
		
		// 데이터 심고
		mv.addObject("LIST", list);
		int cnt = pDao.addPreference(pVO);
		if(cnt == 1) {
			// 성공한 경우
			session.setAttribute("SID", pVO.getId());
			session.setAttribute("MSG_CHECK", "OK");
			rv.setUrl("/camp24/recommendapi/recommendApi.cmp");
		} else {
			rv.setUrl("/camp24/preference/preference.cmp");
		}
		
		mv.setView(rv);
		
		return mv;
	}

}
