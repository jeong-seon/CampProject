package com.githrd.camp24.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.githrd.camp24.dao.UserDao;
import com.githrd.camp24.vo.MemberVO;

@Service("uSrvc")
public class UserService {
	
	@Autowired
	private UserDao uDao;

	public int findId(MemberVO mVO){
		return uDao.findId(mVO);
	}
	
	public MemberVO idResult(MemberVO mVO) {
		return uDao.idResult(mVO);
	}

	public MemberVO findPw(MemberVO mVO) {
		return uDao.findPw(mVO);
	}
	
	public int pwUpdate(MemberVO mVO) {
		return uDao.pwUpdate(mVO);
	}
}
