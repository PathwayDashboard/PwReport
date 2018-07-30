package it.eng.pathway.utilitymodel;

import java.util.Date;

public class CustomGoalAssessment {
	
	private Date date;
	private String value;
	private Integer goalId;
	private Integer category;
	private String questionId;
	private String subcategory;
	
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public Integer getGoalId() {
		return goalId;
	}
	public void setGoalId(Integer goalId) {
		this.goalId = goalId;
	}
	@Override
	public String toString() {
		return "CustomGoalAssessment [date=" + date + ", value=" + value + ", goalId=" + goalId + "]";
	}
	public Integer getCategory() {
		return category;
	}
	public void setCategory(Integer category) {
		this.category = category;
	}
	public String getQuestionId() {
		return questionId;
	}
	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}
	public String getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}
	
	
	
	
	
}
