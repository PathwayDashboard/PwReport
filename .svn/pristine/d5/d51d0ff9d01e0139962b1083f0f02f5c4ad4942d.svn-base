package it.eng.pathway.frontend.business;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.eng.pathway.frontend.dao.FrontEndPatientDAO;
import it.eng.pathway.frontend.dao.RewardDAO;
import it.eng.pathway.frontend.model.Achievement;
import it.eng.pathway.frontend.model.Category;
import it.eng.pathway.frontend.model.FrontEndPatient;
import it.eng.pathway.frontend.model.Reward;

@Service
public class FrontEndPatientBusiness {

	@Autowired
	private FrontEndPatientDAO frontEndPatientDao;
	
	@Autowired
	private RewardDAO rewardDao;
	
	@Autowired
	private AchievementBusiness achievementBusiness;
	
	@Transactional
	public FrontEndPatient getFirst() {
		return frontEndPatientDao.getFirst();
	}
	@Transactional
	public FrontEndPatient create(FrontEndPatient patient) {
		return frontEndPatientDao.create(patient);
	}
	@Transactional
	public FrontEndPatient update(FrontEndPatient patient) {
		return frontEndPatientDao.update(patient);
	}
	
	@Transactional
	public FrontEndPatient getSomePatient() {
		FrontEndPatient patient=getFirst();
		if (patient!=null){
			return patient;
		}
		else{
			patient=new FrontEndPatient("Fabio", "qwerty", "Microsoft Token Placeholder", "Microsoft Refresh Token Placeholder");
			return create(patient);
		}
	}
	
	public FrontEndPatient getPatient(String sin){
		return frontEndPatientDao.getPatient(sin);
	}
	
	public FrontEndPatient checkReward(FrontEndPatient patient, Achievement achievement, String endOfTheWeek){
		List<Achievement> possibiliAchi=achievementBusiness.getByExample(achievement);
		HashMap<Category, ArrayList<Achievement>> mapPossibili=new HashMap<>();
		if (possibiliAchi!=null)
			for (Achievement a : possibiliAchi) {
				System.out.println(a);
				Category cat=a.getCategory();
				ArrayList<Achievement> as=mapPossibili.get(cat);
				if (as==null)
					as = new ArrayList<Achievement>();
				as.add(a);
				mapPossibili.put(cat, as);
			}
		
		List<Reward> daAssegnare=new ArrayList<>();
		
		List<Reward> ottenutiRew=patient.getRewards();
		HashMap<Category, ArrayList<Achievement>> mapOttenuti=new HashMap<>();
		if (ottenutiRew!=null)
			for (Reward reward : ottenutiRew) {
				System.out.println(reward);
				Achievement a=reward.getAchievement();
				Category cat=a.getCategory();
				ArrayList<Achievement> as=mapPossibili.get(cat);
				if (as==null)
					as = new ArrayList<Achievement>();
				as.add(a);
				mapOttenuti.put(cat,as);
			}
		
		Set<Category> keys=mapPossibili.keySet();
		for (Category key : keys) {
			ArrayList<Achievement> achOttenuti=mapOttenuti.get(key);
			ArrayList<Achievement> achPossibili=mapPossibili.get(key);
			Collections.sort(achPossibili);
			
			if (achOttenuti==null){ //non ho badges per questa categoria
				Achievement toAdd=achPossibili.get(0);
				Reward r=new Reward();
				r.setAchievement(toAdd);
				r.setEndDate("20160211");
				r.setStartDate("20160204");
				r.setFirstAssignement("20160211");
				r.setPatient(patient);
				daAssegnare.add(r);
			}else{
				Collections.sort(achOttenuti);
				for (Achievement asOtt : achOttenuti) {
					for (Achievement asPoss : achPossibili) {
						if (asPoss.getId().compareTo(asOtt.getId())>0){
							Reward r=new Reward();
							r.setAchievement(asPoss);
							r.setEndDate("20160211");
							r.setStartDate("20160204");
							r.setFirstAssignement("20160211");
							r.setPatient(patient);
							daAssegnare.add(r);
							break;
						}
					}
				}
			}
		}
		System.out.println("Da Assegnare: "+daAssegnare);
		if (patient.getRewards()==null)
			patient.setRewards(daAssegnare);
		else
			patient.getRewards().addAll(daAssegnare);
		
		return patient;
	}
	
}
