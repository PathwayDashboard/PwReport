<script>

var MSsessions=${jsonSessions}

var aLabels=JSON.parse('${aLabels}')

// var aLabels = {"3":"Walking Static"}

$(document).ready(
		
		function() {
			$('[data-toggle="popover"]').popover({
				title : 'Default title value',
				html : true
			})
			
			checkMsError();
			
			hideErrorDates();
			$("#alertSaved").hide()
			$("#alert_modal").hide()
			$("#alert_modal_0").hide()
			$("#alert_modal_1").hide()
			$("#alert_modal_2").hide()
			
			$("#saveNotTagged").prop("disabled",true);
			
// 			console.log("MSsessions: "+MSsessions)
			if(MSsessions != null && MSsessions.length < 1){
				console.log("MSsessions Empty")
				$("#saveAll").prop("disabled",true);
			}else{
				$("#saveAll").prop("disabled",false);
			}
			
			
// 			$('[data-toggle="popover"]').popover()
			$("#taggedInfo").hide();
			$("#notTaggedInfo").hide();
			$("#notMonitoredInfo").hide();
			$("#saveNotMonitored").prop("disabled",true);
			
			var startDate=$("#lastPresent").text();
			var momStartDate=moment(startDate,"DD-MM-YYYY");
			momStartDate.add(1, 'd');
			startDate=momStartDate.format("DD-MM-YYYY");
			
			var dayString=$("#day").val();
// 			var dayString=moment(day,"DD-MM-YYYY");
			var now=moment();
			var today=now.format("DD-MM-YYYY");
			
			if(dayString.localeCompare(today)==0){
// 				alert(dayString+" == "+today);
				$("#mscloud").prop("disabled",true);
			}else{
				$("#mscloud").prop("disabled",false);
			}
			
			$('.input-daterange').datepicker({
				format : "dd-mm-yyyy",
				todayBtn : true,
				clearBtn : true,
				startDate: startDate
			}).on('changeDate', function(e) {
				var date=e.date;
				
				var curr_date = date.getDate();
				curr_date=curr_date+"";
				curr_date=curr_date.length==1 ? "0"+curr_date : curr_date; 
				
				var curr_month = date.getMonth()+1;
				curr_month = curr_month + "";
				curr_month=curr_month.length==1 ? "0"+curr_month : curr_month; 
				
				var curr_year = date.getFullYear();

				var readable = curr_date + "-" + curr_month + "-" + curr_year;
// 				alert(readable);
				$("#formMS").submit();
		    }),
			$('#saveAll').click(function() {
				var figli = $("#accordion").children();
				var ids= [];
				var cbs= $(":checkbox");
				var count=0;
				var sessions = [];
				for (var i=0;i<cbs.length;i++){
					if (cbs[i].checked){
						ids[count]=(cbs[i].id).substring(3);
						var buttonId="sel_"+ids[count];
						var notesId="comment_"+ids[count];
						var kcalId="kcal_"+ids[count];
						var hrId="hr_"+ids[count];
						var stepsId="steps_"+ids[count];
						var type=$('#'+buttonId)[0].value;
						var notes=$('#'+notesId).value;
						var kcal=$('#'+kcalId)[0].text;
						var hr=$('#'+hrId)[0].text;
						var steps=$('#'+stepsId)[0].text;
						
						var session=new Object();
						session.pos=count;
						session.type=type;
						session.description=notes;
						session.monitored=true;
						session.kcal=kcal;
						session.hr=hr;
						session.steps=steps;
						
						session.date=$("#day").val();
						var rangeText=$("#range_"+ids[count]).text();
						session.startTime=rangeText.substring(0,5);
						session.endTime=rangeText.substring(8,13);
						
						var current=MSsessions[i];
// 						alert("Da memorizzare anche "+current.startTime+" zona 61-70: "+current.minIn6170)
						session.minIn050=current.minIn050;
						session.minIn5160=current.minIn5160;
						session.minIn6170=current.minIn6170;
						session.minIn7180=current.minIn7180;
						session.minIn8190=current.minIn8190;
						session.minIn91100=current.minIn91100;
						session.minIn101=current.minIn101;
						
						session.duration = current.duration;
						session.kcal = current.energyExpenditure.value;
						session.hr = current.averageHeartRate;
						session.steps= current.stepsNumber;
						
						sessions[i]=session;
						
						
						
						addSession(session, "[ "+rangeText+" ]");
						
						count++;
					}
				}
				
				$.ajax({
							type : "POST",
							contentType : 'application/json; charset=utf-8',
							url : "saveIntoPathway",
							dataType: 'json',
							data: JSON.stringify(sessions),
							success : function(msg) {
								var ret=msg;
								var regex = /ERROR/gi;
							  	var results=ret.match(regex);
								if(results==null || results.length==0){
// 									if (count>0) {
// 										showAlert();
// 										if (count=cbs.length){
// 											$("#saveAll").prop("disabled",true);
// 										}
// 									}
//// 									addSession(session,null);
									showAlert()
								}else{
									$("#notMonitored").modal('hide');
									bootstrap_alert.warning(ret);
								}
							}
						})
			}),
			
			$("#saveNotMonitored").click(function() {
				var type=$("#sel_NotMonitored")[0].value;
				var duration=$("#duration_NotMonitored")[0].value;
				var intensity=$("#intensity_NotMonitored")[0];
// 				intensity=document.querySelector('input[name="intensity"]:checked').value;
				intensity=$('input[name="intensity"]:checked').attr('id');
// 				[0].labels[0].innerText;
				var sessions = []
				var session=new Object();
				session.duration=duration;
				session.intensity=intensity;
				session.type=type
				session.monitored=false;
				session.date=$("#day").val();
				
				sessions[0]=session;
				$.ajax({
					type : "POST",
					contentType : 'application/json; charset=utf-8',
					url : "saveIntoPathway",
					dataType: 'json',
					data: JSON.stringify(sessions),
					success : function(msg) {
							var ret=msg;
							var regex = /ERROR/gi;
						  	var results=ret.match(regex);
							if(results==null || results.length==0){
								showModalAlert();
								$("#saveNotMonitored").prop("disabled",true);
								addSession(session,null);
							}else{
								$("#notMonitored").modal('hide');
								bootstrap_alert.warning(ret);
							}
							
					}
				})
				
			})
			
			$(".addNotTagged").click(function() {
// 				alert("clicked "+this.id);

				var day=$("#day").val();
// 				var giorno=day.substring(0,2);
// 				var mese=day.substring(3,5)-1;
// 				var anno=day.substring(6,10);
// 				var dayDate=new Date(anno,mese,giorno,0,0,0,0);
				
				var id=this.id.substring(9);
				var range=$("#range_"+id);
				var rangeText=$("#range_"+id).text();
				
				$("#row_summary").hide();
				$("#notTagged").modal();
				$("#alert_modal_nt").hide();
				$("#time").children().remove();
				$("#time").html(" ["+rangeText+"]");
				
				var min=rangeText.substring(0,6);
				var max=rangeText.substring(8,14);
				
				var timeMin = moment(day+" "+min,"DD-MM-YYYY HH:mm");
				var timeMax = moment(day+" "+max,"DD-MM-YYYY HH:mm");
				
				
// 				$('#datetimepickerFrom').children().remove();
// 				$('#datetimepickerTo').children().remove();
// 				$('#datetimepickerFrom').html("<input type='text' class='form-control'> <span class='input-group-addon'> <span	class='glyphicon glyphicon-time'></span></span>");
// 				$('#datetimepickerTo').html("<input type='text' class='form-control'> <span class='input-group-addon'> <span class='glyphicon glyphicon-time'></span></span>");
				
				if ($('#datetimepickerFrom').data("DateTimePicker")!=null){
					$('#datetimepickerFrom').data("DateTimePicker").destroy();
				}
				if ($('#datetimepickerTo').data("DateTimePicker")!=null){
					$('#datetimepickerTo').data("DateTimePicker").destroy();
				}
				
// 				 $('#datetimepickerFrom').datetimepicker(); //test input da tastiera - non funziona neanche la base
				
			    var from = $('#datetimepickerFrom').datetimepicker({
			    	format: "HH:mm",
			    	minDate: timeMin,
			    	maxDate: timeMax
			    });
				var to = $('#datetimepickerTo').datetimepicker({
			    	format: "HH:mm",
			    	maxDate: timeMax,
			    	minDate: timeMin
			    });
				
				from.on("dp.change", function (e) {
		            to.data("DateTimePicker").minDate(e.date);
		        });
				
				to.on("dp.change", function (e) {
		            from.data("DateTimePicker").maxDate(e.date);
		        });
				
				
// 				$('#datetimepickerFrom').data("DateTimePicker").minDate(timeMin);
// 				$('#datetimepickerFrom').data("DateTimePicker").maxDate(timeMax);
// 				$('#datetimepickerFrom').data("DateTimePicker").defaultDate(timeMin);
				
// 				$('#datetimepickerTo').data("DateTimePicker").minDate(timeMin);
// 				$('#datetimepickerTo').data("DateTimePicker").maxDate(timeMax);
// 				$('#datetimepickerTo').data("DateTimePicker").defaultDate(timeMax);
				
			})
			
// 			$("#datetimepickerTo").on("dp.change", function (e) {
           			 
//            			if ($('#datetimepickerFrom').data("DateTimePicker")!=null){
//     					$('#datetimepickerFrom').data("DateTimePicker").destroy();
//     				}
           			
//            		  $('#datetimepickerFrom').datetimepicker({
//   			    	format: "HH:mm",
//   			    	minDate: e.date,
//   			    });
//       		  });
//        		 $("#datetimepickerFrom").on("dp.change", function (e) {
// //          		   $('#datetimepickerTo').data("DateTimePicker").maxDate(e.date);
         		   
//          		  if ($('#datetimepickerTo').data("DateTimePicker")!=null){
//   					$('#datetimepickerTo').data("DateTimePicker").destroy();
//   				}
         			
//          		  $('#datetimepickerTo').datetimepicker({
// 			    	format: "HH:mm",
// 			    	minDate: e.date,
// 			    });
         		   
//        		 });
			
			$("#mscloud").click(function() {
				var day=$("#day").val();
				var giorno=day.substring(0,2);
				var mese=day.substring(3,5)-1;
				var anno=day.substring(6,10);
				var dayDate=new Date(anno,mese,giorno,0,0,0,0);
				dayDate.setTime(dayDate.getTime()+1000*60*60*24);
				
				var curr_date = dayDate.getDate();
				curr_date=curr_date+"";
				curr_date=curr_date.length==1 ? "0"+curr_date : curr_date; 
				var curr_month = dayDate.getMonth()+1;
				curr_month = curr_month + "";
				curr_month=curr_month.length==1 ? "0"+curr_month : curr_month; 
				var curr_year = dayDate.getFullYear();
				var readable = curr_date + "-" + curr_month + "-" + curr_year;
// 				dayDate.setDate(dayDate.getDate() + 1);
// 				alert("Call the MS API for day: "+readable);
				$("#day").val(readable);
			})
			
			$("#retrieveSummary").click(function() {
				$("#saveNotTagged").prop("disabled",false);
				
				var pickerFrom=$("#datetimepickerFrom").data("DateTimePicker");
				var pickerTo=$("#datetimepickerTo").data("DateTimePicker");
				
				var momFrom=pickerFrom.date();
				var momTo=pickerTo.date();
				
				var from=momFrom.toDate();
				var to=momTo.toDate();
				
				var dates = [];
				dates[0]=from;
				dates[1]=to;
				
// 				fine antecedente all inizio
				if (momTo<momFrom){ 
					showErrorDates();
					return;
				}else{
					hideErrorDates();
				}
				
				$.ajax({
					type : "POST",
					contentType : 'application/json; charset=utf-8',
					url : "createSessionSummary",
					dataType: 'json',
					data: JSON.stringify(dates),
					success : function(msg) {
							refreshSummary(msg);
					}
				})
				
			})
			
			$("#saveNotTagged").click(function() {
				var duration=$("#summary_duration").text();
				var hr=$("#summary_hr").text();
				var kcal=$("#summary_kcal").text();
				var steps=$("#summary_steps").text();
				var description=$("#summary_comment").val();
				var type=$("#sel_NotTagged").val();
				
				
				var pickerFrom=$("#datetimepickerFrom").data("DateTimePicker");
				var pickerTo=$("#datetimepickerTo").data("DateTimePicker");
				var momFrom=pickerFrom.date();
				var momTo=pickerTo.date();
				
				var session=new Object();
				session.type=type;
				session.description=description;
				session.duration=duration;
				session.hr=hr;
				session.kcal=kcal;
				session.steps=steps;
				session.date=$("#day").val();
				session.startTime=momFrom.format("HH:mm");
				session.endTime=momTo.format("HH:mm");
				session.monitored=true;
				
				$.ajax({
					type : "POST",
					contentType : 'application/json; charset=utf-8',
					url : "saveNotTagged",
					dataType: 'json',
					data: JSON.stringify(session),
					success : function(msg) {
						var ret=msg;
						var regex = /ERROR/gi;
					  	var results=ret.match(regex);
						if(results==null || results.length==0){
							$("#alert_modal_nt").fadeIn(300, function() { $(this).show(); })

							var pickerFrom=$("#datetimepickerFrom").data("DateTimePicker");
							var pickerTo=$("#datetimepickerTo").data("DateTimePicker");
							var momFrom=pickerFrom.date();
							var momTo=pickerTo.date();
							var range="[ "+momFrom.format("HH:mm")+" - "+momTo.format("HH:mm")+" ]"
//	 						$("#alredyTagged").append(" "+range);
							addSession(session, range);
							$("#saveNotTagged").prop("disabled",true);
						}else{
							$("#notMonitored").modal('hide');
							bootstrap_alert.warning(ret);
						}
						
// 							alert(msg);
						
					}
				})
				
			})
			
			$("#taggedLink").click(function() {
				var panelInfo=$("#taggedInfo");
				showInfos(panelInfo);
			})
			
			$("#notTaggedLinkInfos").click(function() {
				var panelInfo=$("#notTaggedInfo");
				showInfos(panelInfo);
			})
			
			$("#notMonitoredLinkInfos").click(function() {
				var panelInfo=$("#notMonitoredInfo");
				showInfos(panelInfo);
			})
			
			$("#intensity_NotMonitored").click(function () {
				$("#saveNotMonitored").prop("disabled",false);
			})
			
			
			$('input[type="radio"]').on('click change', function(e) {
			    showIntensityPanel();
			});
			
			$('#notTaggedLink').click(function(){
// 				var day=$("#day").val();
// 				var rangeText="00:00 - 23:59"
				
				
				$("#row_summary").hide();
				$("#notTagged").modal();
				$("#alert_modal_nt").hide();
				resetDateTimePicker();
// 				$("#time").children().remove();
// 				$("#time").html(" ["+rangeText+"]");
				
// 				var min=rangeText.substring(0,6);
// 				var max=rangeText.substring(8,14);
				
// 				var timeMin = moment(day+" "+min,"DD-MM-YYYY HH:mm");
// 				var timeMax = moment(day+" "+max,"DD-MM-YYYY HH:mm");
// // 				console.log(timeMin.toDate())
// // 				console.log(timeMin.toString())
				
// // 				console.log(timeMax.toDate())
// // 				console.log(timeMax.toString())
				
				
// 				if ($('#datetimepickerFrom').data("DateTimePicker")!=null){
// 					$('#datetimepickerFrom').data("DateTimePicker").destroy();
// 				}
// 				if ($('#datetimepickerTo').data("DateTimePicker")!=null){
// 					$('#datetimepickerTo').data("DateTimePicker").destroy();
// 				}
				
// 				var from = $('#datetimepickerFrom').datetimepicker({
// 			    	format: "HH:mm",
// 			    	minDate: timeMin,
// 			    	maxDate: timeMax
// 			    });
// 				var to = $('#datetimepickerTo').datetimepicker({
// 			    	format: "HH:mm",
// 			    	minDate: timeMin,
// 			    	maxDate: timeMax
// 			    });
			    
// 				from.on("dp.change", function (e) {
// 		            to.data("DateTimePicker").minDate(e.date);
// 		        });
				
// 				to.on("dp.change", function (e) {
// 		            from.data("DateTimePicker").maxDate(e.date);
// 		        });
				
// 			    console.log("TO: " + to)
			})
			
			$('#notMonitoredLink').click(function(){
				$("#notMonitored").modal('show');
			})
			
			$('#notShownActivitiesInfosLink').click(function(){
				var panelInfo=$("#notShownActivitiesInfos");
				showInfos(panelInfo);
			})
			
			$('#resetDateTimePicker').click(function(){
				resetDateTimePicker()
				$("#row_summary").hide();
				$("#saveNotTagged").prop("disabled",true);
				$("#alert_modal_nt").hide();
			})
			
			
});

