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

public class CustomOutdoor {
	
	private String pos;
	private String type;
	private String description;
	private String duration;
	private String intensity;
	private String hr;
	private String kcal;
	private String steps;
	private String date;
	private String startTime;
	private String endTime;
	private boolean monitored;
	
	private Integer minIn050;
	
	private Integer minIn5160;
	
	private Integer minIn6170;
	
	private Integer minIn7180;
	
	private Integer minIn8190;
	
	private Integer minIn91100;
	
	private Integer minIn101;
	
	
	public String getHr() {
		return hr;
	}
	public void setHr(String hr) {
		this.hr = hr;
	}
	public String getKcal() {
		return kcal;
	}
	public void setKcal(String kcal) {
		this.kcal = kcal;
	}
	public String getSteps() {
		return steps;
	}
	public void setSteps(String steps) {
		this.steps = steps;
	}
	public CustomOutdoor() {
		super();
	}
	public String getPos() {
		return pos;
	}
	public void setPos(String pos) {
		this.pos = pos;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getIntensity() {
		return intensity;
	}
	public void setIntensity(String intensity) {
		this.intensity = intensity;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public boolean isMonitored() {
		return monitored;
	}
	public void setMonitored(boolean monitored) {
		this.monitored = monitored;
	}
	@Override
	public String toString() {
		return "CustomOutdoor [pos=" + pos + ", type=" + type + ", description=" + description + ", duration="
				+ duration + ", intensity=" + intensity + ", hr=" + hr + ", kcal=" + kcal + ", steps=" + steps
				+ ", date=" + date + ", startTime=" + startTime + ", endTime=" + endTime + ", monitored=" + monitored
				+ "]";
	}
	public Integer getMinIn050() {
		return minIn050;
	}
	public void setMinIn050(Integer minIn050) {
		this.minIn050 = minIn050;
	}
	public Integer getMinIn5160() {
		return minIn5160;
	}
	public void setMinIn5160(Integer minIn5160) {
		this.minIn5160 = minIn5160;
	}
	public Integer getMinIn6170() {
		return minIn6170;
	}
	public void setMinIn6170(Integer minIn6170) {
		this.minIn6170 = minIn6170;
	}
	public Integer getMinIn7180() {
		return minIn7180;
	}
	public void setMinIn7180(Integer minIn7180) {
		this.minIn7180 = minIn7180;
	}
	public Integer getMinIn8190() {
		return minIn8190;
	}
	public void setMinIn8190(Integer minIn8190) {
		this.minIn8190 = minIn8190;
	}
	public Integer getMinIn91100() {
		return minIn91100;
	}
	public void setMinIn91100(Integer minIn91100) {
		this.minIn91100 = minIn91100;
	}
	public Integer getMinIn101() {
		return minIn101;
	}
	public void setMinIn101(Integer minIn101) {
		this.minIn101 = minIn101;
	}
	

	

	
}
