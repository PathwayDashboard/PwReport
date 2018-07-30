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

import java.util.Comparator;

import it.eng.pathway.fake.model.ExerciseProgramme;

public class ExerciseProgrammeComparator implements Comparator<ExerciseProgramme> {

	@Override
	public int compare(ExerciseProgramme e1, ExerciseProgramme e2) {
		int res=0;
		res = e1.getDate().compareTo(e2.getDate());
		return res;
	}
	

}
