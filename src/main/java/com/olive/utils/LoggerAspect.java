package com.olive.utils;

import java.util.Arrays;
import java.util.Date;

import org.apache.commons.lang.time.StopWatch;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggerAspect {

	final static Log log = LogFactory.getLog(LoggerAspect.class);

	@Around("within(com.olive.*.service.*)")
	public Object logOperations(ProceedingJoinPoint joinpoint) throws Throwable {

		String targetClassName = joinpoint.getTarget().getClass().getName();
		String targetMethodName = joinpoint.getSignature().getName();

		if (log.isDebugEnabled()) {
			log.debug(targetClassName + "." + targetMethodName + " 시작!");
			Object[] args = joinpoint.getArgs();
			for (int i = 0; i < args.length; i++) {
				log.debug("arg[" + i + "] : " + args[i]);
			}
		}
		Object returnValue = joinpoint.proceed();

		if (log.isDebugEnabled()) {
			log.debug(targetClassName + "." + targetMethodName + " 종료!");
		}

		return returnValue;
	}

}
//	@Around("within(com.olive.hr_management.service.*)")
//	public Object log(ProceedingJoinPoint joinpoint) throws Throwable {
//		logger.info(joinpoint.getSignature().getName() + " called...");
//		/* 전달되는 모든 파라미터들을 Object의 배열로 가져온다. */
//		logger.info("1:" + Arrays.toString(joinpoint.getArgs()));
//
//		/* 해당 Advice의 타입을 알아낸다. */
//		logger.info("2:" + joinpoint.getKind());
//
//		/* 실행하는 대상 객체의 메소드에 대한 정보를 알아낼 때 사용 */
//		logger.info("3:" + joinpoint.getSignature().getName());
//
//		/* target 객체를 알아낼 때 사용 */
//		logger.info("4:" + joinpoint.getTarget().toString());
//
//		/* Advice를 행하는 객체를 알아낼 때 사용 */
//		logger.info("5:" + joinpoint.getThis().toString());
//
//		org.springframework.util.StopWatch sw = new org.springframework.util.StopWatch();
//		sw.start();
//		Object result = joinpoint.proceed();
//		sw.stop();
//		logger.info("[총 걸린 시간 :" + sw.getTotalTimeMillis() + "초]");
//		return result;
//	}
//}
