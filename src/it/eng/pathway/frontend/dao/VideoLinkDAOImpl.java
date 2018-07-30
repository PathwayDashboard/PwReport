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
import org.springframework.transaction.annotation.Transactional;

import it.eng.pathway.frontend.model.VideoLink;

/**
 * @author fabiomelillo
 *
 */
@Service
public class VideoLinkDAOImpl extends GenericDAO<VideoLink> implements VideoLinkDAO {

	@Autowired
	private EntityManager em;
	
	private static final String DEFLANG="en";

	@Override
	public VideoLink getFirst() {
		Query q = em.createQuery("select vl from VideoLink vl");
		List<VideoLink> res = q.getResultList();
		if (res==null || res.size()==0)
			return null;
		else
			return res.get(0);
	}


	@Override
	public List<VideoLink> find(String locale, String dimension, String type) {
		Query q = em.createQuery("select vl from VideoLink vl where vl.locale=:locale and vl.dimension=:dimension and vl.type=:type");
		q.setParameter("locale", locale);
		q.setParameter("dimension", dimension);
		q.setParameter("type", type);
		List<VideoLink> res = q.getResultList();
		if (res==null || res.size()==0)
			return null;
		else
			return res;
	}


	@Override
	public VideoLink find(Integer id) {
		Query q = em.createQuery("select vl from VideoLink vl where vl.id=:id");
		q.setParameter("id", id);
		List<VideoLink> res = q.getResultList();
		if (res==null || res.size()==0)
			return null;
		else
			return res.get(0);
	}

	public List<VideoLink> getDefaultLanguageVideoLink(String locale, String dimension, String type) {
		Query q = em.createQuery("select vl from VideoLink vl where vl.locale=:locale and vl.dimension=:dimension and vl.type=:type");
		q.setParameter("locale", DEFLANG);
		q.setParameter("dimension", dimension);
		q.setParameter("type", type);
		List<VideoLink> res = q.getResultList();
		if (res==null || res.size()==0)
			return null;
		else
			return res;
	}


	@Override
	@Transactional
	public VideoLink remove(Integer id) {
		VideoLink vl=find(id);
		em.remove(vl);
		return vl;
		
	}

}
