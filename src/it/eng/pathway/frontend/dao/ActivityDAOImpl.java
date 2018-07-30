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

import it.eng.pathway.frontend.model.Activity;
import it.eng.pathway.frontend.model.FrontEndPatient;

/**
 * @author fabiomelillo
 *
 */
@Service
public class ActivityDAOImpl extends GenericDAO<Activity> implements ActivityDAO {

	@Autowired
	private EntityManager em;
	
	private  final String defLanguage = "en";
	
	@SuppressWarnings("unchecked")
	public List<Activity> findAll(String locale) {
		Query q = em.createQuery("select a from Activity a where a.locale= :locale order by a.name");
		q.setParameter("locale", locale);
		List<Activity> res = q.getResultList();
		return res;
	}

	@Override
	public String findActivityByCode(Integer code, String locale) {
		Query q = em.createQuery("select a from Activity a where a.locale= :locale and a.code= :code");
		q.setParameter("code", String.valueOf(code));
		q.setParameter("locale", locale);
		List<Activity> res = q.getResultList();
		if (res==null || res.size()==0){
			return findDefaultPositionFromCode(code);
		}
		else{
			return res.get(0).getName();
		}
	}

	@Override
	public String findDefaultPositionFromCode(Integer aType) {
		Query q = em.createQuery("select a from Activity a where a.locale= :locale and a.code= :code");
		q.setParameter("code", String.valueOf(aType));
		q.setParameter("locale", defLanguage);
		List<Activity> res = q.getResultList();
		if (res==null || res.size()==0){
			return null;
		}
		else{
			return res.get(0).getId();
		}
	}

	@Override
	public String findActivityFromId(Integer pos, String locale) {
		Query q = em.createQuery("select a from Activity a where a.locale= :locale and a.code = ( select act.code from Activity act where act.id= :id)");
		q.setParameter("id", String.valueOf(pos));
		q.setParameter("locale", locale);
		List<Activity> res = q.getResultList();
		if (res==null || res.size()==0){
			return findDefaultActivityFromId(pos);
		}
		else{
			return res.get(0).getName();
		}
	}

	@Override
	public String findDefaultActivityFromId(Integer pos) {
		Query q = em.createQuery("select a from Activity a where a.locale= :locale and a.id= :id");
		q.setParameter("id", String.valueOf(pos));
		q.setParameter("locale", defLanguage);
		List<Activity> res = q.getResultList();
		if (res==null || res.size()==0){
			return null;
		}
		else{
			return res.get(0).getName();
		}
	}

}