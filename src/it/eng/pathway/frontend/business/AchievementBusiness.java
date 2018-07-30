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
package it.eng.pathway.frontend.business;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.eng.pathway.frontend.dao.AchievementDAO;
import it.eng.pathway.frontend.model.Achievement;
import it.eng.pathway.frontend.model.Category;

@Service
public class AchievementBusiness {

	@Autowired
	private AchievementDAO achievementDao;
	
	@Transactional
	public List<Achievement> createSetOfAchievement() {
		
		ArrayList<Achievement> achieves=new ArrayList<>();
		
		Achievement a=new Achievement(false,false,true,false,false,false,"Camminatore",null,null,"01",Category.STEPS);
		achieves.add(a);
		a=new Achievement(false,false,true,false,false,false,"Camminatore di livello superiore",null,null,"02",Category.STEPS);
		achieves.add(a);
		for (Achievement achievement : achieves) {
			achievementDao.create(achievement);
		}
		return achieves;
	}

	public List<Achievement> getByExample(Achievement achievement) {
		return achievementDao.getByExample(achievement);
	}
	
	
}
