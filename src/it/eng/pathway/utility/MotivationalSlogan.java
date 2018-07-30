package it.eng.pathway.utility;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import it.eng.pathway.controller.HomeController;
import it.eng.pathway.fake.model.ExerciseSession;
import it.eng.pathway.utilitymodel.GaugeModeller;

@Component
public class MotivationalSlogan {
	
	private MessageSource msg;
	@Autowired
    public void AccountsController(MessageSource msgSrc) {
     this.msg = msgSrc;
    }
	@Autowired
	HomeController homeController;
	
	
	//TODO - rendere indipendente dai gauges
	public String createMotivationalSlogan(ArrayList<ExerciseSession> sessions,Model model, Locale locale){
		
		//logica per la lettura o creazione degli slogan
		int k;
		double freq=0;
		double total=0;
		double avg=0;
		
		ArrayList<GaugeModeller> gauges=homeController.createGauges(sessions, model);
		if (gauges!=null && gauges.size()>0){ //HDMS fails
			if (gauges!=null){ 
				k=gauges.size();
				double[] perc=new double[k];
//				int[] sum=new int[k];
				
				
				for (int i=0;i<k;i++) {
					GaugeModeller gauge=gauges.get(i);
//					sum[i]=gauge.getDone()-gauge.getGoal();
					perc[i]=((double) gauge.getDone())/ ((double) gauge.getGoal());
				}
				
				freq=perc[0];
				total=perc[1];
				avg=perc[2];
				
				
			}else{
				//calcola freq,total,avg
				List<Integer> goals= (ArrayList<Integer>) model.asMap().get("weeksGoal");
				List<Integer> tots=(ArrayList<Integer>) model.asMap().get("weeksTot");
				int totalSessionNumber=(int) model.asMap().get("totalSessions");
				int totalSessionGoal=(int) model.asMap().get("totalSessionsGoal");
				//percentuale delle sessioni performed rispetto a quello scritto nei programmes
				freq=(double) totalSessionNumber/ (double) totalSessionGoal;
				
				
				Integer totGoals=0;
				Integer totMinutes=0;
				for (Integer current : goals) {
					totGoals+=current;
				}
				for (Integer current : tots) {
					totMinutes+=current;
				}
				//percentuale dei minuti performed rispetto a quello scritto nei programmes
				avg=(double) totMinutes/(double) totGoals;
				
			}
		}

		
		PwLogger.logger.fine(String.format("Freq: %f Total: %f Average: %f", freq,total,avg));

		double[] fasce={0.21,0.41,0.51,0.71,0.91,1};
		
		double frequenza=freq;
		double minuti=avg;
		
		int slogan=0;
		
		if (frequenza < fasce[0]){
			if (minuti < fasce[0]){
				slogan=1;
			}else if (minuti < fasce[1]){
				slogan=8;
			}else if (minuti < fasce[2]){
				slogan=15;
			}else if (minuti <fasce[3]){
				slogan=22;
			}else if (minuti <fasce[4]){
				slogan=29;
			}else if (minuti <= fasce[5]){
				slogan=36;
			}else if (minuti > fasce[5]){
				slogan=43;
			}
			
		}else if (frequenza < fasce[1]){
			if (minuti < fasce[0]){
				slogan=2;
			}else if (minuti < fasce[1]){
				slogan=9;
			}else if (minuti < fasce[2]){
				slogan=16;
			}else if (minuti <fasce[3]){
				slogan=23;
			}else if (minuti <fasce[4]){
				slogan=30;
			}else if (minuti <= fasce[5]){
				slogan=37;
			}else if (minuti > fasce[5]){
				slogan=44;
			}
			
		}else if (frequenza < fasce[2]){
			if (minuti < fasce[0]){
				slogan=3;
			}else if (minuti < fasce[1]){
				slogan=10;
			}else if (minuti < fasce[2]){
				slogan=17;
			}else if (minuti <fasce[3]){
				slogan=24;
			}else if (minuti <fasce[4]){
				slogan=31;
			}else if (minuti <= fasce[5]){
				slogan=38;
			}else if (minuti > fasce[5]){
				slogan=45;
			}
		}else if (frequenza < fasce[3]){
			if (minuti < fasce[0]){
				slogan=4;
			}else if (minuti < fasce[1]){
				slogan=11;
			}else if (minuti < fasce[2]){
				slogan=18;
			}else if (minuti <fasce[3]){
				slogan=25;
			}else if (minuti <fasce[4]){
				slogan=32;
			}else if (minuti <= fasce[5]){
				slogan=39;
			}else if (minuti > fasce[5]){
				slogan=46;
			}
		}else if (frequenza <fasce[4]){
			if (minuti < fasce[0]){
				slogan=5;
			}else if (minuti < fasce[1]){
				slogan=12;
			}else if (minuti < fasce[2]){
				slogan=19;
			}else if (minuti <fasce[3]){
				slogan=26;
			}else if (minuti <fasce[4]){
				slogan=33;
			}else if (minuti <= fasce[5]){
				slogan=40;
			}else if (minuti > fasce[5]){
				slogan=47;
			}
		}else if (frequenza <= fasce[5]){
			if (minuti < fasce[0]){
				slogan=6;
			}else if (minuti < fasce[1]){
				slogan=13;
			}else if (minuti < fasce[2]){
				slogan=20;
			}else if (minuti <fasce[3]){
				slogan=27;
			}else if (minuti <fasce[4]){
				slogan=34;
			}else if (minuti <= fasce[5]){
				slogan=41;
			}else if (minuti > fasce[5]){
				slogan=48;
			}
		}else if (frequenza > fasce[5]){
			if (minuti < fasce[0]){
				slogan=7;
			}else if (minuti < fasce[1]){
				slogan=14;
			}else if (minuti < fasce[2]){
				slogan=21;
			}else if (minuti <fasce[3]){
				slogan=28;
			}else if (minuti <fasce[4]){
				slogan=35;
			}else if (minuti <= fasce[5]){
				slogan=42;
			}else if (minuti > fasce[5]){
				slogan=49;
			}
		}
		
		String sloganKey="slogan.m"+slogan;
		
//		if (total < fasce[0]){
//			
//		}else if (total < fasce[1]){
//			
//		}else if (total < fasce[2]){
//			
//		}else if (total <fasce[3]){
//			
//		}else if (total <fasce[4]){
//			
//		}else if (total <= fasce[5]){
//			
//		}else if (total > fasce[5]){
//			
//		}
		
		String toRet=msg.getMessage(sloganKey, null, locale);
		PwLogger.logger.fine("MSG Ritornato: "+sloganKey+" "+toRet);
		return toRet;
	}

}
