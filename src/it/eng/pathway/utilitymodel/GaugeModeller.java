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
