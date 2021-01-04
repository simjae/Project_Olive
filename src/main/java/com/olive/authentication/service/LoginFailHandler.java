/*
	파일명: LoginFailHandler.java
    설명: 기존 Spring Security 사용한 로그인 시 default Login fail Handler에 로직을 추가하기 위해 커스텀한 Class
    작성일: 2021-01-03
    작성자: 백희승
*/
package com.olive.authentication.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

@Service
public class LoginFailHandler implements AuthenticationFailureHandler {
/*	
	>> 로그인 실패 시 Security는 Provider가 throw한 exception을 여기 fail Handler로 전달한다.
    
    ----Fail Handler가 받는 예외 종류----
    [ (타입 = AuthenticationException), (Class Library = org.springframework.security.authentication.*) ]
     
    - AuthenticationServiceException : 	select 결과 null 값을 리턴했을 경우
    - BadCredentialException : 			UsernameNotFoundException 예외를 Throw
     						  			UserDetails 객체를 리턴했으나, ID 또는 PWD가 틀림.
    - LockedException : 				UserDetails 객체의 isAccountNonLocked() 메소드의 리턴값이 false
	- DisabledException : 				UserDetails 객체의 isEnabled() 메소드의 리턴값이 false
	- AccountExpiredException : 		UserDetails 객체의 isAccountNonExpired() 메소드의 리턴값이 false
	- CredentialExpiredException : 		UserDetails 객체의 isCredentialsNonExpired() 메소드의 리턴값이 false
*/
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		// EMP 테이블 상에 존재하지 않는 사번으로 로그인 했을 경우
		if (exception instanceof AuthenticationServiceException) {
			System.out.println("" + exception.getMessage());
			request.setAttribute("loginFailMsg", "존재하지 않는 사원입니다.");
		
		// 아이디가 존재하나 비밀번호가 일치하지 않을 경우의 예외는 BadCredentialsException,
		// 존재하지 않는 사번일 때 예외는 InternalAuthenticationServiceException 이나,
		// 두 가지를 분리해 예외를 던질 경우 보안성이 낮아진다.
		} else if(exception instanceof BadCredentialsException) {
			request.setAttribute("loginFailMsg", "아이디 또는 비밀번호가 틀립니다.");
			
		} else if(exception instanceof LockedException) {
			request.setAttribute("loginFailMsg", "잠긴 계정입니다..");
			
		} else if(exception instanceof DisabledException) {
			request.setAttribute("loginFailMsg", "비활성화된 계정입니다..");
			
		} else if(exception instanceof AccountExpiredException) {
			request.setAttribute("loginFailMsg", "만료된 계정입니다..");
			
		} else if(exception instanceof CredentialsExpiredException) {
			request.setAttribute("loginFailMsg", "비밀번호가 만료되었습니다.");
		}
		
		// 로그인 페이지로 다시 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("");
		dispatcher.forward(request, response);
		
		
	}

}
