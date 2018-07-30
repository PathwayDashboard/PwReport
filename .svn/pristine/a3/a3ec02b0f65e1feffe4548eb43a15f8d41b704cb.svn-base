package it.eng.pathway.frontend.business;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.eng.pathway.frontend.dao.VideoLinkDAO;
import it.eng.pathway.frontend.model.VideoLink;

@Service
public class VideoLinkBusiness {

	@Autowired
	private VideoLinkDAO videoLinkDao;
	
	public List<VideoLink> getVideoLinks(String locale, String dimension, String type){
		return videoLinkDao.find(locale, dimension, type);
	}
	
	@Transactional
	public VideoLink update(int id, String newUrl) {
		VideoLink vl=videoLinkDao.find(id);
		vl.setUrl(newUrl);
		return videoLinkDao.update(vl);
	}
	
	
	public VideoLink addVideoLink(String locale, String dimension, String type, String url){
		VideoLink vl=new VideoLink();
		vl.setDimension(dimension);
		vl.setLocale(locale);
		vl.setType(type);
		vl.setUrl(url);
		return videoLinkDao.create(vl);
	}
	
	public List<VideoLink> getAllVideoLinks(String locale, String dimension, String type){
		return videoLinkDao.findAll();
	}

	public VideoLink remove(int id) {
		return videoLinkDao.remove(id);
	}
	
	
}
