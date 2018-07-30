package it.eng.pathway.utilitymodel;

public class AverageHR {
	
	private float avgHR;
	private int minutes;
	
	
	public AverageHR(float avgHR, int minutes) {
		super();
		this.avgHR = avgHR;
		this.minutes = minutes;
	}
	public AverageHR() {
		super();
	}
	public float getAvgHR() {
		return avgHR;
	}
	public void setAvgHR(float avgHR) {
		this.avgHR = avgHR;
	}
	public int getMinutes() {
		return minutes;
	}
	public void setMinutes(int minutes) {
		this.minutes = minutes;
	}
	
	

}
