/**
 * 
 */
package it.eng.pathway.frontend.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.eng.pathway.frontend.model.FrontEndPatient;

/**
 * @author fabiomelillo
 *
 */
@Service
public class FrontEndPatientDAOImpl extends GenericDAO<FrontEndPatient> implements FrontEndPatientDAO {

	@Autowired
	private EntityManager em;

	public FrontEndPatient getFirst() {
		if (em == null) {
			System.out.println("ENTITY MANAGER NULL");
		}
//		throw new RuntimeException("FAKE EXCEPTION");
		List<FrontEndPatient> patients = findAll();
		if (patients != null && patients.size() > 0)
			return patients.get(0);
		else {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	public List<FrontEndPatient> findAll() {
		Query q = em.createQuery("select p from FrontEndPatient p");
		List<FrontEndPatient> res = q.getResultList();
		return res;
	}

	@SuppressWarnings("unchecked")
	@Override
	public FrontEndPatient getPatient(String sin) {
		Query q = em.createQuery("select p from FrontEndPatient p where p.sin=:sin");
		q.setParameter("sin", sin);
		List<FrontEndPatient> res = q.getResultList();
		if (res==null || res.size()==0)
			return null;
		else
			return res.get(0);
	}
	
//	public FrontEndPatient create(FrontEndPatient entity) {
////		em.merge(entity);
//		em.persist(entity);
//		em.flush();
////		super.create(entity);
//		return entity;
//	}


}
