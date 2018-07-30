/**
 * 
 */
package it.eng.pathway.frontend.dao;

import java.util.List;
import java.util.Locale;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.eng.pathway.frontend.model.Questionnaire;

/**
 * @author fabiomelillo
 *
 */
@Service
public class QuestionnaireDAOImpl extends GenericDAO<Questionnaire> implements QuestionnaireDAO {

	@Autowired
	private EntityManager em;
	
	private static final String DEF_LANGUAGE="en";

	@Override
	public Questionnaire find(String idQuestion, Locale locale) {
		Query q = em.createQuery("select q from Questionnaire q"
				+ " where q.idQuestion=:idQuestion "
				+ " and q.locale=:locale");
		q.setParameter("idQuestion", idQuestion);
		q.setParameter("locale", locale.getLanguage());
//		return (Content) q.getSingleResult();
		
		List<Questionnaire> contents=q.getResultList();
		if (contents==null || contents.size()<=0){
			q.setParameter("locale", DEF_LANGUAGE);
			contents=q.getResultList();
			if (contents==null || contents.size()<=0)
				return null;
			else
				return contents.get(0);
		}
		else{
			return contents.get(0);
		}
	}

	@Override
	public Questionnaire find(long id) {
		Query q = em.createQuery("select q from Questionnaire q"
				+ " where "
				+ "q.id=:id ");
		q.setParameter("id", id);
		return (Questionnaire) q.getSingleResult();
	}

	@Override
	public Questionnaire find(Integer idGoal, Locale locale) {
		Query q = em.createQuery("select q from Questionnaire q"
				+ " where q.goalId=:idGoal "
				+ " and q.locale=:locale");
		q.setParameter("idGoal", idGoal);
		q.setParameter("locale", locale.getLanguage());
//		return (Content) q.getSingleResult();
		
		List<Questionnaire> contents=q.getResultList();
		if (contents==null || contents.size()<=0){
			q.setParameter("locale", DEF_LANGUAGE);
			contents=q.getResultList();
			if (contents==null || contents.size()<=0)
				return null;
			else
				return contents.get(0);
		}
		else{
			return contents.get(0);
		}
	}

	
	

}