package it.eng.pathway.controller;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import it.eng.pathway.fake.model.ActiveLifestylePASession;
import it.eng.pathway.fake.model.ActivityType;
import it.eng.pathway.fake.model.CardiacRehabilitationProgramme;
import it.eng.pathway.fake.model.CardiacRehabilitationProgress;
import it.eng.pathway.fake.model.ExerClassSession;
import it.eng.pathway.fake.model.ExerGameSession;
import it.eng.pathway.fake.model.ExerciseSession;
import it.eng.pathway.fake.model.TrainingPhaseInfo;
import it.eng.pathway.fake.model.TrainingProfile;
import it.eng.pathway.frontend.dao.ActivityDAO;
import it.eng.pathway.utility.DateMgt;
import it.eng.pathway.utility.HrFileHandler;
import it.eng.pathway.utility.HrMeasure;
import it.eng.pathway.utility.PwLogger;
import it.eng.pathway.utilitymodel.CustomObjectEx;
import it.eng.pathway.utilitymodel.CustomSession;
import it.eng.pathway.utilitymodel.CustomSession.SessionType;
import it.eng.pathway.utilitymodel.GaugeModeller;
import it.eng.pathway.utilitymodel.Misurazione;

@Controller
@SessionAttributes({"xSessionId", "sin", "progress", "programme", "filteredSessions", "sessions", "profile"})
public class SessionController {
	
	
	private static String BPM_CHART_TITLE;
	private static String BPM_CHART_MAX;
	private static String BPM_CHART_MIN;
	private static String BPM_CHART_VALUES;
	private static String GAUGE_WU_DURATION;
	private static String GAUGE_WU_HR;
	private static String GAUGE_ST_DURATION;
	private static String GAUGE_ST_HR;
	private static String GAUGE_AE_DURATION;
	private static String GAUGE_AE_HR;
	private static String GAUGE_CD_DURATION;
	private static String GAUGE_CD_HR;
	private static String GAUGE_RX_DURATION;
	private static String GAUGE_RX_HR;
	private static String BPM_CHART_ACHIEVED;
	private static String BPM_CHART_EXCEEDED;
	private static String BPM_CHART_NOTREACHED;
	private static String WU_LABEL;
	private static String AE_LABEL;
	private static String CD_LABEL;
	private int CAMPIONI_AL_MINUTO=60;
	
	private static final String MAXHR_JS="max";
	private static final String MINHR_JS="min";
	private static final String VALUESHR_JS="values";
	
//	@Autowired
//	EnumLabelManagerJSP labelManagerJSP;
	
	@Autowired
	private ActivityDAO activityDao;
	
	
	private MessageSource msg;
	
	@Autowired
    public void AccountsController(MessageSource msgSrc) {
     this.msg = msgSrc;
    }

