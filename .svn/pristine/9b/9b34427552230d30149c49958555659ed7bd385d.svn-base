package it.eng.pathway.hdms.connection;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Properties;

import org.joda.time.DateTime;

import io.swagger.client.ApiException;
import io.swagger.client.api.CardiacRehabilitationProgrammeApi;
import io.swagger.client.model.CardiacRehabilitationProgrammeExerciseProgrammeSubSection;
import io.swagger.client.model.CardiacRehabilitationProgrammeSection;
import it.eng.pathway.fake.model.CardiacRehabilitationProgramme;
import it.eng.pathway.utility.PwLogger;

public class CRProgramme {
	
	private static Properties prop;
	private static String filename = "config.properties";
	
	public static CardiacRehabilitationProgramme getProgramme(String patientNumber, String xSessionId) throws ApiException, IOException{
		
		CardiacRehabilitationProgrammeSection hdmsProg=getHDMSProgramme(patientNumber,xSessionId);
//		List<CardiacRehabilitationProgrammeExerciseProgrammeSubSection> hdmsExs = hdmsProg != null ? hdmsProg.getExerciseProgrammes() : null;
		
		CardiacRehabilitationProgramme programme = new CardiacRehabilitationProgramme(hdmsProg);
		
		return programme;
	}

	public static CardiacRehabilitationProgrammeSection getHDMSProgramme(String patientNumber, String xSessionId) throws ApiException, IOException{
		
		prop = new Properties();
		InputStream inputStream = CRProgramme.class.getClassLoader().getResourceAsStream(filename);
		prop.load(inputStream);
		
		CardiacRehabilitationProgrammeApi api=new CardiacRehabilitationProgrammeApi();
		api.getApiClient().setBasePath(prop.getProperty("HDMSURL"));
		PwLogger.logger.fine("Connecting to... "+api.getApiClient().getBasePath());
		
		CardiacRehabilitationProgrammeSection result=new CardiacRehabilitationProgrammeSection();
		try {
			result=api.cardiacRehabilitationProgrammeGetCRProgramme(patientNumber, xSessionId);
//			PwLogger.logger.fine(result.toString());
		} catch (ApiException e) {
			e.printStackTrace();
//			result=createFakeCRProgramme();
//			return result;
			return null;
		}
		
		return result;
	}
	
	public static List<CardiacRehabilitationProgrammeExerciseProgrammeSubSection> getExerciseProgrammes(String patientNumber, String xSessionId) throws ApiException, IOException{
		
//		prop = new Properties();
//		InputStream inputStream = CRProgramme.class.getClassLoader().getResourceAsStream(filename);
//		prop.load(inputStream);
//		
//		CardiacRehabilitationProgrammeApi api=new CardiacRehabilitationProgrammeApi();
//		api.getApiClient().setBasePath(prop.getProperty("HDMSURL"));
//		PwLogger.logger.fine("Connecting to... "+api.getApiClient().getBasePath());
//		
//		List<CardiacRehabilitationProgrammeExerciseProgrammeSubSection> result=new ArrayList<CardiacRehabilitationProgrammeExerciseProgrammeSubSection>();
//		try {
//			result=api.cardiacRehabilitationProgrammeGetExerciseProgrammes(patientNumber, xSessionId);
//			PwLogger.logger.fine(result.toString());
//		} catch (ApiException e) {
//			e.printStackTrace();
//			result=createFakeExerciseProgrammes(180);
//		}finally {
//			return result;
//		}
		
		CardiacRehabilitationProgrammeSection crp = getHDMSProgramme(patientNumber, xSessionId);
		if (crp!=null){
			return crp.getExerciseProgrammes();
		}else
			return null;
		
	}
	
	
	//TO DELETE when integrated
	
//	private static CardiacRehabilitationProgrammeSection createFakeCRProgramme() {
//		CardiacRehabilitationProgrammeSection programme= new CardiacRehabilitationProgrammeSection();
//		DateTime startDate = new DateTime();
//		startDate.plusDays(-43);
//		programme.setCreationDate(startDate.toDate());
//		return null;
//	}


