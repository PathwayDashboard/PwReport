/**
 * 
 */
package it.eng.pathway.frontend.dao;

import java.util.List;

import it.eng.pathway.frontend.model.Document;

/**
 * @author fabiomelillo
 *
 */
public interface DocumentDAO{


	public Document create(Document entity);
	public List<Document> getDocuments(String dimension, String locale);
	public Document getDocument(Integer documentId);
	public List<Document> getAllDocuments(String string);
	public void removeDocument(Integer documentId);

}
