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
package it.eng.pathway.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import io.swagger.client.ApiException;
import io.swagger.client.model.CardiacRehabilitationProgressActiveLifestylePASessionSubsection;
import io.swagger.client.model.CardiacRehabilitationProgressActiveLifestylePASessionenergyExpenditureSubSubSection;
import io.swagger.client.model.CardiacRehabilitationProgressActiveLifestylePASessionminutesInZoneSubSubSection;
import it.eng.pathway.fake.model.ActiveLifestylePAIntensityType;
import it.eng.pathway.fake.model.ActiveLifestylePASession;
import it.eng.pathway.fake.model.ActivityType;
import it.eng.pathway.fake.model.ExerciseSession;
import it.eng.pathway.frontend.dao.ActivityDAO;
import it.eng.pathway.frontend.model.Activity;
import it.eng.pathway.hdms.connection.CRProgress;
import it.eng.pathway.utility.DateMgt;
import it.eng.pathway.utility.PwLogger;
import it.eng.pathway.utility.StringUtil;
import it.eng.pathway.utilitymodel.CustomOutdoor;
import it.eng.pathway.utilitymodel.CustomSession;
import it.eng.pathway.utilitymodel.CustomSession.SessionType;

@Controller
@SessionAttributes({"xSessionId" , "sin", "programme", "sessionsMap", "lastPresent",  "mssessions", "activitysessions", "notTagged", "mstoken", "mscode", "msrefresh", "aLabels", "progress"})
public class OutdoorController {

	private static final String OKSTRING = "OK";
	@Autowired
	private 	MSController msController;
	@Autowired
	private HomeController homeController;
	private String[] intensity={"Light","Moderate","Vigorous"};
	
	private Properties prop;
	private String filename = "config.properties";
	
	@Autowired
	private ActivityDAO activitiesDAO;
	
	private MessageSource msg;
	@Autowired
    public void AccountsController(MessageSource msgSrc) {
     this.msg = msgSrc;
    }
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/outdoor", method = RequestMethod.GET)
	public String outdoor(Model model, Locale locale) {
		PwLogger.printMethod();
		//leggi l'ultima sessione presente sul hdms
		Map<CustomSession.SessionType, ArrayList<? extends ExerciseSession>> sessionsMap=(Map<SessionType, ArrayList<? extends ExerciseSession>>) model.asMap().get("sessionsMap");
		if(sessionsMap==null)
			return "redirect:/";
		ArrayList<ActiveLifestylePASession> lifestyle=(ArrayList<ActiveLifestylePASession>) sessionsMap.get(SessionType.ACTIVE);
		Collections.sort(lifestyle);
//		System.out.println("0: " + DateMgt.getReadableDate(lifestyle.get(0).getDate()));
//		System.out.println("last in the array: " + DateMgt.getReadableDate(lifestyle.get(lifestyle.size()-1).getDate()));
		
		Calendar c=GregorianCalendar.getInstance();
		Date lastMSdate = this.getLastMonitoredSessionDate(lifestyle);
		c.setTime(lastMSdate);
//		c.setTime(lifestyle.get(0).getDate());
		c.add(Calendar.DAY_OF_MONTH, 1);
		
		String day=DateMgt.getReadableDate(c.getTime());
		String lastPresent=DateMgt.getReadableDate(lastMSdate);
		HomeController.addMenuData(model, null);
		
		model.addAttribute("toInvoke", c.getTime());
		model.addAttribute("lastPresent", lastPresent);
		
		return msController.importFromMS(day, model, locale);
//		return msController.importFromMSGateway(day, model, locale);
//		return "outdoorPage";
	}
	
