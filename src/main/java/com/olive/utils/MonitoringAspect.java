package com.olive.utils;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

@Aspect
@Component
public class MonitoringAspect {
	
	private static Log log = LogFactory.getLog(MonitoringAspect.class);
	

	//within(com.olive.*.*.*) 나중에 넣어야함 인터페이스로 criteria 빼고 나서 
	@Around("within(com.olive.hr_info.*.*)")
	public Object doDAOMonitoring(ProceedingJoinPoint joinpoint) throws Throwable {
		StopWatch clock = new StopWatch("Profiling ...");

		Object result;
		try {
			clock.start(joinpoint.toShortString());
			result = joinpoint.proceed();
		} finally {
			clock.stop();
		}

		if (clock.getTotalTimeMillis() > 500) {
			if (log.isWarnEnabled()) {
				log.warn("Execution Location : " + joinpoint.getTarget().getClass().getName());
				log.warn("Execution Method : " + joinpoint.toShortString());
				log.warn("Execution Time : " + clock.prettyPrint());
			}
		}
		return result;
	}
}
