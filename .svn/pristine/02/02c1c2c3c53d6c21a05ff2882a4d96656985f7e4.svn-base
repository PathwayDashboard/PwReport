package it.eng.pathway.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import ers.test.Utility;
import io.swagger.client.ApiException;
import io.swagger.client.model.BehavioralChangeProgressGoalAssessmentQuantitativeAnswerSubSubsection;
import io.swagger.client.model.BehavioralChangeProgressGoalAssessmentSubSection;
import io.swagger.client.model.BehavioralChangeProgressSection;
import io.swagger.client.model.BehaviouralChangeProgrammePersonalGoalSubsection;
import io.swagger.client.model.BehaviouralChangeProgrammeSection;
import io.swagger.client.model.GenericPostputResult;
import it.eng.pathway.fake.model.CardiacRehabilitationProgramme;
import it.eng.pathway.fake.model.ExerciseProgramme;
import it.eng.pathway.fake.model.GoalCategoryType;
import it.eng.pathway.frontend.business.ContentBusiness;
import it.eng.pathway.frontend.business.DocumentBusiness;
import it.eng.pathway.frontend.business.VideoLinkBusiness;
import it.eng.pathway.frontend.dao.QuestionnaireDAO;
import it.eng.pathway.frontend.model.Content;
import it.eng.pathway.frontend.model.Document;
import it.eng.pathway.frontend.model.Questionnaire;
import it.eng.pathway.frontend.model.VideoLink;
import it.eng.pathway.hdms.connection.BCProgramme;
import it.eng.pathway.hdms.connection.BCProgress;
import it.eng.pathway.utility.PwLogger;
import it.eng.pathway.utilitymodel.CustomGoalAssessment;
import it.eng.pathway.utilitymodel.CustomSession;

@Controller
@SessionAttributes({"xSessionId" , "sin", "bcprogramme", "goalsByType", "programme", "role", "dimension"})
public class Lifestyle {
	
private static final String FORMATTER_STRING = "yyyy-MM-dd";
private static final String READABLE_STRING = "dd-MM-yyyy hh:mm";
private static final String PDF_PATH = "/WEB-INF/resources/pdf/";

@Autowired
private DocumentBusiness documentBusiness;

private static final String RECOMM="Recomm";
private static final String TIPS="Tips";
private static final String OTHER="Other";
private static final String PEERS="Peers";
private static final String EXPERT="Expert";

private static final String PA="PhysicalActivity";
private static final String SMOKING="Smoking";
private static final String DIET="Diet";
private static final String STRESS="Stress";
private static final String ALCOHOL="Alcohol";
private static final String MEDICINE="Medicine";


	//	static ArrayList<String> labels;
	static ArrayList<CustomSession> sessions;
	
	@Autowired
	private ContentBusiness contentBusiness;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	QuestionnaireDAO questionnaireDAO;
	
	@Autowired
	private VideoLinkBusiness videoLinkBusiness;
	
	private MessageSource msg;
	@Autowired
    public void AccountsController(MessageSource msgSrc) {
     this.msg = msgSrc;
    }
	
	@RequestMapping(value="/physicalActivity", method=RequestMethod.GET)
	public String physicalActivity(Model model, Locale locale){
		PwLogger.printMethod();
		model.addAttribute("dimension", PA);
		String dimension=(String) model.asMap().get("dimension");
		upload(null, model, locale);
		
		Content tips=contentBusiness.find(dimension, TIPS,locale);
		if (tips!=null){
			model.addAttribute("tips", tips.getHtml());
			model.addAttribute("tipsId", tips.getId());
		}
		
		Content recomm=contentBusiness.find(dimension, RECOMM,locale);
		if (recomm!=null){
			model.addAttribute("recomm", recomm.getHtml());
			model.addAttribute("recommId", recomm.getId());
		}
		
		Content other=contentBusiness.find(dimension, OTHER,locale);
		if (other!=null){
			model.addAttribute("other", other.getHtml());
			model.addAttribute("otherId", other.getId());
		}
		
		model=loadVideoLinks(model, locale);
		
		
		if(!isAdmin(model)){
			CardiacRehabilitationProgramme programme=(CardiacRehabilitationProgramme) model.asMap().get("programme");
			if(programme!=null){
				if(programme.getExerciseProgrammes() != null){
					ExerciseProgramme exProgramme=programme.getExerciseProgrammes().get(programme.getExerciseProgrammes().size()-1);
					model.addAttribute("exProgramme", exProgramme);
				}
			}
		}
		
		return "physicalActivityPage";
	}
	
	private boolean isAdmin(Model model) {
		String role=(String) model.asMap().get("role");
		PwLogger.logger.fine(role);
		return  role != null && role.equals(EditingController.ADMIN);
	}
	
	private boolean isStatic(Model model) {
		String xsessionId=(String) model.asMap().get("xSessionId");
		BehaviouralChangeProgrammeSection bcprogramme = (BehaviouralChangeProgrammeSection) model.asMap().get("bcprogramme");
		return xsessionId == null || bcprogramme == null;
	}

