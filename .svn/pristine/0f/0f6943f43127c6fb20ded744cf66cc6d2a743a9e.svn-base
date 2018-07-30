package it.eng.pathway.utilitymodel;

public class CRCustomCreation {
	
//	private static int WEEKLY_FREQ = 3;
//	private static int N=2;
//	private static int TOTALDURATION=50;
//	private static double wutp=0.1667;
//	private static double sttp=0.0833;
//	private static double aetp=0.5;
//	private static double cdtp=0.1667;
//	private static double rxtp=0.0833;
//	
//	
//	public static CardiacRehabilitionProgramme createProgramme(int maxFreq){
//		PwLogger.printMethod();
//		CardiacRehabilitionProgramme crp=new CardiacRehabilitionProgramme();
//		crp.setCreationDate(DateMgt.getDate("2016-01-23"));
////		TOT DURATION 60'
////		percentages 16,67 8,33 50 16,67 8,33
//		TrainingProfile tp=new TrainingProfile();
//		tp.setWarmingUpDuration((int) (TOTALDURATION*wutp));
//		tp.setWarmingHRzoneMax((int) (0.6*maxFreq));
//		tp.setWarmingHRzoneMin((int) (0.5*maxFreq));
//		
////		tp.setStretchingDuration((int) (TOTALDURATION*sttp));
////		tp.setStretchingHRzoneMax((int) (0.66*maxFreq));
////		tp.setStretchingHRzoneMin((int) (0.55*maxFreq));
//		
//		tp.setMainDuration((int) (TOTALDURATION*aetp));
//		tp.setMainHRzoneMax((int) (0.85*maxFreq));
//		tp.setMainHRzoneMin((int) (0.6*maxFreq));
//		
//		tp.setCooldownDuration((int) (TOTALDURATION*cdtp));
//		tp.setCooldownHRZoneMax((int) (0.7*maxFreq));
//		tp.setCooldownHRZoneMin((int) (0.5*maxFreq));
//		
////		tp.setRelaxationDuration((int) (TOTALDURATION*rxtp));
////		tp.setRelaxationHRzoneMax((int) (0.55*maxFreq));
////		tp.setRelaxationHRzoneMin((int) (0.4*maxFreq));
//		
//		crp.setTrainingProfile(tp);
//		
//		
//		CurrentExerciseProgramme ep=new CurrentExerciseProgramme();
//		ep.setWeeklyFrequency(WEEKLY_FREQ);
//		ep.setExerciseIntensity(3);
//		ep.setWeeklyTime(WEEKLY_FREQ*TOTALDURATION);
//		ep.setSessionDuration(ep.getWeeklyTime()/ep.getWeeklyFrequency());
//		ep.setNumberOfExerclass(2);
//		ep.setNumberOfExerGame(0);
//		ep.setNumberOfActiveLifeStyleActivity(1);
//		
//		crp.setCurrentExerciseProgramme(ep);
//		
//		return crp;
//	}
//	
//	public static CardiacRehabilitationProgress getSessions(CardiacRehabilitionProgramme crp, int days, Date startDate){
//		PwLogger.printMethod();
//		List<ExerciseSession> sessions=new ArrayList<ExerciseSession>();
//		
//		Calendar cal=GregorianCalendar.getInstance();
//		cal.setTime(startDate);
//		
//		CurrentExerciseProgramme programme=crp.getCurrentExerciseProgramme();
//		int exerclass=programme.getNumberOfExerclass();
//		int exergame=programme.getNumberOfExerGame();
//		int activity=programme.getNumberOfActiveLifeStyleActivity();
//		
//		int weeks=((int) days/7);
//		
//		exerclass*=weeks;
//		exergame*=weeks;
//		activity*=weeks;
//		
//		int countClass=0;
//		int countGame=0;
//		int countActivity=0;
//		
//		Random r=new Random();
//		CardiacRehabilitationProgress crs=new CardiacRehabilitationProgress();
//		TrainingProfile tp=crp.getTrainingProfile();
//		
////		List<CardiacRehabilitationProgress> crps=new ArrayList<CardiacRehabilitationProgress>();
//		for (int i=0;i<days;i++){
//			cal.add(Calendar.DAY_OF_MONTH, i);
//			Date actual=cal.getTime();
//			int choice;
//			int perDay=0+r.nextInt(4);
//			for (int j=0;j<perDay;j++){
//				
//				choice=r.nextInt(8);
//				
//				switch (choice) {
//				case 0:
//					break;
//				case 1:
//					if(countClass<exerclass+N){
//						ExerClassSession exClass=new ExerClassSession();
//						exClass.setDate(actual);
//						cal.set(Calendar.HOUR_OF_DAY, r.nextInt(23));
//						cal.set(Calendar.MINUTE,r.nextInt(59));
//						String start=DateMgt.getReadableTime(cal);
//						exClass.setStartTime(start);
//						int duration=20+r.nextInt(45);
//						cal.add(Calendar.MINUTE, duration);
//						String end=DateMgt.getReadableTime(cal);
//						exClass.setEndTime(end);
//						exClass.setDuration(duration);
//						
//						EnergyExpenditureObservation kcal=new EnergyExpenditureObservation();
//						kcal.setValue(350+r.nextInt(251));
//						exClass.setEnergyExpenditure(kcal);
//						
//						TrainingPhaseInfo wu=new TrainingPhaseInfo();
//						wu.setDuration((int) Math.round(duration*wutp));
//						int min=tp.getWarmingHRzoneMin();
//						int max=tp.getWarmingHRzoneMax();
//						float avg=(max+min)/2;
//						max=max+r.nextInt(8);
//						wu.setMaxHR(max);
//						wu.setMinHR(min);
//						wu.setAverageHR(avg);
//						exClass.setWarmingDuration(wu);
//						
////						TrainingPhaseInfo st=new TrainingPhaseInfo();
////						st.setDuration((int) Math.round(duration*sttp));
////						min=tp.getStretchingHRzoneMin();
////						max=tp.getStretchingHRzoneMax();
////						avg=(max+min)/2;
////						max=max+r.nextInt(8);
////						st.setMaxHR(max);
////						st.setMinHR(min);
////						st.setAverageHR(avg);
////						exClass.setStretchingDuration(st);
//						
//						TrainingPhaseInfo ae=new TrainingPhaseInfo();
//						ae.setDuration((int) Math.round(duration*aetp));
//						min=tp.getMainHRzoneMin();
//						max=tp.getMainHRzoneMax();
//						avg=(max+min)/2;
//						max=max+r.nextInt(8);
//						ae.setMaxHR(max);
//						ae.setMinHR(min);
//						ae.setAverageHR(avg);
//						exClass.setMainDuration(ae);
//						
//						TrainingPhaseInfo cd=new TrainingPhaseInfo();
//						cd.setDuration((int) Math.round(duration*cdtp));
//						min=tp.getCooldownHRZoneMin();
//						max=tp.getCooldownHRZoneMax();
//						avg=(max+min)/2;
//						max=max+r.nextInt(8);
//						cd.setMaxHR(max);
//						cd.setMinHR(min);
//						cd.setAverageHR(avg);
//						exClass.setCoolDownDuration(cd);
//						
////
////						TrainingPhaseInfo rx=new TrainingPhaseInfo();
////						rx.setDuration((int) Math.round(duration*rxtp));
////						min=tp.getRelaxationHRzoneMin();
////						max=tp.getRelaxationHRzoneMax();
////						avg=(max+min)/2;
////						max=max+r.nextInt(8);
////						rx.setMaxHR(max);
////						rx.setMinHR(min);
////						rx.setAverageHR(avg);
////						exClass.setRelaxationDuration(rx);
//						
//						sessions.add(exClass);
//						countClass++;
//					}
//					break;
//					
//				case 2:
//					if(countGame<exergame+N){
//						ExerGameSession exGame=new ExerGameSession();
//						exGame.setDate(actual);
//						cal.set(Calendar.HOUR_OF_DAY, r.nextInt(23));
//						cal.set(Calendar.MINUTE,r.nextInt(59));
//						String start=DateMgt.getReadableTime(cal);
//						exGame.setStartTime(start);
//						int duration=20+r.nextInt(45);
//						cal.add(Calendar.MINUTE, duration);
//						String end=DateMgt.getReadableTime(cal);
//						exGame.setEndTime(end);
//						exGame.setDuration(duration);
//						
//						EnergyExpenditureObservation kcal=new EnergyExpenditureObservation();
//						kcal.setValue(350+r.nextInt(251));
//						exGame.setEnergyExpenditure(kcal);
//						
//						TrainingPhaseInfo wu=new TrainingPhaseInfo();
//						wu.setDuration((int) Math.round(duration*wutp));
//						int min=tp.getWarmingHRzoneMin();
//						int max=tp.getWarmingHRzoneMax();
//						float avg=(max+min)/2;
//						max=max+r.nextInt(8);
//						wu.setMaxHR(max);
//						wu.setMinHR(min);
//						wu.setAverageHR(avg);
//						exGame.setWarmingDuration(wu);
//						
////						TrainingPhaseInfo st=new TrainingPhaseInfo();
////						st.setDuration((int) Math.round(duration*sttp));
////						min=tp.getStretchingHRzoneMin();
////						max=tp.getStretchingHRzoneMax();
////						avg=(max+min)/2;
////						max=max+r.nextInt(8);
////						st.setMaxHR(max);
////						st.setMinHR(min);
////						st.setAverageHR(avg);
////						exGame.setStretchingDuration(st);
//						
//						TrainingPhaseInfo ae=new TrainingPhaseInfo();
//						ae.setDuration((int) Math.round(duration*aetp));
//						min=tp.getMainHRzoneMin();
//						max=tp.getMainHRzoneMax();
//						avg=(max+min)/2;
//						max=max+r.nextInt(8);
//						ae.setMaxHR(max);
//						ae.setMinHR(min);
//						ae.setAverageHR(avg);
//						exGame.setMainDuration(ae);
//						
////						exGame.setCoolDownDuration((int) Math.round(duration*cdtp));
////						
////						exGame.setRelaxationDuration((int) Math.round(duration*wutp));
//						
//						TrainingPhaseInfo cd=new TrainingPhaseInfo();
//						cd.setDuration((int) Math.round(duration*cdtp));
//						min=tp.getCooldownHRZoneMin();
//						max=tp.getCooldownHRZoneMax();
//						avg=(max+min)/2;
//						max=max+r.nextInt(8);
//						cd.setMaxHR(max);
//						cd.setMinHR(min);
//						cd.setAverageHR(avg);
//						exGame.setCoolDownDuration(cd);
//						
//
//						
//						exGame.setScore(5+r.nextInt(25));
//						
//						sessions.add(exGame);
//						countGame++;
//					}
//					break;
//				case 3:
//					if(countActivity<activity+N){
//						
//						ActiveLifestylePASession pa=new ActiveLifestylePASession();
//						pa.setDate(actual);
//						cal.set(Calendar.HOUR_OF_DAY, r.nextInt(23));
//						cal.set(Calendar.MINUTE,r.nextInt(59));
//						String start=DateMgt.getReadableTime(cal);
//						pa.setStartTime(start);
//						int duration=20+r.nextInt(45);
//						cal.add(Calendar.MINUTE, duration);
//						String end=DateMgt.getReadableTime(cal);
//						pa.setEndTime(end);
//						pa.setDuration(duration);
//						
//						EnergyExpenditureObservation kcal=new EnergyExpenditureObservation();
//						kcal.setValue(350+r.nextInt(251));
//						pa.setEnergyExpenditure(kcal);
//						
//						pa.setType(ActivityType.values()[r.nextInt(3)]);
//						
//						pa.setMonitored(!(r.nextInt(4)==0));
//						if (pa.isMonitored()){
//							pa.setStepsNumber(6000+r.nextInt(4000));
//							pa.setAverageHeartRate(120);
//						}else{
//							pa.setIntensity(ActiveLifestylePAIntensityType.MODERATE);
//							pa.setDescription("in the park");
//						}
//						
//						pa.setIntensity(ActiveLifestylePAIntensityType.values()[r.nextInt(3)]);
//						
//						sessions.add(pa);
//						
//						countActivity++;
//					}
//					break;
//				default:
//					break;
//				}
//			}
//
//			cal.add(Calendar.DAY_OF_MONTH, -i);
//		}
//		
//		crs.setExerciseSession(sessions);
//		
//		return crs;
//	}
//	

}
