package it.eng.pathway.hdms.connection;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Properties;

import io.swagger.client.ApiException;
import io.swagger.client.api.BehaviouralChangeProgressApi;
import io.swagger.client.model.BehavioralChangeProgressGoalAssessmentSubSection;
import io.swagger.client.model.BehavioralChangeProgressSection;
import io.swagger.client.model.GenericPostputResult;
import it.eng.pathway.utility.PwLogger;

public class BCProgress {

	private static Properties prop;
	private static String filename = "config.properties";

	public static BehavioralChangeProgressSection getProgress(String patientNumber, String xSessionId)
			throws ApiException, IOException {

		prop = new Properties();
		InputStream inputStream = BCProgress.class.getClassLoader().getResourceAsStream(filename);
		prop.load(inputStream);

		BehaviouralChangeProgressApi api = new BehaviouralChangeProgressApi();
		api.getApiClient().setBasePath(prop.getProperty("HDMSURL"));
		PwLogger.logger.fine("Connecting to... " + api.getApiClient().getBasePath());

		BehavioralChangeProgressSection result = new BehavioralChangeProgressSection();
		try {
			result = api.behaviouralChangeProgressGetBChangeProgress(patientNumber, xSessionId);
			if (result == null){
				result = new BehavioralChangeProgressSection();
//				result.setGoalAssessments(new ArrayList<BehavioralChangeProgressGoalAssessmentSubSection>());
			}
//			PwLogger.logger.fine(result.toString());
		} catch (ApiException e) {
			e.printStackTrace();
		}

		return result;
	}

	public static GenericPostputResult putProgress(String patientNumber, BehavioralChangeProgressSection bcProgress,
			String xSessionId) throws ApiException, IOException {

		prop = new Properties();
		InputStream inputStream = BCProgress.class.getClassLoader().getResourceAsStream(filename);
		prop.load(inputStream);

		BehaviouralChangeProgressApi api = new BehaviouralChangeProgressApi();
		api.getApiClient().setBasePath(prop.getProperty("HDMSURL"));
		PwLogger.logger.fine("Connecting to... " + api.getApiClient().getBasePath());

		GenericPostputResult result = null;
		try {
			result = api.behaviouralChangeProgressPutBCProgress(patientNumber, bcProgress, xSessionId);
			PwLogger.logger.fine(result.toString());
		} catch (ApiException e) {
			e.printStackTrace();
		}

		return result;
	}
}
