package it.eng.pathway.frontend.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.eng.pathway.frontend.dao.ContentManagerDAO;
import it.eng.pathway.frontend.model.ContentManager;

@Service
public class ContentManagerBusiness {

	@Autowired
	private ContentManagerDAO cmDao;
	
	public ContentManager getManager(String username, String pwd){
		return cmDao.getContentManager(username, pwd);
	}
	
}