	private Date getLastMonitoredSessionDate(ArrayList<ActiveLifestylePASession> lifestyle) {
		PwLogger.printMethod();
		if (lifestyle != null){
			for (ActiveLifestylePASession pa : lifestyle) {
				PwLogger.logger.fine("is Monitored?: "+ pa.isMonitored() + "date: "+ DateMgt.getReadableDate(pa.getDate()));
				if (pa.isMonitored()){
					PwLogger.logger.fine("RETURNING: "+ DateMgt.getReadableDate(pa.getDate()));
					return pa.getDate();
				}
			}
		}
		Calendar c=GregorianCalendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, -1);
		return c.getTime();
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/outdoorGateway", method = RequestMethod.GET)
	public String outdoorGateway(Model model, Locale locale) {
		PwLogger.printMethod();
		String day;
		//leggi l'ultima sessione presente sul hdms
		Map<CustomSession.SessionType, ArrayList<? extends ExerciseSession>> sessionsMap=(Map<SessionType, ArrayList<? extends ExerciseSession>>) model.asMap().get("sessionsMap");
		if(sessionsMap==null){
			day="02-01-2016";
			model=addFakeDay(model,day);
//			return "redirect:/";
		}else{
			ArrayList<ActiveLifestylePASession> lifestyle=(ArrayList<ActiveLifestylePASession>) sessionsMap.get(SessionType.ACTIVE);
			Collections.sort(lifestyle);
			if(lifestyle==null || lifestyle.size()==0){
				day="02-01-2016";
				model=addFakeDay(model,day);
			}else{
				Calendar c=GregorianCalendar.getInstance();
				Date lastMSdate = this.getLastMonitoredSessionDate(lifestyle);
				c.setTime(lastMSdate);
				c.add(Calendar.DAY_OF_MONTH, 1);
				
				day=DateMgt.getReadableDate(c.getTime());
				String lastPresent=DateMgt.getReadableDate(lastMSdate);
				HomeController.addMenuData(model, null);
				
				model.addAttribute("toInvoke", c.getTime());
				model.addAttribute("lastPresent", lastPresent);
			}
		}
		
		List<Activity> as=activitiesDAO.findAll(locale.getLanguage());
//		model.addAttribute("sports",as);
		
		Map<String,String> aLabels = new HashMap<String, String>();
		for (Activity curr : as) {
			aLabels.put(curr.getCode(), curr.getName());
		}
		Gson gson=new Gson();
//		model.addAttribute("aLabels",aLabels);
		model.addAttribute("aLabels",gson.toJson(aLabels));
		
		return msController.importFromMSGateway(day, model, locale);
//		return "outdoorPage";
	}
	
	private Model addFakeDay(Model model,String day) {
		String lastPresent="01-01-2016";
		Date toInvoke=DateMgt.getDate(day);
		model.addAttribute("toInvoke", toInvoke);
		model.addAttribute("lastPresent", lastPresent);
		return model;
	}

	@RequestMapping(value = "/saveIntoPathway", method = RequestMethod.POST)
	public @ResponseBody String saveIntoPathway(@RequestBody CustomOutdoor[] sessions,Model model, Locale locale) {
		PwLogger.printMethod();
		String toRet="";
		try {
			String result = saveIntoHDMS(sessions, model,locale);
			PwLogger.logger.fine(result);
			toRet+=" Saved into PATHway";
			
			model=addSessions(sessions, model, locale);
		} catch (ApiException e) {
			e.printStackTrace();
			PwLogger.errorLogger.severe(e.getMessage());
			toRet+=this.msg.getMessage("hdms.error.msg", null, locale);
//			HomeController.showErrorMsg(toRet, model);
		} catch (IOException e) {
			e.printStackTrace();
			PwLogger.errorLogger.severe(e.getMessage());
			toRet+=this.msg.getMessage("hdms.error.msg", null, locale);
//			HomeController.showErrorMsg(toRet, model);
		}
		
		Gson gson=new Gson();
		String jsonToRet=gson.toJson(toRet);
		
		return jsonToRet;
	}
	
	private ActivityType getConvertedType(CustomOutdoor curr) {
		String type=curr.getType();
		Integer intType = Integer.parseInt(type);
		ActivityType[] array=ActivityType.values();
		for (ActivityType activityType : array) {
			if (activityType.getCode() == intType){
				return activityType;
			}
		}
		return null;
	}
	
	private int getConvertedTypePosition(CustomOutdoor curr) {
		String type=curr.getType();
		ActivityType[] array=ActivityType.values();
		int i=0;
		for (ActivityType activityType : array) {
			if (activityType.toString().equalsIgnoreCase(type)){
				return i;
			}
			i++;
		}
		return -1;
	}

	private ActiveLifestylePAIntensityType getConvertedIntensity(CustomOutdoor customOutdoor) {
		String sint=customOutdoor.getIntensity();
		if (sint!=null){
			int i=Integer.parseInt(sint);
			return ActiveLifestylePAIntensityType.values()[i];
		}
		return null;
		
	}

	private String getActualIntensity(CustomOutdoor customOutdoor) {
		String sint=customOutdoor.getIntensity();
		if (sint!=null){
			int i=Integer.parseInt(sint);
			return intensity[i];
		}
		else
			return null;
	}

