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

import java.util.HashMap;
import java.util.List;

public class ChartModeller {
	
	private List<String> labels;
	
	private HashMap<String, Object> values;
	
	private HashMap<String, Object> goals;
	
	private String title;
	
	private String xTitle;
	private String yTitle;
	
	public static final String TITLEKEY="TITLE";
	public static final String VALUESKEY="VALUES";
	
	
	
	public ChartModeller() {
		super();
	}
	
	public ChartModeller(List<String> labels, HashMap<String, Object> values, HashMap<String, Object> goals,
			String title) {
		super();
		this.labels = labels;
		this.values = values;
		this.goals = goals;
		this.title = title;
	}

	public List<String> getLabels() {
		return labels;
	}
	public void setLabels(List<String> labels) {
		this.labels = labels;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public HashMap<String, Object> getValues() {
		return values;
	}
	public void setValues(HashMap<String, Object> values) {
		this.values = values;
	}
	public HashMap<String, Object> getGoals() {
		return goals;
	}
	public void setGoals(HashMap<String, Object> goals) {
		this.goals = goals;
	}

	public String getxTitle() {
		return xTitle;
	}

	public void setxTitle(String xTitle) {
		this.xTitle = xTitle;
	}

	public String getyTitle() {
		return yTitle;
	}

	public void setyTitle(String yTitle) {
		this.yTitle = yTitle;
	}
	
	
	
	

}
