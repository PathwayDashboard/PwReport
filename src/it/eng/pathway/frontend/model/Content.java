/**
 * 
 */
package it.eng.pathway.frontend.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

/**
 * @author fabiomelillo
 *
 */
@Entity
public class Content {
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	private String section;
	private String subsection;
	private String locale;
	
	@Lob
	private String html;
	
	
	public String getHtml() {
		return html;
	}


	public void setHtml(String html) {
		this.html = html;
	}


	public Content() {
		super();
	}


	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public String getSection() {
		return section;
	}


	public void setSection(String section) {
		this.section = section;
	}


	public String getSubsection() {
		return subsection;
	}


	public void setSubsection(String subsection) {
		this.subsection = subsection;
	}


	public String getLocale() {
		return locale;
	}


	public void setLocale(String locale) {
		this.locale = locale;
	}

	
	
}
