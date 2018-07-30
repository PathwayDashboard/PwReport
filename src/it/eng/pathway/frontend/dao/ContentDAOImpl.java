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

import it.eng.pathway.frontend.model.Content;

/**
 * @author fabiomelillo
 *
 */
@Service
public class ContentDAOImpl extends GenericDAO<Content> implements ContentDAO {

	@Autowired
	private EntityManager em;
	
	private static final String DEF_LANGUAGE="en";

	@Override
	public Content find(String section, String subsection, Locale locale) {
		Query q = em.createQuery("select c from Content c"
				+ " where c.section=:section "
				+ " and c.subsection=:sub "
				+ " and c.locale=:locale");
		q.setParameter("section", section);
		q.setParameter("sub", subsection);
		q.setParameter("locale", locale.getLanguage());
//		return (Content) q.getSingleResult();
		
		List<Content> contents=q.getResultList();
		if (contents==null || contents.size()<=0){
			q.setParameter("locale", DEF_LANGUAGE);
			return (Content) q.getSingleResult();
		}
		else{
			return contents.get(0);
		}
		
	}

	@Override
	public Content find(long id) {
		Query q = em.createQuery("select c from Content c"
				+ " where "
				+ "c.id=:id ");
		q.setParameter("id", id);
		return (Content) q.getSingleResult();
	}
	
	

}