	private String createSentence(int done, int goal) {
		String toRet="";
		if (done>goal)
			toRet="Hai fatto troppo, placati!";
		else
			toRet="Daje un po'";
		return toRet;
	}

	
	@RequestMapping(value = "/singleSessionGauges", method = RequestMethod.GET)
    public String singleSession(String id, Model model, Locale locale) {
		
		try {
			model=HomeController.addMenuData(model, null);
			
			BPM_CHART_TITLE = msg.getMessage("session.label.chart.bpm.title",null, locale);
			BPM_CHART_MAX = msg.getMessage("session.label.chart.bpm.max",null, locale);
			BPM_CHART_MIN = msg.getMessage("session.label.chart.bpm.min",null, locale);
			BPM_CHART_VALUES = msg.getMessage("session.label.chart.bpm.values",null, locale);
			GAUGE_WU_DURATION=msg.getMessage("session.label.gauge.wu.title.duration",null, locale);
			GAUGE_WU_HR=msg.getMessage("session.label.gauge.wu.title.hr",null, locale);
			GAUGE_ST_DURATION=msg.getMessage("session.label.gauge.st.title.duration",null, locale);
			GAUGE_ST_HR=msg.getMessage("session.label.gauge.st.title.hr",null, locale);
			GAUGE_AE_DURATION=msg.getMessage("session.label.gauge.ae.title.duration",null, locale);
			GAUGE_AE_HR=msg.getMessage("session.label.gauge.ae.title.hr",null, locale);
			GAUGE_CD_DURATION=msg.getMessage("session.label.gauge.cd.title.duration",null, locale);
			GAUGE_CD_HR=msg.getMessage("session.label.gauge.cd.title.hr",null, locale);
			GAUGE_RX_DURATION=msg.getMessage("session.label.gauge.rx.title.duration",null, locale);
			GAUGE_RX_HR=msg.getMessage("session.label.gauge.rx.title.hr",null, locale);
			BPM_CHART_ACHIEVED=msg.getMessage("session.label.chart.bpm.achieved",null, locale);
			BPM_CHART_EXCEEDED=msg.getMessage("session.label.chart.bpm.exceeded",null, locale);
			BPM_CHART_NOTREACHED=msg.getMessage("session.label.chart.bpm.notReached",null, locale);
			WU_LABEL=msg.getMessage("session.label.gauge.wu.title",null, locale);
			AE_LABEL=msg.getMessage("session.label.gauge.ae.title",null, locale);
			CD_LABEL=msg.getMessage("session.label.gauge.cd.title",null, locale);
			
			SessionType type = null;
			
			CardiacRehabilitationProgress progress=(CardiacRehabilitationProgress) model.asMap().get("progress");
//			CardiacRehabilitionProgramme programme=(CardiacRehabilitionProgramme) model.asMap().get("programme");
			CardiacRehabilitationProgramme programme=(CardiacRehabilitationProgramme) model.asMap().get("programme");
			
//		List<ExerciseSession> sessions=progress.getExerciseSession();
			
			List<ExerciseSession> sessions=(List<ExerciseSession>) model.asMap().get("filteredSessions");
			
			ExerciseSession session=sessions.get(Integer.parseInt(id));
			
			PwLogger.logger.fine("Exercise Session to render: "+session.toString());
			
//			CurrentExerciseProgramme currentProgramme=programme.getCurrentExerciseProgramme();
//			ExerciseProgrammes currentProgramme=programme.getExerciseProgrammes();
			
//			TrainingProfile profile=programme.getTrainingProfile();
			TrainingProfile profile=new TrainingProfile(); //temp object
			profile=session.getTrainingProfile();
			if (profile==null)
				profile=new TrainingProfile();
			model.addAttribute("profile",profile);
			
			TrainingPhaseInfo phase;
			
//			TODO il training profile dovresti leggerlo direttamente dalla ExerciseSession
			
			if (session instanceof ExerClassSession){
				//navigare tutti gli attributi per creare i gauges
				type=CustomSession.SessionType.CLASS;
			}else if (session instanceof ExerGameSession){
				//navigare tutti gli attributi per creare i gauges
				type=CustomSession.SessionType.GAME;
			}else if (session instanceof ActiveLifestylePASession){
				//navigare tutti gli attributi per creare i gauges
				type=CustomSession.SessionType.ACTIVE;
			}
			
			Random rand = new Random();
//        System.out.println("Debug Message from singleSessionWarmUp" + new Date().toString());
//        System.out.println("id: " + id);
			
//        var primo = goal/2;
//		var secondo = 3*(goal/4);
//		var terzo = 9*(goal/10);
//	 	var quarto = 11*(goal/10);
//	 	var quinto = 1.2*massimo;
//        customSectors: [{
//            color : "#d9534f", //rosso
//            lo : start,
//            hi : primo
//          },{
//            color : "#f0ad4e", //giallo
//            lo : primo+0.1,
//            hi : terzo
//          }, {
//            color : "#5cb85c", //verde
//            lo : terzo+0.1,
//            hi : quarto
//          }, 
//          {
//              color : "#d9534f", //rosso
//              lo : quarto+0.1,
//              hi : quinto
//            }
//         ],
			
			ArrayList<Object> goalsM=new ArrayList<>();  //goals minuti
			ArrayList<Object> goalsBmin=new ArrayList<>(); //goals bpm minimo
			ArrayList<Object> goalsBmax=new ArrayList<>(); //goal bpm max
			ArrayList<Object> min=new ArrayList<>(); //minuti - valore
			ArrayList<Object> bpm=new ArrayList<>(); //bpm - valore
//			goalsM.add("goal");
//			goalsBmin.add("HR minimum");
//			goalsBmax.add("HR maximum");
//			min.add("Minutes");
//			bpm.add("BPM average");
			
			goalsM.add("goal");
			goalsBmin.add(MINHR_JS);
			goalsBmax.add(MAXHR_JS);
			min.add("Minutes");
			bpm.add(VALUESHR_JS);
			
			int goalAvg;
			int done;
			int c1,c2;
			int goalMin,goalMax;
			
			GaugeModeller warmDuration = null,warmHR = null,stretchDuration = null,stretchHR = null,aeroDuration = null,aeroHR = null,coolDuration = null,coolHR = null,realxDuration = null,relaxHR = null;
			
			if (type==SessionType.CLASS){
				//WARMUP
				phase=((ExerClassSession) session).getWarmingDuration();
				goalAvg=profile.getWarmingUpDuration();
				done=phase.getDuration();
				c1=getColor(goalAvg,done);
				goalsM.add(goalAvg);
				min.add(done);
				 warmDuration=new GaugeModeller(GAUGE_WU_DURATION, createSentence(done,goalAvg), 0, done, goalAvg);
				goalAvg=(profile.getWarmingHRzoneMax()+profile.getWarmingHRzoneMin()) /2;
				done=(int) phase.getAverageHR();
				c2=getColor(goalAvg,done);
				model.addAttribute("wuClass", getCSSClass(c1,c2));
				goalMin=profile.getWarmingHRzoneMin();
				goalMax=profile.getWarmingHRzoneMax();
				goalsBmin.add(goalMin);
				goalsBmax.add(goalMax);
				bpm.add(done);
				 warmHR=new GaugeModeller(GAUGE_WU_HR, createSentence(done,goalAvg), 0, done, goalAvg);
				
//			STRETCHING
//				phase=((ExerClassSession) session).getStretchingDuration();
//				goalAvg=profile.getStretchingDuration();
//				done=phase.getDuration();;
//				c1=getColor(goalAvg,done);
//				goalsM.add(goalAvg);
//				min.add(done);
//				 stretchDuration=new GaugeModeller(GAUGE_ST_DURATION, createSentence(done,goalAvg), 0, done, goalAvg);
//				goalAvg=(profile.getStretchingHRZoneMax()+profile.getStretchingHRZoneMin()) /2;
//				done=(int) phase.getAverageHR();
//				c2=getColor(goalAvg,done);
//				model.addAttribute("stClass", getCSSClass(c1,c2));
//				goalMin=profile.getStretchingHRZoneMin();
//				goalMax=profile.getStretchingHRZoneMax();
//				goalsBmin.add(goalMin);
//				goalsBmax.add(goalMax);
//				bpm.add(done);
//				 stretchHR=new GaugeModeller(GAUGE_ST_HR, createSentence(done,goalAvg), 0, done, goalAvg);
				
//			AEROBIC
				phase=((ExerClassSession) session).getMainDuration();
				goalAvg=profile.getMainDuration();
				done=phase.getDuration();;
				c1=getColor(goalAvg,done);
				goalsM.add(goalAvg);
				min.add(done);
				 aeroDuration=new GaugeModeller(GAUGE_AE_DURATION, createSentence(done,goalAvg), 0, done, goalAvg);
				goalAvg=(profile.getMainHRzoneMax()+profile.getMainHRzoneMin()) /2;
				done=(int) phase.getAverageHR();
				
				//TODO eliminare questa pezza a colore
				if (done<=0 && (phase.getMinHR()>0 && phase.getMaxHR()>0)){
					done = (phase.getMaxHR()+phase.getMinHR())/2;
				}
				
				
				c2=getColor(goalAvg,done);
				model.addAttribute("aeClass", getCSSClass(c1,c2));
				goalMin=profile.getMainHRzoneMin();
				goalMax=profile.getMainHRzoneMax();
				goalsBmin.add(goalMin);
				goalsBmax.add(goalMax);
				bpm.add(done);
				 aeroHR=new GaugeModeller(GAUGE_AE_HR, createSentence(done,goalAvg), 0, done, goalAvg);
				
//			COOLDOWN
				phase=((ExerClassSession) session).getCoolDownDuration();
				goalAvg=profile.getCooldownDuration();
				done=phase.getDuration();;
				c1=getColor(goalAvg,done);
				goalsM.add(goalAvg);
				min.add(done);
				 coolDuration=new GaugeModeller(GAUGE_CD_DURATION, createSentence(done,goalAvg), 0, done, goalAvg);
				goalAvg=(profile.getCooldownHRZoneMax()+profile.getCooldownHRZoneMin()) /2;
				done=(int) phase.getAverageHR();
				c2=getColor(goalAvg,done);
				model.addAttribute("cdClass", getCSSClass(c1,c2));
				goalMin=profile.getCooldownHRZoneMin();
				goalMax=profile.getCooldownHRZoneMax();
				goalsBmin.add(goalMin);
				goalsBmax.add(goalMax);
				bpm.add(done);
				 coolHR=new GaugeModeller(GAUGE_CD_HR, createSentence(done,goalAvg), 0, done, goalAvg);
				
//			RELAX
//				phase=((ExerClassSession) session).getRelaxationDuration();
//				goalAvg=profile.getRelaxationDuration();
//				done=phase.getDuration();;
//				c1=getColor(goalAvg,done);
//				goalsM.add(goalAvg);
//				min.add(done);
//				 realxDuration=new GaugeModeller(GAUGE_RX_DURATION, createSentence(done,goalAvg), 0, done, goalAvg);
//				goalAvg=(profile.getRelaxationHRZoneMax()+profile.getRelaxationHRZoneMin()) /2;
//				done=(int) phase.getAverageHR();
//				c2=getColor(goalAvg,done);
//				model.addAttribute("rxClass", getCSSClass(c1,c2));
//				goalMin=profile.getRelaxationHRZoneMin();
//				goalMax=profile.getRelaxationHRZoneMax();
//				goalsBmin.add(goalMin);
//				goalsBmax.add(goalMax);
//				bpm.add(done);
//				 relaxHR=new GaugeModeller(GAUGE_RX_HR, createSentence(done,goalAvg), 0, done, goalAvg);
				
				
			}else if (type==SessionType.GAME){
				//WARMUP
				phase=((ExerGameSession) session).getWarmingDuration();
				goalAvg=profile.getWarmingUpDuration();
				done=phase.getDuration();
				c1=getColor(goalAvg,done);
				goalsM.add(goalAvg);
				min.add(done);
				 warmDuration=new GaugeModeller(GAUGE_WU_DURATION, createSentence(done,goalAvg), 0, done, goalAvg);
				goalAvg=(profile.getWarmingHRzoneMin()+profile.getWarmingHRzoneMax()) /2;
				done=(int) phase.getAverageHR();
				c2=getColor(goalAvg,done);
				model.addAttribute("wuClass", getCSSClass(c1,c2));
				goalMin=profile.getWarmingHRzoneMin();
				goalMax=profile.getWarmingHRzoneMax();
				goalsBmin.add(goalMin);
				goalsBmax.add(goalMax);
				bpm.add(done);
				 warmHR=new GaugeModeller(GAUGE_WU_HR, createSentence(done,goalAvg), 0, done, goalAvg);
				
//			STRETCHING
//				phase=((ExerGameSession) session).getStretchingDuration();
//				goalAvg=profile.getStretchingDuration();
//				done=phase.getDuration();;
//				c1=getColor(goalAvg,done);
//				goalsM.add(goalAvg);
//				min.add(done);
//				 stretchDuration=new GaugeModeller(GAUGE_ST_DURATION, createSentence(done,goalAvg), 0, done, goalAvg);
//				goalAvg=(profile.getStretchingHRZoneMax()+profile.getStretchingHRZoneMin()) /2;
//				done=(int) phase.getAverageHR();
//				c2=getColor(goalAvg,done);
//				model.addAttribute("stClass", getCSSClass(c1,c2));
//				goalMin=profile.getStretchingHRZoneMin();
//				goalMax=profile.getStretchingHRZoneMax();
//				goalsBmin.add(goalMin);
//				goalsBmax.add(goalMax);
//				bpm.add(done);
//				 stretchHR=new GaugeModeller(GAUGE_ST_HR, createSentence(done,goalAvg), 0, done, goalAvg);
				
//			AEROBIC
				phase=((ExerGameSession) session).getMainDuration();
				goalAvg=profile.getMainDuration();
				done=phase.getDuration();;
				c1=getColor(goalAvg,done);
				goalsM.add(goalAvg);
				min.add(done);
				 aeroDuration=new GaugeModeller(GAUGE_AE_DURATION, createSentence(done,goalAvg), 0, done, goalAvg);
				goalAvg=(profile.getMainHRzoneMax()+profile.getMainHRzoneMin()) /2;
				done=(int) phase.getAverageHR();
				c2=getColor(goalAvg,done);
				model.addAttribute("aeClass", getCSSClass(c1,c2));
				goalMin=profile.getMainHRzoneMin();
				goalMax=profile.getMainHRzoneMax();
				goalsBmin.add(goalMin);
				goalsBmax.add(goalMax);
				bpm.add(done);
				 aeroHR=new GaugeModeller(GAUGE_AE_HR, createSentence(done,goalAvg), 0, done, goalAvg);
				 
//				COOLDOWN
				 phase=((ExerGameSession) session).getCoolDownDuration();
				goalAvg=profile.getCooldownDuration();
				done=phase.getDuration();;
				c1=getColor(goalAvg,done);
				goalsM.add(goalAvg);
				min.add(done);
				 coolDuration=new GaugeModeller(GAUGE_CD_DURATION, createSentence(done,goalAvg), 0, done, goalAvg);
				goalAvg=(profile.getCooldownHRZoneMax()+profile.getCooldownHRZoneMin()) /2;
				done=(int) phase.getAverageHR();
				c2=getColor(goalAvg,done);
				model.addAttribute("cdClass", getCSSClass(c1,c2));
				goalMin=profile.getCooldownHRZoneMin();
				goalMax=profile.getCooldownHRZoneMax();
				goalsBmin.add(goalMin);
				goalsBmax.add(goalMax);
				bpm.add(done);
				 coolHR=new GaugeModeller(GAUGE_CD_HR, createSentence(done,goalAvg), 0, done, goalAvg);
				
//				RELAX
//					phase=((ExerGameSession) session).getRelaxationDuration();
//					goalAvg=profile.getRelaxationDuration();
//					done=phase.getDuration();;
//					c1=getColor(goalAvg,done);
//					goalsM.add(goalAvg);
//					min.add(done);
//					 realxDuration=new GaugeModeller(GAUGE_RX_DURATION, createSentence(done,goalAvg), 0, done, goalAvg);
//					goalAvg=(profile.getRelaxationHRZoneMax()+profile.getRelaxationHRZoneMin()) /2;
//					done=(int) phase.getAverageHR();
//					c2=getColor(goalAvg,done);
//					model.addAttribute("rxClass", getCSSClass(c1,c2));
//					goalMin=profile.getRelaxationHRZoneMin();
//					goalMax=profile.getRelaxationHRZoneMax();
//					goalsBmin.add(goalMin);
//					goalsBmax.add(goalMax);
//					bpm.add(done);
//					 relaxHR=new GaugeModeller(GAUGE_RX_HR, createSentence(done,goalAvg), 0, done, goalAvg);
					
					
				
				model.addAttribute("score",((ExerGameSession) session).getScore()); 
				
			}else if (type==SessionType.ACTIVE){
				//TODO - pensare a cosa visualizzare
//				goalMin=profile.getMainHRzoneMin();  //il profile non esiste per le PA
//				goalMax=profile.getMainHRzoneMax();  //il profile non esiste per le PA
				
				goalMin=114;  //il profile non esiste per le PA
				goalMax=136;  //il profile non esiste per le PA
				
//				bpm.add(0);
//				goalsBmin.add(0);
//				goalsBmax.add(0);
//				bpm.add(0);
//				goalsBmin.add(0);
//				goalsBmax.add(0);
				int letto=((ActiveLifestylePASession) session).getAverageHeartRate()!= null ? ((ActiveLifestylePASession) session).getAverageHeartRate() : 0;
				bpm.add(letto);
				if(letto>0){
					goalsBmin.add(goalMin);
					goalsBmax.add(goalMax);
				}else{
					goalsBmin.add(0);
					goalsBmax.add(0);
				}
//				bpm.add(0);
//				goalsBmin.add(0);
//				goalsBmax.add(0);
//				bpm.add(0);
//				goalsBmin.add(0);
//				goalsBmax.add(0);
				
				
//				goalAvg=profile.getWarmingUpDuration()+profile.getMainDuration()+profile.getCooldownDuration();  //il profile non esiste per le PA
				goalAvg=0; 
				
				min.add(0);
				goalsM.add(0);
				min.add(0);
				goalsM.add(0);
				min.add(((ActiveLifestylePASession) session).getDuration());
				goalsM.add(goalAvg);
				min.add(0);
				goalsM.add(0);
				min.add(0);
				goalsM.add(0);
			}
			
			
			
			
			
			
			
			HashMap<String, GaugeModeller> gauges=new HashMap<>();
			gauges.put("warmDuration", warmDuration);
			gauges.put("warmHR", warmHR);
//			gauges.put("stretchDuration", stretchDuration);
//			gauges.put("stretchHR", stretchHR);
			gauges.put("aeroDuration", aeroDuration);
			gauges.put("aeroHR", aeroHR);
			gauges.put("coolDuration", coolDuration);
			gauges.put("coolHR", coolHR);
//			gauges.put("realxDuration", realxDuration);
//			gauges.put("relaxHR", relaxHR);
			
			model.addAttribute("gauges", gauges);
			Gson gson=new Gson();
			String gaugesJson=gson.toJson(gauges);
			model.addAttribute("gaugesJson",gaugesJson);
			model.addAttribute("id",id);
//		model.addAttribute("date",HomeController.labels.get(Integer.parseInt(id)));
			model.addAttribute("session", session);
			
			int tot=min.size();
			int totalDuration=0;
			for(int i=1;i<tot;i++){
				totalDuration+=(Integer) min.get(i);
			}
			if (totalDuration==0){
				totalDuration=session.getDuration();
			}
			model.addAttribute("totalDuration",totalDuration);
			if (session.getEnergyExpenditure()!=null)
				model.addAttribute("energy",session.getEnergyExpenditure().getValue());
			else
				model.addAttribute("energy",0);
			
			HashMap<String, ArrayList<Object>> steps=new HashMap<>();
			steps.put("goalsM", goalsM);
			steps.put("goalsBmin", goalsBmin);
			steps.put("goalsBmax", goalsBmax);
			steps.put("min", min);
			steps.put("bpm", bpm);
			String stepJson = gson.toJson(steps);
			model.addAttribute("stepJson",stepJson);
			
			model.addAttribute("summaryActive", "active");
			model.addAttribute("hrActive", "");
			model.addAttribute("exActive", "");
			
			model.addAttribute("hrMaxLabel", BPM_CHART_MAX);
			model.addAttribute("hrMinLabel", BPM_CHART_MIN);
			model.addAttribute("hrValuesLabel", BPM_CHART_VALUES);
			model.addAttribute("achievedLabel", BPM_CHART_ACHIEVED);
			model.addAttribute("exceededLabel", BPM_CHART_EXCEEDED);
			model.addAttribute("notReachedLabel", BPM_CHART_NOTREACHED);
			
			model.addAttribute("wuLabel",WU_LABEL);
			model.addAttribute("aeLabel",AE_LABEL);
			model.addAttribute("cdLabel",CD_LABEL);
			
			model.addAttribute("sessionJson", gson.toJson(session));
			
			return "singleSession";
		} catch (Exception e) {
			String msgToUser=msg.getMessage("error.expired",null, locale);
			PwLogger.logger.fine(e.toString());
			PwLogger.logger.fine(msgToUser);
			
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			e.printStackTrace(pw);
			PwLogger.errorLogger.severe(sw.toString());
			
			model.addAttribute("msg",msgToUser);
			return "redirect:/";
		}
    }
	
