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
