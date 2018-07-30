package it.eng.pathway.frontend.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

@Entity
public class Document {
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	
	@Lob
	private byte[] fileDocument;
	
	private String filename;
	
	private String locale;
	
	private String dimension; //diet, smoking, stress
	
	private String contentType;
	
	private String label;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public String getLocale() {
		return locale;
	}

	public void setLocale(String locale) {
		this.locale = locale;
	}

	public String getDimension() {
		return dimension;
	}

	public void setDimension(String dimension) {
		this.dimension = dimension;
	}

	public byte[] getFileDocument() {
		return fileDocument;
	}

	public void setFileDocument(byte[] fileDocument) {
		this.fileDocument = fileDocument;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}


	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	@Override
	public String toString() {
		return "Document [id=" + id + ", filename=" + filename + ", locale=" + locale + ", dimension=" + dimension
				+ ", contentType=" + contentType + ", label=" + label + "]";
	}

	

}
