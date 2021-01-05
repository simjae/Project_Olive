/*
	파일명: LoginFailHandler.java
    설명: 기존 Spring Security 사용한 로그인 시 default Login fail Handler에 로직을 추가하기 위해 커스텀한 Class
    작성일: 2021-01-03
    작성자: 백희승
*/
package com.olive.authentication.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailHandler implements AuthenticationFailureHandler {
	/*
	 * >> 로그인 실패 시 Security는 Provider가 throw한 exception을 여기 fail Handler로 전달한다.
	 * 
	 * ----Fail Handler가 받는 예외 종류---- [ (타입 = AuthenticationException), (Class
	 * Library = org.springframework.security.authentication.*) ]
	 * 
	 * - AuthenticationServiceException : select 결과 null 값을 리턴했을 경우 -
	 * BadCredentialException : UsernameNotFoundException 예외를 Throw UserDetails 객체를
	 * 리턴했으나, ID 또는 PWD가 틀림. - LockedException : UserDetails 객체의
	 * isAccountNonLocked() 메소드의 리턴값이 false - DisabledException : UserDetails 객체의
	 * isEnabled() 메소드의 리턴값이 false - AccountExpiredException : UserDetails 객체의
	 * isAccountNonExpired() 메소드의 리턴값이 false - CredentialExpiredException :
	 * UserDetails 객체의 isCredentialsNonExpired() 메소드의 리턴값이 false
	 */

	private String empno;
	private String pwd;
	private String defaultFailureUrl;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {

		String loginFailMsg = null;

		String username = request.getParameter(empno);
		String password = request.getParameter(pwd);
		System.out.println("로그인 시도 : " + username + "/" + password);

		// EMP 테이블 상에 존재하지 않는 사번으로 로그인 했을 경우
		if (exception instanceof AuthenticationServiceException) {
			loginFailMsg = "존재하지 않는 사원입니다.";

		} else if (exception instanceof BadCredentialsException) {
			loginFailMsg = "아이디 또는 비밀번호가 틀립니다.";

		} else if (exception instanceof LockedException) {
			loginFailMsg = "잠긴 계정입니다. 관리자에게 문의하세요.";

		} else if (exception instanceof DisabledException) {
			loginFailMsg = "비활성화된 계정입니다. 관리자에게 문의하세요.";

		} else if (exception instanceof AccountExpiredException) {
			loginFailMsg = "만료된 계정입니다. 관리자에게 문의하세요.";

		} else if (exception instanceof CredentialsExpiredException) {
			loginFailMsg = "비밀번호가 만료되었습니다.";
		} else {
			loginFailMsg = exception.getMessage();
		}

		System.out.println("발생한 예외 : " + exception.getMessage());
		System.out.println("loginFailMsg : " + loginFailMsg);
		request.setAttribute("loginFailMsg", loginFailMsg);

		// 로그인 페이지로 다시 포워딩
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
	}

	public String getEmpno() {
		return empno;
	}

	public void setEmpno(String empno) {
		this.empno = empno;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}

}
