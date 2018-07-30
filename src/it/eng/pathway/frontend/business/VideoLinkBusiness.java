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
