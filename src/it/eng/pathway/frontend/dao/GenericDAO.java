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
import javax.persistence.criteria.CriteriaQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author fabiomelillo
 *
 */
@Service
public abstract class GenericDAO<T> {

	private Class<T> entity;

	@Autowired
	private EntityManager entityManager;
//
	public EntityManager getEntityManager() {
		return entityManager;
	}
//
//	public void setEntityManager(EntityManager entityManager) {
//		this.entityManager = entityManager;
//	}
	
//	private EntityManagerFactory emf;
//
//    @PersistenceUnit
//    public void setEntityManagerFactory(EntityManagerFactory emf) {
//        this.emf = emf;
//    }
	@Transactional
	public T create(T entity) {
		getEntityManager().merge(entity);
		getEntityManager().flush();
		return entity;
	}

	@Transactional
	public void flush() {
		getEntityManager().flush();
	}

	@Transactional
	public T update(T entity) {
		T toRet = getEntityManager().merge(entity);
		getEntityManager().flush();
		return toRet;
	}

	@Transactional
	public T find(Object id) {
		try {
			return getEntityManager().find(entity, id);
		} catch (Exception e) {
			System.err.println(e);
			return null;
		}
	}
	
	@Transactional
	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		CriteriaQuery<T> createQuery = (CriteriaQuery<T>) getEntityManager().getCriteriaBuilder()
				.createQuery();
		CriteriaQuery<T> cq = createQuery;
		cq.select(cq.from(entity));
		return getEntityManager().createQuery(cq).getResultList();
	}

	@Transactional
	public void detach(T entity) {
		getEntityManager().detach(entity);
		isDetached(entity);
	}
	
	@Transactional
	public boolean isDetached(T entity) {
		boolean isManaged = getEntityManager().contains(entity);
		if (!isManaged)
			System.out.println(entity.toString() + " DETACHED");
		return !isManaged;
	}
	
	@Transactional
	public T refresh(T entity) {
		getEntityManager().refresh(entity);
		return entity;
	}
	
	@Transactional
	public T remove(T entity) {
		getEntityManager().remove(entity);
		return entity;
	}

}
