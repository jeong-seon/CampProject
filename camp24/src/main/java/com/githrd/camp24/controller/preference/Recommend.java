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
 * @since	2022.07.22
 * @version	v.1.0
 * 
 * 			작업이력 ]
 
 * 				2022.07.22	-	담당자 : 김은선
 * 									 캠핑장 추천 처리
 * 									
 *
 */

@Controller
@RequestMapping("recommendapi")
public class Recommend {
	
	private static final Logger preferenceLog = LoggerFactory.getLogger(Preference.class);
	private static final Logger pLog = LoggerFactory.getLogger("preferenceLog");
	@Autowired
	RecommendDao rcDao;
	
	@Autowired
	PreferenceDao pDao;

	/**
	 * 추천 폼보기 요청 처리함수
	 */
	@RequestMapping("/recommendApi.cmp")
	public ModelAndView preferenceform(ModelAndView mv, RedirectView rv, PreferenceVO pVO) {
		pVO = pDao.getPreferenceList(pVO.getId());
		
		List<RecommendVO> rclist = rcDao.getRecommend(pVO);
		
		// 데이터 심고
		mv.addObject("RCLIST", rclist);
		// 뷰 설정
		mv.setViewName("preference/recommend");
		return mv;
	}
}