	@RequestMapping(value = "/saveNotMonitored", method = RequestMethod.POST)
	public @ResponseBody String saveNotMonitored(@RequestBody CustomOutdoor[] sessions,Model model, Locale locale) {
		PwLogger.printMethod();
		String toRet="";
		
		try {
			String result = saveIntoHDMS(sessions, model,locale);
			PwLogger.logger.fine(result);
			toRet+=" Saved into PATHway";
			
			model=addSessions(sessions, model, locale);
			
		} catch (ApiException e) {
			e.printStackTrace();
			PwLogger.errorLogger.severe(e.getMessage());
			toRet+=" [ERROR] Error occurs during the interaction with the HDMS ";
			HomeController.showErrorMsg(toRet, "FROM HDMS: "+toRet, model);
		} catch (IOException e) {
			e.printStackTrace();
			PwLogger.errorLogger.severe(e.getMessage());
			toRet+=" [ERROR] Error occurs during the interaction with the HDMS ";
			HomeController.showErrorMsg(toRet, toRet, model);
		}
		
		toRet+=" Saved into PATHway";
		
		Gson gson=new Gson();
		String jsonToRet=gson.toJson(toRet);
		
		return jsonToRet;
	}
	
	@RequestMapping(value = "/createSessionSummary", method = RequestMethod.POST)
	public @ResponseBody String createSessionsummary(@RequestBody Date[] dates,Model model, Locale locale) {
		PwLogger.printMethod();
		Date from=dates[0];
		Date to=dates[1];
		
		String fromMs=msController.createSummary(from,to, model, locale);
		
		return fromMs;
	}
	
	@RequestMapping(value = "/saveNotTagged", method = RequestMethod.POST)
	public @ResponseBody String saveNotTagged(@RequestBody CustomOutdoor session,Model model, Locale locale) {
		PwLogger.printMethod();
		String toRet="";
		CustomOutdoor[] sessions=new CustomOutdoor[1];
		sessions[0]=session;
		

		try {
			String result = saveIntoHDMS(sessions, model,locale);
			PwLogger.logger.fine(result);
			toRet+=" Saved into PATHway";
			
			model=addSessions(sessions, model, locale);
		} catch (ApiException e) {
			e.printStackTrace();
			PwLogger.errorLogger.severe(e.getMessage());
			toRet+=" [ERROR] Error occurs during the interaction with the HDMS ";
			HomeController.showErrorMsg(toRet,"FROM HDMS: "+toRet, model);
		} catch (IOException e) {
			e.printStackTrace();
			PwLogger.errorLogger.severe(e.getMessage());
			toRet+=" [ERROR] Error occurs during the interaction with the HDMS ";
			HomeController.showErrorMsg(toRet, toRet, model);
		}
		
		Gson gson=new Gson();
		String jsonToRet=gson.toJson(toRet);
		
		return jsonToRet;
	}
	
