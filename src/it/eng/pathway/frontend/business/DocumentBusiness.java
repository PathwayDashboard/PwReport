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
package it.eng.pathway.frontend.business;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.eng.pathway.frontend.dao.DocumentDAO;
import it.eng.pathway.frontend.model.Document;
import it.eng.pathway.utility.PwLogger;

@Service
public class DocumentBusiness {

	@Autowired
	private DocumentDAO documentDAO;
	
	private static final String DEF_LANGUAGE="en";

	public List<Document> getDocuments(String dimension, String locale) {
		 List<Document> docs= documentDAO.getDocuments(dimension, locale);
		 if (docs==null || docs.size()<1){
			 docs=documentDAO.getDocuments(dimension, DEF_LANGUAGE);
		 }
		 return docs;
	}

	public List<Document> getAllDocuments(String locale) {
		List<Document> docs=documentDAO.getAllDocuments(locale);
		 if (docs==null || docs.size()<1){
			 docs=documentDAO.getAllDocuments(DEF_LANGUAGE);
		 }
		 return docs;
	}

	public Document create(Document doc) {
		Document d = documentDAO.create(doc);
		PwLogger.logger.fine("CREATED: "+d.toString());
		return d;
	}

	public Document getDocument(Integer documentId) {
		return documentDAO.getDocument(documentId);
	}

	public void remove(Integer documentId) {
		documentDAO.removeDocument(documentId);
	}
	

	
	
}
