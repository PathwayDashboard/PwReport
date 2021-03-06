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

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import it.eng.pathway.frontend.business.ContentBusiness;
import it.eng.pathway.frontend.business.ContentManagerBusiness;
import it.eng.pathway.frontend.model.Content;
import it.eng.pathway.frontend.model.ContentManager;
import it.eng.pathway.utility.PwLogger;
import it.eng.pathway.utilitymodel.LoginForm;

@Controller
@SessionAttributes({"contentId", "xSessionId", "role", "sin"})
public class EditingController {
	
	public final static String ADMIN="admin";

	@Autowired
	private ContentBusiness contentBusiness;
	
	@Autowired
	private ContentManagerBusiness contentManagerBusiness;
	
	@RequestMapping(value = "/contentManager", method = RequestMethod.GET)
	public String contentManager(SessionStatus status, HttpSession session, Model model, Locale locale){
		PwLogger.printMethod();
		if (status!=null)
			status.setComplete();
		session.invalidate();
		model.asMap().clear();
		return "managerLogin";
	}
	
	@RequestMapping(value = "/contentManagerLogin", method = RequestMethod.POST)
	public String contentManagerLogin(@ModelAttribute LoginForm form, Model model, Locale locale){
		PwLogger.printMethod();
		PwLogger.logger.fine("ContentManager LoginForm: "+form);
		PwLogger.logger.fine("Language: "+locale.getLanguage());
		String username=null;
		String password=null;
		if (form!=null && form.getUsername()!=null){
			username=form.getUsername();
			password=form.getPassword();
			try {
				MessageDigest md = MessageDigest.getInstance("MD5");
				byte[] encr = md.digest(password.getBytes());
				String result = "";
				for (int i = 0; i < encr.length; i++) {
				      result += Integer.toHexString((0x000000ff & encr[i]) | 0xffffff00).substring(6);
				    }
				    PwLogger.logger.fine("Encrypted: "+result);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			
		}
		
		ContentManager manager=contentManagerBusiness.getManager(username, password);
		if (manager==null){
			String msg="Access Denied! Please check your Username/Password";
			model.addAttribute("msg", msg);
			return "managerLogin";
		}
		model.addAttribute("role",ADMIN);
		
		return "healthyPage";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String editing(String id,Model model, Locale locale) {
		Content content=contentBusiness.find(Long.parseLong(id));
		if (content!=null){
			model.addAttribute("contentLocale", content.getLocale());
			model.addAttribute("contentToModify", content.getHtml());
			model.addAttribute("contentId", content.getId());
			HttpServletRequest req=((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
			System.out.println(req.getRequestURI());
			System.out.println(req.getRequestURL());
			PwLogger.logger.fine("Contenuto da modificare "+content.getId()+" "+content.getHtml());
		}
		return "editingPage";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saving(String modified, Model model, Locale locale) {
		long id=(long) model.asMap().get("contentId");
		
		contentBusiness.update(id,modified);
		
//		return this.editing(String.valueOf(id),model,locale);
		return "healthyPage";
	}

}