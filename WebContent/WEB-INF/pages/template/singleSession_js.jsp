<script>


var gauge1 = new JustGage();
var gauge2 = new JustGage();
var gauge3 = new JustGage();
var gauge4 = new JustGage();
var gauge5 = new JustGage();
var gauge6 = new JustGage();
var gauge7 = new JustGage();
var gauge8 = new JustGage();
var gauge9 = new JustGage();
var gauge10 = new JustGage();
var variables = [gauge1, gauge2, gauge3, gauge4, gauge5, gauge6, gauge7, gauge8, gauge9, gauge10];
var amcharts = [gauge1, gauge2, gauge3, gauge4, gauge5, gauge6, gauge7, gauge8, gauge9, gauge10];


$(document).ready(function() {
	
	
	$(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip(); 
	});
	
	var map=JSON.parse('${gaugesJson}');
	refreshGauges(map);
	
	var session=${sessionJson}
	if (session.type != null){
		console.log(session)
			$.ajax({
		        type: "get",
		        url: "translateActivity/"+session.type,
		        success: function(res){ 
		        	$('#actType').text(res)
		        }
		    })
	}

	
	
// 	model.addAttribute("hrMaxLabel", BPM_CHART_MAX);
// 	model.addAttribute("hrMinLabel", BPM_CHART_MIN);
// 	model.addAttribute("hrValuesLabel", BPM_CHART_VALUES);
// 	model.addAttribute("achievedLabel", BPM_CHART_ACHIEVED);
// 	model.addAttribute("exceededLabel", BPM_CHART_EXCEEDED);
// 	model.addAttribute("notReachedLabel", BPM_CHART_NOTREACHED);

	creaC3StepSummaryBPM("#c3chartDSummary",mapStep,'${hrMaxLabel}',
			'${hrMinLabel}','${hrValuesLabel}','${achievedLabel}',
			'${exceededLabel}','${notReachedLabel}','${wuLabel}','${aeLabel}','${cdLabel}');
	
	$("#moreInfos").click(function() {
		var panelInfo=$("#chartInfo");
		showInfos(panelInfo);
	})
	
	$('#readIt').click(
			function() {
				var text = $("#infos").text();
				var msg = new SpeechSynthesisUtterance(text);
			    window.speechSynthesis.speak(msg);
			});
	
});


function refreshGauges(gauges){
	var map = gauges;
	var keys = Object.keys(map);
	var tot=keys.length;
	for (var i=0;i<tot;i++){
// 		eval("var "+keys[i]+";");
		var modeller=map[keys[i]];
		var chiave=keys[i];
		$('#'+chiave+"Title").hide().html(modeller.title).fadeIn('fast'),
		popolaAmGauge(chiave,modeller,i);
	}
}
	var mapStep=JSON.parse('${stepJson}');
// 	creaC3StepSummary("#c3chartDSummary",mapStep);
	
	creaC3StepSummaryDuration("#c3chartDSummaryDuration",mapStep);

function showInfos(panel){
	panel.toggle();
// 		panel.fadeIn(300, function() {$(this).toggle(); })
}
	
</script> 