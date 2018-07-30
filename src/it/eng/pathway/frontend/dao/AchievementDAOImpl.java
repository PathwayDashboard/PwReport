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
/**
 * 
 */
package it.eng.pathway.frontend.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.eng.pathway.frontend.model.Achievement;
import it.eng.pathway.frontend.model.FrontEndPatient;

/**
 * @author fabiomelillo
 *
 */
@Service
public class AchievementDAOImpl extends GenericDAO<Achievement> implements AchievementDAO {

	@Autowired
	private EntityManager em;

	@Override
	public List<Achievement> getByExample(Achievement achievement) {
		Query q = em.createQuery("select a from Achievement a"
				+ " where a.kcalAvg=:kcalAvg "
				+ " and a.hrAvg=:hrAvg "
				+ " and a.steps=:steps "
				+ " and a.sessions=:sessions "
				+ " and a.durationAvg=:durationAvg"
				+ " and a.durationTotal=:durationTotal ");
		
		q.setParameter("kcalAvg", achievement.isKcalAvg());
		q.setParameter("hrAvg", achievement.isHrAvg());
		q.setParameter("steps", achievement.isSteps());
		q.setParameter("sessions", achievement.isSessions());
		q.setParameter("durationAvg", achievement.isDurationAvg());
		q.setParameter("durationTotal", achievement.isDurationTotal());
		
		List<Achievement> res = q.getResultList();
		return res;
	}
	
	

}