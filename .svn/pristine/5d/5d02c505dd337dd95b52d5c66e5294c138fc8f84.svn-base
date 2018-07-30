package it.eng.pathway.utilitymodel;

import java.io.Serializable;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class GaugeModeller implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String title,message;
	private int start,done,goal;
	
	public GaugeModeller() {
		super();
	}

	public GaugeModeller(String title, String message, int start, int done, int goal) {
		super();
		this.title = title;
		this.message = message;
		this.start = start;
		this.done = done;
		this.goal = goal;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getDone() {
		return done;
	}
	public void setDone(int done) {
		this.done = done;
	}
	public int getGoal() {
		return goal;
	}
	public void setGoal(int goal) {
		this.goal = goal;
	}
	
	public String toJson() {
		String toRet="";
		ObjectMapper mapper = new ObjectMapper();
		try {
			toRet=mapper.writeValueAsString(this);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return toRet;
	}

	@Override
	public String toString() {
		return "GaugeModeller [title=" + title + ", message=" + message + ", start=" + start + ", done=" + done
				+ ", goal=" + goal + "]";
	}
	
	

}
