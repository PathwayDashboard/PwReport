package it.eng.pathway.utilitymodel;

public class CustomSession {
	
	public enum SessionType {
		CLASS,GAME,ACTIVE;
	}
	
	private String date;
	private SessionType type;
	private boolean acceptable;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public SessionType getType() {
		return type;
	}
	public void setType(SessionType type) {
		this.type = type;
	}
	public boolean isAcceptable() {
		return acceptable;
	}
	public void setAcceptable(boolean acceptable) {
		this.acceptable = acceptable;
	}

	
}
