/*
	파일명: AuthenticationService.java
    설명: LoginFailHandler / LoginSuccessHandler 시 계정 인증 관련 비즈니스 로직을 담당하는 Service 
    작성일: 2021-01-03
    작성자: 백희승
*/
package com.olive.authentication.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

import com.olive.authentication.dao.AuthenticationDao;
import com.olive.dto.Emp;

@Service
public class AuthenticationService {

	@Autowired
	private SqlSession sqlsession;

	// [LoginSuccess]
	// 계정 로그인 실패 횟수 초기화
	public void initFailCount(String empno) {
		AuthenticationDao dao = sqlsession.getMapper(AuthenticationDao.class);
		dao.initFailCount(empno);
	}
	
	// [LoginFail] 
	// 계정이 존재하는지 검색
	public Emp selectEmp(String empno) {
		AuthenticationDao dao = sqlsession.getMapper(AuthenticationDao.class);
		return dao.selectEmp(empno);
	}

	// 계정의 로그인 실패 횟수 검색
	public int getFailCount(String empno) {
		AuthenticationDao dao = sqlsession.getMapper(AuthenticationDao.class);
		return dao.getFailCount(empno);
	}

	// 계정의 로그인 실패 횟수 증가
	public void addFailCount(String empno) {
		AuthenticationDao dao = sqlsession.getMapper(AuthenticationDao.class);
		dao.addFailCount(empno);
	}

	// 계정 잠금
	public void disable(String empno) {
		AuthenticationDao dao = sqlsession.getMapper(AuthenticationDao.class);
		dao.disable(empno);
	}
	
}
