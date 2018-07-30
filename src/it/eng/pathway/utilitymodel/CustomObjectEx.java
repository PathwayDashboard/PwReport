package it.eng.pathway.utilitymodel;

public class CustomObjectEx {
	
	String date,type,duration;
	
	public CustomObjectEx(String date, String type, String duration) {
		super();
		this.date = date;
		this.type = type;
		this.duration = duration;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}
	
	

}
