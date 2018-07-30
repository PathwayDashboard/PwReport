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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import io.swagger.client.ApiException;
import io.swagger.client.api.CardiacRehabilitationProgressApi;
import io.swagger.client.model.CardiacRehabilitationProgressActiveLifestylePASessionSubsection;
import io.swagger.client.model.CardiacRehabilitationProgressExerClassSessionSubsection;
import io.swagger.client.model.CardiacRehabilitationProgressExerGameSessionSubsection;
import io.swagger.client.model.CardiacRehabilitationProgressSection;
import io.swagger.client.model.GenericPostputResult;
import it.eng.pathway.fake.model.ActiveLifestylePASession;
import it.eng.pathway.fake.model.CardiacRehabilitationProgress;
import it.eng.pathway.fake.model.ExerClassSession;
import it.eng.pathway.fake.model.ExerGameSession;
import it.eng.pathway.fake.model.ExerciseSession;
import it.eng.pathway.utility.DateMgt;
import it.eng.pathway.utility.PwLogger;

public class CRProgress {
	
	private static Properties prop;
	private static String filename = "config.properties";
	
	public static CardiacRehabilitationProgress getCompleteCRProgress(String patientNumber, String xSessionId, Date startDate, Date stopDate) throws ApiException, IOException{
		CardiacRehabilitationProgressSection hdmsProgress = getProgress(patientNumber, xSessionId, startDate, stopDate);
		if (hdmsProgress == null)
			return null;
		List<CardiacRehabilitationProgressExerClassSessionSubsection> classes=hdmsProgress.getExerClassSessions();
		List<CardiacRehabilitationProgressExerGameSessionSubsection> games=hdmsProgress.getExerGameSessions();
		List<CardiacRehabilitationProgressActiveLifestylePASessionSubsection> pas=hdmsProgress.getActiveLifestylePASessions();
		
		CardiacRehabilitationProgress ourProgress=new CardiacRehabilitationProgress();
		ArrayList<ExerciseSession> engSessions=new ArrayList<ExerciseSession>();
		ourProgress.setExerciseSession(engSessions);
		
//		CLASS
		if(classes!=null){
			PwLogger.logger.fine("ExerClasses: "+classes.size());
			for (CardiacRehabilitationProgressExerClassSessionSubsection curr : classes) {
				ExerClassSession currEng=new ExerClassSession(curr);
//				PwLogger.logger.fine(curr.toString());
				if (currEng.isValid()){
					engSessions.add(currEng);
				}
			}
		}
		
//		GAME
		//		dovrebbe essere una lista di games
		if (games!=null){
			PwLogger.logger.fine("ExerGames:" +games.size());
//			PwLogger.logger.fine(games.toString());
			for (CardiacRehabilitationProgressExerGameSessionSubsection curr : games) {
				ExerGameSession game=new ExerGameSession(curr);
				if (game!=null){
//					PwLogger.logger.fine(curr.toString());
					if(game.isValid()){
						engSessions.add(game);
					}
				}
			}
		}
		
//		PA
		if (pas!=null){
			PwLogger.logger.fine("PAs: "+pas.size());
			for (CardiacRehabilitationProgressActiveLifestylePASessionSubsection curr : pas) {
//				PwLogger.logger.fine(curr.toString());
				ActiveLifestylePASession engPa=new ActiveLifestylePASession(curr);
				if (engPa.isValid()){
					engSessions.add(engPa);
				}
			}
		}
		
		
		return ourProgress;
	}
	
	
	

//	public static List<CardiacRehabilitationProgressExerClassSessionSubsection> getClassProgress(String patientNumber, String xSessionId) throws ApiException, IOException{
//		prop = new Properties();
//		InputStream inputStream = CRProgress.class.getClassLoader().getResourceAsStream(filename);
//		prop.load(inputStream);
//		
//		CardiacRehabilitationProgressApi api=new CardiacRehabilitationProgressApi();
//		api.getApiClient().setBasePath(prop.getProperty("HDMSURL"));
//		PwLogger.logger.fine("Connecting to... "+api.getApiClient().getBasePath());
//		
//		List<CardiacRehabilitationProgressExerClassSessionSubsection> result=null;
//		try {
//			result= api.cardiacRehabilitationProgressGetCardiacRehabilitationProgressExerClassSessions(patientNumber, xSessionId);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return result;
//	}
//	
//	public static List<ExerGameSessionSubsection> getGameProgress(String patientNumber, String xSessionId) throws ApiException, IOException{
//		
//		prop = new Properties();
//		InputStream inputStream = CRProgress.class.getClassLoader().getResourceAsStream(filename);
//		prop.load(inputStream);
//		
//		CardiacRehabilitationProgressApi api=new CardiacRehabilitationProgressApi();
//		api.getApiClient().setBasePath(prop.getProperty("HDMSURL"));
//		PwLogger.logger.fine("Connecting to... "+api.getApiClient().getBasePath());
//		
//		List<ExerGameSessionSubsection> result=null;
//		try {
//			result = api.cardiacRehabilitationProgressGetCardiacRehabilitationProgressExerGameSessions(patientNumber, xSessionId);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return result;
//	}
//	
//	public static List<ActiveLifestylePASessionSubsection> getPAProgress(String patientNumber, String xSessionId) throws ApiException, IOException{
////		try {
////			InetAddress iaddr=InetAddress.getLocalHost();
////			String address=String.valueOf(iaddr);
////			if (!address.startsWith("wellness")){
////				PwLogger.logger.fine("SQUIDMAN proxy set");
////				System.setProperty("http.proxyHost", "localhost");
////				System.setProperty("http.proxyPort", "13128");
////			}
////		} catch (UnknownHostException e) {
////			e.printStackTrace();
////		}
//		
//		prop = new Properties();
//		InputStream inputStream = CRProgress.class.getClassLoader().getResourceAsStream(filename);
//		prop.load(inputStream);
//		
//		CardiacRehabilitationProgressApi api=new CardiacRehabilitationProgressApi();
//		api.getApiClient().setBasePath(prop.getProperty("HDMSURL"));
//		PwLogger.logger.fine("Connecting to... "+api.getApiClient().getBasePath());
//		
//		List<ActiveLifestylePASessionSubsection> result=null;
//		try {
//			result = api.cardiacRehabilitationProgressGetCardiacRehabilitationProgressActiveLifestylePASessions(patientNumber, xSessionId);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return result;
//	}
	
