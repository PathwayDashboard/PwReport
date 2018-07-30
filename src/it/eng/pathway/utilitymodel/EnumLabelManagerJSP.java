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
package it.eng.pathway.utilitymodel;

import java.util.Locale;

import javax.inject.Inject;

import org.springframework.context.i18n.LocaleContextHolder;

import it.eng.pathway.fake.model.ActivityType;
import it.eng.pathway.fake.model.RatedPerceivedEffort;
import it.eng.pathway.frontend.dao.LabelDAO;
import it.eng.pathway.utility.PwLogger;

public class EnumLabelManagerJSP {
	
	@Inject
	LabelDAO labelDao;
	
	
	private static final String DEFLOCALE = "en";
	
	public String getRPELabel(RatedPerceivedEffort rpe){
		Locale locale = LocaleContextHolder.getLocale();
		PwLogger.logger.fine("locale: "+locale);
		
		
		String label=labelDao.getRightLabel(rpe, locale.getLanguage());
		
		if (label == null){
			label=labelDao.getRightLabel(rpe, DEFLOCALE);
		}
		
		return label;
	}
	
	
	public String getActivityLabel(ActivityType type){
		Locale locale = LocaleContextHolder.getLocale();
		PwLogger.logger.fine("locale: "+locale);
		
//		String label=labelDao.getRightLabel(type, locale.getLanguage());
		
//		if (label == null){
//			label=labelDao.getRightLabel(type, DEFLOCALE);
//		}
		
		return "CIao";
	}

}
