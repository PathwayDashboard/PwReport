package it.eng.pathway.utilitymodel;

import java.util.Comparator;

import it.eng.pathway.fake.model.ExerciseSession;
import it.eng.pathway.utility.PwLogger;

public class ExerciseSessionComparator implements Comparator<ExerciseSession> {

	@Override
	public int compare(ExerciseSession o1, ExerciseSession o2) {
		if (o1.isValid() && o2.isValid()){
//			PwLogger.logger.fine(o1.getDate()+" -> "+o2.getDate());
			return o1.getDate().compareTo(o2.getDate());
		}else{
			return 0;
		}
	}
	
	

}
