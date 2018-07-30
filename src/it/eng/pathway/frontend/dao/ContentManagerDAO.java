/**
 * 
 */
package it.eng.pathway.frontend.dao;

import it.eng.pathway.frontend.model.ContentManager;

/**
 * @author fabiomelillo
 *
 */
public interface ContentManagerDAO{


	public ContentManager create(ContentManager entity);
	public ContentManager update(ContentManager patient);
	public ContentManager getContentManager(String username, String pwd);

}
