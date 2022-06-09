package com.githrd.camp24.controller.map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/**
 * 네이버 지도 api 페이지를 보기위한 클래스
 * @author	정선우
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
