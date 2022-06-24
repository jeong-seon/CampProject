package com.githrd.camp24.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 회원 관련 요청을 할 때
 * 로그인이 되어있는 경우는
 * 메인페이지로 돌려보내는 작업을 처리할 인터셉터 클래스
 * @author	정선우
 * @since	2022.06.24
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.06.24	-	담당자 : 정선우
 * 									클래스 제작
 */
public class LoginCheckInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler)
			throws Exception {
		if(req.getSession().getAttribute("SID") != null) {
			resp.sendRedirect("/camp24/main.cmp");
			return false;	// 요청처리함수 실행 x
		}
		return true;		// 요청처리함수 실행 o
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