	private static int WEEKLY_FREQ = 3;
	private static int N=2;
	private static int TOTALDURATION=50;
	private static double wutp=0.12;
	private static double aetp=0.77;
	private static double cdtp=0.12;
//	
//	public static List<CardiacRehabilitationProgrammeExerciseProgrammeSubSection> createFakeExerciseProgrammes(int maxFreq) {
//		PwLogger.printMethod();
//		PwLogger.logger.fine("FAKE PROGRAMME CREATING");
//		
//		List<CardiacRehabilitationProgrammeExerciseProgrammeSubSection> exs=new ArrayList<CardiacRehabilitationProgrammeExerciseProgrammeSubSection>();
//		
//		
//		CardiacRehabilitationProgrammeExerciseProgrammeSubSection ex=new CardiacRehabilitationProgrammeExerciseProgrammeSubSection();
//		ex.setWeeklyFrequency(WEEKLY_FREQ);
//		ex.setExerciseIntensity(1);
//		ex.setWeeklyTime(WEEKLY_FREQ*TOTALDURATION);
//		ex.setClassDuration(TOTALDURATION);
//		ex.setGameDuration(TOTALDURATION/2);
//		ex.setNumberOfExerClass(2);
//		ex.setNumberOfExerGame(0);
//		ex.setNumberOfActiveLifeStyleActivity(1);
//		Calendar c=GregorianCalendar.getInstance();
//		ex.setDate(new DateTime(c.getTime()).toDate());
//		exs.add(ex);
//		
//		ex=new CardiacRehabilitationProgrammeExerciseProgrammeSubSection();
//		ex.setWeeklyFrequency(WEEKLY_FREQ);
//		ex.setExerciseIntensity(1);
//		ex.setWeeklyTime(WEEKLY_FREQ*TOTALDURATION);
//		ex.setClassDuration(TOTALDURATION);
//		ex.setGameDuration(TOTALDURATION/2);
//		ex.setNumberOfExerClass(2);
//		ex.setNumberOfExerGame(0);
//		ex.setNumberOfActiveLifeStyleActivity(1);
//		c.add(Calendar.DAY_OF_MONTH, -7);
//		ex.setDate(new DateTime(c.getTime()).toDate());
//		exs.add(ex);
//		
//		ex=new CardiacRehabilitationProgrammeExerciseProgrammeSubSection();
//		ex.setWeeklyFrequency(WEEKLY_FREQ);
//		ex.setExerciseIntensity(1);
//		ex.setWeeklyTime(WEEKLY_FREQ*TOTALDURATION);
//		ex.setClassDuration(TOTALDURATION);
//		ex.setGameDuration(TOTALDURATION/2);
//		ex.setNumberOfExerClass(2);
//		ex.setNumberOfExerGame(0);
//		ex.setNumberOfActiveLifeStyleActivity(1);
//		c.add(Calendar.DAY_OF_MONTH, -2);
//		ex.setDate(new DateTime(c.getTime()).toDate());
//		exs.add(ex);
//		
//		
//		PwLogger.logger.fine("FAKE PROGRAMME CREATED");
//		
//		return exs;
//}

//	public static List<ExerciseProgrammeSubSection> createFakeExerciseProgrammes(int maxFreq) {
//			PwLogger.printMethod();
//			PwLogger.logger.fine("FAKE PROGRAMME CREATED");
//			ExerciseProgrammeSubSection crp=new ExerciseProgrammeSubSection();
////			TrainingProfile tp=new TrainingProfile();
////			tp.setWarmingUpDuration((int) (TOTALDURATION*wutp));
////			tp.setWarmingHRzoneMax((int) (0.6*maxFreq));
////			tp.setWarmingHRzoneMin((int) (0.5*maxFreq));
////			
////			tp.setMainDuration((int) (TOTALDURATION*aetp));
////			tp.setMainHRzoneMax((int) (0.85*maxFreq));
////			tp.setMainHRzoneMin((int) (0.6*maxFreq));
////			
////			tp.setCooldownDuration((int) (TOTALDURATION*cdtp));
////			tp.setCooldownHRZoneMax((int) (0.7*maxFreq));
////			tp.setCooldownHRZoneMin((int) (0.5*maxFreq));
//
////			crp.setTrainingProfile(tp);
//			
//			List<ExerciseProgramme> exs=new ArrayList<ExerciseProgramme>();
//			
//			
//			ExerciseProgramme ex=new ExerciseProgramme();
//			ex.setWeeklyFrequency(WEEKLY_FREQ);
//			ex.setExerciseIntensity(1);
//			ex.setWeeklyTime(WEEKLY_FREQ*TOTALDURATION);
//			ex.setClassDuration(TOTALDURATION);
//			ex.setGameDuration(TOTALDURATION/2);
//			ex.setNumberOfExerClass(2);
//			ex.setNumberOfExerGame(0);
//			ex.setNumberOfActiveLifeStyleActivity(1);
//			Calendar c=GregorianCalendar.getInstance();
//			ex.setExerciseProgrammeDate(c.getTime());
//			exs.add(ex);
//			
//			ex=new ExerciseProgramme();
//			ex.setWeeklyFrequency(WEEKLY_FREQ);
//			ex.setExerciseIntensity(1);
//			ex.setWeeklyTime(WEEKLY_FREQ*TOTALDURATION);
//			ex.setClassDuration(TOTALDURATION);
//			ex.setGameDuration(TOTALDURATION/2);
//			ex.setNumberOfExerClass(2);
//			ex.setNumberOfExerGame(0);
//			ex.setNumberOfActiveLifeStyleActivity(1);
//			c.add(Calendar.DAY_OF_MONTH, -7);
//			ex.setExerciseProgrammeDate(c.getTime());
//			exs.add(ex);
//			
//			ex=new ExerciseProgramme();
//			ex.setWeeklyFrequency(WEEKLY_FREQ);
//			ex.setExerciseIntensity(1);
//			ex.setWeeklyTime(WEEKLY_FREQ*TOTALDURATION);
//			ex.setClassDuration(TOTALDURATION);
//			ex.setGameDuration(TOTALDURATION/2);
//			ex.setNumberOfExerClass(2);
//			ex.setNumberOfExerGame(0);
//			ex.setNumberOfActiveLifeStyleActivity(1);
//			c.add(Calendar.DAY_OF_MONTH, -2);
//			ex.setExerciseProgrammeDate(c.getTime());
//			exs.add(ex);
//			
//			crp.setExerciseProgrammes(exs);
//			
//			return crp;
//	}

//	public static CardiacRehabilitationProgrammeExerciseProgrammeSubSection createFakeExerciseProgramme(int i) {
//		CardiacRehabilitationProgrammeExerciseProgrammeSubSection ex=new CardiacRehabilitationProgrammeExerciseProgrammeSubSection();
//		ex.setWeeklyFrequency(WEEKLY_FREQ);
//		ex.setExerciseIntensity(1);
//		ex.setWeeklyTime(WEEKLY_FREQ*TOTALDURATION);
//		ex.setClassDuration(TOTALDURATION);
//		ex.setGameDuration(TOTALDURATION/2);
//		ex.setNumberOfExerClass(2);
//		ex.setNumberOfExerGame(0);
//		ex.setNumberOfActiveLifeStyleActivity(1);
//		Calendar c=GregorianCalendar.getInstance();
//		ex.setDate(new DateTime(c.getTime()).toDate());
//		
//		return ex;
//	}
	
}
