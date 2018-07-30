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