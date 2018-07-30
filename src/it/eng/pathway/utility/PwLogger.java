/*******************************************************************************
 * Copyright 2018 Engineering Ing. Inf. S.p.A.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *******************************************************************************/
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
