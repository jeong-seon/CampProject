package com.githrd.camp24.service;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.githrd.camp24.vo.MemberVO;
import com.githrd.camp24.vo.BoardVO;

@Service
@Aspect
public class LogService {
	private static Logger loginLog = LoggerFactory.getLogger("memberLog");
	private static Logger freeBoardLog = LoggerFactory.getLogger("freeBoardLog");
	private static Logger qnaBoardLog = LoggerFactory.getLogger("qnaBoardLog");
	private static Logger reviewBoardLog = LoggerFactory.getLogger("reviewBoardLog");
	
	@Pointcut("execution(* com.githrd.camp24.controller.login.Member.loginProc(..))")
	public void recordLogin() {
		System.out.println("########### aop start ###########");
	}
	
	@After("recordLogin()")
	public boolean rec(JoinPoint join) {
		MemberVO mVO = (MemberVO) join.getArgs()[1];
		
		if(mVO.getCnt() == 1) {
			loginLog.info(mVO.getId() + " 님 로그인");
		}
		return true;
	}
	
	@Before("execution(* com.githrd.camp24.controller.login.Member.logout(..))")
	public void logoutSetData(JoinPoint join) {
		HttpSession session = (HttpSession) join.getArgs()[1];
		MemberVO mVO = (MemberVO) join.getArgs()[2];
		mVO.setId((String) session.getAttribute("SID"));
	}
	
	@After("execution(* com.githrd.camp24.controller.login.Member.logout(..))")
	public void logoutRecord(JoinPoint join) {
		MemberVO mVO = (MemberVO) join.getArgs()[2];
		String id = mVO.getId();
		String result = mVO.getResult();
		
		if(result != null && result == "OK") {
			loginLog.info(id + " 님 로그아웃");
		}
	}
	
	@After("execution(* com.githrd.camp24.controller.freeBoard.FreeBoard.fwriteProc(..))")
	public void freeBoardLogWrite(JoinPoint join) {
		BoardVO bVO = (BoardVO) join.getArgs()[2];
		String result = bVO.getResult();
		String id = bVO.getId();
		int bno = bVO.getBno();
		
		if(result != null && result.equals("OK")) {
			freeBoardLog.info(id + " 회원님이 [ " + bno + " ] 번 글을 작성했습니다.");
		}
	}
	
	@After("execution(* com.githrd.camp24.controller.qnaBoard.QnaBoard.qwriteProc(..))")
	public void qnaBoardLogWrite(JoinPoint join) {
		BoardVO bVO = (BoardVO) join.getArgs()[2];
		String result = bVO.getResult();
		String id = bVO.getId();
		int bno = bVO.getBno();
		
		if(result != null && result.equals("OK")) {
			qnaBoardLog.info(id + " 회원님이 [ " + bno + " ] 번 글을 작성했습니다.");
		}
	}
	
	@After("execution(* com.githrd.camp24.controller.review.ReviewBoard.reviewBoardWriteProc(..))")
	public void reviewBoardLogWrite(JoinPoint join) {
		BoardVO bVO = (BoardVO) join.getArgs()[1];
		String result = bVO.getResult();
		String id = bVO.getId();
		int rno = bVO.getRno();
		
		if(result != null && result.equals("OK")) {
			reviewBoardLog.info(id + " 회원님이 [ " + rno + " ] 번 글을 작성했습니다.");
		}
	}
}
