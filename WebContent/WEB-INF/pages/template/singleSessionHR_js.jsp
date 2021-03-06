<script>

$(document).ready(function() {
	var onTarget = "${onTarget}"
	var outOfTarget = "${outOfTarget}"
	var goalLabel = "${goalLabel}"
		
	if ( '${PA}' == 'false'){
		var map2 = ${misurazioni};
		var hrLabel = "${hrLabel}";
		var freq='${campioniAlMinuto}';
		
		var campioniWu='${wuDuration}'*freq;
		var campioniAe='${aeDuration}'*freq;
		var campioniCd='${cdDuration}'*freq;
		
//	 	creaC3LineDynamicMisurazioni("#c3chartD",map2,campioniWu,campioniWu+campioniAe,campioniWu+campioniAe+campioniCd,'${wuMin}','${wuMax}','${aeMin}','${aeMax}','${cdMin}','${cdMax}',hrLabel, '${wuLabel}', '${aeLabel}', '${cdLabel}');
		
		creaC3LineDynamicMisurazioniConFasce("#c3chartDLines",map2,campioniWu,campioniWu+campioniAe,campioniWu+campioniAe+campioniCd,
				'${wuMin}','${wuMax}','${aeMin}','${aeMax}','${cdMin}','${cdMax}',
				hrLabel, '${wuLabel}', '${aeLabel}', '${cdLabel}','${minHrLabel}','${maxHrLabel}',onTarget, outOfTarget, freq);
		
//	 	creaC3MixSummary2("#c3chartDSummary",'${wpMax}','${stMax}','${aeMax}','${cdMax}');
		
//	 	var aeInTarget = ${aeInTarget};
//	 	var aeMax= ${aeMax};
//	 	var stMax= ${stMax};
		
		
		
		
//	 	ipotizzato campionamento ogni 12 secondi, quindi 6 al minuto - questa corrispondenza deve esserci lato server
//	 	hrTimeOnTarget
//	 	creaC3HorizontalBar("#hrTimeOnTarget",'${wuInTarget}','${stInTarget}','${aeInTarget}','${cdInTarget}','${rxInTarget}');
		
//	 	creaC3HorizontalBarWithGoal("#hrTimeOnTarget", '${wuInTarget}',
//	 						'${stInTarget}', '${aeInTarget}', '${cdInTarget}',
//	 						'${rxInTarget}', '${wpMax}', '${stMax}', '${aeMax}',
//	 						'${cdMax}', '${rxMax}', onTarget, outOfTarget, '${wuLabel}', '${stLabel}', '${aeLabel}', '${cdLabel}', '${rxLabel}', '${achievedLabel}', '${notReachedLabel}');
		
		
		var wu='${wuDuration}'*freq;
		var ae=wu+'${aeDuration}'*freq;
		var cd=ae+'${cdDuration}'*freq;
		
		var wuOnTarget=0;
		var aeOnTarget=0;
		var cdOnTarget=0;
		
		var wuMin = '${wuMin}';
		var wuMax = '${wuMax}';
		var aeMin = '${aeMin}';
		var aeMax = '${aeMax}';
		var cdMin = '${cdMin}';
		var cdMax = '${cdMax}';
		
		var d = 1
		var max = 120
		var v = 0.35
		cdMin = wuMin
		
		var tot=Object.keys(map2).length;
		for (var i=0;i<tot;i++) {
				var misurazione=map2[i];
				var value=parseInt(misurazione.freq);
				if (i<wu){
					if (value>=wuMin && value<=wuMax){
						wuOnTarget++;
					}
				}else if(i<ae){
					if (value>=aeMin && value<=aeMax){
						aeOnTarget++;
					}
				}else if(i<tot){
					if(d<max){
						d++
					}
					cdMax = aeMax-(d*v);
					if (value>=cdMin && value<=cdMax){
						console.log("IN: "+secondsToHms(i)+" "+value)
						cdOnTarget++;
					}else{
						console.log("OUT: "+secondsToHms(i)+" "+value)
					}
				}
			}
		
		
		creaC3HorizontalBarWithGoal("#hrTimeOnTarget",Math.round(wuOnTarget/freq),
				Math.round(aeOnTarget/freq), Math.round(cdOnTarget/freq),
			 '${wuDuration}','${aeDuration}','${cdDuration}', onTarget, goalLabel, '${wuLabel}', '${aeLabel}', '${cdLabel}', '${achievedLabel}', '${notReachedLabel}');
		
					creaPie("#pieWu", wuOnTarget, '${wuDuration}'*freq - wuOnTarget > 0 ? '${wuDuration}'*freq - wuOnTarget : 0,
							onTarget, outOfTarget);
//	 				creaPie("#pieSt", '${stInTarget*5}',
//	 						'${stMax - wpMax - stInTarget*5}', onTarget,
//	 						outOfTarget);
					creaPie("#pieAe", aeOnTarget,
							'${aeDuration}'*freq - aeOnTarget > 0 ?'${aeDuration}'*freq - aeOnTarget : 0, onTarget,
							outOfTarget);
					creaPie("#pieCd", cdOnTarget,
							'${cdDuration}'*freq - cdOnTarget > 0 ? '${cdDuration}'*freq - cdOnTarget : 0,
							onTarget, outOfTarget);
	}
	else {
		var mis = ${misurazioni};
		
		var session=new Object();
		session.minIn050=mis[0];
		session.minIn5160=mis[1];
		session.minIn6170=mis[2];
		session.minIn7180=mis[3];
		session.minIn8190=mis[4];
		session.minIn91100=mis[5];
		session.minIn101=mis[6];
		createZoneChart("#hrPATimeOnTarget", session);
		
		creaPie("#piePA", session.minIn6170+session.minIn7180+session.minIn8190,
				session.minIn050+session.minIn5160+session.minIn91100+session.minIn101,
				onTarget, outOfTarget);
	}
	
	
	$("#moreInfos").click(function() {
		var panelInfo=$("#chartInfo");
		showInfos(panelInfo);
	})
	
	$("#moreInfoTime").click(function() {
		var panelInfo=$("#chartInfoTime");
		showInfos(panelInfo);
	})
	
	$("#moreInfoCakes").click(function() {
		var panelInfo=$("#chartInfoCakes");
		showInfos(panelInfo);
	})
	
	$("#moreInfoCakes2").click(function() {
		var panelInfo=$("#chartInfoCakes");
		showInfos(panelInfo);
	})
	
	$("#moreInfoCakes3").click(function() {
		var panelInfo=$("#chartInfoCakes");
		showInfos(panelInfo);
	})
	
	$('#readIt').click(
			function() {
				var text = $("#infos").text();
				var msg = new SpeechSynthesisUtterance(text);
			    window.speechSynthesis.speak(msg);
			});

});
			
			
function createZoneChart(id, session) {
	
	creaC3BarZonesDynamic(id, session);
	
}

function secondsToHms(d) {
    d = Number(d);
    var h = Math.floor(d / 3600);
    var m = Math.floor(d % 3600 / 60);
    var s = Math.floor(d % 3600 % 60);

    var hDisplay = h > 0 ? h + (h == 1 ? " hour, " : " hours, ") : "";
    var mDisplay = m > 0 ? m + (m == 1 ? " minute, " : " minutes, ") : "";
    var sDisplay = s > 0 ? s + (s == 1 ? " second" : " seconds") : "";
    return hDisplay + mDisplay + sDisplay; 
}

function showInfos(panel){
	panel.toggle();
// 		panel.fadeIn(300, function() {$(this).toggle(); })
}
</script> 