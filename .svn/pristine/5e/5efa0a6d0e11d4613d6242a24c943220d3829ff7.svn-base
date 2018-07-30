package it.eng.pathway.frontend.business;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.eng.pathway.frontend.dao.ContentDAO;
import it.eng.pathway.frontend.model.Content;

@Service
public class ContentBusiness {

	@Autowired
	private ContentDAO contentDAO;
	

	public Content find(String section, String subsection, Locale locale) {
		return contentDAO.find(section,subsection,locale);
	}
	
	public Content find(long id) {
		return contentDAO.find(id);
	}


	@Transactional
	public void update(long id, String modified) {
		Content content=contentDAO.find(id);
		content.setHtml(modified);
		contentDAO.update(content);
		return;
	}
	
	
}