	private Object getCSSClass(int c1, int c2) {
		String classes[] = {"success","warning","danger"};
//		System.out.println("c1: "+c1+" c2: "+c2+" "+classes[Math.max(c1, c2)]);
		return classes[Math.max(c1, c2)];
	}


	private int getColor(double goal, double done) {
		
//		var massimo = goal;
//		if (goal < done) {
//			massimo = done;
//		}
//		
//		var colors = ["#d9534f","#D9726F","#f0ad4e","#f0ad4e", "#97C297", "#5cb85c"];
		int ncp=5;
		
		double massimo;
		massimo=goal;
		if (goal<done){
			massimo=done;
		}
		
		int settori=6; //NUMERO SETTORI GAUGE
		float[] percs=new float[settori];
		int[] valori = new int[settori];
		float perc=((float) 1)/settori;
		for (int i=0;i<settori;i++){
			percs[i]=perc*i;
			valori[i] = (int) (percs[i]*massimo);
			if (done>valori[i])
				ncp=i;
		}
		
		
//		System.out.println("done: "+done+" goal: "+goal );
		double primo,terzo,quarto;
		massimo=goal;
		if (goal<done){
			massimo=done;
		}
//		primo=goal/2;
////		secondo = 3*(goal/4);
//		terzo = 9*(goal/10);
//		quarto = 11*(goal/10);
////		quinto = 1.2*massimo;
		
		primo=valori[2];
		terzo=valori[4];
		quarto=massimo;
		
//		System.out.println(primo+" "+terzo+" "+quarto);
		
//		System.out.println(String.format("Done %f, Primo %f, Terzo %f, Quarto %f, Massimo %f - Goal %f",done,primo,terzo,quarto,massimo,goal));
		
		if (done <= primo){
			return 2; //rosso
		}else if(done > primo && done <=terzo){
			return 1; //giallo
		}else if(done > terzo && done <=quarto ){
			return 0; //verde
		}else {
			return 0; //verde
		}
		
		
	}


//	@RequestMapping(value = "/singleSessionHR", method = RequestMethod.GET)
//    public String pupolateHR(String id, Model model,Locale locale) {
//		
//		model.addAttribute("id",id);
////		model.addAttribute("date",HomeController.labels.get(Integer.parseInt(id)));
////		model.addAttribute("session", HomeController.sessions.get(Integer.parseInt(id)));
//		ArrayList<ExerciseSession> sessions=(ArrayList<ExerciseSession>) model.asMap().get("sessions");
//		ExerciseSession session= sessions.get(Integer.parseInt(id));
//		model.addAttribute("session", session);
//		if (! (session instanceof ActiveLifestylePASession)){
//			model.addAttribute("PA",false);
//			model.addAttribute("trainingProfile", session.getTrainingProfile());
//			model=HomeController.addMenuData(model,null);
//			
//			HashMap<String, Integer> zones=getHRZones(model);
//			
//			Random r=new Random();
//			
//			//simulazione del file con le frequenze cardiache
////			300 misurazioni - una ogni 12 secondi -> 60 minuti
////			60 minuti - una ogni 5 secondi -> 
//			
//			//divisione verticale
//					int tot=300;
//					int wu=(int) (zones.get("wuDuration"))*CAMPIONI_AL_MINUTO;
//					int ae=wu+(int) (zones.get("aeDuration"))*CAMPIONI_AL_MINUTO;
//					int cd=ae+(int) (zones.get("cdDuration"))*CAMPIONI_AL_MINUTO;
//					
////			System.out.println(wu+ " "+st+ " "+ae+ " "+cd+ " "+rx);	
////			System.out.println(wu/5+ " "+st/5+ " "+ae/5+ " "+cd/5+ " "+rx/5);	
//					
//			ArrayList<Misurazione> misurazioni=new ArrayList<>();
//			int n=0;
//			int base=85;
//			int rand;
//			n=base;
//			int randDivisione=2;
//			for (int i=0;i<cd;i++){ //la fine del cooldown è il massimo dei valori che dovrei generare
//				if (i<=wu){
//					rand=r.nextInt(6);
//					n+= i%2==0 ? rand : -(rand)/randDivisione; 
//				}else if(i<=ae){
//					rand=r.nextInt(12);
//					n+= i%3==0 ? rand : -(rand)/randDivisione;
//					if (n>160 || n<140){
//						n=140+r.nextInt(20);
//					}
//				}else if(i<=cd){
//					rand=r.nextInt(8);
//					n+= i%8==0 ? +(rand) : -rand/randDivisione; 
//				}
//				
////				rand=r.nextInt(2);
////				
////				if (i>75){
////					rand=r.nextInt(5);
////				}
////				crescente=base+(i/2);
////				n=n%2==0 ? crescente+rand : crescente+(rand)-4; 
////				System.out.println("\trand: "+rand+"\tcrescente:" + crescente + "\tn:"+n);
//				Misurazione m=new Misurazione(String.valueOf(i), String.valueOf(n));
//				misurazioni.add(m);
//			}
//			
////			for (int i=220;i<300;i++){
////				rand=r.nextInt(5);
////				if (n<=90){
////					n+=i%2==0 ? 1 : -1; 
////				}else{
////					n-=rand;
////				}
//////				System.out.println("\tn:"+n);
////				Misurazione m=new Misurazione(String.valueOf(i), String.valueOf(n));
////				misurazioni.add(m);
////			}
//			
//			Gson gson=new Gson();
//			String misurazioniJson=gson.toJson(misurazioni);
//			model.addAttribute("misurazioni",misurazioniJson); //dovrei tornare questo, i calcoli lato client
//			//TODO dovresti calcolare i campioni al minuto
//			
//			model.addAttribute("campioniAlMinuto",CAMPIONI_AL_MINUTO);
//			Integer duration=session.getDuration();
//			//calcolo in base al training profile associato alla sessione
//			//TODO - per ora WU e CD è 0,15 della AE
//			double aeDuration= ((double) duration/1.3);
//			double cdDuration;
//			double wuDuration=cdDuration=aeDuration*0.15;
//			model.addAttribute("wuDuration",Math.round(wuDuration));
//			model.addAttribute("aeDuration",Math.round(aeDuration));
//			model.addAttribute("cdDuration",Math.round(cdDuration));
//			
//			
//			
//			//TODO sempre dal TrainingProfile
//			model.addAttribute("wuMax", zones.get("wuMax"));
//			model.addAttribute("wuMin", zones.get("wuMin"));
//			model.addAttribute("aeMax", zones.get("aeMax"));
//			model.addAttribute("aeMin", zones.get("aeMin"));
//			model.addAttribute("cdMax", zones.get("cdMax"));
//			model.addAttribute("cdMin", zones.get("cdMin"));
//			
//			
//			model.addAttribute("wuDuration",zones.get("wuDuration"));
//			model.addAttribute("aeDuration",zones.get("aeDuration"));
//			model.addAttribute("cdDuration",zones.get("cdDuration"));
//			
//			//divisione verticale
////			int tot=300;
////			int wu=(int) (tot*0.25);
////			int st=(int) (wu+(tot*0.2));
////			int ae=(int) (st+ (tot*0.2));
////			int cd=(int) (ae+(tot*0.2));
////			int rx=(int) (cd+ (tot*0.15));
//			
////			model.addAttribute("wpMax", wu);
////			model.addAttribute("stMax", st);
////			model.addAttribute("aeMax", ae);
////			model.addAttribute("cdMax", cd);
////			model.addAttribute("rxMax", rx);
////			
////			int wuMin=80;
////			int wuMax=100;
////			int stMin=100;
////			int stMax=110;
////			int aeMin=140;
////			int aeMax=160;
////			int cdMin=110;
////			int cdMax=120;
////			int rxMin=80;
////			int rxMax=100;
////			
////			int wuInTarget=0;
////			int stInTarget=0;
////			int aeInTarget=0;
////			int cdInTarget=0;
////			int rxInTarget=0;
////			
////			for (int i=0;i<tot;i++) {
////				Misurazione misurazione=misurazioni.get(i);
////				int value=Integer.parseInt(misurazione.getFreq());
////				if (i<=wu){
////					if (value>=wuMin && value<=wuMax){
////						wuInTarget++;
////					}
////				}else if (i<=st){
////					if (value>=stMin && value<=stMax){
////						stInTarget++;
////					}
////				}else if(i<=ae){
////					if (value>=aeMin && value<=aeMax){
////						aeInTarget++;
////					}
////				}else if(i<=cd){
////					if (value>=cdMin && value<=cdMax){
////						cdInTarget++;
////					}
////				}else if(i<=rx){
////					if (value>=rxMin && value<=rxMax){
////						rxInTarget++;
////					}
////				}
////			}
//			//sempre ipotizzando un campionamento ogni 12 secondi
////			model.addAttribute("wuInTarget", wuInTarget/5);
////			model.addAttribute("stInTarget", stInTarget/5);
////			model.addAttribute("aeInTarget", aeInTarget/5);
////			model.addAttribute("cdInTarget", cdInTarget/5);
////			model.addAttribute("rxInTarget", rxInTarget/5);
//			
////			HashMap<String, ArrayList<Integer>> hrmap=new HashMap<>();
////			ArrayList<Integer> hrs=new ArrayList<>();
////			hrs.add(80);
////			hrs.add(100);
////			hrmap.put("hr_wu",hrs);
////			hrs=new ArrayList<>();
////			hrs.add(100);
////			hrs.add(110);
////			hrmap.put("hr_st",hrs);
////			hrs=new ArrayList<>();
////			hrs.add(140);
////			hrs.add(160);
////			hrmap.put("hr_aw",hrs);
////			hrs=new ArrayList<>();
////			hrs.add(110);
////			hrs.add(120);
////			hrmap.put("hr_cd",hrs);
////			hrs=new ArrayList<>();
////			hrs.add(80);
////			hrs.add(100);
////			hrmap.put("hr_rx",hrs);
////			String jsonMap=gson.toJson(hrmap);
////			model.addAttribute("hrs",jsonMap);
//			
//			//solo per testing timeline
////			ArrayList<CustomObjectEx> customs=new ArrayList<>();
////			String data=labels.get(Integer.parseInt(id));
////			int tot=0;
////			for (int i=0;i<10;i++){
////				n=r.nextInt(4);
////				String tipo="";
////				switch (n) {
////				case 0:
////					tipo="bici";
////					break;
////				case 1:
////					tipo="cuore";
////					break;
////				case 2:
////					tipo="corsetta";
////					break;
////				default:
////					tipo="cuore";
////					break;
////				}
////				tot+=5+n;
////				CustomObjectEx custom=new CustomObjectEx(data, tipo, String.valueOf(5+n));
////				customs.add(custom);
////			}
//		}else{
//			model.addAttribute("PA",true);
//			Gson gson=new Gson();
//			model.addAttribute("misurazioni",gson.toJson("Misurazioni PA FAKE"));
//		}
//		
//		
//		model.addAttribute("id",id);
////		Gson gson=new Gson();
////		model.addAttribute("lista",gson.toJson(customs));
//		
////		model.addAttribute("lista",customs);
////		model.addAttribute("tot",tot);
//		
//		
////		model.addAttribute("footer_javascripts", "resources/js/drawC3.js");
//		
//		
//		model.addAttribute("summaryActive", "");
//		model.addAttribute("hrActive", "active");
//		model.addAttribute("exActive", "");
//		
//		BPM_CHART_ACHIEVED=msg.getMessage("session.label.chart.bpm.achieved",null, locale);
//		BPM_CHART_NOTREACHED=msg.getMessage("session.label.chart.bpm.notReached",null, locale);
//		
//		String wuLabel=msg.getMessage("session.label.gauge.wu.title",null, locale);
//		String stLabel=msg.getMessage("session.label.gauge.st.title",null, locale);
//		String aeLabel=msg.getMessage("session.label.gauge.ae.title",null, locale);
//		String cdLabel=msg.getMessage("session.label.gauge.cd.title",null, locale);
//		String rxLabel=msg.getMessage("session.label.gauge.rx.title",null, locale);
//		
//		
//		String onTargetLabel = msg.getMessage("session.label.pie.onTarget", null, locale);
//		String outOfTargetLabel = msg.getMessage("session.label.pie.outOfTarget", null, locale);
//		String minOnTargetLabel =  msg.getMessage("session.label.hrchart.timeOnTarget.values", null, locale);
//		String goalLabel =  msg.getMessage("session.label.hrchart.goal.values", null, locale); 
//		String hrLabel = msg.getMessage("session.label.hrchart.unit", null, locale);
//		
//		String minHrLabel=msg.getMessage("session.label.chart.bpm.min",null, locale);
//		String maxHrLabel=msg.getMessage("session.label.chart.bpm.max",null, locale);
//		
//		model.addAttribute("onTarget", onTargetLabel);
//		model.addAttribute("outOfTarget", outOfTargetLabel);
//		model.addAttribute("minOnTarget",minOnTargetLabel);
//		model.addAttribute("goal",goalLabel);
//		model.addAttribute("achievedLabel", BPM_CHART_ACHIEVED);
//		model.addAttribute("notReachedLabel", BPM_CHART_NOTREACHED);
//		model.addAttribute("wuLabel",wuLabel);
//		model.addAttribute("stLabel",stLabel);
//		model.addAttribute("aeLabel",aeLabel);
//		model.addAttribute("cdLabel",cdLabel);
//		model.addAttribute("rxLabel",rxLabel);
//		model.addAttribute("hrLabel", hrLabel);
//		
//		model.addAttribute("minHrLabel", minHrLabel);
//		model.addAttribute("maxHrLabel", maxHrLabel);
//		
//		
//		return "singleSessionHR";
//	}
//	
	//TODO check su null values
	private HashMap<String, Integer> getHRZones(Model model) {
		HashMap<String, Integer> zones=new HashMap<String, Integer>();
//		CardiacRehabilitationProgramme programme=(CardiacRehabilitationProgramme) model.asMap().get("programme");
//		TrainingProfile train=programme.getTrainingProfile();
		TrainingProfile train=(TrainingProfile) model.asMap().get("trainingProfile");
		if (train!=null){
			zones.put("wuDuration", train.getWarmingUpDuration());
			zones.put("aeDuration", train.getMainDuration());
			zones.put("cdDuration", train.getCooldownDuration());
				
			try {
				zones.put("wuMin", train.getWarmingHRzoneMin());
				zones.put("wuMax", train.getWarmingHRzoneMax());
				zones.put("aeMin", train.getMainHRzoneMin());
				zones.put("aeMax", train.getMainHRzoneMax());
				zones.put("cdMin", train.getCooldownHRZoneMin());
				zones.put("cdMax", train.getCooldownHRZoneMax());
				}catch (Exception e){
					zones.put("wuMin", 90);
					zones.put("wuMax", 110);
					zones.put("aeMin", 120);
					zones.put("aeMax", 140);
					zones.put("cdMin", 110);
					zones.put("cdMax", 90);
				}
			
		}
		else{
			zones.put("wuDuration", 6);
			zones.put("aeDuration", 34);
			zones.put("cdDuration", 6);
			
			zones.put("wuMin", 90);
			zones.put("wuMax", 110);
			zones.put("aeMin", 120);
			zones.put("aeMax", 140);
			zones.put("cdMin", 110);
			zones.put("cdMax", 90);
		}
		
		return zones;
		
	}

