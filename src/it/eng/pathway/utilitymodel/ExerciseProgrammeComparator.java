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
