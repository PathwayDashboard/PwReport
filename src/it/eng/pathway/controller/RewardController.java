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

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import it.eng.pathway.frontend.business.AchievementBusiness;
import it.eng.pathway.frontend.business.FrontEndPatientBusiness;
import it.eng.pathway.frontend.model.Achievement;
import it.eng.pathway.frontend.model.FrontEndPatient;

@Controller
public class RewardController {

	@Autowired
	private AchievementBusiness achievementBusiness;
	
	@Autowired
	private FrontEndPatientBusiness patientBusiness;
	

	@RequestMapping(value = "/createAchievements", method = RequestMethod.GET)
	public @ResponseBody String createAchievements(Model model, Locale locale) {
		Gson gson=new Gson();
		return gson.toJson(achievementBusiness.createSetOfAchievement());
	}
	
	@RequestMapping(value = "/testRewards", method = RequestMethod.GET)
	public @ResponseBody String testRewards(Model model, Locale locale) {
		
		Achievement a=new Achievement(false,false,true,false,false,false);
		
		FrontEndPatient p=patientBusiness.getSomePatient();
		patientBusiness.checkReward(p, a, "20160211");
		
		final GsonBuilder builder = new GsonBuilder();
	    builder.excludeFieldsWithoutExposeAnnotation();
	    final Gson gson = builder.create();
		return gson.toJson(p);
	}
	

}