	private Model addSessions(CustomOutdoor[] sessions, Model model, Locale locale){
		Map<String, ArrayList<ActiveLifestylePASession>> mapActivitySessions=(Map<String, ArrayList<ActiveLifestylePASession>>) model.asMap().get("activitysessions");
		if (mapActivitySessions==null)
			mapActivitySessions=new HashMap<String, ArrayList<ActiveLifestylePASession>>();
//		if (activitySessions==null)
			ArrayList<ActiveLifestylePASession> activitySessions=new ArrayList<ActiveLifestylePASession>();
			
		String dateString="";	
		for (CustomOutdoor curr : sessions) {
			if (curr != null) {
//			curr.setIntensity(getActualIntensity(curr));
			PwLogger.logger.fine(curr.toString());
			
			ActiveLifestylePASession pa=new ActiveLifestylePASession();
			pa.setAverageHeartRate( (curr.getHr()!=null) ? Integer.parseInt(curr.getHr()) : 0);
			dateString=curr.getDate();
			pa.setDate(DateMgt.getDate(dateString));
			pa.setDescription(curr.getDescription());
			if(curr.getDuration()!=null){
				pa.setDuration(Integer.parseInt(curr.getDuration()));
			}else{
				pa.setDuration(DateMgt.getMinutesBetween(curr.getStartTime(),curr.getEndTime()));
			}
			pa.setDuration( (curr.getDuration()!=null) ? Integer.parseInt(curr.getDuration()) : 0);
			pa.setStartTime(curr.getStartTime());
			pa.setEndTime(curr.getEndTime());
//			pa.setIntensity(getConvertedIntensity(curr));
			pa.setMonitored(curr.isMonitored());
			pa.setStepsNumber((curr.getSteps()!=null) ? Integer.parseInt(curr.getSteps()) : 0);
			pa.setType(getConvertedType(curr));
			// TOTEST
			pa.setTypeLabel(activitiesDAO.findActivityByCode(pa.getType().getCode(), locale.toString()));
			
			
			PwLogger.logger.fine(pa.toString());
			activitySessions.add(pa);
			}
		}
		String key=DateMgt.getComparableDayString(DateMgt.getDate(dateString));
		ArrayList<ActiveLifestylePASession> sess=mapActivitySessions.get(key);
		if (sess!=null && sess.size()>0)
			sess.addAll(activitySessions);
		else
			mapActivitySessions.put(key, activitySessions);
			
			model.addAttribute("activitysessions",mapActivitySessions);
			
		return model;	
	}
	
	
	private String saveIntoHDMS(CustomOutdoor[] sessions, Model model, Locale locale) throws ApiException, IOException{
		 prop = new Properties();
		 InputStream inputStream = getClass().getClassLoader().getResourceAsStream(filename);
		 if (inputStream == null) {
			 String msg="property file '" + filename
					 + "' not found in the classpath";
		PwLogger.errorLogger.severe(msg);
		throw new FileNotFoundException(msg);
		 }
		 prop.load(inputStream);
		
		String result="";
		PwLogger.printMethod();
		for (CustomOutdoor current : sessions) {
			if (current != null){
			CardiacRehabilitationProgressActiveLifestylePASessionSubsection pas=new CardiacRehabilitationProgressActiveLifestylePASessionSubsection();
			
			String date=current.getDate();
			if (StringUtil.isValid(date)){
				Date dateToPass=DateMgt.getDate(date);
				pas.setDate(new DateTime(dateToPass.getTime()).toDate());
			}
			
			String desc=current.getDescription();
			if(StringUtil.isValid(desc)){
				pas.setDescription(desc);
			}
			
			String duration=current.getDuration();
			if(StringUtil.isValid(duration)){
				pas.setDuration(Integer.parseInt(duration));
			}
			
			String endTime = current.getEndTime();
			if(StringUtil.isValid(endTime)){
				endTime = date+" "+endTime;
				pas.setEndTime(DateMgt.getDate(endTime));
			}
			
			String hr = current.getHr();
			if (StringUtil.isValid(hr)){
				pas.setAverageHeartRate(Integer.parseInt(hr));
			}
			
			String intensity=current.getIntensity();
			if (StringUtil.isValid(intensity)){
				pas.setIntensity(Integer.parseInt(intensity));
			}
//				
//				IntensityType[] values = IntensityType.values();
//				int max=values.length;
//				int pos=-1;
//				for (int i = 0; i <max; i++) {
//					if (values[i].toString().equalsIgnoreCase(intensity)){
//						pos=i;
//						break;
//					}
//				}
//				if (pos>=0)
//					pas.setCrProgressActiveLifestylePASessionIntensity(pos);
//			}
//			
			String kcal = current.getKcal();
			if(StringUtil.isValid(kcal)){
				CardiacRehabilitationProgressActiveLifestylePASessionenergyExpenditureSubSubSection energy = new CardiacRehabilitationProgressActiveLifestylePASessionenergyExpenditureSubSubSection();
				energy.setKcal(Integer.parseInt(kcal));
				pas.setEnergyExpenditure(energy);
			}
			
			String startTime=current.getStartTime();
			if(StringUtil.isValid(startTime)){
				startTime = date+" "+startTime;
				pas.setStartTime(DateMgt.getDate(startTime));
			}
			
			String steps=current.getSteps();
			if(StringUtil.isValid(steps)){
				pas.setStepsNumber(Integer.parseInt(steps));
			}
			
			String type=current.getType();
			if(StringUtil.isValid(type)){
				Integer aType = Integer.parseInt(type);
//				String typeLabel = activityDAO.findActivityByCode(aType, locale.getLanguage());
//				int actType = getConvertedTypePosition(current);
//				if (actType>=0)
//					pas.setType(actType);
//				
				aType = Integer.parseInt(activitiesDAO.findDefaultPositionFromCode(aType));
				pas.setType(aType);
//				current.setType(activitiesDAO.findDefaultActivityFromId(aType));
			}
			
			pas.setMonitored(current.isMonitored()); //manipolo i boolean come integer per HDMS
			
			CardiacRehabilitationProgressActiveLifestylePASessionminutesInZoneSubSubSection minutesInZone = new CardiacRehabilitationProgressActiveLifestylePASessionminutesInZoneSubSubSection();
			
			minutesInZone.setZone050(current.getMinIn050() != null ? current.getMinIn050() : 0 );
			minutesInZone.setZone5160(current.getMinIn5160() != null ? current.getMinIn5160() : 0 );
			minutesInZone.setZone6170(current.getMinIn6170() != null ? current.getMinIn6170() : 0 );
			minutesInZone.setZone7180(current.getMinIn7180() != null ? current.getMinIn7180() : 0 );
			minutesInZone.setZone8190(current.getMinIn8190() != null ? current.getMinIn8190() : 0 );
			minutesInZone.setZone91100(current.getMinIn91100() != null ? current.getMinIn91100() : 0);
			minutesInZone.setZone101(current.getMinIn101() != null ? current.getMinIn101() : 0);
			
			pas.setMinutesInZone(minutesInZone);
			
			
			//check della ACCEPTABILITY - 70% del tempo tra il 60% ed il 90% della HRMax [tutto preso da MS devi calcolare solo la percentuale dei minuti]
			// 2070914 aggiunto parametro di numero minimo di minuti. Letto dal file delle properties
			int min = Integer.parseInt(prop.getProperty("ACCEPTABILITYMINUTES"));
			if(pas.getMonitored()){
				checkAcceptability(pas,current,min);
			}else{
				PwLogger.logger.fine("Acceptable? "+(pas.getMonitored())+". Because getMonitored() is "+ pas.getMonitored());
				pas.setAcceptable(new Boolean(false));
			}
			
			String xSessionId=(String) model.asMap().get("xSessionId");
			String patientNumber=(String) model.asMap().get("sin");
			
			PwLogger.logger.fine("To Persist: "+pas.toString());
			
			
			if (Boolean.parseBoolean(prop.getProperty("DONTSAVE"))){
				PwLogger.logger.fine("The PA session won't be saved into HDSM due to the DONTSAVE parameter");
			}else{
				result=CRProgress.savePA(patientNumber, xSessionId, pas);
				try {
					model=homeController.refreshProgress(model);
				} catch (Exception e) {
					e.printStackTrace();
					PwLogger.logger.fine("Error getting the CRProgress");
				}
			}
		}
		}
		return result;
	}

	
	/**
	 * Valuta l'accettabilità della sessione. Il 70% del tempo deve essere speso tra il 60% ed il 90% della frequenza massima
	 * @param pas
	 * @param current
	 */
	private void checkAcceptability(CardiacRehabilitationProgressActiveLifestylePASessionSubsection pas, CustomOutdoor current, int minutiMinimi) {
		Double percTime = 0.7;
//		Double percMin = 0.6;
//		Double percMax = 0.9;
		if (pas.getDuration() != null){
			Integer wholeDuration=pas.getDuration();
			if (wholeDuration > minutiMinimi){
				Double goalDuration = percTime * (double) wholeDuration;
				
				Integer sum = 0;
				
				sum += current.getMinIn6170()!=null ? current.getMinIn6170() : 0; 
				sum += current.getMinIn7180()!=null ? current.getMinIn7180() : 0; 
				sum += current.getMinIn8190()!=null ? current.getMinIn8190() : 0; 
				PwLogger.logger.fine("Acceptable? "+(wholeDuration > minutiMinimi)+". Because wholeDuration is "+ wholeDuration +" and the minutiMinimi is: "+ minutiMinimi);
				PwLogger.logger.fine("Acceptable? "+(sum>=goalDuration)+". Because SUM is "+ sum +" and the goalDuration is: "+ goalDuration);
				if (sum>=goalDuration){
					pas.setAcceptable(new Boolean(true));
				}else{
					pas.setAcceptable(new Boolean(false));
				}
			}else{
				PwLogger.logger.fine("Acceptable? "+(wholeDuration > minutiMinimi)+". Because wholeDuration is "+ wholeDuration +" and the minutiMinimi is: "+ minutiMinimi);
				pas.setAcceptable(new Boolean(false));
			}
		}else{
			PwLogger.logger.fine("Acceptable? "+(pas.getDuration() != null)+". Because pas.getDuration() is null");
			pas.setAcceptable(new Boolean(false));
		}
		
		
	}

}