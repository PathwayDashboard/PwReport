<script src="resources/js/lang-all.js"></script>
<script>

var colorVeg="#97C297";
var colorFat="#D9726F";
var colorSalt="#2C628C";

// var colorArray=["#97C297","#D9726F","#2C628C"];
var colorArray=["#D9726F"];

var labelArray=new Array();

var smokingEvent=" - "+'${alcoholEvent}';

var goalArray=checkParameter(${goalsJs});
if (goalArray!=""){
	goalArray = goalArray.filter(function(e){return e});
}
var goalQuesions='${goalsQuestions}';

var selected;

var eventsCatArray=checkParameter(${goalsCategories});

var eventsArray=new Array();

var dayLimit=moment();
dayLimit.add(1,'d').hour(0).minute(0);

var completeGoals=checkParameter(${completeGoalsJson})
var category=checkParameter(${goalCategory})

var pastAssessments=checkParameter(${pastAssessments})

$(document).ready(function() {
	
	//sezione per modifica VIDEO URL
	initURLVideoEditing();
	

	//craere array delle etichette
	var tot=goalArray.length;
	
	for (var i=0;i<tot;i++){
		var puntino=$('#img_'+i);
		puntino.css('color',colorArray[i]);
	}
	
	var lingua='${lang}'
	var now=moment();
	var today= now.format("YYYY-MM-DD");
	
var totAns=pastAssessments.length
	
	for(var n=0;n<totAns;n++){
		var past=pastAssessments[n];
		var title=past.value + " - "+past.subcategory;
		var date=past.date;
		var colorId=getCategory(title);
		var color=colorArray[colorId];
		eventsArray.push({title : title , start : date, color : color});
		eventsArray.push({start : date, rendering : 'background', color : color});
	}
	
// 	PER CREARE QUALCHE entry
// 	for (var n=0; n<4; n++){
// 		var title=1+((n+1)%6)+" "+eventsCatArray[n%tot];
// 		var date=today;
// 		switch (n%5) {
// 		case 1:
// 			date=now.subtract(2, 'days').format("YYYY-MM-DD")
// 			break;
// 		case 2:
// 			date=now.subtract(0, 'days').format("YYYY-MM-DD");
// 			break;
// 		default:
// 			date=now.subtract(1, 'days').format("YYYY-MM-DD")
// 			break;
// 		}
// 		var colorId=getCategory(title);
// 		var color=colorArray[colorId];
// 		eventsArray.push({start : date, rendering : 'background', color : color});
// 		eventsArray.push({title : title , start : date, color : color});
// 	}

	
	
	if(tot>0){
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek'
			},
			theme: false,
			aspectRatio : 2,
			defaultDate: today,
			lang : lingua,
			selectable: true,
			selectHelper: true,
			select: function(start, end) {
				if(start<=dayLimit){
					showGoalQuestionnaire(start, end);
				}
			},
//	 		eventMouseover : function(event, jsEvent, view) {
//	 			eventHover(event);
//	 		},
			eventOrder : function(a,b){
				return compareEvents(a, b);
			},
			displayEventTime : false,
			editable: true,
			eventLimit: false, // allow "more" link when too many events
			events : eventsArray
		});
	}

	
	//TODO	
	$('#saveGoals').click(function() {
		
		var values=new Array();
		
		var tot=goalArray.length;
		for (var i=0;i<tot;i++){
			var value=$('#goal_'+i).val();
			values.push(value);
		}
		
		var answers=new Array()
		
		//ciclo sui valori calcolati
		tot=values.length;
		for (i=0;i<tot;i++){
			//solo per farlo funzionare al momento
			console.log(values[i]);
			var current=values[i];
			if (current!="undefined" && current!="" && current>0){
				console.log(values[i] + "to elaborate. i= "+ i);
				var date=selected;
				
				var title=current+eventsCatArray[i];
				
				var colorId=i;
				var color=colorArray[colorId];
				var eventData={title : title , start : date, color : color}
				var backgroundData = {start : date, rendering : 'background', color : color}
				eventsArray.push(eventData);
				$('#goal_'+i).val("");
				$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
				$('#calendar').fullCalendar('renderEvent', backgroundData, true); // stick? = true
						
				var answer = new Object()
				answer.date=selected
				answer.value=values[i]
				answer.goalId=completeGoals[i].goalId
				answer.category=category
				answer.questionId=completeGoals[i].idQuestion;
				answers.push(answer)
			}
		}
		
		$.ajax({
			type : "POST",
			contentType : 'application/json; charset=utf-8',
			url : "saveGoals",
			dataType: 'json',
			data: JSON.stringify(answers),
			success : function(msg) {
				var ret=msg;
				var regex = /ERROR/gi;
			  	var results=ret.match(regex);
				if(results==null || results.length==0){
//						if (count>0) {
//							showAlert();
//							if (count=cbs.length){
//								$("#saveAll").prop("disabled",true);
//							}
//						}
////						addSession(session,null);
				}else{
				}
			}
		})
		
		
		$('#calendar').fullCalendar('unselect');
		$('#input').modal('hide');
	});
	
});

function showGoalQuestionnaire(start, end){
	selected=start;
	$('#day').html(start.format('DD-MM-YYYY'));
	$('#input').modal('show');
}

function getLang()
{
 if (navigator.languages != undefined) 
 return navigator.languages[0]; 
 else 
 return navigator.language;
}

function eventHover(event){
	var e=event;
	var selected=e.start.format("DD-MM-YYYY");
	console.log(selected);
}

//TODO to TEST
function getCategory(title){
	var tot=eventsCatArray.length;
	for (var i=0;i<tot;i++){
		var event = eventsCatArray[i];
		var test = new RegExp(event, "gi");
		if (title.match(test))
			return i;
	}
}

function compareEvents(eventA, eventB){
	var a=eventA.title;
	var b=eventB.title;
	
	var aCat=getCategory(a);
	var bCat=getCategory(b);
	
	return aCat-bCat;
	
}

function refresh() {
	window.location.replace("alcohol.html")
}

</script>
