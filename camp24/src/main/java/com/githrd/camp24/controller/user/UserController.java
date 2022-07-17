package com.githrd.camp24.controller.user;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.camp24.service.UserService;
import com.githrd.camp24.vo.MemberVO;

@Controller
@RequestMapping("/user")
public class UserController {
	private static final Logger mailLog = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService uSrvc;
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 아이디 찾기
	@RequestMapping(path="/find_id.cmp", method=RequestMethod.POST)
	public ModelAndView findIdAction(ModelAndView mv, MemberVO mVO) {
		int cnt = uSrvc.findId(mVO);
		
		
		if(cnt == 0) {
			mv.addObject("check", 1);
		} else {
			mv.addObject("check", 0);
			mVO = uSrvc.idResult(mVO);
			mv.addObject("id", mVO.getId());
		}
		mv.setViewName("user/findId");
		return mv;
	}
	
	
	// 비밀번호 찾기 인증번호 발송
	@RequestMapping(path="/pw_auth.cmp")
	public ModelAndView pw_auth(ModelAndView mv, String id, String mail, MemberVO mVO, HttpSession session) {
		mVO = uSrvc.findPw(mVO);
		
		if(mVO.getMail().equals(mail)) {
			
			Random r = new Random();
			int num = r.nextInt(888888) + 111111;
			
			
			String setFrom = "camp24page@gmail.com";
			String toMail = mail;
			String title = "[ CAMP24 비밀번호 인증 이메일입니다 ]";
			String content = "CAMP24 홈페이지를 방문해주셔서 감사합니다." +
							"<br><br>" +
							"인증 번호는 " + num + " 입니다." +
							"<br>" +
							"해당 인증번호를 인증번호 확인란에 입력해 주세요.";
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content, true);
				mailSender.send(message);
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			String snum = Integer.toString(num);
			session.setAttribute("NUM", snum);
		}
		mv.setViewName("user/pw_auth");
		return mv;
	}
	
	
	// 아이디 찾기 페이지로 이동
	@RequestMapping("/find_id_form.cmp")
	public ModelAndView findIdView(ModelAndView mv) {
		mv.setViewName("user/findId");
		return mv;
	}

	
	// 비밀번호 찾기 페이지로 이동
	@RequestMapping("/find_pw_form.cmp")
	public ModelAndView findPwView(ModelAndView mv) {
		mv.setViewName("user/findPw");
		return mv;
	}
	
	@RequestMapping(path="/pw_set.cmp", method=RequestMethod.POST)
	public ModelAndView pw_set(ModelAndView mv, String num, String mail, String authNum) {
		
		if(authNum.equals(num)) {
			mv.setViewName("user/pw_new");
		} else {
			mv.setViewName("user/pw_auth");
		}
		
		return mv;
	}
	
	// 비밀번호 업데이트
	@RequestMapping(path="/pw_new.cmp", method=RequestMethod.POST)
	public ModelAndView pw_new(ModelAndView mv, MemberVO mVO, String pw, String mail, HttpSession session) {
		System.out.println(mVO);
		
		int cnt = uSrvc.pwUpdate(mVO);
		System.out.println(mVO);
		
		if(cnt == 1) {
			mv.setViewName("member/login");
		} else {
			mv.setViewName("user/pw_new");
		}
		
		return mv;
	}
}