function resetDateTimePicker(){
	var day=$("#day").val();
	var rangeText="00:00 - 23:59"
		$("#time").children().remove();
	$("#time").html(" ["+rangeText+"]");
	
	var min=rangeText.substring(0,6);
	var max=rangeText.substring(8,14);
	
	var timeMin = moment(day+" "+min,"DD-MM-YYYY HH:mm");
	var timeMax = moment(day+" "+max,"DD-MM-YYYY HH:mm");
	if ($('#datetimepickerFrom').data("DateTimePicker")!=null){
		$('#datetimepickerFrom').data("DateTimePicker").destroy();
	}
	if ($('#datetimepickerTo').data("DateTimePicker")!=null){
		$('#datetimepickerTo').data("DateTimePicker").destroy();
	}
	
	var from = $('#datetimepickerFrom').datetimepicker({
    	format: "HH:mm",
    	minDate: timeMin,
    	maxDate: timeMax
    });
	var to = $('#datetimepickerTo').datetimepicker({
    	format: "HH:mm",
    	minDate: timeMin,
    	maxDate: timeMax
    });
    
// 	if (to != undefined &&  to.data("DateTimePicker") != undefined){
// 		from.on("dp.change", function (e) {
// 	        to.data("DateTimePicker").minDate(e.date);
// 	    });
// 	}
	
// 	if (from != undefined &&  from.data("DateTimePicker") != undefined){
// 		to.on("dp.change", function (e) {
// 	        from.data("DateTimePicker").maxDate(e.date);
// 	    });
// 	}
	
}

