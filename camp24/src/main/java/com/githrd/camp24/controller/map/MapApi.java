package com.githrd.camp24.controller.map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/**
 * 네이버지도를 보기위한 클래스
 * @author	정선우
 * @since	2022.07.14
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				
 * 				2022.07.14	-	담당자 : 정선우
 * 									클래스 제작
 *
 */

@Controller
@RequestMapping("/map")
public class MapApi {
	
	@RequestMapping("/mapApi.cmp")
	public ModelAndView mapApi(ModelAndView mv) {
		
		
		mv.setViewName("map/mapApi");
		return mv;
	}
	
	
}