	private static CardiacRehabilitationProgressSection getProgress(String patientNumber, String xSessionId, Date startDate, Date stopDate)throws ApiException, IOException {
		prop = new Properties();
		InputStream inputStream = CRProgress.class.getClassLoader().getResourceAsStream(filename);
		prop.load(inputStream);
		
		CardiacRehabilitationProgressApi api=new CardiacRehabilitationProgressApi();
		api.getApiClient().setBasePath(prop.getProperty("HDMSURL"));
		PwLogger.logger.fine("Connecting to... "+api.getApiClient().getBasePath());
		PwLogger.logger.fine("Filtering the CRProgress between: "+DateMgt.getReadableDate(startDate)+" and "+DateMgt.getReadableDate(stopDate));
		CardiacRehabilitationProgressSection result=null;
		try {
			result= api.cardiacRehabilitationProgressGetPatientCRProgress(patientNumber,  startDate, stopDate, xSessionId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}




	public static String savePA(String patientNumber, String xSessionId, CardiacRehabilitationProgressActiveLifestylePASessionSubsection paSession) throws ApiException, IOException{
		PwLogger.printMethod();
		prop = new Properties();
		InputStream inputStream = CRProgress.class.getClassLoader().getResourceAsStream(filename);
		prop.load(inputStream);
		
		CardiacRehabilitationProgressApi api=new CardiacRehabilitationProgressApi();
		api.getApiClient().setBasePath(prop.getProperty("HDMSURL"));
		PwLogger.logger.fine("Connecting to... "+api.getApiClient().getBasePath());
		
		GenericPostputResult result = api.cardiacRehabilitationProgressPostActiveLifestylePASession(patientNumber, paSession, xSessionId);
		PwLogger.logger.fine(result.getResult());
		return result.getResult();
	}
	
	public static String saveExerClass(String patientNumber, String xSessionId, CardiacRehabilitationProgressExerClassSessionSubsection exClass) throws ApiException, IOException{
		PwLogger.printMethod();
		prop = new Properties();
		InputStream inputStream = CRProgress.class.getClassLoader().getResourceAsStream(filename);
		prop.load(inputStream);
		
		CardiacRehabilitationProgressApi api=new CardiacRehabilitationProgressApi();
		api.getApiClient().setBasePath(prop.getProperty("HDMSURL"));
		PwLogger.logger.fine("Connecting to... "+api.getApiClient().getBasePath());
	
		GenericPostputResult result = null;
		result = api.cardiacRehabilitationProgressPostExerClassSession(patientNumber, exClass, xSessionId);
		PwLogger.logger.fine(result.getResult());
		
		return result.getResult();
	}


	public static String saveExerGame(String patientNumber, String xSessionId, CardiacRehabilitationProgressExerGameSessionSubsection exGame) throws ApiException, IOException {
		PwLogger.printMethod();
		prop = new Properties();
		InputStream inputStream = CRProgress.class.getClassLoader().getResourceAsStream(filename);
		prop.load(inputStream);
		
		CardiacRehabilitationProgressApi api=new CardiacRehabilitationProgressApi();
		api.getApiClient().setBasePath(prop.getProperty("HDMSURL"));
		PwLogger.logger.fine("Connecting to... "+api.getApiClient().getBasePath());
	
		GenericPostputResult result = null;
		result = api.cardiacRehabilitationProgressPostExerGameSession(patientNumber, exGame, xSessionId);
		PwLogger.logger.fine(result.getResult());
		
		return result.getResult();
	}
	
}
