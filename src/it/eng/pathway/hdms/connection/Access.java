package it.eng.pathway.hdms.connection;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import io.swagger.client.ApiException;
import io.swagger.client.api.PathwayhdmisessionApi;
import io.swagger.client.api.UsersApi;
import io.swagger.client.model.CreatePatientSessionData;
import io.swagger.client.model.GenericPostputResult;
import io.swagger.client.model.UserInfo;
import it.eng.pathway.utility.PwLogger;

public class Access {
	
	private Properties prop;
	private String filename = "config.properties";

	public GenericPostputResult login(String username, String password) throws ApiException, IOException{
//		try {
//			InetAddress iaddr=InetAddress.getLocalHost();
//			PwLogger.logger.fine(iaddr.toString());
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
		InputStream inputStream = getClass().getClassLoader().getResourceAsStream(filename);
		prop.load(inputStream);
		
		
		
		PathwayhdmisessionApi loginapi = new PathwayhdmisessionApi();
		loginapi.getApiClient().setBasePath(prop.getProperty("HDMSURL"));
		PwLogger.logger.fine(prop.getProperty("HDMSURL"));
		PwLogger.logger.fine("Connecting to... "+loginapi.getApiClient().getBasePath());
		CreatePatientSessionData data=new CreatePatientSessionData();
		data.setUserName(username);
		data.setPassword(password);
		GenericPostputResult result=loginapi.pathwayHdmiSessionPostPatientSession(data);
		return result;
	}
	
	public boolean isAdmin(String username, String xSessionId) throws IOException, ApiException {
		prop = new Properties();
		InputStream inputStream = getClass().getClassLoader().getResourceAsStream(filename);
		prop.load(inputStream);
		
		
		
		UsersApi loginapi = new UsersApi();
		loginapi.getApiClient().setBasePath(prop.getProperty("HDMSURL"));
		PwLogger.logger.fine(prop.getProperty("HDMSURL"));
		PwLogger.logger.fine("Connecting to... "+loginapi.getApiClient().getBasePath());
		
		UserInfo infos = loginapi.usersGetUserInfo(username, xSessionId);
		
		return infos.getRoles() != null;
	}
	
}
