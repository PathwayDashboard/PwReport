package it.eng.pathway.hdms.connection;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import io.swagger.client.ApiException;
import io.swagger.client.api.BehaviouralChangeProgrammeApi;
import io.swagger.client.model.BehaviouralChangeProgrammeSection;
import it.eng.pathway.utility.PwLogger;

public class BCProgramme {
	
	private static Properties prop;
	private static String filename = "config.properties";

	public static BehaviouralChangeProgrammeSection getProgramme(String patientNumber, String xSessionId) throws ApiException, IOException{
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
		
		prop = new Properties();
		InputStream inputStream = BCProgramme.class.getClassLoader().getResourceAsStream(filename);
		prop.load(inputStream);
		
		BehaviouralChangeProgrammeApi api=new BehaviouralChangeProgrammeApi();
		api.getApiClient().setBasePath(prop.getProperty("HDMSURL"));
		PwLogger.logger.fine("Connecting to... "+api.getApiClient().getBasePath());
		
		BehaviouralChangeProgrammeSection result=new BehaviouralChangeProgrammeSection();
		try {
			result=api.behaviouralChangeProgrammeGetBCProgramme(patientNumber, xSessionId);
			if (BCProgramme.isValid(result))
				PwLogger.logger.fine(result.toString());
		} catch (ApiException e) {
			e.printStackTrace();
			return null;
		}
		
		
		return result;
	}
	
	private static boolean isValid(BehaviouralChangeProgrammeSection result){
		return (result != null);
	}
	
}
