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
/**
 * 
 */
package it.eng.pathway.frontend.model;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;

import com.google.gson.annotations.Expose;

/**
 * @author fabiomelillo
 *
 */
@Entity
public class FrontEndPatient {
	@Expose
	private String username;
//	Unique identifier from HDMS
	@Id
	private String sin;
	@Lob
	private String msToken;
	@Lob
	private String msRefreshToken;
	
	private Date firstLogin;
	
	@OneToMany(fetch=FetchType.EAGER, mappedBy="patient")
	@Expose
	private List<Reward> rewards;
	
	
	public FrontEndPatient() {
		super();
	}
	
	public FrontEndPatient(String username, String sin, String msToken, String msRefreshToken) {
		super();
		this.username = username;
		this.sin = sin;
		this.msToken = msToken;
		this.msRefreshToken = msRefreshToken;
		this.firstLogin = Calendar.getInstance().getTime();
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSin() {
		return sin;
	}
	public void setSin(String sin) {
		this.sin = sin;
	}
	public String getMsToken() {
		return msToken;
	}
	public void setMsToken(String msToken) {
		this.msToken = msToken;
	}
	public String getMsRefreshToken() {
		return msRefreshToken;
	}
	public void setMsRefreshToken(String msRefreshToken) {
		this.msRefreshToken = msRefreshToken;
	}

	public List<Reward> getRewards() {
		return rewards;
	}

	public void setRewards(List<Reward> rewards) {
		this.rewards = rewards;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((sin == null) ? 0 : sin.hashCode());
		result = prime * result + ((username == null) ? 0 : username.hashCode());
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
		FrontEndPatient other = (FrontEndPatient) obj;
		if (sin == null) {
			if (other.sin != null)
				return false;
		} else if (!sin.equals(other.sin))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "FrontEndPatient [username=" + username + ", sin=" + sin + ", msToken=" + msToken + ", msRefreshToken="
				+ msRefreshToken + "]";
	}

	public Date getFirstLogin() {
		return firstLogin;
	}

	public void setFirstLogin(Date firstLogin) {
		this.firstLogin = firstLogin;
	}
	
	

}
