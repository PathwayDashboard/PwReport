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

import it.eng.pathway.fake.model.ActiveLifestylePASession;

public class ActiveLifestyleReverseComparator implements Comparator<ActiveLifestylePASession> {

	@Override
	public int compare(ActiveLifestylePASession o1, ActiveLifestylePASession o2) {
		if (o1.getStartTime() == null)
			return 100;
		if (o2.getStartTime() == null)
			return -200;
		return o1.getStartTime().compareTo(o2.getStartTime());
	}

}
