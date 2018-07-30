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
import java.text.SimpleDateFormat;
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
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.google.gson.Gson;

import ers.test.Utility;
import io.swagger.client.ApiException;
import io.swagger.client.model.GenericPostputResult;
import io.swagger.client.model.PATIENT;
import it.eng.pathway.fake.model.ActiveLifestylePASession;
import it.eng.pathway.fake.model.CardiacRehabilitationProgramme;
import it.eng.pathway.fake.model.CardiacRehabilitationProgress;
import it.eng.pathway.fake.model.DailyActivity;
import it.eng.pathway.fake.model.EnergyExpenditureObservation;
import it.eng.pathway.fake.model.ExerClassSession;
import it.eng.pathway.fake.model.ExerGameSession;
import it.eng.pathway.fake.model.ExerciseProgramme;
import it.eng.pathway.fake.model.ExerciseSession;
import it.eng.pathway.fake.model.HRZone;
import it.eng.pathway.fake.model.TrainingPhaseInfo;
import it.eng.pathway.fake.model.TrainingProfile;
import it.eng.pathway.frontend.business.FrontEndPatientBusiness;
import it.eng.pathway.frontend.exception.NoRefreshTokenException;
import it.eng.pathway.frontend.model.FrontEndPatient;
import it.eng.pathway.hdms.connection.Access;
import it.eng.pathway.hdms.connection.CRProgramme;
import it.eng.pathway.hdms.connection.CRProgress;
import it.eng.pathway.hdms.connection.Patient;
import it.eng.pathway.utility.DateMgt;
import it.eng.pathway.utility.MotivationalSlogan;
import it.eng.pathway.utility.PwLogger;
import it.eng.pathway.utilitymodel.AverageHR;
import it.eng.pathway.utilitymodel.ChartModeller;
import it.eng.pathway.utilitymodel.CustomSession;
import it.eng.pathway.utilitymodel.CustomSession.SessionType;
import it.eng.pathway.utilitymodel.ExerciseProgrammeComparator;
import it.eng.pathway.utilitymodel.ExerciseSessionComparator;
import it.eng.pathway.utilitymodel.GaugeModeller;
import it.eng.pathway.utilitymodel.LoginForm;

@Controller
@SessionAttributes({"xSessionId" , "sin", "username", "progress", "programme", "start", "end", "startRequest", "sessionsMap", "sessionsMapByDate", "filteredSessions", "sessions", "weeksGoal", "weeksTot", "totalSessions", "totalSessionsGoal", "role", "msError"})
public class HomeController {
	
private static final String FORMATTER_STRING = "yyyy-MM-dd";
private static final String READABLE_STRING = "dd-MM-yyyy hh:mm";
private static final String DEFAULT_PATIENT_NUMBER = "0";
private static String SESSIONS_FREQ;
private static String SESSIONS_TOTAL_DURATION;
private static String SESSIONS_AVG_DURATION;
	//	static ArrayList<String> labels;
//	static ArrayList<CustomSession> sessions;
	static int idFilter=3;
	
	private MessageSource msg;
	@Autowired
    public void AccountsController(MessageSource msgSrc) {
     this.msg = msgSrc;
    }
	
	@Autowired
	MotivationalSlogan motivationalSlogan;
	
	@Autowired
	FrontEndPatientBusiness frontendPatientBusiness;
	
	@Autowired
	MSController msController;
	
//	static CardiacRehabilitationProgress progress;
//	static CardiacRehabilitionProgramme programme;
	private static int MAX=185;
//	static List<ExerciseSession> sessions;
	static Map<CustomSession.SessionType, ArrayList<? extends ExerciseSession>> sessionsMap;
	static Map<String, ArrayList<? extends ExerciseSession>> sessionsMapByDate;
	
//	PARAMETRO PER BYPASSARE IL LOGIN
//	private static boolean INTEGRATED=true;
	
	private Properties prop;
	private String filename = "config.properties";
	
	
	@RequestMapping(value="/login", method={RequestMethod.POST, RequestMethod.GET})
	public String logIn(@ModelAttribute LoginForm form, String sessionId, String sin, Model model, Locale locale, HttpServletRequest request, HttpSession session) throws IOException, ApiException{
		
		 prop = new Properties();
		 InputStream inputStream = getClass().getClassLoader().getResourceAsStream(filename);
		 String patientNumber;
		 boolean login=true;
		
		 if (inputStream == null) {
			 String msg="property file '" + filename
					 + "' not found in the classpath";
		PwLogger.errorLogger.severe(msg);
		throw new FileNotFoundException(msg);
		 }
		 prop.load(inputStream);
		
		PwLogger.printMethod();
		session.invalidate();
		model.asMap().clear();
		PwLogger.logger.fine("sessionId: "+sessionId);
		PwLogger.logger.fine("sin: "+sin);
		PwLogger.logger.fine("LoginForm: "+form);
		PwLogger.logger.fine("Language: "+locale.getLanguage());
		String username=null;
		String password=null;
		if (form!=null && form.getUsername()!=null){
			username=form.getUsername();
			password=form.getPassword();
		}
		
		//from HomeApplication + ClinicalApplication
		if (sessionId!=null && !sessionId.equals("")){
			login=false;
			PwLogger.logger.fine("SessionId From NG or ERS:"+sessionId);
			model.addAttribute("xSessionId", sessionId);
//			return dashboard(model,locale);
		}
		
		//from ClinicalApplication
		if (sin!=null && !sin.equals("")){
			login=false;
			PwLogger.logger.fine("SessionId From ERS:"+sessionId);
			model.addAttribute("sin",sin);
//			return dashboard(model,locale);
		}
		
		if (/*Boolean.parseBoolean(prop.getProperty("INTEGRATED")) &&*/ login){
			PwLogger.logger.fine("Trying to contact HDMS");
			Access access=new Access(); //imposta anche il proxy per le prove in locale
			try{
			GenericPostputResult result=access.login(username, password);
			String uid=result.getUid();
			model.addAttribute("xSessionId", uid);
			model.addAttribute("username", username);
			
			//TODO manca il check per sapere se l'utente loggato è un paziente o l'admin
			if (isAdmin(model)){
				model.addAttribute("role",EditingController.ADMIN);
				return "healthyPage";
			}
			
			
			}
			catch (ApiException e){
				String tester=this.msg.getMessage("error.msg.tester", null, locale);
				String msg=Utility.getMessage(e)+ " " + tester;
				PwLogger.logger.fine("FROM HDMS: "+msg);
				PwLogger.errorLogger.severe("FROM HDMS: "+msg);
//				model.addAttribute("msg", msg);
//				return "redirect:/";
				
//				return showErrorMsg(msg,"FROM HDMS: "+msg, model); //HDMS fails	
				
				model.addAttribute("xSessionId", "HDMS INTERACTION ERROR");
				model.addAttribute("username", "Jon Snow");
				model.addAttribute("sin","1236");
			}
		}
		
		
		// call the HDMS for getting more infos - Demograhphic
		patientNumber=(String) model.asMap().get("sin");
		String xSessionId=(String) model.asMap().get("xSessionId");
		try {
			PATIENT patient = Patient.getDemographics(patientNumber!=null ? patientNumber : DEFAULT_PATIENT_NUMBER, xSessionId);
			username=patient.getDemographics().getFirstName(); //modifica senza senso sull'hdms
//			username=patient.getDemographics().getLastName();
			if (username == null)
				username =  "Jon Snow";
			model.addAttribute("username", username);
			patientNumber=patient.getIdentification().getPATIENTID();
			model.addAttribute("sin",patientNumber);
			PwLogger.logger.fine("username: "+username+" sin: "+ patientNumber);
		} catch (ApiException e) {
			String tester=this.msg.getMessage("error.msg.tester", null, locale);
			String msg=Utility.getMessage(e)+ " " + tester;
			PwLogger.logger.fine(msg);
			PwLogger.errorLogger.severe(msg);
			return showErrorMsg(msg,"FROM HDMS: "+msg, model);  	
		}
		
		
		
		if (!Boolean.parseBoolean(prop.getProperty("INTEGRATED"))){
			String msg=this.msg.getMessage("error.msg", null, locale);
					msg+=" "+this.msg.getMessage("hdmsNotIntegrated", null, locale);
			return showErrorMsg(msg,"FROM HDMS: "+msg, model);		
			
		}
		else{
			PwLogger.logger.fine("Contacting HDMS for CRProgramme");
			try{
				CardiacRehabilitationProgramme prog = CRProgramme.getProgramme(patientNumber, xSessionId);
				if (prog==null || prog.getExerciseProgrammes() == null || prog.getExerciseProgrammes().size() <= 0){
					return "errorPageHDMS";
				}
				model.addAttribute("programme", prog);
				Calendar cal=GregorianCalendar.getInstance();
				cal.add(Calendar.DAY_OF_MONTH, -28);
				refreshProgress(model);
			}catch (Exception e){
				e.printStackTrace();
				return("errorPageHDMS");
			}
			
		}
		
		
		FrontEndPatient patient=frontendPatientBusiness.getPatient(patientNumber);
		if (patient!=null){
			patient.setUsername(username);
			frontendPatientBusiness.update(patient);
		}else{
			patient = new FrontEndPatient(username,patientNumber,null,null);
			frontendPatientBusiness.create(patient);
		}
		
		
		return dashboard(model,locale);
		
	}
	