	@RequestMapping(value="/healthy", method=RequestMethod.GET)
	public String healthyRender(Model model, Locale locale){
		PwLogger.printMethod();
		if (!isAdmin(model)){
		String sin=(String) model.asMap().get("sin");
		String xSessionId=(String) model.asMap().get("xSessionId");
		
		try {
			BehaviouralChangeProgrammeSection bcprogramme=BCProgramme.getProgramme(sin, xSessionId);
			if (bcprogramme == null){
				return "healthyPage";
			}
			PwLogger.logger.fine(bcprogramme.toString());
			model.addAttribute("bcprogramme", bcprogramme);
			
			List<BehaviouralChangeProgrammePersonalGoalSubsection> goals=bcprogramme.getPersonalGoals();
			if (goals != null && goals.size()>0){
				HashMap<Integer,List<BehaviouralChangeProgrammePersonalGoalSubsection>> goalsByType = new HashMap<Integer,List<BehaviouralChangeProgrammePersonalGoalSubsection>>();
				for (BehaviouralChangeProgrammePersonalGoalSubsection current : goals) {
					int type=current.getCategory();
					List<BehaviouralChangeProgrammePersonalGoalSubsection> tmp = goalsByType.get(type);
					if (tmp==null){
						tmp=new ArrayList<BehaviouralChangeProgrammePersonalGoalSubsection>();
					}
					tmp.add(current);
					goalsByType.put(type, tmp);
				}
				
				model.addAttribute("goalsByType", goalsByType);
			}
			
		} catch (ApiException e) {
			e.printStackTrace();
			String tester=this.msg.getMessage("error.msg.tester", null, locale);
			String msg=Utility.getMessage(e)+ " " + tester;
			PwLogger.logger.fine(msg);
			PwLogger.errorLogger.severe(msg);
			return "errorPageHDMSBC";
//			return HomeController.showErrorMsg(msg,"FROM HDMS: "+msg, model);	
		} catch (IOException e) {
			e.printStackTrace();
		} catch (NullPointerException npe) {
			PwLogger.logger.fine(npe.toString());
			npe.printStackTrace();
			return "healthyPage";
		}
		
		}
		return "healthyPage";
	}
	
