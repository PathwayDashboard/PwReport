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

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import ers.test.Utility;
import io.swagger.client.ApiException;
import io.swagger.client.model.CardiacRehabilitationProgrammeExerciseProgrammeSubSection;
import io.swagger.client.model.CardiacRehabilitationProgressActiveLifestylePASessionSubsection;
import io.swagger.client.model.CardiacRehabilitationProgressExerClassSessionSubsection;
import io.swagger.client.model.CardiacRehabilitationProgressExerGameSessionSubsection;
import io.swagger.client.model.GenericPostputResult;
import it.eng.pathway.frontend.business.ContentBusiness;
import it.eng.pathway.frontend.business.DocumentBusiness;
import it.eng.pathway.frontend.dao.FrontEndPatientDAO;
import it.eng.pathway.frontend.model.Content;
import it.eng.pathway.frontend.model.Document;
import it.eng.pathway.frontend.model.FrontEndPatient;
import it.eng.pathway.hdms.connection.Access;
import it.eng.pathway.hdms.connection.CRProgramme;
import it.eng.pathway.hdms.connection.CRProgress;
import it.eng.pathway.utility.CRProgressCreator;
import it.eng.pathway.utility.DateMgt;
import it.eng.pathway.utility.PwLogger;

@Controller
@SessionAttributes({"contentId","dimension"})
public class TestController {


	
//	@Autowired
//	private FrontEndPatientBusiness patientBusiness;
	
	@Autowired
	private FrontEndPatientDAO patientDAO;
	
	@Autowired
	private ContentBusiness contentBusiness;
	
	@Autowired
	private DocumentBusiness documentBusiness;
	
	private MessageSource msg;
	@Autowired
    public void AccountsController(MessageSource msgSrc) {
     this.msg = msgSrc;
    }
	

	@RequestMapping(value = "/createTransaction", method = RequestMethod.GET)
	public String createTransaction(Model model, Locale locale) {
		
//		FrontEndPatient patient=patientBusiness.getFirst();
//		if (patient!=null){
//			model.addAttribute("patient", patient.toString());
//			model.addAttribute("mstoken", patient.getMsToken());
//			model.addAttribute("msrefresh", patient.getMsRefreshToken());
//		}
//		
//		else{
		FrontEndPatient patient=new FrontEndPatient("Fabio", "qwerty", null, null);
//			patientBusiness.create(patient);
			patientDAO.create(patient);
//		}
		
		model.addAttribute("patient", patient);
		model.addAttribute("mstoken", patient.getMsToken());
		model.addAttribute("msrefresh", patient.getMsRefreshToken());
		
		return "tokenPage";
	}
	
	
	@RequestMapping(value = "/readTransaction", method = RequestMethod.GET)
	public String readTransaction(Model model, Locale locale) {
		
		FrontEndPatient patient=patientDAO.getFirst();
		if (patient!=null){
			model.addAttribute("patient", patient.toString());
			model.addAttribute("mstoken", patient.getMsToken());
			model.addAttribute("msrefresh", patient.getMsRefreshToken());
		}
		
		model.addAttribute("patient", patient);
		
		return "tokenPage";
	}
	
	@RequestMapping(value = "/editing", method = RequestMethod.GET)
	public String editing(Model model, Locale locale) {
		Content content=contentBusiness.find("Alcohol", "Tips",locale);
		if (content!=null){
			model.addAttribute("contentToModify", content.getHtml());
			model.addAttribute("contentId", content.getId());
		}
		return "editingPage";
	}
	
	@RequestMapping(value = "/saving", method = RequestMethod.POST)
	public String saving(String modified, Model model, Locale locale) {
		long id=(long) model.asMap().get("contentId");
		
		contentBusiness.update(id,modified);
		
		return editing(model,locale);
	}
	
	
	@RequestMapping(value = "/script", method = RequestMethod.GET)
	public String script(Model model, Locale locale) {
		return "scriptForm";
	}
	
