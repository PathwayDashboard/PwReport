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
package it.eng.pathway.hdms.connection;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Properties;

import io.swagger.client.ApiException;
import io.swagger.client.api.PatientApi;
import io.swagger.client.model.GenericPostputResult;
import io.swagger.client.model.PATIENT;
import it.eng.pathway.fake.model.DailyActivity;
import it.eng.pathway.utility.PwLogger;

public class Patient {
	
	private static Properties prop;
	private static String filename = "config.properties";

	public static PATIENT getDemographics(String patientNumber, String xSessionId) throws ApiException, IOException{
//		try {
//			InetAddress iaddr=InetAddress.getLocalHost();
//			String address=String.valueOf(iaddr);
//			if (!address.startsWith("wellness")){
//				PwLogger.logger.fine("SQUIDMAN proxy set");
//				System.setProperty("http.proxyHost", "localhost");
//				System.setProperty("http.proxyPort", "13128");
//			}
//		} catch (UnknownHostException e) {
//			e.printStackTrace();
//		}
//		
		prop = new Properties();
		InputStream inputStream = Patient.class.getClassLoader().getResourceAsStream(filename);
		prop.load(inputStream);
		
		PatientApi api=new PatientApi();
		api.getApiClient().setBasePath(prop.getProperty("HDMSURL"));
		PwLogger.logger.fine("Connecting to... "+api.getApiClient().getBasePath());
		
		PATIENT result=api.patientGetPatient(patientNumber, xSessionId);
		return result;
	}
	
	
	public static void putDailyActivities(String patientNumber, String xSessionId, List<DailyActivity> das) throws ApiException, IOException{
//		
		prop = new Properties();
		InputStream inputStream = Patient.class.getClassLoader().getResourceAsStream(filename);
		prop.load(inputStream);
		
		PatientApi api=new PatientApi();
		api.getApiClient().setBasePath(prop.getProperty("HDMSURL"));
		PwLogger.logger.fine("Connecting to... "+api.getApiClient().getBasePath());
		
		//TODO - aggiugnere la chiamata al metodo HDMS quando sarà pronto
		if (das!=null){
			for (DailyActivity da : das) {
				io.swagger.client.model.DailyActivity d = da.getHDMSDA();
				PwLogger.logger.fine("Storing... "+da.toString());
				GenericPostputResult result = api.patientPostDailyActivity(patientNumber, d, xSessionId);
				PwLogger.logger.fine(result.getResult());
			}
		}
	}
	
}