	@RequestMapping(value = "/singleSessionEx", method = RequestMethod.GET)
    public String populateEX(String id, Model model) {
		
		Random r=new Random();
		
//		ArrayList<ExerClassExerciseDescription> exs=new ArrayList<>();
//		String data=HomeController.labels.get(Integer.parseInt(id));
		ArrayList<ExerciseSession> sessions=(ArrayList<ExerciseSession>) model.asMap().get("sessions");
		model.addAttribute("session", sessions.get(Integer.parseInt(id)));
		String data=DateMgt.getReadableDate(sessions.get(Integer.parseInt(id)).getDate());
		ArrayList<CustomObjectEx> customs=new ArrayList<>();
		int tot=0;
		for (int i=0;i<10;i++){
			int n=r.nextInt(4);
			String tipo="";
			switch (n) {
			case 0:
				tipo="bici";
				break;
			case 1:
				tipo="cuore";
				break;
			case 2:
				tipo="corsetta";
				break;
			default:
				tipo="cuore";
				break;
			}
			tot+=5+n;
			CustomObjectEx custom=new CustomObjectEx(data, tipo, String.valueOf(5+n));
			customs.add(custom);
		}
		
		model.addAttribute("id",id);
//		Gson gson=new Gson();
//		model.addAttribute("lista",gson.toJson(customs));
		
		model.addAttribute("lista",customs);
		model.addAttribute("tot",tot);
		model.addAttribute("date",data);
		model=HomeController.addMenuData(model,null);
		
		model.addAttribute("summaryActive", "");
		model.addAttribute("hrActive", "");
		model.addAttribute("exActive", "active");
		
		return "singleSessionEX";
	}
	