	@RequestMapping(value ="/createSesions", method = RequestMethod.POST)
	public String createSessioni(String username, String password, String from, String to, Model model, Locale locale) {
		PwLogger.logger.fine(username);
		PwLogger.logger.fine(password);
		PwLogger.logger.fine(from);
		PwLogger.logger.fine(to);
		
		model.addAttribute("msgToShow", "Richiesta ricevuta");
		
		PwLogger.logger.fine("Trying to contact HDMS");
		Access access=new Access(); //imposta anche il proxy per le prove in locale
		try{
		GenericPostputResult result=access.login(username, password);
		String uid=result.getUid();
		model.addAttribute("xSessionId", uid);
		model.addAttribute("username", username);
		
		
//		CardiacRehabilitationProgramme crp=CRProgramme.getProgramme(username, uid);
		
		List<CardiacRehabilitationProgrammeExerciseProgrammeSubSection> crps=CRProgramme.getExerciseProgrammes(username, uid);
		CardiacRehabilitationProgrammeExerciseProgrammeSubSection exp=null;
		if (crps!=null && crps.size()>0){
			exp = crps.get(crps.size()-1); //leggo solo l'ultimo
//			crp=new CardiacRehabilitationProgramme();
//			ExerciseProgramme exp=new ExerciseProgramme(crps.get(crps.size()-1));
//			crp.setCreationDate(exp.getDate());
//			List<ExerciseProgramme> eps=new ArrayList<ExerciseProgramme>();
//			eps.add(exp)
//			crp.setExerciseProgrammes(eps);
		}
		
		HashMap<String, Object> map=CRProgressCreator.createProgress(exp, DateMgt.getDate(from), DateMgt.getDate(to));
		
		if (map!=null){
			String chiaveClass="exerClass";
			String chiaveGame="exerGame";
			String chiavePa="paSessions";
			
//			ExerClassSessionProgress exClass=(ExerClassSessionProgress) map.get(chiaveClass);
//			ExerGameSessionProgress exGame = (ExerGameSessionProgress) map.get(chiaveGame);
//			ActiveLifeStyleProgress paProgress=(ActiveLifeStyleProgress) map.get(chiavePa);
//			PwLogger.logger.fine(exClass.toString());
//			PwLogger.logger.fine(exGame.toString());
//			PwLogger.logger.fine(paProgress.toString());
			
			List<CardiacRehabilitationProgressExerClassSessionSubsection> classes = (List<CardiacRehabilitationProgressExerClassSessionSubsection>) map.get(chiaveClass);
			List<CardiacRehabilitationProgressExerGameSessionSubsection> games = (List<CardiacRehabilitationProgressExerGameSessionSubsection>) map.get(chiaveGame);
			List<CardiacRehabilitationProgressActiveLifestylePASessionSubsection> pas = (List<CardiacRehabilitationProgressActiveLifestylePASessionSubsection>) map.get(chiavePa);
			
			//TODO delete this line of code, serviva per evitare che scrivesse le exerclass
//			classes=null;
			
			model.addAttribute("msgToShow",map);
			String toPrint="";
			
			PwLogger.logger.fine("USER: "+username);
			
//			if (exClass!=null){
//				List<ExerClassSessionss> classes=exClass.getExerClassSessionsss();
				if (classes!=null){
					for (CardiacRehabilitationProgressExerClassSessionSubsection current : classes) {
						toPrint=DateMgt.getReadableDate(current.getDate());
						PwLogger.logger.fine(toPrint+ " In progress");
						toPrint+=" "+CRProgress.saveExerClass(username, uid, current);
						PwLogger.logger.fine(toPrint);
					}
				}
//			}
			
			if (games!=null){
//				List<ExerClassSessionSS> classes=exClass.getExerClassSessionSSs();
//				if (classes!=null){
					for (CardiacRehabilitationProgressExerGameSessionSubsection current : games) {
						toPrint=DateMgt.getReadableDate(current.getDate());
						PwLogger.logger.fine(toPrint+ " In progress");
						toPrint+=" "+CRProgress.saveExerGame(username, uid, current);
						PwLogger.logger.fine(toPrint);
					}
//				}
			}
			
			if(pas!=null){
				for (CardiacRehabilitationProgressActiveLifestylePASessionSubsection current : pas) {
					toPrint=DateMgt.getReadableDate(current.getDate());
					PwLogger.logger.fine(toPrint+ " In progress");
					toPrint+=" "+CRProgress.savePA(username, uid, current);
					PwLogger.logger.fine(toPrint);
				}
			}
			
			
		}
		
		}
		catch (ApiException e){
			String tester=this.msg.getMessage("error.msg.tester", null, locale);
			String msg=Utility.getMessage(e)+ " " + tester;
			PwLogger.logger.fine("FROM HDMS: "+msg);
			PwLogger.errorLogger.severe("FROM HDMS: "+msg + " ERROR CODE: "+e.getCode());
//			model.addAttribute("msg", msg);
//			return "redirect:/";
			e.printStackTrace();
			return HomeController.showErrorMsg(msg,"FROM HDMS: "+msg, model);	
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		return "scriptForm";
	}
	
	
	@RequestMapping(value="/hrZones", method={RequestMethod.POST, RequestMethod.GET})
	public String newDash(Model model, Locale locale){
		return "zones";
	}
//	
//	@RequestMapping(value="/uploadDoc", method={RequestMethod.POST, RequestMethod.GET})
//	public String upload(@RequestParam(value = "dimension", required = false) String dimension, Model model, Locale locale){
//		List<Document> docs;
//		if(dimension!=null){
//			docs= documentBusiness.getDocuments(dimension, locale.toString());
//			if (docs != null){
//				for (Document document : docs) {
//					System.out.println(document.toString());
//				}
//				model.addAttribute("docs", docs);
//			}
//		}else{
//			docs= documentBusiness.getAllDocuments(locale.toString());
//		}
//		
//		model.addAttribute("docs", docs);
//		
//		return "uploadPage";
//	}
//	
//	@RequestMapping(value="/saveDoc", method=RequestMethod.POST)
//    public String handleFileUpload(@RequestParam("file") MultipartFile file, @RequestParam("label") String label, Model model, Locale locale) {
//		
//		System.out.println(file.getOriginalFilename()+" Uploaded");
//		Document doc=new Document();
//		String dimension=(String) model.asMap().get("dimension");
//		if(dimension==null)
//			dimension="PA";
//		doc.setDimension(dimension);
//		doc.setLocale(locale.toString());
//		doc.setContentType(file.getContentType());
//		try {
//			doc.setFileDocument(file.getBytes());
//		} catch (IOException e) {
//			System.out.println("[ERROR] with file " + file.getOriginalFilename());
//			e.printStackTrace();
//		}
//		doc.setFilename(file.getOriginalFilename());
//		doc.setLabel(label);
//		
//		System.out.println(doc.toString());
//		
//		documentBusiness.create(doc);
//		
//        return upload(dimension, model, locale);
//    }
//	
//	@RequestMapping(value="/downloadDoc/{documentId}", method=RequestMethod.GET)
//	public String download(@PathVariable("documentId") Integer documentId, HttpServletResponse response, Model model, Locale locale){
//		
//		Document doc= documentBusiness.getDocument(documentId);
//		if (doc != null){
//			try {
//				response.setHeader("Content-Disposition", "inline;filename=\"" +doc.getFilename()+ "\"");
//				OutputStream out = response.getOutputStream();
//				response.setContentType(doc.getContentType());
//				InputStream in=new ByteArrayInputStream(doc.getFileDocument());
//				IOUtils.copy(in, out);
//				out.flush();
//				out.close();
//			
//			} catch (IOException e) {
//				e.printStackTrace();
//			} 
//			
//		}
//		
//		return null;
//	}
//	
////	@RequestMapping(value="/removeDoc", method=RequestMethod.GET)
////	public String remove(@RequestParam("documentId") Integer documentId, HttpServletResponse response, Model model, Locale locale){
////		//TODO CONTROLLO DEL RUOLO
//////		Document doc= documentBusiness.getDocument(documentId);
//////		if (doc != null){
////			documentBusiness.remove(documentId);
//////		}
////		
////		return upload(null, model, locale);
////	}
//	
//	@RequestMapping(value = "/removeDocAjax", method = RequestMethod.POST)
//	public @ResponseBody String removeAjax(@RequestParam("id") Integer documentId, Model model){
//		PwLogger.printMethod();
//		//TODO CONTROLLO DEL RUOLO
//		documentBusiness.remove(documentId);
//		String toRet=documentId + " Removed";
//		PwLogger.logger.fine(toRet);
//		return toRet;
//	}

}