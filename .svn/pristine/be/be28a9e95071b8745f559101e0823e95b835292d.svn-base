package it.eng.pathway.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import it.eng.pathway.fake.model.AnswerType;
import it.eng.pathway.fake.model.ClosedAnswer;
import it.eng.pathway.fake.model.GoalCategoryType;
import it.eng.pathway.fake.model.LifeStyleAssessmentQuestionnaire;
import it.eng.pathway.fake.model.Question;
import it.eng.pathway.fake.model.YesNoScore;
import it.eng.pathway.frontend.business.ContentBusiness;

@Controller
@SessionAttributes({"lifestyleQ"})
public class QuestionnaireController {
	
	@Autowired
	private ContentBusiness contentBusiness;
	
	private MessageSource msg;
	@Autowired
    public void AccountsController(MessageSource msgSrc) {
     this.msg = msgSrc;
    }
	
	@RequestMapping(value="/smokingQuestionnaire", method=RequestMethod.GET)
	public String homeRender(Model model, Locale locale){
		
		LifeStyleAssessmentQuestionnaire lifestyleQ=new LifeStyleAssessmentQuestionnaire();
		lifestyleQ.setCategory(GoalCategoryType.smoking);
		
		ArrayList<Question> qs=new ArrayList<Question>();
		lifestyleQ.setQuestionsList(qs);
		
		Question q=new Question();
		q.setId(0);
		q.setQuestionText("How soon after waking do you smoke your first cigarette?");
		q.setAnswerType(AnswerType.STRING);
		q.setMaxAnswersNumber(1);
		List<ClosedAnswer> as=new ArrayList<ClosedAnswer>();
		ClosedAnswer a=new ClosedAnswer();
		a.setAnswerText("Within 5 minutes");
		a.setScore(3);
		as.add(a);
		a=new ClosedAnswer();
		a.setAnswerText("5-30 minutes");
		a.setScore(2);
		as.add(a);
		a=new ClosedAnswer();
		a.setAnswerText("31-60 minutes");
		a.setScore(1);
		as.add(a);
		q.setClosedAnswer(as);
		qs.add(q);
		
		
		q=new Question();
		q.setId(1);
		q.setQuestionText("Do you find it difficult to refrain from smoking in places where it is forbidden? E.g. Church, Library etc.");
		q.setAnswerType(AnswerType.BOOLEAN);
		q.setMaxAnswersNumber(1);
		YesNoScore ynScore=new YesNoScore();
		ynScore.setYesScore(1);
		ynScore.setNoScore(0);
		q.setYesNoScores(ynScore);
		qs.add(q);
		
		q=new Question();
		q.setId(2);
		q.setQuestionText("Which cigarette would you hate to give up?");
		q.setAnswerType(AnswerType.STRING);
		q.setMaxAnswersNumber(1);
		as=new ArrayList<ClosedAnswer>();
		a=new ClosedAnswer();
		a.setAnswerText("The first in the morning");
		a.setScore(1);
		as.add(a);
		a=new ClosedAnswer();
		a.setAnswerText("Any other");
		a.setScore(0);
		as.add(a);
		q.setClosedAnswer(as);
		qs.add(q);
		
		q=new Question();
		q.setId(3);
		q.setQuestionText("How many cigarettes a day do you smoke?");
		q.setAnswerType(AnswerType.STRING);
		q.setMaxAnswersNumber(1);
		as=new ArrayList<ClosedAnswer>();
		a=new ClosedAnswer();
		a.setAnswerText("10 or less");
		a.setScore(0);
		as.add(a);
		a=new ClosedAnswer();
		a.setAnswerText("11-20");
		a.setScore(1);
		as.add(a);
		a=new ClosedAnswer();
		a.setAnswerText("21-30");
		a.setScore(2);
		as.add(a);
		a=new ClosedAnswer();
		a.setAnswerText("31 or more");
		a.setScore(3);
		as.add(a);
		q.setClosedAnswer(as);
		qs.add(q);
		
		q=new Question();
		q.setId(4);
		q.setQuestionText("Do you smoke more frequently in the morning?");
		q.setAnswerType(AnswerType.BOOLEAN);
		q.setMaxAnswersNumber(1);
		ynScore=new YesNoScore();
		ynScore.setYesScore(1);
		ynScore.setNoScore(0);
		q.setYesNoScores(ynScore);
		qs.add(q);
		
		q=new Question();
		q.setId(5);
		q.setQuestionText("Do you smoke even if you are sick in bed most of the day?");
		q.setAnswerType(AnswerType.BOOLEAN);
		q.setMaxAnswersNumber(1);
		ynScore=new YesNoScore();
		ynScore.setYesScore(1);
		ynScore.setNoScore(0);
		q.setYesNoScores(ynScore);
		qs.add(q);
		
		Gson gson=new Gson();
		String lifestyleJ=gson.toJson(lifestyleQ);
		
		model.addAttribute("lifestyleJ", lifestyleJ);
		model.addAttribute("lifestyleQ", lifestyleQ);
		
		
		return "questionnaires";
	}
	
		
}