	private boolean isAdmin(Model model) {
		
		try {
			Access access=new Access();
			String username=(String) model.asMap().get("username");
			String xSessionId=(String) model.asMap().get("xSessionId");
			PwLogger.logger.fine("Checking role of "+username);
			if (access.isAdmin(username, xSessionId)){
				PwLogger.logger.fine("IS ADMIN or SUPERVISOR");
				return true;
			}else{
				PwLogger.logger.fine("IS PATIENT");
				return false;
			}
		} catch (IOException e) {
			PwLogger.logger.fine("[ERROR] IOException during isAdmin");
			e.printStackTrace();
		} catch (ApiException e) {
			PwLogger.logger.fine("[ERROR] ApiException during isAdmin");
			PwLogger.logger.fine(e.getMessage());
		}
		return false;
	}

	public Model refreshProgress(Model model) throws ApiException, IOException{
//		PwLogger.printMethod();
		PwLogger.logger.fine("Contacting HDMS for CRProgress");
		String patientNumber = (String) model.asMap().get("sin");
		String xSessionId = (String) model.asMap().get("xSessionId");
		Date startDate = null;
		Date stopDate;
		
		Calendar cal = GregorianCalendar.getInstance();
		stopDate = cal.getTime();
		
		startDate = getStartDate(model);
		
		
		CardiacRehabilitationProgress progress=CRProgress.getCompleteCRProgress(patientNumber, xSessionId, startDate, stopDate);
		if (progress==null){
			PwLogger.logger.fine("NO PROGRESS present for patient: "+patientNumber);
			progress = new CardiacRehabilitationProgress();
		}else{
			PwLogger.logger.fine("ExerciseSessions Presenti: "+progress.getExerciseSession().size());
		}
		model.addAttribute("progress", progress);
		
		createSessionsMapByDate(model);
		
		return model;
	}
	
	private boolean wasAlreadyRequest(Model model){
		String startFromPatientStr = (String) model.asMap().get("start");
		Date startRequest = (Date) model.asMap().get("startRequest");
		if (startFromPatientStr != null && startRequest != null){
			Date startFromPatient = DateMgt.getDate(startFromPatientStr);
			
			return !(startFromPatient.before(startRequest));
		}
		return false;
	}
	
	private Date getStartDate(Model model){
		Calendar cal = GregorianCalendar.getInstance();
		Date startDate = null;
		// ottimizziamo le chiamate iniziali - inizio con 1 mese
		String startFromPatientStr = (String) model.asMap().get("start");
		Date startRequest = (Date) model.asMap().get("startRequest");
		if (startFromPatientStr != null && startRequest != null) {
			Date startFromPatient = DateMgt.getDate(startFromPatientStr);

			if (startFromPatient.before(startRequest)) {
				startDate = startFromPatient;
				model.addAttribute("startRequest", startFromPatient);
			}
		}

		if (startDate == null) {
			cal.add(Calendar.MONTH, -1);
			startDate = cal.getTime();
			model.addAttribute("startRequest", startDate);
		}
		return startDate;
	}
	
//	@RequestMapping(value="/plogin", method=RequestMethod.POST)
//	public String logInFromPlatform(String sessionId, Model model, Locale locale){
////		Recuperare username da HDMS
//		PwLogger.printMethod();
//		System.out.println(sessionId);
//		model.addAttribute("xSessionId", sessionId);
//		return dashboard(model,locale);
//	}
//
//	@RequestMapping(value="/sayHello", method=RequestMethod.GET)
//	public ModelAndView homeRender(){
//		return new ModelAndView("hello.world", "message", "Ciao a te");
//	}
	
	@RequestMapping(value="/risks", method=RequestMethod.GET)
	public String risksRender(){
		PwLogger.printMethod();
		return "risks";
	}
	
//	@RequestMapping(value="/healthy", method=RequestMethod.GET)
//	public String healthyRender(){
//		return "healthy";
//	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(SessionStatus status, HttpSession session, Model model, Locale locale){
		PwLogger.printMethod();
		if (status!=null)
			status.setComplete();
		session.invalidate();
		model.asMap().clear();
		return "redirect:/";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/dashboard", method=RequestMethod.GET)
	public String dashboard(Model model, Locale locale){
		PwLogger.printMethod();
		//dopo il log-in, con il xSessionId recuperato
//		if (!model.containsAttribute("xSessionId"))
//			model.addAttribute("xSessionId", UUID.randomUUID());
		
		model=addMenuData(model,getDataThisWeekArrayList(model));
//		model.addAttribute("todo",3);
//		model.addAttribute("todoList","1 Exerclass <br>2 Exergame");
		
//        System.out.println(("Client Locale: "+ locale.toString()));
	    SESSIONS_FREQ = msg.getMessage("sessions.number", null, locale);
	    SESSIONS_TOTAL_DURATION = msg.getMessage("sessions.duration.total",null, locale);
	    SESSIONS_AVG_DURATION= msg.getMessage("sessions.duration.avg",null, locale);
	    
		
		
		
		model.addAttribute("this","active");
		model.addAttribute("week","");
		model.addAttribute("month","");
		model.addAttribute("custom","");
		
		
		//gestire la generazione dell'agenda basata sul FITT programme
//		CurrentExerciseProgramme exerciseProg=getProgramme(model).getCurrentExerciseProgramme();
//		int cNum=exerciseProg.getNumberOfExerclass();
//		int gNum=exerciseProg.getNumberOfExerGame();
//		int paNum=exerciseProg.getNumberOfActiveLifeStyleActivity();
		
//		From HDMS
//		ExerciseProgrammes exerciseProg=((CardiacRehabilitationProgramme) model.asMap().get("programme")).getExerciseProgrammes();
//		if (exerciseProg!=null && it.eng.pathway.fake.model.ExerciseProgramme.isValid(exerciseProg)){
			
			
			ArrayList<String> date=getDataThisWeekArrayList(model);
			model.addAttribute("start", date.get(0));
			model.addAttribute("end", date.get(1));
			ExerciseProgramme exerciseProg=getLastOfTheWeekProgramme(null,model);
			if (exerciseProg==null){
				return "errorPageHDMS";
			}
			model.addAttribute("exProgramme", exerciseProg);
			
			ArrayList<ExerciseSession> filteredSessions=filterSessions(model, 3);
			
			Integer cNum=exerciseProg.getNumberOfExerClass();
			Integer gNum=exerciseProg.getNumberOfExerGame();
			Integer paNum=exerciseProg.getNumberOfActiveLifestyleActivity();
			
			if (filteredSessions!=null){
				for (ExerciseSession curr : filteredSessions) {
					if (curr.isAcceptable()){ //non calcolo se non è accettabile
						if (curr instanceof ExerClassSession){
							cNum--;
						}else if(curr instanceof ExerGameSession){
							gNum--;
						}else if(curr instanceof ActiveLifestylePASession){
							paNum--;
						}
					}
				}
			}
			cNum= (cNum == null || cNum<0) ? 0 : cNum;
			gNum= (gNum == null || gNum<0) ? 0 : gNum;
			paNum= (paNum == null || paNum<0) ? 0 : paNum;
			
			model.addAttribute("todo",cNum+gNum+paNum);
			String toPrint="";
			String classLabel=msg.getMessage("dashboard.label.todo.class", null, locale);
			String gameLabel=msg.getMessage("dashboard.label.todo.game", null, locale);
			String paLabel=msg.getMessage("dashboard.label.todo.pa", null, locale);
			if (cNum>0){
				
				toPrint+=cNum+" "+classLabel+"<br>";
			}
			if (gNum>0){
				toPrint+=gNum+" "+gameLabel+"<br>";
			}
			if (paNum>0){
				toPrint+=paNum+" "+paLabel+"<br>";
			}
			model.addAttribute("todoList",toPrint);	
			

			createSessionsMapByDate(model);
//		}
		
		return "aggregate";
	}
	
