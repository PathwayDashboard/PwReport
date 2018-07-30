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

import it.eng.pathway.frontend.model.ContentManager;

/**
 * @author fabiomelillo
 *
 */
@Service
public class ContentManagerDAOImpl extends GenericDAO<ContentManager> implements ContentManagerDAO {

	@Autowired
	private EntityManager em;

	@Override
	public ContentManager getContentManager(String username, String pwd) {
		Query q = em.createQuery("select cm from ContentManager cm where cm.username=:username and cm.password=md5(:pwd)");
		q.setParameter("username", username);
		q.setParameter("pwd", pwd);
		List<ContentManager> res = q.getResultList();
		if (res==null || res.size()==0)
			return null;
		else
			return res.get(0);
	}



}
