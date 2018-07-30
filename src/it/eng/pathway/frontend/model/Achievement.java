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
package it.eng.pathway.frontend.model;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;

import com.google.gson.annotations.Expose;

@Entity
public class Achievement implements Comparable<Achievement>{
	
	@Id
	@Expose
	private String id;
	@Expose
	private boolean kcalAvg;
	@Expose
	private boolean hrAvg;
	@Expose
	private boolean steps;
	@Expose
	private boolean sessions;
	@Expose
	private boolean durationAvg;
	@Expose
	private boolean durationTotal;
	@Expose
	private String message;
	@Expose
	private String badge;
	@Expose
	private String trophy;
	@Expose
	private String times; //0-leading number
	@Enumerated(EnumType.STRING)
	@Expose
	private Category category;

	
	public Achievement() {
		super();
	}

	public Achievement(boolean kcalAvg, boolean hrAvg, boolean steps, boolean sessions, boolean durationAvg,
			boolean durationTotal, String message, String badge, String trophy, String times, Category category) {
		super();
		this.kcalAvg = kcalAvg;
		this.hrAvg = hrAvg;
		this.steps = steps;
		this.sessions = sessions;
		this.durationAvg = durationAvg;
		this.durationTotal = durationTotal;
		this.message = message;
		this.badge = badge;
		this.trophy = trophy;
		this.times = times;
		this.category = category;
		
		this.id=createId(times, category);
	}
	
	public Achievement(boolean kcalAvg, boolean hrAvg, boolean steps, boolean sessions, boolean durationAvg,
			boolean durationTotal) {
		this.kcalAvg = kcalAvg;
		this.hrAvg = hrAvg;
		this.steps = steps;
		this.sessions = sessions;
		this.durationAvg = durationAvg;
		this.durationTotal = durationTotal;
	}

	public String createId(String times, Category category){
		String id=category.name()+"_"+times;
		return id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public boolean isKcalAvg() {
		return kcalAvg;
	}

	public void setKcalAvg(boolean kcalAvg) {
		this.kcalAvg = kcalAvg;
	}

	public boolean isHrAvg() {
		return hrAvg;
	}

	public void setHrAvg(boolean hrAvg) {
		this.hrAvg = hrAvg;
	}

	public boolean isSteps() {
		return steps;
	}

	public void setSteps(boolean steps) {
		this.steps = steps;
	}

	public boolean isSessions() {
		return sessions;
	}

	public void setSessions(boolean sessions) {
		this.sessions = sessions;
	}

	public boolean isDurationAvg() {
		return durationAvg;
	}

	public void setDurationAvg(boolean durationAvg) {
		this.durationAvg = durationAvg;
	}

	public boolean isDurationTotal() {
		return durationTotal;
	}

	public void setDurationTotal(boolean durationTotal) {
		this.durationTotal = durationTotal;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getBadge() {
		return badge;
	}

	public void setBadge(String badge) {
		this.badge = badge;
	}

	public String getTrophy() {
		return trophy;
	}

	public void setTrophy(String trophy) {
		this.trophy = trophy;
	}

	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Achievement [id=" + id + ", kcalAvg=" + kcalAvg + ", hrAvg=" + hrAvg + ", steps=" + steps
				+ ", sessions=" + sessions + ", durationAvg=" + durationAvg + ", durationTotal=" + durationTotal
				+ ", message=" + message + ", badge=" + badge + ", trophy=" + trophy + ", times=" + times
				+ ", category=" + category + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((badge == null) ? 0 : badge.hashCode());
		result = prime * result + ((category == null) ? 0 : category.hashCode());
		result = prime * result + (durationAvg ? 1231 : 1237);
		result = prime * result + (durationTotal ? 1231 : 1237);
		result = prime * result + (hrAvg ? 1231 : 1237);
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + (kcalAvg ? 1231 : 1237);
		result = prime * result + ((message == null) ? 0 : message.hashCode());
		result = prime * result + (sessions ? 1231 : 1237);
		result = prime * result + (steps ? 1231 : 1237);
		result = prime * result + ((times == null) ? 0 : times.hashCode());
		result = prime * result + ((trophy == null) ? 0 : trophy.hashCode());
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
		Achievement other = (Achievement) obj;
		if (badge == null) {
			if (other.badge != null)
				return false;
		} else if (!badge.equals(other.badge))
			return false;
		if (category != other.category)
			return false;
		if (durationAvg != other.durationAvg)
			return false;
		if (durationTotal != other.durationTotal)
			return false;
		if (hrAvg != other.hrAvg)
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (kcalAvg != other.kcalAvg)
			return false;
		if (message == null) {
			if (other.message != null)
				return false;
		} else if (!message.equals(other.message))
			return false;
		if (sessions != other.sessions)
			return false;
		if (steps != other.steps)
			return false;
		if (times == null) {
			if (other.times != null)
				return false;
		} else if (!times.equals(other.times))
			return false;
		if (trophy == null) {
			if (other.trophy != null)
				return false;
		} else if (!trophy.equals(other.trophy))
			return false;
		return true;
	}

	@Override
	public int compareTo(Achievement o) {
		return this.getId().compareTo(o.getId());
	}
	
	

}