	private void createSessionsMapByDate(Model model){
		//crea la map con le divisioni per tipologia
				ArrayList<ExerClassSession> classes=new ArrayList<ExerClassSession>();
				ArrayList<ExerGameSession> games=new ArrayList<ExerGameSession>();
				ArrayList<ActiveLifestylePASession> pas=new ArrayList<ActiveLifestylePASession>();
				
		CardiacRehabilitationProgress progress=((CardiacRehabilitationProgress) model.asMap().get("progress"));
		List<ExerciseSession> sessions=((List<ExerciseSession>) model.asMap().get("sessions"));
		if (progress!=null)
			sessions= ((CardiacRehabilitationProgress) model.asMap().get("progress")).getExerciseSession();
		else {
			sessions=getSessions(model);
		}
			
		sessionsMapByDate=(Map<String, ArrayList<? extends ExerciseSession>>) model.asMap().get("sessionsMapByDate");
		sessionsMap=(Map<SessionType, ArrayList<? extends ExerciseSession>>) model.asMap().get("sessionsMap");
		
		if (sessionsMapByDate==null)
			sessionsMapByDate=new HashMap<String, ArrayList<? extends ExerciseSession>>();
		
		if (sessionsMap==null)
			sessionsMap=new HashMap<CustomSession.SessionType, ArrayList<? extends ExerciseSession>>();
		
		sessionsMapByDate.clear();
		sessionsMap.clear();
		if (sessions!=null){ //HDMS fails
			for (ExerciseSession current : sessions) {
				if (current.isValid()){
					if (current instanceof ExerClassSession){
						classes.add((ExerClassSession) current);
					}else if (current instanceof ExerGameSession){
						games.add((ExerGameSession) current);
					}else if (current instanceof ActiveLifestylePASession){
						pas.add((ActiveLifestylePASession) current);
					}
					String date=DateMgt.getFormattedDateString(current.getDate());
					ArrayList<ExerciseSession> sessionsByDate=(ArrayList<ExerciseSession>) sessionsMapByDate.get(date);
					if (sessionsByDate==null)
						sessionsByDate=new ArrayList<ExerciseSession>();
					sessionsByDate.add(current);
					sessionsMapByDate.put(date, sessionsByDate);
				}
			}
			sessionsMap.put(SessionType.CLASS,classes);
			sessionsMap.put(SessionType.GAME, games);
			sessionsMap.put(SessionType.ACTIVE, pas);
			
			model.addAttribute("sessionsMap", sessionsMap);
			model.addAttribute("sessionsMapByDate",sessionsMapByDate);
		}
	}
	
	
	private List<ExerciseSession> getSessions(Model model) {
//		PwLogger.printMethod();
//		CardiacRehabilitionProgramme prog=(CardiacRehabilitionProgramme) model.asMap().get("programme");
//		if (prog==null)
//		CardiacRehabilitionProgrammeprog=getProgramme(model);
//		model.addAttribute("programme", prog);
//		Calendar cal=GregorianCalendar.getInstance();
//		cal.add(Calendar.DAY_OF_MONTH, -28);
//		CardiacRehabilitationProgress progress=CRCustomCreation.getSessions(prog, 28, cal.getTime());
		
//		from HDMS
		CardiacRehabilitationProgress progress=(CardiacRehabilitationProgress) model.asMap().get("progress");
//		if (progress==null){ //HDMS fails
//			CardiacRehabilitationProgramme prog = (CardiacRehabilitationProgramme) model.asMap().get("programme");
//			HashMap<String, Object> map=CRProgressCreator.createProgress(prog, DateMgt.getDate("01-05-2016"), DateMgt.getDate("05-07-2016"));
//			ArrayList<ExerciseSession> sess=new ArrayList<>();
//			Set<String> keys= map.keySet();
//			for (String key : keys) {
//				Object currProgress=map.get(key);
//				if (currProgress instanceof  ExerClassSessionProgress){
//					List <ExerClassSessionss> list=((ExerClassSessionProgress) currProgress).getExerClassSessionsss();
//					for (ExerClassSessionss curr : list) {
//						sess.add(new ExerClassSession((ExerClassSessionss) curr));
//					}
//				}else  if (currProgress instanceof  ExerGameSessionProgress){
//					sess.add(new ExerGameSession((ExerGameSessionProgress) currProgress));
//				}else if (currProgress instanceof  ActiveLifeStyleProgress){
//					List <ActiveLifestylePASessionSS> list=((ActiveLifeStyleProgress) currProgress).getActiveLifestylePASessionSSs();
//					for (ActiveLifestylePASessionSS curr : list) {
//						sess.add(new ActiveLifestylePASession((ActiveLifestylePASessionSS) curr));
//					}
//				}
//			}
//			model.addAttribute("sessions",sess);
//			return sess;
//		}else{
		if (progress!=null)
			return progress.getExerciseSession();
		else
			return new ArrayList<ExerciseSession>();
//		}
		
//		return (List<ExerciseSession>) (progress!=null ? progress : model.asMap().get("sessions")); //HDMS fails
	}

	private String createSentence(int done, int goal) {
		String toRet="";
		if (done>goal)
			toRet="Hai fatto troppo, placati!";
		else
			toRet="Daje un po'";
		return toRet;
	}

	@RequestMapping(value="/analyseSession", method=RequestMethod.GET)
	public String getValuesForSingleSession(String data,String id,Model model){
		PwLogger.printMethod();
		
		model.addAttribute("date", data);
		model.addAttribute("id", id);
		model=addMenuData(model,null);
		return "singleSession";
	}
	
	
	@SuppressWarnings("unchecked")
	public static Model addMenuData(Model model, ArrayList<String> arrayList){
//		PwLogger.printMethod();
		List<ExerciseSession> sessions=(List<ExerciseSession>) model.asMap().get("filteredSessions");
		CardiacRehabilitationProgress progress=(CardiacRehabilitationProgress) model.asMap().get("progress");
		if (sessions!=null){
//			PwLogger.logger.fine("Filtered Sessions NOT NULL");
//			printSessions(sessions);
			model.addAttribute("sessions", sessions);
		}
		else{
			if (progress==null){
//				PwLogger.logger.fine("Filtered Sessions NULL + Progress NULL");
				return model; //senza upgrade del menu
			}
//			PwLogger.logger.fine("Filtered Sessions NULL + Progress NOT NULL");
			sessions=progress.getExerciseSession();
//			printSessions(sessions);
			if (sessions == null)
				sessions= new ArrayList<ExerciseSession>();
			model.addAttribute("sessions", sessions);
		}
		return model;
	}
	
	private static void printSessions(List<ExerciseSession> sessions){
		PwLogger.logger.fine("Starting Printing");
		for (ExerciseSession curr : sessions) {
			String toPrint=DateMgt.getReadableDate(curr.getDate())+" ";
					toPrint+=curr.getStartTime()+" -> ";
					toPrint+=curr.getEndTime();
			PwLogger.logger.fine(toPrint);		
		}
		PwLogger.logger.fine("END");
	}
	
	
	@RequestMapping(value = "/filterLabels/{start}/{end}", method = RequestMethod.GET)
	public @ResponseBody String filterLabels(@PathVariable("start") String start, @PathVariable("end") String end,Model model) {
		PwLogger.printMethod();
		ArrayList<String> range=new ArrayList<>();
		range.add(start);
		range.add(end);
		
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		
//		progress=CRCustomCreation.getSessions(programme, DateMgt.getDays(start,end), DateMgt.getDate(start));
//		sessions=progress.getExerciseSession();
		
		ArrayList<ExerciseSession> filteredSessions=filterSessions(model,3);
		
		ArrayList<CustomSession> customs=new ArrayList<CustomSession>();
		for (ExerciseSession current : filteredSessions) {
			CustomSession c=new CustomSession();
			c=new CustomSession();
			c.setDate(DateMgt.getReadableDayTime(current.getDate(),current.getStartTime()));
			if (current instanceof ExerClassSession){
				c.setType(SessionType.CLASS);
			}else if (current instanceof ExerGameSession){
				c.setType(SessionType.GAME);
			}else if (current instanceof ActiveLifestylePASession){
				c.setType(SessionType.ACTIVE);
			}
			
			c.setAcceptable(current.isAcceptable());
				
			customs.add(c);
		}
//		printCustomSessions(customs);
//		model.addAttribute("filteredSessions", filteredSessions);
		
		Gson gson=new Gson();
//		return gson.toJson(getDataFiltered(range));
//		return gson.toJson(filteredSessions);
		return gson.toJson(customs);
	}
	