	@RequestMapping(value = "/singleSessionHR", method = RequestMethod.GET)
	public String pupolateHR(String id, Model model,Locale locale) {
		
		model.addAttribute("id",id);
//		model.addAttribute("date",HomeController.labels.get(Integer.parseInt(id)));
//		model.addAttribute("session", HomeController.sessions.get(Integer.parseInt(id)));
		ArrayList<ExerciseSession> sessions=(ArrayList<ExerciseSession>) model.asMap().get("sessions");
		ExerciseSession session= sessions.get(Integer.parseInt(id));
		model.addAttribute("session", session);
		if (! (session instanceof ActiveLifestylePASession)){
			model.addAttribute("PA",false);
			model.addAttribute("trainingProfile", session.getTrainingProfile());
			model=HomeController.addMenuData(model,null);
			
			HashMap<String, Integer> zones=getHRZones(model);
			
			Random r=new Random();
			
			//simulazione del file con le frequenze cardiache
//			300 misurazioni - una ogni 12 secondi -> 60 minuti
//			60 minuti - una ogni 5 secondi -> 
			
			//divisione verticale
//					int wu=(int) (zones.get("wuDuration"))*CAMPIONI_AL_MINUTO;
//					int ae=wu+(int) (zones.get("aeDuration"))*CAMPIONI_AL_MINUTO;
//					int cd=ae+(int) (zones.get("cdDuration"))*CAMPIONI_AL_MINUTO;
					
					int wu = 0;
					int ae = 0;
					int cd = 0;
			
					if (session instanceof ExerClassSession){
						wu = ((ExerClassSession) session).getWarmingDuration().getDuration()*CAMPIONI_AL_MINUTO;
						ae=wu+((ExerClassSession) session).getMainDuration().getDuration()*CAMPIONI_AL_MINUTO;
						cd=ae+((ExerClassSession) session).getCoolDownDuration().getDuration()*CAMPIONI_AL_MINUTO;
					}else if(session instanceof ExerGameSession){
						wu = ((ExerGameSession) session).getWarmingDuration().getDuration()*CAMPIONI_AL_MINUTO;
						ae=wu+((ExerGameSession) session).getMainDuration().getDuration()*CAMPIONI_AL_MINUTO;
						cd=ae+((ExerGameSession) session).getCoolDownDuration().getDuration()*CAMPIONI_AL_MINUTO;
					}
					
//			System.out.println(wu+ " "+st+ " "+ae+ " "+cd+ " "+rx);	
//			System.out.println(wu/5+ " "+st/5+ " "+ae/5+ " "+cd/5+ " "+rx/5);	
					
			ArrayList<Misurazione> misurazioni=new ArrayList<>();
			List<HrMeasure> hrs=HrFileHandler.parse(session.getHr_file());
			if (hrs!=null && hrs.size()>0){
				int tot=hrs.size();
				for (int i=0;i<tot;i++){
					Misurazione m=new Misurazione(String.valueOf(i+1), String.valueOf(hrs.get(i).getValue()));
					misurazioni.add(m);
				}
			}else {
				int n=0;
				int base=85;
				int rand;
				n=base;
				int randDivisione=2;
				for (int i=0;i<cd;i++){ //la fine del cooldown è il massimo dei valori che dovrei generare
					if (i<=wu){
						rand=r.nextInt(6);
						n+= i%2==0 ? rand : -(rand)/randDivisione; 
					}else if(i<=ae){
						rand=r.nextInt(12);
						n+= i%3==0 ? rand : -(rand)/randDivisione;
						if (n>160 || n<140){
							n=140+r.nextInt(20);
						}
					}else if(i<=cd){
						rand=r.nextInt(8);
						n+= i%8==0 ? +(rand) : -rand/randDivisione; 
					}
					
					Misurazione m=new Misurazione(String.valueOf(i), String.valueOf(n));
					misurazioni.add(m);
				}
			}
			
			
			Gson gson=new Gson();
			String misurazioniJson=gson.toJson(misurazioni);
			model.addAttribute("misurazioni",misurazioniJson); //dovrei tornare questo, i calcoli lato client
			//TODO dovresti calcolare i campioni al minuto
			
			model.addAttribute("campioniAlMinuto",CAMPIONI_AL_MINUTO);
			Integer duration=session.getDuration();
			//calcolo in base al training profile associato alla sessione
			
//			double wuDuration=session.getTrainingProfile().getWarmingUpDuration(); 
//			double aeDuration= session.getTrainingProfile().getMainDuration();
//			double cdDuration= session.getTrainingProfile().getCooldownDuration(); 
			
			double wuDuration = 0;
			double aeDuration = 0;
			double cdDuration = 0;
			if (session instanceof ExerClassSession){
				wuDuration = ((ExerClassSession) session).getWarmingDuration().getDuration();
				aeDuration = ((ExerClassSession) session).getMainDuration().getDuration();
				cdDuration = ((ExerClassSession) session).getCoolDownDuration().getDuration();
			}else if (session instanceof ExerGameSession){
				wuDuration = ((ExerGameSession) session).getWarmingDuration().getDuration();
				aeDuration = ((ExerGameSession) session).getMainDuration().getDuration();
				cdDuration = ((ExerGameSession) session).getCoolDownDuration().getDuration();
			}
			
			model.addAttribute("wuDuration",Math.round(wuDuration));
			model.addAttribute("aeDuration",Math.round(aeDuration));
			model.addAttribute("cdDuration",Math.round(cdDuration));
			
			
			
			//sempre dal TrainingProfile
			model.addAttribute("wuMax", zones.get("wuMax"));
			model.addAttribute("wuMin", zones.get("wuMin"));
			model.addAttribute("aeMax", zones.get("aeMax"));
			model.addAttribute("aeMin", zones.get("aeMin"));
			model.addAttribute("cdMax", zones.get("cdMax"));
			model.addAttribute("cdMin", zones.get("cdMin"));
			
			
			model.addAttribute("wuDurationGoal",zones.get("wuDuration"));
			model.addAttribute("aeDurationGoal",zones.get("aeDuration"));
			model.addAttribute("cdDurationGoal",zones.get("cdDuration"));
			
		}else{
			model.addAttribute("PA",true);
			ActiveLifestylePASession pa = (ActiveLifestylePASession) session;
			ArrayList<Integer> misurazioni=new ArrayList<Integer>();
			misurazioni.add(pa.getMinIn050());
			misurazioni.add(pa.getMinIn5160());
			misurazioni.add(pa.getMinIn6170());
			misurazioni.add(pa.getMinIn7180());
			misurazioni.add(pa.getMinIn8190());
			misurazioni.add(pa.getMinIn91100());
			misurazioni.add(pa.getMinIn101());
			
			Gson gson=new Gson();
			model.addAttribute("misurazioni",gson.toJson(misurazioni));
		}
		
		
		model.addAttribute("id",id);
//		Gson gson=new Gson();
//		model.addAttribute("lista",gson.toJson(customs));
		
//		model.addAttribute("lista",customs);
//		model.addAttribute("tot",tot);
		
		
//		model.addAttribute("footer_javascripts", "resources/js/drawC3.js");
		
		
		model.addAttribute("summaryActive", "");
		model.addAttribute("hrActive", "active");
		model.addAttribute("exActive", "");
		
		BPM_CHART_ACHIEVED=msg.getMessage("session.label.chart.bpm.achieved",null, locale);
		BPM_CHART_NOTREACHED=msg.getMessage("session.label.chart.bpm.notReached",null, locale);
		
		String wuLabel=msg.getMessage("session.label.gauge.wu.title",null, locale);
		String stLabel=msg.getMessage("session.label.gauge.st.title",null, locale);
		String aeLabel=msg.getMessage("session.label.gauge.ae.title",null, locale);
		String cdLabel=msg.getMessage("session.label.gauge.cd.title",null, locale);
		String rxLabel=msg.getMessage("session.label.gauge.rx.title",null, locale);
		
		
		String onTargetLabel = msg.getMessage("session.label.pie.onTarget", null, locale);
		String outOfTargetLabel = msg.getMessage("session.label.pie.outOfTarget", null, locale);
		String minOnTargetLabel =  msg.getMessage("session.label.hrchart.timeOnTarget.values", null, locale);
		String goalLabel =  msg.getMessage("session.label.hrchart.goal.values", null, locale); 
		String hrLabel = msg.getMessage("session.label.chart.bpm.values", null, locale);
		
		String minHrLabel=msg.getMessage("session.label.chart.bpm.min",null, locale);
		String maxHrLabel=msg.getMessage("session.label.chart.bpm.max",null, locale);
		
		model.addAttribute("onTarget", onTargetLabel);
		model.addAttribute("outOfTarget", outOfTargetLabel);
		model.addAttribute("minOnTarget",minOnTargetLabel);
		model.addAttribute("goal",goalLabel);
		model.addAttribute("achievedLabel", BPM_CHART_ACHIEVED);
		model.addAttribute("notReachedLabel", BPM_CHART_NOTREACHED);
		model.addAttribute("wuLabel",wuLabel);
		model.addAttribute("stLabel",stLabel);
		model.addAttribute("aeLabel",aeLabel);
		model.addAttribute("cdLabel",cdLabel);
		model.addAttribute("rxLabel",rxLabel);
		model.addAttribute("hrLabel", hrLabel);
		model.addAttribute("goalLabel", goalLabel);
		
		model.addAttribute("minHrLabel", minHrLabel);
		model.addAttribute("maxHrLabel", maxHrLabel);
		
		
		return "singleSessionHR";
	}
	
	@RequestMapping(value = "/translateActivity/{aType}", method = RequestMethod.GET)
	public @ResponseBody String filterLabels(@PathVariable("aType") ActivityType aType, Model model, Locale locale) {
		PwLogger.printMethod();
		String label=activityDao.findActivityFromId(aType.getPos(), locale.getLanguage());
		
		return label;
		
	}
	
	
}
