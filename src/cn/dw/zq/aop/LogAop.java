package cn.dw.zq.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

/**
 * @author Ken.Leung
 * @version 2018年8月30日 上午10:53:33
 * 
 */
@Component
@Aspect
public class LogAop {

	// exection(* cn.dw.zq.controller.*.*(..) 第一个* 代表参数，所有参数类型
	// cn.dw.zq.controller.*.*(..) (..)代表所有的返回类型
	@Pointcut("execution(* cn.dw.zq.controller.*.*(..))") // 切入点
	public void log() {
	};

	@Before("log()")
	public void doBefore(JoinPoint joinPoint) {
		Object[] args = joinPoint.getArgs();

		System.out.println("===========方法调用之前的操作===========");
	}

	@After("log()")
	public void doAfter(JoinPoint joinPoint) {
		Object[] args = joinPoint.getArgs();
		System.out.println("*************方法调用之后的操作************");
	}

	@Around("log()") // 影响原方法运行，可以做校验操作
	public Object doAround(ProceedingJoinPoint pjp) throws Throwable {
		// 获取开始时间
		long start = System.currentTimeMillis();
		// 利用代理对象去调用对应的方法
		Object obj = pjp.proceed();
		// 获取结束时间
		long end = System.currentTimeMillis();

		System.out.println("方法调用消耗时间：" + (end - start));

		return obj;
	}

	@AfterReturning(pointcut = "log()", returning = "obj")
	public void doAfterReturning(JoinPoint joinPoint, Object obj) {
		System.out.println("============方法调用返回结果集以后========="+obj.toString());
	}

	@AfterThrowing(pointcut = "log()", throwing = "e")
	public void doAfterThrowing(JoinPoint joinPoint, Throwable e) {
		e.printStackTrace();
		System.out.println("===========方法执行抛出异常以后=========");
	}
}
