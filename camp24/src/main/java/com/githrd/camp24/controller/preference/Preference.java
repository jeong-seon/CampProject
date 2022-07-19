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
/*	
	@RequestMapping("/surveyInfo.cmp")
	public ModelAndView surveyInfo(ModelAndView mv, SurveyVO sVO) {
		List<SurveyVO> list = sDao.getIngList(sVO.getId());
		List<SurveyVO> old = sDao.getOldList();
		
		// 데이터심고
		mv.addObject("ING", list);
		mv.addObject("OLD", old);
		
		// 뷰 정하고
		mv.setViewName("survey/surveyInfo");
		return mv;
	}
*/	
	/**
	 * 설문조사 폼보기 요청 처리함수
	 */
	@RequestMapping("/preference.cmp")
	public ModelAndView preferenceform(ModelAndView mv, RedirectView rv) {
		List<PreferenceVO> list = pDao.getMenuList();
		
		// 데이터 심고
		mv.addObject("LIST", list);
		System.out.println("list : " + list);
		// 뷰 설정
		mv.setViewName("preference/preference");
		return mv;
	}
	
	// 선호도조사 처리요청
	@RequestMapping(path="/preferenceProc.cmp", method=RequestMethod.POST)
	public ModelAndView joinProc(PreferenceVO pVO, ModelAndView mv, 
								RedirectView rv, HttpSession session) {
		int cnt = pDao.addPreference(pVO);
		
		if(cnt == 1) {
			// 성공한 경우
			session.setAttribute("SID", pVO.getId());
			session.setAttribute("MSG_CHECK", "OK");
			rv.setUrl("/camp24/");
		} else {
			rv.setUrl("/camp24/preference/preference.cmp");
		}
		
		mv.setView(rv);
		
		return mv;
	}
/*	
	@RequestMapping("/survey.cmp")
	public ModelAndView survey(ModelAndView mv, SurveyVO sVO) {
		
//		sSrvc.setBogi(sVO);
		sSrvc.settingList(sVO);
		
		// 데이터 심고
		mv.addObject("DATA", sVO);
		
		// 뷰 설정
		mv.setViewName("survey/prefersurvey");
		return mv;
	}
*/	
	/**
	 * 설문조사 응답 처리 요청 처리함수
	 */
/*
	@RequestMapping("/surveyProc.cmp")
	public ModelAndView surveyProc(ModelAndView mv, SurveyVO sVO) {
*/
		/*
		for(int no : sVO.getDap()) {
			System.out.println("qno : " + no);
		}
		*/
/*
		boolean bool = sSrvc.applyTx(sVO);
		
		String view = "/camp24/survey/surveyResult.cmp";
		
		if(!bool) {
			// 실패한 작업이 있는 경우
			view = "/camp24/survey/survey.cmp";
		} else {
			sLog.info(sVO.getId() + " 님이 [ " + sVO.getSino() + " ] 번 설문에 참여 완료했습니다.");
		}
		
		// 데이터심고
		mv.addObject("VIEW", view);
		
		// 뷰 정하고
		mv.setViewName("survey/redirect");
		return mv;
	}
	
	// 설문 결과페이지 폼보기 요청
	@RequestMapping("/surveyResult.cmp")
	public ModelAndView surveyResult(ModelAndView mv, SurveyVO sVO) {
//		sSrvc.resultService(sVO);
//		sSrvc.getResult(sVO);
		sSrvc.setMunhangList(sVO);
		
		// 위의 함수 호출로 인해서  sVO의 변수에 변화가 생겼으므로 그냥 심어주면 된다.
		// 데이터 심고
		mv.addObject("DATA", sVO);
		
		mv.setViewName("survey/surveyResult");
		return mv;
	}
*/
}
