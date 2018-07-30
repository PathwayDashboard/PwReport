package it.eng.pathway.frontend.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.gson.annotations.Expose;

@Entity
public class Reward {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Expose
	private int id;
	@Expose
	private String startDate;
	@Expose
	private String endDate;
	
	
	@OneToOne
	@Expose
	private Achievement achievement;
	@Expose
	private String firstAssignement;
	
	@ManyToOne
	@Expose(serialize=false, deserialize=false)
	private FrontEndPatient patient;
	

	public Reward() {
		super();
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Achievement getAchievement() {
		return achievement;
	}

	public void setAchievement(Achievement achievement) {
		this.achievement = achievement;
	}

	public String getFirstAssignement() {
		return firstAssignement;
	}

	public void setFirstAssignement(String firstAssignement) {
		this.firstAssignement = firstAssignement;
	}

	public FrontEndPatient getPatient() {
		return patient;
	}

	public void setPatient(FrontEndPatient patient) {
		this.patient = patient;
	}

	@Override
	public String toString() {
		return "Reward [id=" + id + ", startDate=" + startDate + ", endDate=" + endDate + ", achievement=" + achievement
				+ ", firstAssignement=" + firstAssignement + ", patient=" + patient.getSin() + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((achievement == null) ? 0 : achievement.hashCode());
		result = prime * result + ((endDate == null) ? 0 : endDate.hashCode());
		result = prime * result + ((firstAssignement == null) ? 0 : firstAssignement.hashCode());
		result = prime * result + id;
		result = prime * result + ((patient == null) ? 0 : patient.hashCode());
		result = prime * result + ((startDate == null) ? 0 : startDate.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Reward other = (Reward) obj;
		if (achievement == null) {
			if (other.achievement != null)
				return false;
		} else if (!achievement.equals(other.achievement))
			return false;
		if (endDate == null) {
			if (other.endDate != null)
				return false;
		} else if (!endDate.equals(other.endDate))
			return false;
		if (firstAssignement == null) {
			if (other.firstAssignement != null)
				return false;
		} else if (!firstAssignement.equals(other.firstAssignement))
			return false;
		if (id != other.id)
			return false;
		if (patient == null) {
			if (other.patient != null)
				return false;
		} else if (!patient.equals(other.patient))
			return false;
		if (startDate == null) {
			if (other.startDate != null)
				return false;
		} else if (!startDate.equals(other.startDate))
			return false;
		return true;
	}
	
	

}
