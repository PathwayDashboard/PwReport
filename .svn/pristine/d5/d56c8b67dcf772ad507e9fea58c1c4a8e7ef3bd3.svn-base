package it.eng.pathway.utility;

import java.util.logging.Logger;

public class PwLogger {
	
	public static Logger logger=Logger.getLogger("it.eng.pathway");
	public static Logger errorLogger=Logger.getLogger("err.it.eng.pathway");
	
	public static void printMethod(){
		logger.fine("Invoked: "+getMethod());
	}

	private static String getMethod() {
		return getMethod(4);
	}
	
	private static String getMethod(int stackDeep) {
		StackTraceElement[] stackTraceElements = Thread.currentThread().getStackTrace();
		StackTraceElement element=stackTraceElements[stackDeep];
		String toRet=(element.getClassName()+"."+element.getMethodName());
		return toRet;
	}
	
}