	@RequestMapping(value="/smoking", method=RequestMethod.GET)
	public String smokingRender(Model model, Locale locale){
		PwLogger.printMethod();
		model.addAttribute("dimension", SMOKING);
		
		String dimension = (String) model.asMap().get("dimension");
		
		Content tips=contentBusiness.find(dimension, "Tips",locale);
		if (tips!=null){
			model.addAttribute("tips", tips.getHtml());
			model.addAttribute("tipsId", tips.getId());
		}
		
		Content recomm=contentBusiness.find(dimension, "Recomm",locale);
		if (recomm!=null){
			model.addAttribute("recomm", recomm.getHtml());
			model.addAttribute("recommId", recomm.getId());
		}
		
		Content other=contentBusiness.find(dimension, "Other",locale);
		if (other!=null){
			model.addAttribute("other", other.getHtml());
			model.addAttribute("otherId", other.getId());
		}
		
		model=loadVideoLinks(model, locale);
		
		if(!isStatic(model)){
		
			if(!isAdmin(model)){
			ArrayList<String> goals=new ArrayList<>();
			ArrayList<String> goalsQuestions=new ArrayList<>();
			ArrayList<String> goalsCategories=new ArrayList<>();
			
			ArrayList<Questionnaire> completeGoals=new ArrayList<Questionnaire>();
			
			HashMap<Integer, List<BehaviouralChangeProgrammePersonalGoalSubsection>> goalsByType=(HashMap<Integer, List<BehaviouralChangeProgrammePersonalGoalSubsection>>) model.asMap().get("goalsByType");
			
			int type = GoalCategoryType.smoking.ordinal();
			if(goalsByType != null ){
				List<BehaviouralChangeProgrammePersonalGoalSubsection> goalsHDMS = goalsByType.get(type);
				PwLogger.logger.fine("SMOKING GOAL");
				try {
					if (goalsHDMS != null) {
						for (BehaviouralChangeProgrammePersonalGoalSubsection goal : goalsHDMS) {
							PwLogger.logger.fine(goal.toString());
							goals.add(goal.getDescription());
	//				goalsQuestions.add("FROM HDMS - "+" no question related");
							Questionnaire q=questionnaireDAO.find(goal.getId(), locale);
							String goalQuestion = q.getText();
							goalsQuestions.add("from DB - "+goalQuestion);
							goalsCategories.add(" - "+q.getCategory());
							completeGoals.add(q);
						}
					}
				} catch (Exception e1) {
					PwLogger.errorLogger.fine(e1.toString());
					return "errorPageHDMSBC";
				}
			
				
				model.addAttribute("lang",locale.getLanguage());
				
				String smokingLabel=this.msg.getMessage("lifestyle.cig.event", null, locale);
				
				model.addAttribute("smokeEvent", smokingLabel);
				
				Gson gson=new Gson();
				model.addAttribute("goalCategory", type);
				model.addAttribute("goals", goals);
				model.addAttribute("goalsQuestions",goalsQuestions);
				model.addAttribute("completeGoals", completeGoals);
				model.addAttribute("completeGoalsJson", gson.toJson(completeGoals));
				
				model.addAttribute("goalsJs", gson.toJson(goals));
		//		model.addAttribute("goalsQuestions",gson.toJson(goalsQuestions));
		//		if (goalsCategories.size()==0)
		//			goalsCategories.add("Unit");
				model.addAttribute("goalsCategories",gson.toJson(goalsCategories));
				
				model.addAttribute("stylesheets","resources/css/fullcalendar_smoking.css");
				
				try {
					String patientNumber=(String) model.asMap().get("sin");
					String xSessionId=(String) model.asMap().get("xSessionId");
					BehavioralChangeProgressSection bcProgress=BCProgress.getProgress(patientNumber, xSessionId);
					List<BehavioralChangeProgressGoalAssessmentSubSection> oldAnswers = bcProgress.getGoalAssessments();
					ArrayList<CustomGoalAssessment> gas=new ArrayList<CustomGoalAssessment>();
					
					if(oldAnswers != null){
						for (BehavioralChangeProgressGoalAssessmentSubSection current : oldAnswers) {
							if (current.getCategory()==type){
								CustomGoalAssessment ga = new CustomGoalAssessment();
								ga.setCategory(current.getCategory());
								ga.setDate(current.getSubmissionDate());
								ga.setGoalId(current.getId());
								Questionnaire q=questionnaireDAO.find(current.getId(), locale);
								ga.setSubcategory(q.getCategory());
								List<BehavioralChangeProgressGoalAssessmentQuantitativeAnswerSubSubsection> ans = current.getQuantitativeAnwers();
								if (ans!=null){
									for (BehavioralChangeProgressGoalAssessmentQuantitativeAnswerSubSubsection currentAns : ans) {
										ga.setQuestionId(currentAns.getQuestionId());
										ga.setValue(String.valueOf(currentAns.getValue()));
									}
								}
								gas.add(ga);
							}
						}
					}else{
						PwLogger.logger.fine("NO OLD ANSWERS for Goal: SMOKING");
					}
					
					model.addAttribute("pastAssessments",gson.toJson(gas));
					
				
					
				} catch (ApiException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			
			}
			
			}
		}
		
		return "smokingPage";
	}
	
	

	@RequestMapping(value="/alcohol", method=RequestMethod.GET)
	public String alcoholRender(Model model, Locale locale){
		PwLogger.printMethod();
		model.addAttribute("dimension", ALCOHOL);
		String dimension=(String) model.asMap().get("dimension");
		
		Content tips=contentBusiness.find(dimension, "Tips",locale);
		if (tips!=null){
			model.addAttribute("tips", tips.getHtml());
			model.addAttribute("tipsId", tips.getId());
		}
		
		Content recomm=contentBusiness.find(dimension, "Recomm",locale);
		if (recomm!=null){
			model.addAttribute("recomm", recomm.getHtml());
			model.addAttribute("recommId", recomm.getId());
		}
		
		Content other=contentBusiness.find(dimension, "Other",locale);
		if (other!=null){
			model.addAttribute("other", other.getHtml());
			model.addAttribute("otherId", other.getId());
		}
		
		
		model=loadVideoLinks(model, locale);
		
		if(!isStatic(model)){
			if(!isAdmin(model)){
			ArrayList<String> goals=new ArrayList<>();
			ArrayList<String> goalsQuestions=new ArrayList<>();
			ArrayList<String> goalsCategories=new ArrayList<>();
			
			ArrayList<Questionnaire> completeGoals=new ArrayList<Questionnaire>();
			
			HashMap<Integer, List<BehaviouralChangeProgrammePersonalGoalSubsection>> goalsByType=(HashMap<Integer, List<BehaviouralChangeProgrammePersonalGoalSubsection>>) model.asMap().get("goalsByType");
			
			int type = GoalCategoryType.alcohol.ordinal();
			if(goalsByType != null ){
				List<BehaviouralChangeProgrammePersonalGoalSubsection> goalsHDMS = goalsByType.get(type);
				PwLogger.logger.fine("ALCOHOL GOAL");
				try {
					if (goalsHDMS != null) {
						for (BehaviouralChangeProgrammePersonalGoalSubsection goal : goalsHDMS) {
							PwLogger.logger.fine(goal.toString());
							goals.add(goal.getDescription());
		//				goalsQuestions.add("FROM HDMS - "+" no question related");
							Questionnaire q=questionnaireDAO.find(goal.getId(), locale);
							String goalQuestion = q.getText();
							goalsQuestions.add("from DB - "+goalQuestion);
							goalsCategories.add(" - "+q.getCategory());
							completeGoals.add(q);
						}
					}
				} catch (Exception e1) {
					PwLogger.errorLogger.fine(e1.toString());
					return "errorPageHDMSBC";
				}
			
				model.addAttribute("lang",locale.getLanguage());
				
				String smokingLabel=this.msg.getMessage("lifestyle.alc.event", null, locale);
				
				model.addAttribute("alcEvent", smokingLabel);
				
				
				Gson gson=new Gson();
				model.addAttribute("goalCategory", type);
				model.addAttribute("goals", goals);
				model.addAttribute("goalsQuestions",goalsQuestions);
				model.addAttribute("completeGoals", completeGoals);
				model.addAttribute("completeGoalsJson", gson.toJson(completeGoals));
				
				model.addAttribute("goalsJs", gson.toJson(goals));
		//		model.addAttribute("goalsQuestions",gson.toJson(goalsQuestions));
		//		if (goalsCategories.size()==0)
		//			goalsCategories.add("Unit");
				model.addAttribute("goalsCategories",gson.toJson(goalsCategories));
				
				
				model.addAttribute("stylesheets","resources/css/fullcalendar_smoking.css");
				
				
				try {
					String patientNumber=(String) model.asMap().get("sin");
					String xSessionId=(String) model.asMap().get("xSessionId");
					BehavioralChangeProgressSection bcProgress=BCProgress.getProgress(patientNumber, xSessionId);
					List<BehavioralChangeProgressGoalAssessmentSubSection> oldAnswers = bcProgress.getGoalAssessments();
					ArrayList<CustomGoalAssessment> gas=new ArrayList<CustomGoalAssessment>();
					
					if(oldAnswers != null){
						for (BehavioralChangeProgressGoalAssessmentSubSection current : oldAnswers) {
							if (current.getCategory()==type){
								CustomGoalAssessment ga = new CustomGoalAssessment();
								ga.setCategory(current.getCategory());
								ga.setDate(current.getSubmissionDate());
								ga.setGoalId(current.getId());
								Questionnaire q=questionnaireDAO.find(current.getId(), locale);
								ga.setSubcategory(q.getCategory());
								List<BehavioralChangeProgressGoalAssessmentQuantitativeAnswerSubSubsection> ans = current.getQuantitativeAnwers();
								if (ans!=null){
									for (BehavioralChangeProgressGoalAssessmentQuantitativeAnswerSubSubsection currentAns : ans) {
										ga.setQuestionId(currentAns.getQuestionId());
										ga.setValue(String.valueOf(currentAns.getValue()));
									}
								}
								gas.add(ga);
							}
						}
					}else{
						PwLogger.logger.fine("NO OLD ANSWERS for Goal: ALCOHOL");
					}
					
					model.addAttribute("pastAssessments",gson.toJson(gas));
					
				} catch (ApiException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			}
		}
		return "alcoholPage";
	}
	
	@RequestMapping(value="/diet", method=RequestMethod.GET)
	public String dietRender(Model model, Locale locale){
		PwLogger.printMethod();
		model.addAttribute("dimension", DIET);
		upload(null, model, locale);
		
		String dimension=(String) model.asMap().get("dimension");
		
		Content tips=contentBusiness.find(dimension, "Tips",locale);
		if (tips!=null){
			model.addAttribute("tips", tips.getHtml());
			model.addAttribute("tipsId", tips.getId());
		}
		
		Content recomm=contentBusiness.find(dimension, "Recomm",locale);
		if (recomm!=null){
			model.addAttribute("recomm", recomm.getHtml());
			model.addAttribute("recommId", recomm.getId());
		}
		
		Content other=contentBusiness.find(dimension, "Other",locale);
		if (other!=null){
			model.addAttribute("other", other.getHtml());
			model.addAttribute("otherId", other.getId());
		}
		
		Content recipe=contentBusiness.find(dimension, "Recipe",locale);
		if (recipe!=null){
			model.addAttribute("recipe", recipe.getHtml());
			model.addAttribute("recipeId", recipe.getId());
		}
		
		model=loadVideoLinks(model, locale);
//		model.addAttribute("locale", locale);
		
		if(!isStatic(model)){
		
			if(!isAdmin(model)){
			
			ArrayList<String> goals=new ArrayList<>();
			ArrayList<String> goalsQuestions=new ArrayList<>();
			ArrayList<String> goalsCategories=new ArrayList<>();
			
			ArrayList<Questionnaire> completeGoals=new ArrayList<Questionnaire>();
			
			HashMap<Integer, List<BehaviouralChangeProgrammePersonalGoalSubsection>> goalsByType=(HashMap<Integer, List<BehaviouralChangeProgrammePersonalGoalSubsection>>) model.asMap().get("goalsByType");
			
			int type = GoalCategoryType.eating.ordinal();
			if(goalsByType != null ){
				List<BehaviouralChangeProgrammePersonalGoalSubsection> goalsHDMS = goalsByType.get(type);
				PwLogger.logger.fine("EATING GOAL");
				try{
					if (goalsHDMS != null) {
						for (BehaviouralChangeProgrammePersonalGoalSubsection goal : goalsHDMS) {
							PwLogger.logger.fine(goal.toString());
							goals.add(goal.getDescription());
			//				goalsQuestions.add("FROM HDMS - "+" no question related");
							Questionnaire q=questionnaireDAO.find(goal.getId(), locale);
							String goalQuestion = q.getText();
							goalsQuestions.add("from DB - "+goalQuestion);
							goalsCategories.add(" - "+q.getCategory());
							completeGoals.add(q);
						}
					}
				}catch (Exception e){
					PwLogger.errorLogger.fine(e.toString());
					return "errorPageHDMSBC";
				}
			
			
				model.addAttribute("lang",locale.getLanguage());
				model.addAttribute("goalCategory", type);
				
				String vegLabel=this.msg.getMessage("lifestyle.veg.event", null, locale);
				String fatLabel=this.msg.getMessage("lifestyle.fat.event", null, locale);
				String saltLabel=this.msg.getMessage("lifestyle.salt.event", null, locale);
				
				model.addAttribute("vegEvent", vegLabel);
				model.addAttribute("fatEvent", fatLabel);
				model.addAttribute("saltEvent", saltLabel);
		//		
		//		
		//		
		//		String goal1Q="How many portions of <b>Fruit and Veg</b> did you eat today?";
		//		String goal2Q="How many courses containing <b>saturated fats</b> had you today?";
		//		String goal3Q="How many teaspoons of <b>salt</b> did you use today?";
		//		
		//		goalsQuestions.add(goal1Q);
		//		goalsQuestions.add(goal2Q);
		//		goalsQuestions.add(goal3Q);
		//		
		//		goalsCategories.add(" - Veg");
		//		goalsCategories.add(" - Fat");
		//		goalsCategories.add(" - Salt");
		//		goalsCategories.add(" - HDMS");
				
				Gson gson=new Gson();
				
				model.addAttribute("goals", goals);
				model.addAttribute("goalsQuestions",goalsQuestions);
				model.addAttribute("completeGoals", completeGoals);
				model.addAttribute("completeGoalsJson", gson.toJson(completeGoals));
				
				model.addAttribute("goalsJs", gson.toJson(goals));
		//		model.addAttribute("goalsQuestions",gson.toJson(goalsQuestions));
				model.addAttribute("goalsCategories",gson.toJson(goalsCategories));
				
				
				try {
					String patientNumber=(String) model.asMap().get("sin");
					String xSessionId=(String) model.asMap().get("xSessionId");
					BehavioralChangeProgressSection bcProgress=BCProgress.getProgress(patientNumber, xSessionId);
					List<BehavioralChangeProgressGoalAssessmentSubSection> oldAnswers = bcProgress.getGoalAssessments();
					ArrayList<CustomGoalAssessment> gas=new ArrayList<CustomGoalAssessment>();
					
					if(oldAnswers != null){
						for (BehavioralChangeProgressGoalAssessmentSubSection current : oldAnswers) {
							if (current.getCategory()==type){
								CustomGoalAssessment ga = new CustomGoalAssessment();
								ga.setCategory(current.getCategory());
								ga.setDate(current.getSubmissionDate());
								ga.setGoalId(current.getId());
								Questionnaire q=questionnaireDAO.find(current.getId(), locale);
								ga.setSubcategory(q.getCategory());
								List<BehavioralChangeProgressGoalAssessmentQuantitativeAnswerSubSubsection> ans = current.getQuantitativeAnwers();
								if (ans!=null){
									for (BehavioralChangeProgressGoalAssessmentQuantitativeAnswerSubSubsection currentAns : ans) {
										ga.setQuestionId(currentAns.getQuestionId());
										ga.setValue(String.valueOf(currentAns.getValue()));
									}
								}
								gas.add(ga);
							}
						}
					}else{
						PwLogger.logger.fine("NO OLD ANSWERS for Goal: HEALTHY EATING");
					}
					
					model.addAttribute("pastAssessments",gson.toJson(gas));
					
				} catch (ApiException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			
			}
			
			}
		}
		
		return "dietPage";
	}
	
	@RequestMapping(value="/stress", method=RequestMethod.GET)
	public String stressRender(Model model, Locale locale){
		PwLogger.printMethod();
		model.addAttribute("dimension", STRESS);
		
		String dimension = (String) model.asMap().get("dimension");
		
		upload(null, model, locale);
		Content tips=contentBusiness.find(dimension, "Tips",locale);
		if (tips!=null){
			model.addAttribute("tips", tips.getHtml());
			model.addAttribute("tipsId", tips.getId());
		}
		
		Content recomm=contentBusiness.find(dimension, "Recomm",locale);
		if (recomm!=null){
			model.addAttribute("recomm", recomm.getHtml());
			model.addAttribute("recommId", recomm.getId());
		}
		
		Content other=contentBusiness.find(dimension, "Other",locale);
		if (other!=null){
			model.addAttribute("other", other.getHtml());
			model.addAttribute("otherId", other.getId());
		}
		
		model=loadVideoLinks(model, locale);
		if(!isStatic(model)){
		
			if(!isAdmin(model)){
			
			ArrayList<String> goals=new ArrayList<>();
			ArrayList<String> goalsQuestions=new ArrayList<>();
			ArrayList<String> goalsCategories=new ArrayList<>();
			
			ArrayList<Questionnaire> completeGoals=new ArrayList<Questionnaire>();
			
			HashMap<Integer, List<BehaviouralChangeProgrammePersonalGoalSubsection>> goalsByType=(HashMap<Integer, List<BehaviouralChangeProgrammePersonalGoalSubsection>>) model.asMap().get("goalsByType");
			
			int type = GoalCategoryType.stressManagement.ordinal();
			if(goalsByType != null ){
				List<BehaviouralChangeProgrammePersonalGoalSubsection> goalsHDMS = goalsByType.get(type);
				PwLogger.logger.fine("StressManagement GOAL");
				try {
					if (goalsHDMS != null) {
						for (BehaviouralChangeProgrammePersonalGoalSubsection goal : goalsHDMS) {
							PwLogger.logger.fine(goal.toString());
							goals.add(goal.getDescription());
		//				goalsQuestions.add("FROM HDMS - "+" no question related");
							Questionnaire q=questionnaireDAO.find(goal.getId(), locale);
							if (q!=null){
								String goalQuestion = q.getText();
								goalsQuestions.add("from DB - "+goalQuestion);
								goalsCategories.add(" - "+q.getCategory());
								completeGoals.add(q);
							}
						}
					}
				} catch (Exception e) {
					PwLogger.errorLogger.fine(e.toString());
					return "errorPageHDMSBC";
				}
			
				
				model.addAttribute("lang",locale.getLanguage());
				
				
				Gson gson=new Gson();
				model.addAttribute("goalCategory", type);
				model.addAttribute("goals", goals);
				model.addAttribute("goalsQuestions",goalsQuestions);
				model.addAttribute("completeGoals", completeGoals);
				model.addAttribute("completeGoalsJson", gson.toJson(completeGoals));
				
				model.addAttribute("goalsJs", gson.toJson(goals));
		//		model.addAttribute("goalsQuestions",gson.toJson(goalsQuestions));
		//		if (goalsCategories.size()==0)
		//			goalsCategories.add("Unit");
				model.addAttribute("goalsCategories",gson.toJson(goalsCategories));
			
			}
			
			}
		}
		
		return "stressPage";
	}
	
	@RequestMapping(value="/medicine", method=RequestMethod.GET)
	public String medicineRender(Model model, Locale locale){
		PwLogger.printMethod();
		model.addAttribute("dimension", MEDICINE);
		
		String dimension=(String) model.asMap().get("dimension");
		
		Content tips=contentBusiness.find(dimension, "Tips",locale);
		if (tips!=null){
			model.addAttribute("tips", tips.getHtml());
			model.addAttribute("tipsId", tips.getId());
		}
		
		Content recomm=contentBusiness.find(dimension, "Recomm",locale);
		if (recomm!=null){
			model.addAttribute("recomm", recomm.getHtml());
			model.addAttribute("recommId", recomm.getId());
		}
		
		Content other=contentBusiness.find(dimension, "Other",locale);
		if (other!=null){
			model.addAttribute("other", other.getHtml());
			model.addAttribute("otherId", other.getId());
		}
		
		
		model=loadVideoLinks(model, locale);
		if(!isStatic(model)){
			if(!isAdmin(model)){
			
			ArrayList<String> goals=new ArrayList<>();
			ArrayList<String> goalsQuestions=new ArrayList<>();
			ArrayList<String> goalsCategories=new ArrayList<>();
			
			ArrayList<Questionnaire> completeGoals=new ArrayList<Questionnaire>();
			
			HashMap<Integer, List<BehaviouralChangeProgrammePersonalGoalSubsection>> goalsByType=(HashMap<Integer, List<BehaviouralChangeProgrammePersonalGoalSubsection>>) model.asMap().get("goalsByType");
			
			int type = GoalCategoryType.medication.ordinal();
			if(goalsByType != null ){
			List<BehaviouralChangeProgrammePersonalGoalSubsection> goalsHDMS = goalsByType.get(type);
			PwLogger.logger.fine("Medication GOAL");
				if (goalsHDMS != null) {
					for (BehaviouralChangeProgrammePersonalGoalSubsection goal : goalsHDMS) {
						PwLogger.logger.fine(goal.toString());
						goals.add(goal.getDescription());
		//				goalsQuestions.add("FROM HDMS - "+" no question related");
						Questionnaire q=questionnaireDAO.find(goal.getId(), locale);
						if (q!=null){
							String goalQuestion = q.getText();
							goalsQuestions.add("from DB - "+goalQuestion);
							goalsCategories.add(" - "+q.getCategory());
							completeGoals.add(q);
						}
					}
				}
				
				
				model.addAttribute("lang",locale.getLanguage());
				
				
				Gson gson=new Gson();
				model.addAttribute("goalCategory", type);
				model.addAttribute("goals", goals);
				model.addAttribute("goalsQuestions",goalsQuestions);
				model.addAttribute("completeGoals", completeGoals);
				model.addAttribute("completeGoalsJson", gson.toJson(completeGoals));
				
				model.addAttribute("goalsJs", gson.toJson(goals));
		//		model.addAttribute("goalsQuestions",gson.toJson(goalsQuestions));
		//		if (goalsCategories.size()==0)
		//			goalsCategories.add("Unit");
				model.addAttribute("goalsCategories",gson.toJson(goalsCategories));
			
			}
			
			}
		}
		
		return "medicinePage";
	}
	
	
	@RequestMapping(value = "/getpdf/{file_name}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(@PathVariable("file_name") String filename, Model model, Locale locale) {
		PwLogger.printMethod();
		String completefilename=filename+"_"+locale.toString()+".pdf";
		File toDownload = new File( servletContext.getRealPath(PDF_PATH)+"/"+completefilename );
		if (!toDownload.exists()){
			completefilename=filename+"_en.pdf"; //ipotizzo che quello in inglese esista sempre
			toDownload = new File( servletContext.getRealPath(PDF_PATH)+"/"+completefilename );
		}
		byte[] pdfBytes={1};
		try {
			pdfBytes = Files.readAllBytes(toDownload.toPath());
		} catch (IOException e) {
			e.printStackTrace();
		}
//		FileSystemResource toRet= new FileSystemResource(toDownload);
//		return toRet;
		
		HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.parseMediaType("application/pdf"));
	    headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
	    ResponseEntity<byte[]> response = new ResponseEntity<byte[]>(pdfBytes, headers, HttpStatus.OK);
	    return response;
	}
	
	
	@RequestMapping(value = "/saveGoals", method = RequestMethod.POST)
	public @ResponseBody String saveIntoPathway(@RequestBody CustomGoalAssessment[] answers,Model model, Locale locale) {
		PwLogger.printMethod();
		//recupera tutto il BCProgress dall'HDMS
		//aggiungi le risposte date
		//salva tutto di nuovo
		
		try {
			String patientNumber=(String) model.asMap().get("sin");
			String xSessionId=(String) model.asMap().get("xSessionId");
			
			BehavioralChangeProgressSection bcProgress=BCProgress.getProgress(patientNumber, xSessionId);
			List<BehavioralChangeProgressGoalAssessmentSubSection> oldAnswers = bcProgress.getGoalAssessments();
			
			if (oldAnswers == null){
				oldAnswers = new ArrayList<BehavioralChangeProgressGoalAssessmentSubSection>();
				bcProgress.setGoalAssessments(oldAnswers);
			}
			
			for (CustomGoalAssessment current : answers) {
				System.out.println(current.toString());
				PwLogger.logger.fine("Answer To Store: "+current.toString());
				BehavioralChangeProgressGoalAssessmentSubSection temp= new BehavioralChangeProgressGoalAssessmentSubSection();
				temp.setCategory(current.getCategory());
				temp.setSubmissionDate(current.getDate());
				temp.setId(current.getGoalId());
				List<BehavioralChangeProgressGoalAssessmentQuantitativeAnswerSubSubsection> quantitativeAnwers = new ArrayList<>();
				BehavioralChangeProgressGoalAssessmentQuantitativeAnswerSubSubsection ans=new BehavioralChangeProgressGoalAssessmentQuantitativeAnswerSubSubsection();
				ans.setQuestionId(current.getQuestionId());
				ans.setValue(Integer.parseInt(current.getValue()));
				quantitativeAnwers.add(ans);
				temp.setQuantitativeAnwers(quantitativeAnwers);
				oldAnswers.add(temp);
			}
			
			
			GenericPostputResult res = BCProgress.putProgress(patientNumber, bcProgress, xSessionId);
//			PwLogger.logger.fine(res.toString());
		} catch (ApiException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
//		String toRet="";
//		try {
//			String result = saveIntoHDMS(sessions, model,locale);
//			PwLogger.logger.fine(result);
//			toRet+=" Saved into PATHway";
//			
//			model=addSessions(sessions, model);
//		} catch (ApiException e) {
//			e.printStackTrace();
//			PwLogger.errorLogger.severe(e.getMessage());
//			toRet+=this.msg.getMessage("hdms.error.msg", null, locale);
////			HomeController.showErrorMsg(toRet, model);
//		} catch (IOException e) {
//			e.printStackTrace();
//			PwLogger.errorLogger.severe(e.getMessage());
//			toRet+=this.msg.getMessage("hdms.error.msg", null, locale);
////			HomeController.showErrorMsg(toRet, model);
//		}
		
//		Gson gson=new Gson();
//		String jsonToRet=gson.toJson(toRet);
//		
//		return jsonToRet;
		
		return "Stored";
	}
	
	@RequestMapping(value = "/updateVideoUrl", method = RequestMethod.POST)
	public @ResponseBody String updateVideoUrl(String name, String pk, String value, Model model, Locale locale) {
		PwLogger.printMethod();
		if(isAdmin(model)){
			PwLogger.logger.fine(name+" "+pk+" "+value);
			videoLinkBusiness.update(Integer.parseInt(pk), value);
		}
		return "ok";
	}
	
	@RequestMapping(value = "/removeVideoUrl", method = RequestMethod.POST)
	public @ResponseBody String removeVideoUrl(@RequestParam("pk") String pk, Model model, Locale locale) {
		PwLogger.printMethod();
		if(isAdmin(model)){
			PwLogger.logger.fine(pk);
			VideoLink vl=videoLinkBusiness.remove(Integer.parseInt(pk));
			PwLogger.logger.fine("DELETED: "+vl.toString());
		}
		return "ok";
	}
	
	@RequestMapping(value = "/addVideoUrl", method = RequestMethod.POST)
	public @ResponseBody String addVideoUrl(@RequestParam("type") String type, @RequestParam("url") String url, Model model, Locale locale) {
		PwLogger.printMethod();
		String dimension = (String) model.asMap().get("dimension");
		if(isAdmin(model)){
			VideoLink vl=videoLinkBusiness.addVideoLink(locale.getLanguage(), dimension, type, url);
			PwLogger.logger.fine("ADDED: "+vl.toString());
		}
		return "ok";
	}
	
//	@RequestMapping(value="/uploadDoc", method={RequestMethod.POST, RequestMethod.GET})
	public List<Document> upload(/*@RequestParam(value = "dimension", required = false)*/ String dimension, Model model, Locale locale){
		PwLogger.printMethod();
		List<Document> docs;
		if (dimension==null)
			dimension=(String) model.asMap().get("dimension");
		if(dimension!=null){
			docs= documentBusiness.getDocuments(dimension, locale.toString());
			if (docs != null){
//				for (Document document : docs) {
//					System.out.println(document.toString());
//				}
				model.addAttribute("docs", docs);
			}
		}else{
			docs= documentBusiness.getAllDocuments(locale.toString());
		}
		
		model.addAttribute("docs", docs);
		
		return docs;
	}
	
	@RequestMapping(value="/saveDoc", method=RequestMethod.POST)
    public String handleFileUpload(@RequestParam("file") MultipartFile file, @RequestParam("label") String label, Model model, Locale locale) {
		PwLogger.printMethod();
		if(isAdmin(model)){
			PwLogger.logger.fine(file.getOriginalFilename()+" arrived in the controller");
			Document doc=new Document();
			String dimension=(String) model.asMap().get("dimension");
			if(dimension==null)
				dimension="PA";
			doc.setDimension(dimension);
			doc.setLocale(locale.toString());
			doc.setContentType(file.getContentType());
			try {
				doc.setFileDocument(file.getBytes());
			} catch (IOException e) {
				System.out.println("[ERROR] with file " + file.getOriginalFilename());
				e.printStackTrace();
			}
			doc.setFilename(file.getOriginalFilename());
			doc.setLabel(label);
			
			PwLogger.logger.fine(doc.toString());
			
			documentBusiness.create(doc);
			
			if(dimension.equalsIgnoreCase(PA)){
				return physicalActivity(model, locale);
			} else if(dimension.equalsIgnoreCase(DIET)){
				return dietRender(model, locale);
			} else if(dimension.equalsIgnoreCase(SMOKING)){
				return smokingRender(model, locale);
			} else if(dimension.equalsIgnoreCase(STRESS)){
				return stressRender(model, locale);
			} else if(dimension.equalsIgnoreCase(ALCOHOL)){
				return alcoholRender(model, locale);
			} else if(dimension.equalsIgnoreCase(MEDICINE)){
				return medicineRender(model, locale);
			} 
		}
        return "Doc saved";
    }
	
	@RequestMapping(value="/downloadDoc/{documentId}", method=RequestMethod.GET)
	public String download(@PathVariable("documentId") Integer documentId, HttpServletResponse response, Model model, Locale locale){
		PwLogger.printMethod();
		Document doc= documentBusiness.getDocument(documentId);
		if (doc != null){
			try {
				response.setHeader("Content-Disposition", "inline;filename=\"" +doc.getFilename()+ "\"");
				OutputStream out = response.getOutputStream();
				response.setContentType(doc.getContentType());
				InputStream in=new ByteArrayInputStream(doc.getFileDocument());
				IOUtils.copy(in, out);
				out.flush();
				out.close();
			
			} catch (IOException e) {
				e.printStackTrace();
			} 
			
		}
		
		return null;
	}
	
	
	@RequestMapping(value = "/removeDocAjax", method = RequestMethod.POST)
	public @ResponseBody String removeAjax(@RequestParam("id") Integer documentId, Model model){
		PwLogger.printMethod();
		String toRet=documentId + " Removed";
		if(isAdmin(model)){
			documentBusiness.remove(documentId);
			PwLogger.logger.fine(toRet);
		}
		return toRet;
	}

	
	private Model loadVideoLinks(Model model, Locale locale){
		String dimension=(String) model.asMap().get("dimension");
		List<VideoLink> peers=videoLinkBusiness.getVideoLinks(locale.getLanguage(), dimension, PEERS); 
		if(peers!=null){
			model.addAttribute(PEERS, peers);
		}
		List<VideoLink> expert=videoLinkBusiness.getVideoLinks(locale.getLanguage(), dimension, EXPERT);
		if(expert!=null){
			model.addAttribute(EXPERT, expert);
		}
		return model;
	}
	
	
}
