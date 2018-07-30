package it.eng.pathway.frontend.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.eng.pathway.frontend.model.Document;
import it.eng.pathway.utility.PwLogger;

/**
 * @author fabiomelillo
 *
 */
@Service
public class DocumentDAOImpl extends GenericDAO<Document> implements DocumentDAO {

	@Autowired
	private EntityManager em;

	@Override
	public List<Document> getDocuments(String dimension, String locale) {
		Query q = em.createQuery("select d from Document d where d.dimension=:dimension and d.locale=:locale");
		q.setParameter("dimension", dimension);
		q.setParameter("locale", locale);
		List<Document> res = q.getResultList();
		return res;
	}

	@Override
	public Document getDocument(Integer documentId) {
		Query q = em.createQuery("select d from Document d where d.id=:documentId");
		q.setParameter("documentId", documentId);
		List<Document> res = q.getResultList();
		if (res!=null && res.size()>0)
			return res.get(0);
		else
			return null;
	}

	@Override
	public List<Document> getAllDocuments(String locale) {
		Query q = em.createQuery("select d from Document d where d.locale=:locale");
		q.setParameter("locale", locale);
		List<Document> res = q.getResultList();
		return res;
	}

	@Override
	@Transactional
	public void removeDocument(Integer documentId) {
		Query q = em.createQuery("select d from Document d where d.id=:documentId");
		q.setParameter("documentId", documentId);
		List<Document> res = q.getResultList();
		if (res!=null && res.size()>0){
			Document d=res.get(0);
			PwLogger.logger.fine("Going to REMOVE: "+d.toString());
			getEntityManager().remove(d);
		}
	}



}
