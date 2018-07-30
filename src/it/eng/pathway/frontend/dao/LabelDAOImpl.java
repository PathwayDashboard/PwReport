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

import it.eng.pathway.fake.model.RatedPerceivedEffort;
import it.eng.pathway.fake.model.SatisfactionLevelType;
import it.eng.pathway.fake.model.StatusType;
import it.eng.pathway.frontend.model.Label;
import it.eng.pathway.frontend.model.RPE;

/**
 * @author fabiomelillo
 *
 */
@Service
public class LabelDAOImpl extends GenericDAO<Label> implements LabelDAO {

	@Autowired
	private EntityManager em;
	
	@Override
	public String getRightLabel(RatedPerceivedEffort rpe, String language) {
		int pos=rpe.ordinal()+1;
		Query q = em.createQuery("select a from RPE a where a.locale= :locale and a.id= :pos");
		q.setParameter("locale", language);
		q.setParameter("pos", pos);
		List<RPE> res = q.getResultList();
		if (res==null || res.size()==0){
			return null;
		}
		else{
			return res.get(0).getLabel();
		}
	}

	@Override
	public String getRightLabel(SatisfactionLevelType satisfaction, String language) {
		int pos=satisfaction.ordinal()+1;
		Query q = em.createQuery("select a from SatisfactionLevel a where a.locale= :locale and a.id= :pos");
		q.setParameter("locale", language);
		q.setParameter("pos", pos);
		List<RPE> res = q.getResultList();
		if (res==null || res.size()==0){
			return null;
		}
		else{
			return res.get(0).getLabel();
		}
	}

	@Override
	public String getRightLabel(StatusType status, String language) {
		int pos=status.ordinal()+1;
		Query q = em.createQuery("select a from StatusType a where a.locale= :locale and a.id= :pos");
		q.setParameter("locale", language);
		q.setParameter("pos", pos);
		List<RPE> res = q.getResultList();
		if (res==null || res.size()==0){
			return null;
		}
		else{
			return res.get(0).getLabel();
		}
	}
	



}