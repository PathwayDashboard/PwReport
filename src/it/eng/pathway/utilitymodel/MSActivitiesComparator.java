package it.eng.pathway.utilitymodel;

import java.util.Comparator;

import ms.client.model.RunActivity;

public class MSActivitiesComparator implements Comparator<RunActivity> {

	@Override
	public int compare(RunActivity o1, RunActivity o2) {
		return o1.getStartTime().compareTo(o2.getStartTime());
	}

}
