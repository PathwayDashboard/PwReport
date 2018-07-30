/**
 * 
 */
package it.eng.pathway.frontend.dao;

import it.eng.pathway.fake.model.RatedPerceivedEffort;
import it.eng.pathway.fake.model.SatisfactionLevelType;
import it.eng.pathway.fake.model.StatusType;

/**
 * @author fabiomelillo
 *
 */
public interface LabelDAO {


	public String getRightLabel(RatedPerceivedEffort rpe, String language);
	public String getRightLabel(SatisfactionLevelType satisfaction, String language);
	public String getRightLabel(StatusType status, String language);

}
