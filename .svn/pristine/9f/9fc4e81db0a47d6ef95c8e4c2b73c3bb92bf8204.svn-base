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