	private void printCustomSessions(List<CustomSession> customs){
		PwLogger.logger.fine("Starting Printing CUSTOM SESSIONS");
		for (CustomSession curr : customs) {
			String toPrint=curr.getDate();
			PwLogger.logger.fine(toPrint);		
		}
		PwLogger.logger.fine("END CUSTOM");
	}
	
	
	private synchronized ArrayList<ExerciseSession> filterSessions(Model model, int type) {
		
		if(!wasAlreadyRequest(model)){
			try {
				refreshProgress(model);
			} catch (ApiException e) {
				PwLogger.logger.fine("[ERROR] ApiException during refreshProgress");
				e.printStackTrace();
			} catch (IOException e) {
				PwLogger.logger.fine("[ERROR] IoException during refreshProgress");
				e.printStackTrace();
			}
		}
		
//		PwLogger.printMethod();
		CardiacRehabilitationProgress progress=(CardiacRehabilitationProgress) model.asMap().get("progress");
		String startString=(String) model.asMap().get("start");
		String endString=(String) model.asMap().get("end");
		Date start=DateMgt.getDate(startString);
		Date end=DateMgt.getDate(endString);
//		PwLogger.logger.fine("[DEBUG] FROM:"+start+ " TO:"+end);
		
		
		try {
			Date now=DateMgt.getDate(DateMgt.getNow());
			Date limit=now;
			if (end.compareTo(now)<=0)
				limit=end;
			if (limit.before(start))
				limit=start;
//			PwLogger.logger.fine("[DEBUG] FROM:"+start+ " LIMIT:"+limit);
			ActiveLifestylePASession summary = msController.createPathwaySummary(start, limit, model, null);
			if (summary!=null){
				PwLogger.logger.fine("Steps for"+ startString+" "+ endString+" - "+summary.getStepsNumber());
				PwLogger.logger.fine("kcal for"+ startString+" "+ endString+" - "+summary.getEnergyExpenditure().getValue());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String comparableStart=DateMgt.getComparableDayString(start);
		String comparableEnd=DateMgt.getComparableDayString(end);
		List<ExerciseSession> allSessions;
		if (progress==null){
			allSessions=getSessions(model);
		}
		else {
			allSessions=progress.getExerciseSession();
		}
		ExerciseSessionComparator comp=new ExerciseSessionComparator();
		
		ArrayList<ExerciseSession> filteredSessions=new ArrayList<>();
		if (allSessions!=null && allSessions.size()>0) { //HDMS fails
			Collections.sort(allSessions, comp);
			for (ExerciseSession current : allSessions) {
				if (current.isValid()){
					String currentDayComparable = DateMgt.getComparableDayString(current.getDate());
					if (currentDayComparable.compareTo(comparableStart)>=0 && currentDayComparable.compareTo(comparableEnd)<=0){
//						System.out.println("Entrato "+currentDayComparable);
						switch (type) {
						case 0:
							if (current instanceof ExerClassSession)
								filteredSessions.add(current);
							break;
						case 1:
							if (current instanceof ExerGameSession)
								filteredSessions.add(current);
							break;
						case 2:
							if (current instanceof ActiveLifestylePASession)
								filteredSessions.add(current);
							break;
						case 3:
							filteredSessions.add(current);
							break;
						default:
							filteredSessions.add(current);
							break;
						}
						
					}
				}
			}
			
			model.addAttribute("filteredSessions",filteredSessions);
		}
		
		
//		StackTraceElement[] stackTraceElements = Thread.currentThread().getStackTrace();
//		StackTraceElement element=stackTraceElements[2];
//		System.out.println((element.getClassName()+"."+element.getMethodName()));
//		System.out.println(filteredSessions.size());
		
		
		return filteredSessions;
	}

	@RequestMapping(value = "/rangeThisWeek", method = RequestMethod.GET)
	public @ResponseBody String getDataThisWeek(Model model) {
//		PwLogger.printMethod();
		Gson gson=new Gson();
		return gson.toJson(getDataThisWeekArrayList(model));
	}
	
	
	private ArrayList<String> getDataThisWeekArrayList(Model model) {
//		PwLogger.printMethod();
		CardiacRehabilitationProgramme programme=getProgramme(model);
		
//			if (programme==null)
//				programme=(CardiacRehabilitionProgramme) model.asMap().get("programme");
//			if (programme==null)
//				programme=getProgramme();
		
//			String dateStart=programme.getCreationDate();
		
		
		SimpleDateFormat formatter = new SimpleDateFormat(FORMATTER_STRING);
//			SimpleDateFormat readable = new SimpleDateFormat(READABLE_STRING);
//			SimpleDateFormat loggable = new SimpleDateFormat(READABLE_STRING +" [EEEE]");
//			Date startD = formatter.parse(dateStart);
		Date startD = programme.getCreationDate(); //modificato il getCreationDate perché ci sono problemi con il setting del CreationDate del CRProgramme
		if (startD!=null){
			//CI SONO PROBLEMI CON LA CREATION DATE DEL CRPROGRAMME
			//FIX PROGRAMMATICO DEL FRONTEND
			String start = formatter.format(startD);
			DateTime startJoda=new DateTime(startD);
			DateTime endJoda = startJoda.plusDays(6);
			String end = formatter.format(endJoda.toDate());
			
			Calendar today = GregorianCalendar.getInstance();
			DateTime todayJoda=new DateTime(today.getTime());
			int n=todayJoda.compareTo(startJoda);
			ArrayList<String> range=new ArrayList<>();
//			System.out.println("JodaDifference: " +n);
			if (n<0){
			
//				range.add(start);	
//				range.add(end);
			}else{
	//			today.add(Calendar.DAY_OF_MONTH, i);
	//				System.out.println("TodayIs: "+DateMgt.getReadableDate(today.getTime()));
				Calendar startTime = GregorianCalendar.getInstance();
	//				startTime.setTime(today.getTime());
				Calendar temp = GregorianCalendar.getInstance();
				temp.setTime(startD);
	//				System.out.println("Ipotizzo allenamento iniziato il: " + DateMgt.getReadableDate(temp.getTime()));
				int startDayOfWeek = temp.get(Calendar.DAY_OF_WEEK);
	//				System.out.println("StartDayOfWeek: "+startDayOfWeek);
				
				startTime.set(Calendar.DAY_OF_WEEK, startDayOfWeek);
				
				startJoda=new DateTime(startTime.getTime());
				endJoda = startJoda.plusDays(6);
				start = formatter.format(startD);
				end = formatter.format(endJoda.toDate());
				
				n=todayJoda.compareTo(startJoda);
	//			System.out.println("JodaDifference: " +n);
				if (n>=0){
					temp.setTime(startTime.getTime());
	//					System.out.println("TempTime: "+DateMgt.getReadableDate(temp.getTime()));
					temp.add(Calendar.DAY_OF_MONTH, 6); // data fine settimana corrente
				}else{
					startTime.add(Calendar.DAY_OF_MONTH, -7); // data di inizio
					// settimana corrente
	//					System.out.println("StartTime: "+DateMgt.getReadableDate(startTime.getTime()));
					temp.setTime(startTime.getTime());
	//					System.out.println("TempTime: "+DateMgt.getReadableDate(temp.getTime()));
					temp.add(Calendar.DAY_OF_MONTH, 6); // data fine settimana corrente
				}
				
	//			int differenceDaysWeek = DateMgt.getDaysInAWeekBetween(today,startTime);
	//				System.out.println("Differenza giorni settimana: "+differenceDaysWeek);
	//			int differenceDays = DateMgt.getDays(startTime.getTime(),today.getTime());
	//				System.out.println("Differenza giorni mese: "+differenceDays);	
	//				System.out.println("EndTime: "+DateMgt.getReadableDate(temp.getTime()));
	//				System.out.println("Il range per la settimana attuale sarebbe dal: " + DateMgt.getReadableDate(startTime.getTime())
	//						+ " al: " + DateMgt.getReadableDate(temp.getTime()));
				start = formatter.format(startTime.getTime());
				end = formatter.format(temp.getTime());
			}
			
			range.add(start);	
			range.add(end);
			
			
			
//			Calendar today = GregorianCalendar.getInstance();
////			today.add(Calendar.DAY_OF_MONTH, i);
////				System.out.println("TodayIs: "+DateMgt.getReadableDate(today.getTime()));
//			Calendar startTime = GregorianCalendar.getInstance();
////				startTime.setTime(today.getTime());
//			Calendar temp = GregorianCalendar.getInstance();
//			temp.setTime(startD);
////				System.out.println("Ipotizzo allenamento iniziato il: " + DateMgt.getReadableDate(temp.getTime()));
//			int startDayOfWeek = temp.get(Calendar.DAY_OF_WEEK);
////				System.out.println("StartDayOfWeek: "+startDayOfWeek);
//			
//			startTime.set(Calendar.DAY_OF_WEEK, startDayOfWeek);
//			
//			DateTime startJoda=new DateTime(startTime.getTime());
//			DateTime todayJoda=new DateTime(today.getTime());
//			int n=todayJoda.compareTo(startJoda);
////			System.out.println("JodaDifference: " +n);
//			if (n>=0){
//				temp.setTime(startTime.getTime());
////					System.out.println("TempTime: "+DateMgt.getReadableDate(temp.getTime()));
//				temp.add(Calendar.DAY_OF_MONTH, 6); // data fine settimana corrente
//			}else{
//				startTime.add(Calendar.DAY_OF_MONTH, -7); // data di inizio
//				// settimana corrente
////					System.out.println("StartTime: "+DateMgt.getReadableDate(startTime.getTime()));
//				temp.setTime(startTime.getTime());
////					System.out.println("TempTime: "+DateMgt.getReadableDate(temp.getTime()));
//				temp.add(Calendar.DAY_OF_MONTH, 6); // data fine settimana corrente
//			}
//				
//			int differenceDaysWeek = DateMgt.getDaysInAWeekBetween(today,startTime);
////				System.out.println("Differenza giorni settimana: "+differenceDaysWeek);
//			int differenceDays = DateMgt.getDays(startTime.getTime(),today.getTime());
////				System.out.println("Differenza giorni mese: "+differenceDays);	
////				System.out.println("EndTime: "+DateMgt.getReadableDate(temp.getTime()));
////				System.out.println("Il range per la settimana attuale sarebbe dal: " + DateMgt.getReadableDate(startTime.getTime())
////						+ " al: " + DateMgt.getReadableDate(temp.getTime()));
//			String start = formatter.format(startTime.getTime());
//			String end = formatter.format(temp.getTime());
//			ArrayList<String> range=new ArrayList<>();
//			range.add(start);
//			range.add(end);
			
			return range;
		}
		
		return null;
}
	
	private CardiacRehabilitationProgramme getProgramme(Model model) {
//		PwLogger.printMethod();
		CardiacRehabilitationProgramme programme=(CardiacRehabilitationProgramme) model.asMap().get("programme");
//		if (programme==null || programme.getExerciseProgrammes()==null){
//			PwLogger.logger.fine("Programme RECREATED");
//			programme=CRProgramme.createFakeProgramme(MAX);
//			model.addAttribute("programme", programme);
//		}
		return programme;
	}

	@RequestMapping(value = "/ajaxBoxes/{start}/{end}", method = RequestMethod.GET)
    public @ResponseBody String getBoxesDataByDate(@PathVariable("start") String start, @PathVariable("end") String end, String id, Model model, Locale locale) {
		PwLogger.printMethod();
		ArrayList<ExerciseSession> filteredSessions;
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		if (id==null){
			filteredSessions=filterSessions(model, 3); //3 all
		}
		else{
			filteredSessions=filterSessions(model, Integer.parseInt(id)); //3 all
		}
		int total=0;
		int totalKcal=0;
		int avgDailySteps; //indipendente dal TOTAL
		int totalSteps=0;
		int maxHR=0;
		int cmaxHR=0;
		ArrayList<AverageHR> averages=new ArrayList<AverageHR>();
		
		Integer minimumHR=0; //minimumHR della MainPhase calcolata dai training profile delle sessioni filtrate
		int tpFound=0;
		for (ExerciseSession current : filteredSessions) {
			if (current.isAcceptable()){
				total++;
				if (current.getEnergyExpenditure()!=null){
				totalKcal+=current.getEnergyExpenditure().getValue();
					averages.add(calculateAvgHR(current));
					if (current instanceof ActiveLifestylePASession){
						if (((ActiveLifestylePASession) current).isMonitored()){
							if (((ActiveLifestylePASession) current).getStepsNumber() != null){
							totalSteps+=((ActiveLifestylePASession) current).getStepsNumber();
							} else {
								totalSteps+=0;
							}
						}
					}
				}
				cmaxHR=findMaxHR(current);
				maxHR = maxHR > cmaxHR ? maxHR : cmaxHR;
				
				TrainingProfile tp=current.getTrainingProfile();
				
				if(tp!=null){
					HRZone hrs=tp.getAeHR();
					if (hrs!=null){
						Integer min=hrs.getMinimumHR();
						if(min!=null && min>0){
							tpFound++;
							minimumHR+=min;
						}
					}
				}
			}
		}
		if (minimumHR>0 && tpFound>0)
			minimumHR/=tpFound;
		
		int days=DateMgt.getDays(start, end);
		avgDailySteps=totalSteps/days;
		float ponderataTotale=0;
		float durataTotale=0;
		float hrTotale=0;
		for (AverageHR averageHR : averages) {
			hrTotale+=(averageHR.getAvgHR()*averageHR.getMinutes());
			durataTotale+=averageHR.getMinutes();
		}
		ponderataTotale=hrTotale/durataTotale;
		
//		CardiacRehabilitationProgramme programme=(CardiacRehabilitationProgramme) model.asMap().get("programme");
//		if (programme!=null && programme.getTrainingProfile()!=null){
//			Integer minimumHR=programme.getTrainingProfile().getMainHRzoneMin();
			
			HashMap<String, Integer> boxes=new HashMap<String, Integer>();
			boxes.put("totalKcal",totalKcal);
			boxes.put("avgKcal", total>0 ? (int) (totalKcal/total) : 0);
			boxes.put("avgHR", ((int) ponderataTotale));
			boxes.put("hrMin", minimumHR);
			boxes.put("avgSteps", avgDailySteps);
			boxes.put("maxHR", maxHR);
			boxes.put("totalSessions", total);
			
//			model.addAttribute("filteredSessions", filteredSessions);
			
			Gson gson=new Gson();
			String boxesJson=gson.toJson(boxes);
			return boxesJson;
//		}
		
//		Gson gson=new Gson();
//		String boxesJson=gson.toJson(null);
//		return boxesJson;
	}

	private int findMaxHR(ExerciseSession c) {
		TrainingPhaseInfo phase=null;
		int hr=0;
		if (c instanceof ExerClassSession){
			phase=((ExerClassSession) c).getMainDuration();
			hr=phase.getMaxHR();
		}else if (c instanceof ExerGameSession){
			phase=((ExerGameSession) c).getMainDuration();
			hr=phase.getMaxHR();
		}else if (c instanceof ActiveLifestylePASession){
			if (((ActiveLifestylePASession) c).getAverageHeartRate() != null)
				hr=((ActiveLifestylePASession) c).getAverageHeartRate();
			else
				hr = 0;
		}
		return hr;
	}

	private AverageHR calculateAvgHR(ExerciseSession c) {
		float hrs=0;
		int durations=0;
		int d=0;
		TrainingPhaseInfo phase;
		if (c instanceof ExerClassSession){
//			phase=((ExerClassSession) c).getWarmingUpDuration();
//			d=phase.getDuration();
//			hrs+= (d*phase.getAverageHR());
//			durations+=d;
//			phase=((ExerClassSession) c).getStretchingDuration();
//			d=phase.getDuration();
//			hrs+= (d*phase.getAverageHR());
//			durations+=d;
			phase=((ExerClassSession) c).getMainDuration();
			d=phase.getDuration();
			hrs+= (d*phase.getAverageHR());
			durations+=d;
//			phase=((ExerClassSession) c).getCoolDownDuration();
//			d=phase.getDuration();
//			hrs+= (d*phase.getAverageHR());
//			durations+=d;
//			phase=((ExerClassSession) c).getRelaxationDuration();
//			d=phase.getDuration();
//			hrs+= (d*phase.getAverageHR());
//			durations+=d;
		}else if (c instanceof ExerGameSession){
//			phase=((ExerGameSession) c).getWarmingUpDuration();
//			d=phase.getDuration();
//			hrs+= (d*phase.getAverageHR());
//			durations+=d;
//			phase=((ExerGameSession) c).getStretchingDuration();
//			d=phase.getDuration();
//			hrs+= (d*phase.getAverageHR());
//			durations+=d;
			phase=((ExerGameSession) c).getMainDuration();
			d=phase.getDuration();
			hrs+= (d*phase.getAverageHR());
			durations+=d;
		}else if (c instanceof ActiveLifestylePASession){
			if (((ActiveLifestylePASession) c).isMonitored()){
				d=((ActiveLifestylePASession) c).getDuration();
				Integer tempHr=((ActiveLifestylePASession) c).getAverageHeartRate();
				if (tempHr!= null && tempHr>0){
					hrs+= (d*tempHr);
					durations+=d;
				}
			}
		}
		float avgPonderata=hrs/durations; //controllo del calcolo della media, risulta una media/2
		
		return new AverageHR(durations>0 ? avgPonderata : 0,durations);
	}
	
	

	@RequestMapping(value = "/ajaxgauges/{start}/{end}", method = RequestMethod.GET)
    public @ResponseBody String getGaugesDataByDate(@PathVariable("start") String start, @PathVariable("end") String end, Model model, Locale locale) {
//		PwLogger.printMethod();
		
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		
		ArrayList<ExerciseSession> filteredSessions=filterSessions(model, 3); //3 all
		
		ArrayList<GaugeModeller> filteredGauges=createGauges(filteredSessions, model);
		if (filteredGauges!=null){
			HashMap<String, GaugeModeller> gauges=new HashMap<>();
			gauges.put("gaugeFreq", filteredGauges.get(0));
			gauges.put("gaugeTime", filteredGauges.get(1));
			gauges.put("gaugeAvgDuration", filteredGauges.get(2));
			
			model.addAttribute("gauges", gauges);
			Gson gson=new Gson();
			String gaugesJson=gson.toJson(gauges);
			model.addAttribute("gaugesJson",gaugesJson);
			
			ArrayList<String> date=new ArrayList<>();
			date.add(start);
			date.add(end);
			addMenuData(model, date);
			
//			model.addAttribute("filteredSessions", filteredSessions);
			
			String feedbackMsg=motivationalSlogan.createMotivationalSlogan(filteredSessions,model,locale);
			model.addAttribute("messageSession", feedbackMsg);
			return gaugesJson;
		}
		return null;
		
    }
	
	public ArrayList<GaugeModeller> createGauges(ArrayList<ExerciseSession> filteredSessions, Model model) {
		ArrayList<GaugeModeller> gauges=new ArrayList<GaugeModeller>();
		String startDate=(String) model.asMap().get("start");
		String endDate=(String) model.asMap().get("end");
		
		int days=DateMgt.getDays(startDate, endDate);
		int weeks=days/7 >0 ? days/7 : 1 ;
		
		CardiacRehabilitationProgramme programme=getProgramme(model);
		
		//TODO forse dovrebbe essere cambiata in somma per le settimane di cui è stata fatta la richiesta
//		ExerciseProgrammes exProgramme=programme.getExerciseProgrammes();
		if (weeks==1){
			ExerciseProgramme exProgramme=getLastOfTheWeekProgramme(null,model);
			
			if (exProgramme!=null && ExerciseProgramme.isValid(exProgramme)){
				int totalExerClass=exProgramme.getNumberOfExerClass()*weeks;
				int totalExerGame=exProgramme.getNumberOfExerGame()*weeks;
				int totalPA=exProgramme.getNumberOfActiveLifestyleActivity()*weeks;
				
				int total=totalExerClass+totalExerGame+totalPA;
				int sessionsGoal=0;
				int sessionsDone=0;
				int timeGoal=0;
				int timeDone=0;
				int timeAvgGoal=0;
				int timeAvgDone=0;
				
				if (filteredSessions!=null){ //HDMS fails
					for (ExerciseSession current : filteredSessions) {
						if (current.isAcceptable()){
							sessionsDone++;
							timeDone+=current.getDuration();
						}
					}
					
					sessionsGoal=total;
					timeAvgGoal=exProgramme.getClassDuration();
					timeGoal=exProgramme.getPersonalWeeklyTime();
					if (timeGoal<=0)
						timeGoal=exProgramme.getWeeklyTime();
					if (sessionsDone==0)
						timeAvgDone=0;
					else
						timeAvgDone=timeDone/sessionsDone;
					
					GaugeModeller modelFreq=new GaugeModeller(SESSIONS_FREQ, createSentence(sessionsDone,sessionsGoal), 0, sessionsDone, sessionsGoal);
					GaugeModeller modelTime=new GaugeModeller(SESSIONS_TOTAL_DURATION, createSentence(timeDone,timeGoal), 0, timeDone, timeGoal);
					GaugeModeller modelSessionDuration=new GaugeModeller(SESSIONS_AVG_DURATION, createSentence(timeAvgDone,timeAvgGoal), 0, timeAvgDone, timeAvgGoal);
					gauges.add(modelFreq);
					gauges.add(modelTime);
					gauges.add(modelSessionDuration);
				}
				
				
				
//				PwLogger.logger.fine(modelFreq.toString());
//				PwLogger.logger.fine(modelTime.toString());
//				PwLogger.logger.fine(modelSessionDuration.toString());
				
				return gauges;
			}
		}
			
			
//		else{
//			Calendar c=GregorianCalendar.getInstance();
//			Date end=DateMgt.getDate(endDate);
//			c.setTime(end);
//			List<Integer> goals=new ArrayList<Integer>();
//			List<Integer> tots=new ArrayList<Integer>();
//			List<String> labels=new ArrayList<String>();
//			for (int i=0;i<weeks;i++){
//				c.add(Calendar.DAY_OF_MONTH, -6);
//				Date start=c.getTime();
//				String label=DateMgt.getReadableDate(start)+" -> "+DateMgt.getReadableDate(end);
//				ExerciseProgramme exProg=getLastOfTheWeekProgramme(end, model);
//				Integer goal=exProg.getWeeklyTime();
//				Integer tot=0;
//				for (ExerciseSession current : filteredSessions) {
//					Date currentDate=current.getDate();
//					if (currentDate.before(end) && currentDate.after(start)){
//						tot+=current.getDuration();
//					}
//				}
//				goals.add(goal);
//				labels.add(label);
//				tots.add(tot);
//				
//				c.add(Calendar.DAY_OF_MONTH, -1); //altra settimana
//				end=c.getTime();
//			}
////			Gson gson=new Gson();
//			model.addAttribute("weeksLabels",labels);
//			model.addAttribute("weeksGoal",goals);
//			model.addAttribute("weeksTot",tots);
//		}
		
		//se ho più settimane non restituisco i gauges - ma in teoria l'istogramma con il weekly breakdown
		
		return null;
	}
	
	@RequestMapping(value="/weeklyChart/{start}/{end}", method = RequestMethod.GET)
	public @ResponseBody String getWeeklyChartData(@PathVariable("start") String startDate, @PathVariable("end") String endDate, String id, Model model, Locale locale){
		model.addAttribute("start",startDate);
		model.addAttribute("end",endDate);
		Integer idForFiltering;
		if (id!=null){
			idForFiltering=Integer.parseInt(id);
		}else{
			idForFiltering=(Integer) model.asMap().get("idFilter");
			if (idForFiltering==null)
				idForFiltering=3;
		}
		ArrayList<ExerciseSession> filteredSessions=filterSessions(model, idForFiltering); //3 all
		
//		String startDate=(String) model.asMap().get("start");
//		String endDate=(String) model.asMap().get("end");
		
		int days=DateMgt.getDays(startDate, endDate);
		int weeks=days/7 >0 ? days/7 : 1 ;
		
		Calendar c=GregorianCalendar.getInstance();
		Date end=DateMgt.getDate(endDate);
		c.setTime(end);
		List<Integer> goals=new ArrayList<Integer>();
		List<Integer> tots=new ArrayList<Integer>();
		List<String> labels=new ArrayList<String>();
		int totalSessions=0;
		int totalSessionsGoal=0;
		for (int i=0;i<weeks;i++){
			c.add(Calendar.DAY_OF_MONTH, -6);
			Date start=c.getTime();
			String label=DateMgt.getReadableDate(start)+" -> "+DateMgt.getReadableDate(end);
			ExerciseProgramme exProg=getLastOfTheWeekProgramme(end, model);
			totalSessionsGoal+=exProg.getNumberOfActiveLifestyleActivity()+exProg.getNumberOfExerClass()+exProg.getNumberOfExerGame();
			Integer goal=exProg.getWeeklyTime();
			Integer tot=0;
			for (ExerciseSession current : filteredSessions) {
				if (current.isAcceptable()){
					Date currentDate=current.getDate();
					if (currentDate.before(end) && currentDate.after(start)){
						tot+=current.getDuration();
						totalSessions++;
					}
				}
			}
			goals.add(goal);
			labels.add(label);
			tots.add(tot);
			
			c.add(Calendar.DAY_OF_MONTH, -1); //altra settimana
			end=c.getTime();
		}
//			Gson gson=new Gson();
//		BISOGNA INVERTIRLI PER UNA VISUALIZZAZIONE IN DATA CRESCENTE DA SINISTRA A DESTRA
//		model.addAttribute("weeksLabels",labels);
//		model.addAttribute("weeksGoal",goals);
//		model.addAttribute("weeksTot",tots);
		
		Collections.reverse(labels);
		Collections.reverse(goals);
		Collections.reverse(tots);
		model.addAttribute("weeksLabels",labels);
		model.addAttribute("weeksGoal",goals);
		model.addAttribute("weeksTot",tots);
		
		model.addAttribute("totalSessions",totalSessions);
		model.addAttribute("totalSessionsGoal",totalSessionsGoal);
		
		String titoloGrafico=msg.getMessage("sessions.duration.total", null, locale);
		String titoloGoal=msg.getMessage("dashboard.label.chart.weekly.goal", null, locale);
		String titoloValori=msg.getMessage("dashboard.label.chart.weekly.duration", null, locale);
		
		HashMap<String, Object> goalToSet=new HashMap<String,Object>();
		goalToSet.put(ChartModeller.TITLEKEY, titoloGoal);
		goalToSet.put(ChartModeller.VALUESKEY, goals);
		
		HashMap<String, Object> valuesToSet=new HashMap<String,Object>();
		valuesToSet.put(ChartModeller.TITLEKEY, titoloValori);
		valuesToSet.put(ChartModeller.VALUESKEY, tots);
		
		String xLabel=msg.getMessage("dashboard.label.chart.weekly.x", null, locale);
		String yLabel=msg.getMessage("dashboard.label.chart.weekly.y", null, locale);
		ChartModeller chart=new ChartModeller(labels, valuesToSet, goalToSet, titoloGrafico);
		chart.setxTitle(xLabel);
		chart.setyTitle(yLabel);
		
		model.addAttribute("filteredSessions",filteredSessions);
		
		ArrayList<String> date=new ArrayList<>();
		date.add(startDate);
		date.add(endDate);
		addMenuData(model, date);
		
//		String feedbackMsg=motivationalSlogan.createMotivationalSlogan(filteredSessions,model,locale);
//		model.addAttribute("messageSession", feedbackMsg);
		
		Gson gson=new Gson();
		return gson.toJson(chart);
	}

	private ExerciseProgramme getLastOfTheWeekProgramme(Date endRequest,Model model) {
		//TODO - logica per il weekly breakdown
		//QUI POTREBBE ESSERE FATTA UNA CHIAMATA PER RECUPERARE SOLO I PROGRAMME NELL'INTERVALLO
		String startDate=(String) model.asMap().get("start");
		String endDate;
		//o lo richiedo esplicitamente, o si prende quello che c'è in sessione
		if (endRequest==null)
			endDate=(String) model.asMap().get("end");
		else
			endDate=DateMgt.getComparableRangeDayTimeString(endRequest);
		
		CardiacRehabilitationProgramme programme=getProgramme(model);
		List<ExerciseProgramme> exs=programme.getExerciseProgrammes();
		ExerciseProgrammeComparator exProgComparator=new ExerciseProgrammeComparator();
		Collections.sort(exs,exProgComparator);
		
		PwLogger.logger.fine("Programme EndDate: "+DateMgt.getReadableDateTime(DateMgt.getDate(endDate)));
		
		Date end=DateMgt.getDate(endDate);
		boolean found=false;
		//ipotizzando un'ordinamento crescente
		int last=exs.size()-1;
		for (int i=last;i>=0;i--){
			ExerciseProgramme ex=exs.get(i);
			if (found){
				PwLogger.logger.fine("Returned ExerciseProgramme Date: "+DateMgt.getReadableDateTime(ex.getDate()));
				return ex; //prendo quello immediatamente precedente all'ultimo - che sarebbe la prescrizione per l'ultimo
			}
			Date curr=ex.getDate();
			
			int days=DateMgt.getDays(end, curr);
//			PwLogger.logger.fine("Days Between: "+days);
//			PwLogger.logger.fine("Days Between: "+days+" ExerciseProgramme CurrDate: "+DateMgt.getReadableDateTime(curr));
			
			int hours=DateMgt.getHours(end, curr);
//			PwLogger.logger.fine("Hours Between: "+hours);
			
			if (days<=1 || hours<=24){
//				PwLogger.logger.fine("FOUND");
//				PwLogger.logger.fine("Days Between: "+days+" ExerciseProgramme CurrDate: "+DateMgt.getReadableDateTime(curr));
				found=true; //il primo che trovo è quello relativo al giorno della fine della settimana
				Calendar c=Calendar.getInstance();
				Date now = c.getTime();
				if (DateMgt.getDays(curr,now)>=1)
					return ex;
			}else if(i==0 && !found){
				ex=exs.get(i);
//				PwLogger.logger.fine("Returned ExerciseProgramme Date [THE LAST ONE]: "+DateMgt.getReadableDateTime(ex.getDate()));
				return ex;
			}
		}
		
		//se non esiste non possiamo andare avanti
		
		
//		ExerciseProgramme ex=new ExerciseProgramme(CRProgramme.createFakeExerciseProgramme(180));
//		PwLogger.logger.fine("Returned Programme Date: "+DateMgt.getReadableDateTime(ex.getDate()));
		return null;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/linegraph/{start}/{end}", method = RequestMethod.GET)
    public @ResponseBody String lineGraph(@PathVariable("start") String start, @PathVariable("end") String end, Model model) {
//        System.out.println("Line Graph - Start: " + start + " End: "+end);
//		PwLogger.printMethod();
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		HashMap<String, Object[]> linesValues = createLineGraph(start, end, null, model);
		
		
		model.addAttribute("lines", linesValues);
		Gson gson=new Gson();
		String linesValuesJSON=gson.toJson(linesValues);
		model.addAttribute("linesJson",linesValuesJSON);
		
		
        return linesValuesJSON;
    }
	/**
	 * generico per entrambi i tipi di filtraggio
	 * @param start
	 * @param end
	 * @param id
	 * @param model
	 * @return
	 */
	private HashMap<String, Object[]> createLineGraph(String start, String end, String id, Model model) {
		int idType;
		if (id==null){
			 id=(String) model.asMap().get("idFilter");
			 if (id==null){
				 idType=3;
			 }else{
				 idType=Integer.parseInt(id);
			 }
		}
		else
			idType=Integer.parseInt(id);
		
		Date dateStart, dateEnd;
		Calendar cstart = GregorianCalendar.getInstance();
		Calendar cend = GregorianCalendar.getInstance();
		int tot = 20;
		SimpleDateFormat formatter = new SimpleDateFormat(FORMATTER_STRING);
		// SimpleDateFormat readable = new SimpleDateFormat(READABLE_STRING);

		dateStart = DateMgt.getDate(start);
		dateEnd = DateMgt.getDate(end);
		cstart.setTime(dateStart);
		cend.setTime(dateEnd);
		cend.add(Calendar.DAY_OF_MONTH, 1);
		tot = (int) ((cend.getTime().getTime() - cstart.getTime().getTime()) / (1000 * 60 * 60 * 24)) + 1; // uno
																											// per
																											// la
																											// label
																											// della
																											// serie

		Object[] x = new Object[tot];
		Object[] xclass = new Object[tot];
		Object[] xgame = new Object[tot];
		// Object[] goals=new Object[tot];
		Object[] active = new Object[tot];
		// TEST per NOT ACCEPTABLE
		// Object[] na = new Object[tot];
		
		if(!wasAlreadyRequest(model)){
			try {
				model = refreshProgress(model);
			} catch (ApiException e) {
				PwLogger.logger.fine("[ERROR] ApiException during refreshProgress");
				e.printStackTrace();
			} catch (IOException e) {
				PwLogger.logger.fine("[ERROR] IoException during refreshProgress");
				e.printStackTrace();
			}
		}

		Map<String, ArrayList<ExerciseSession>> mapByDate = (Map<String, ArrayList<ExerciseSession>>) model.asMap()
				.get("sessionsMapByDate");
		if (mapByDate==null)
			return null;
		
		for (int i = 0; i < tot; i++) {
			if (i == 0) {
				x[i] = 'x';
				xclass[i] = "ExerClass";
				xgame[i] = "ExerGame";
				// goals[i]="Goal";
				active[i] = "ActiveLifeStyle";
//				na[i] = "NotAcceptable";
			} else {
				x[i] = formatter.format(cstart.getTime());
				// System.out.println(x[i]);
				int exClass = 0;
				int exGame = 0;
				int pa = 0;
//				int naCount = 0;
				ArrayList<ExerciseSession> sessions = mapByDate.get(DateMgt.getFormattedDateString(cstart.getTime()));
				if (sessions != null) {
					for (ExerciseSession current : sessions) {
						if(current.isAcceptable()){
							if (current instanceof ExerClassSession) {
								exClass++;
							} else if (current instanceof ExerGameSession) {
								exGame++;
							} else if (current instanceof ActiveLifestylePASession) {
								pa++;
							}
						}else{
//							naCount++;
						}
					}
				}

				switch (idType) {
				case 0:
					xclass[i] = exClass;
					break;
				case 1:
					xgame[i] = exGame;
					break;
				case 2:
					active[i] = pa;
					break;
				default:
					xclass[i] = exClass;
					xgame[i] = exGame;
					active[i] = pa;
//					na[i] = naCount;
					break;
				}
				// goals[i]=1;
				cstart.add(Calendar.DAY_OF_MONTH, 1);
			}
		}

		HashMap<String, Object[]> linesValues = new HashMap<>();
		linesValues.put("x", x);
		linesValues.put("xclass", xclass);
		linesValues.put("xgame", xgame);
		// linesValues.put("goal", goals);
		linesValues.put("active", active);
//		linesValues.put("notAcceptable", na);

		return linesValues;
	}
	
	@RequestMapping(value ="boxesFiltered/{id}", method = RequestMethod.GET)
	public @ResponseBody String boxesFiltered(@PathVariable("id") String id, Model model, Locale locale) {
		PwLogger.printMethod();
		String startString=(String) model.asMap().get("start");
		String endString=(String) model.asMap().get("end");
		model.addAttribute("idFilter", id);
		return getBoxesDataByDate(startString, endString, id, model, locale);
		
	}
	
	
	@RequestMapping(value = "/gaugesFiltered/{id}", method = RequestMethod.GET)
    public @ResponseBody String gaugesFiltered(@PathVariable("id") String id, Model model, Locale locale) {
//		PwLogger.printMethod();
		int i=Integer.parseInt(id);
		ArrayList<ExerciseSession> filteredSessions=filterSessions(model, i); //3 all
		
		ArrayList<GaugeModeller> filteredGauges=createGauges(filteredSessions, model);
		
		HashMap<String, GaugeModeller> gauges=new HashMap<>();
		if (gauges!=null && filteredGauges!=null){
			gauges.put("gaugeFreq", filteredGauges.get(0));
			gauges.put("gaugeTime", filteredGauges.get(1));
			gauges.put("gaugeAvgDuration", filteredGauges.get(2));
			
			model.addAttribute("gauges", gauges);
			Gson gson=new Gson();
			String gaugesJson=gson.toJson(gauges);
			model.addAttribute("gaugesJson",gaugesJson);
			
			 return gaugesJson;
		}
		
		return null;
		
		
		//filtro delle sessioni in base alla tipologia e data - le date sono in sessions al momento
		
//		3 - All
//		0 - Class
//		1 - Game
//		2 - Active
	}
   
	@RequestMapping(value = "/lineFiltered/{id}", method = RequestMethod.GET)
    public @ResponseBody String lineFiltered(@PathVariable("id") String id, Model model) {
//		PwLogger.printMethod();
		
		model.addAttribute("idFilter", id);
		String startString=(String) model.asMap().get("start");
		String endString=(String) model.asMap().get("end");
		HashMap<String, Object[]> linesValues = this.createLineGraph(startString, endString, id, model);
		
		model.addAttribute("lines", linesValues);
		Gson gson=new Gson();
		String linesValuesJSON=gson.toJson(linesValues);
		model.addAttribute("linesJson",linesValuesJSON);
		
		return linesValuesJSON;
//		 Random rand = new Random();
//		 SimpleDateFormat formatter = new SimpleDateFormat(FORMATTER_STRING);
//	        SimpleDateFormat readable = new SimpleDateFormat(READABLE_STRING);
////		3 - All
////		0 - Class
////		1 - Game
////		2 - Active
		
	}


	@RequestMapping(value = "/refreshSlogan", method = RequestMethod.GET)
	public @ResponseBody String refreshSlogan(Model model, Locale locale) {
		ArrayList<ExerciseSession> sessions=(ArrayList<ExerciseSession>) model.asMap().get("filteredSessions");
		return motivationalSlogan.createMotivationalSlogan(sessions, model, locale);
	}
	
	@RequestMapping(value="/newDashboard", method={RequestMethod.POST, RequestMethod.GET})
	public String newDash(Model model, Locale locale){
		return "newDashboard";
	}
		
	public static String showErrorMsg(String msg, String toLog, Model model){
		model.addAttribute("toLog", toLog);
		model.addAttribute("msg", msg);
		return "redirect:/";
	}
	
	
	@RequestMapping(value = "/getSteps/{start}/{end}", method = RequestMethod.GET)
	public @ResponseBody String getSteps(@PathVariable("start") String startString, @PathVariable("end") String endString, Model model, Locale locale){
		
		FrontEndPatient patient= frontendPatientBusiness.getPatient((String) model.asMap().get("sin"));
		String refresh=patient.getMsRefreshToken();
		ActiveLifestylePASession summary = new ActiveLifestylePASession();
		if (refresh==null){
			summary.setStepsNumber(0);
			EnergyExpenditureObservation energy=new EnergyExpenditureObservation();
			energy.setValue(0);
			summary.setEnergyExpenditure(energy);
		}
		else{
			Date start=DateMgt.getDate(startString);
			Date end=DateMgt.getDate(endString);
			try {
				Date now=DateMgt.getDate(DateMgt.getNow());
				Date limit=now;
				if (end.compareTo(now)<=0)
					limit=end;
				summary = msController.createPathwaySummary(start, limit, model, null);
				if (summary!=null){
					long diff = limit.getTime() - start.getTime();
					int days = (int) Math.ceil(TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS))+1;
//					PwLogger.logger.fine("Days: " + days);
//					PwLogger.logger.fine("Total Steps for"+ startString+" "+ endString+" - "+summary.getStepsNumber());
//					PwLogger.logger.fine("Total kcal for"+ startString+" "+ endString+" - "+summary.getEnergyExpenditure().getValue());
					
					if (days>0){
						Integer stepsAvg=summary.getStepsNumber()/days;
						summary.setStepsNumber(stepsAvg);
						
						Integer kcalAvg=summary.getEnergyExpenditure().getValue()/days;
						summary.getEnergyExpenditure().setValue(kcalAvg);
						
						
//						PwLogger.logger.fine("AVG Steps for"+ startString+" "+ endString+" - "+summary.getStepsNumber());
//						PwLogger.logger.fine("AVG kcal for"+ startString+" "+ endString+" - "+summary.getEnergyExpenditure().getValue());
					}
				}else{
					summary = new ActiveLifestylePASession();
					summary.setStepsNumber(0);
					summary.setEnergyExpenditure(new EnergyExpenditureObservation(0));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		Gson gson=new Gson();
		String steps=gson.toJson(summary);
		return steps;
	}
	
	
	@RequestMapping(value = "/refreshDailyActivities/{start}/{end}", method = RequestMethod.GET)
	public @ResponseBody String refreshDailyActivities(@PathVariable("start") String startString, @PathVariable("end") String endString, Model model, Locale locale){
		Date from = DateMgt.getDate(startString);
		Date to = DateMgt.getDate(endString);
		Calendar current = new GregorianCalendar();
		if(DateMgt.getDays(to, current.getTime()) < 1){
			//non puoi richiedere il summary per il giorno in corso - [For date range queries, the endTime must not be greater than the current UTC Date]
//			to = current.getTime();
			DateTime currentUTC = new DateTime(DateTimeZone.UTC);
			to = currentUTC.toDate();
		}
		List<DailyActivity> das = msController.getDailyActivities(from, to, model, locale);
		PwLogger.logger.fine("Dovrei salvare sul HDMS le dailyActivities scaricate");
		if (das!=null){
			for (DailyActivity da : das) {
				PwLogger.logger.fine(da.toString());
			}
		}
		String patientNumber=(String) model.asMap().get("sin");
		String xSessionId=(String) model.asMap().get("xSessionId");
		
		try {
			Patient.putDailyActivities(patientNumber!=null ? patientNumber : DEFAULT_PATIENT_NUMBER, xSessionId, das);
		} catch (ApiException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "Request sent";
	}
	

}