function showIntensityPanel() {
	var intensity=$("#intensity_NotMonitored")[0];
	var id=$('input[name="intensity"]:checked').attr('id');
	$("#alert_modal_0").hide()
	$("#alert_modal_1").hide()
	$("#alert_modal_2").hide()
	$('#alert_modal_'+id).show();
}

function showAlert(){
	$("#alertSaved").show();
	var cbs= $(":checkbox");
	for (var i=0;i<cbs.length;i++){
		if (cbs[i].checked){
			var count=(cbs[i].id).substring(3);
			var panelId="panel"+count;
			$('#'+panelId).hide();
		}
	}
}

function showModalAlert(){
	$("#alert_modal").show();
}

(function ($) {
	  $('.spinner .btn:first-of-type').on('click', function() {
	    $('.spinner input').val( parseInt($('.spinner input').val(), 10) + 1);
	  });
	  $('.spinner .btn:last-of-type').on('click', function() {
	    $('.spinner input').val( parseInt($('.spinner input').val(), 10) - 1);
	  });
	})(jQuery);

function refreshSummary(msg){
	var summary=msg;
	
// 	$("#summary_duration").html(summary.duration);
// 	$("#summary_hr").html(summary.heartRateSummary.averageHeartRate);
// 	$("#summary_kcal").html(summary.caloriesBurnedSummary.totalCalories);
// 	$("#summary_steps").html(summary.stepsTaken);

	$("#summary_duration").html(summary.duration);
	$("#summary_hr").html(summary.averageHeartRate);
	$("#summary_kcal").html(summary.energyExpenditure.value);
	$("#summary_steps").html(summary.stepsNumber);
	
	$("#row_summary").show();

	
	
}

function showErrorDates(){
	$("#errorDates").fadeIn(300, function() { $(this).show(); })
}

function hideErrorDates(){
	$("#errorDates").fadeOut(300, function() { $(this).hide(); })
}

function showInfos(panel){
	panel.fadeIn(300, function() {$(this).show(); })
}

function addSession(session, range){
// 	$("#alreadySaved").append(session.duration+" "+session.type);
var time=range!=null ? range : session.duration+" minutes";
var code = session.type;
var label = aLabels[code];
	$("#alreadySaved").append("<div class='panel panel-default'> <div class='panel-heading' role='tab'><h4 class='panel-title'>	<table>		<tr>			<td  style='padding-right: 20px'> "+
			time+
			"</span> </a></td>			<td style='padding-right: 20px'> "+
			label+
			"</td>			<td>			</td>			<td>			</td>		</tr>	</table></h4></div></div>")

}

function checkMsError(){
	var errors = ${msError}
	console.log(errors)
	if (errors !== undefined){
		$("#msError").show()		    		
	}else{
		$("#msError").hide()	
	}
}


</script>
