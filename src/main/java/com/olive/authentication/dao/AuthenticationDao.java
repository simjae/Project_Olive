/*
	파일명: AuthenticationDao.java
    설명: 인증 관련 비즈니스 로직 Dao 
    작성일: 2021-01-04
    작성자: 백희승
*/
package com.olive.authentication.dao;

import com.olive.dto.Emp;

public interface AuthenticationDao {
	public int getFailCount(String empno);
	
	public Emp isFound(String empno);
	
	public void addFailCount(String empno);
	
	public void disable(String empno);
	
	public void initFailCount(String empno);
}
