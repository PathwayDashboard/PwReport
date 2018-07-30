/**
 * 
 */
package it.eng.pathway.frontend.dao;

import java.util.List;
import java.util.Locale;

import it.eng.pathway.frontend.model.Questionnaire;

/**
 * @author fabiomelillo
 *
 */
public interface QuestionnaireDAO{

	public List<Questionnaire> findAll();
	public Questionnaire find(String idQuestion, Locale locale);
	public Questionnaire find(long id);
	public Questionnaire find(Integer idGoal, Locale locale);

}
