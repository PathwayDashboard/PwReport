<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<link href="resources/css/w3.css" rel="stylesheet">
<link href="resources/css/bootstrap.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="resources/css/metisMenu.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="resources/css/sb-admin-2.css" rel="stylesheet">

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">


<link href="http://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.8.0/fullcalendar.print.css" rel="stylesheet"	type="text/css" media="print">
<link href="http://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.8.0/fullcalendar.min.css" rel="stylesheet"	type="text/css">

<link href="resources/css/pathway.css" rel="stylesheet">

<c:forEach var="css" items="${stylesheets}">
	<link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
</c:forEach>





<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>
</head>
<body>

	<div id='calendar'></div>

</body>


<script src="resources/js/jquery-2.1.4.js"></script>
<script src="resources/js/bootstrap.js"></script>

	<script src="resources/js/metisMenu.js"></script>
	<script src="resources/js/sb-admin-2.js"></script>

<script src="resources/js/pathway.js"></script>

<script src="resources/js/moment.js"></script>

<script src="http://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.8.0/fullcalendar.min.js"></script>	
	
<script src="resources/js/lang-all.js"></script>
	
<script>

var colorVeg="#97C297";
var colorFat="#D9726F";
var colorSalt="#2C628C";

var colorArray=["#97C297","#D9726F","#2C628C","#5bc0de"];

var labelArray=new Array();

var vegEvent=" - "+'${vegEvent}';
var fatEvent=" - "+'${fatEvent}';
var saltEvent=" - "+'${saltEvent}';

var goalArray=${goalsJs};
goalArray = goalArray.filter(function(e){return e}); 
var goalQuesions='${goalsQuestions}';

var selected;

var eventsCatArray=${goalsCategories};

var eventsArray=new Array();

var dayLimit=moment();
dayLimit.add(1,'d').hour(0).minute(0);

$(document).ready(function() {

	//craere array delle etichette
	var tot=goalArray.length;
	
	for (var i=0;i<tot;i++){
		var puntino=$('#img_'+i);
		puntino.css('color',colorArray[i]);
	}
	
	var lingua='${lang}'
	var now=moment();
	var today= now.format("YYYY-MM-DD");
	
// 	PER CREARE QUALCHE entry
	for (var n=0; n<10; n++){
		var title=1+((n+1)%6)+" "+eventsCatArray[n%tot];
		var date=today;
		switch (n%5) {
		case 1:
			date=now.subtract(2, 'days').format("YYYY-MM-DD")
			break;
		case 2:
			date=now.subtract(0, 'days').format("YYYY-MM-DD");
			break;
		case 3:
			date=now.subtract(1, 'days').format("YYYY-MM-DD")
			break;
		default:
			date=now.subtract(1, 'days').format("YYYY-MM-DD")
			break;
		}
		var colorId=getCategory(title);
		var color=colorArray[colorId];
		eventsArray.push({title : title , start : date, color : color});
	}

	
	
	
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek'
		},
		aspectRatio : 2,
		lang : lingua,
		selectable: true,
		selectHelper: true,
		select: function(start, end) {
			if(start<=dayLimit){
				alert(start.format("DD-MM-YYYY"))
				showGoalQuestionnaire(start, end);
			}
		},
			
// 		eventMouseover : function(event, jsEvent, view) {
// 			eventHover(event);
// 		},
		eventOrder : function(a,b){
			return compareEvents(a, b);
		},
		displayEventTime : false,
		editable: false,
		eventLimit: false, // allow "more" link when too many events
		events : eventsArray
	});

		
		
	
	//TODO	
	$('#saveGoals').click(function() {
		
		var values=new Array();
		
		var tot=goalArray.length;
		for (var i=0;i<tot;i++){
			var value=$('#goal_'+i).val();
			values.push(value);
		}
		
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
				eventsArray.push(eventData);
				$('#goal_'+i).val("");
				$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
			}
		}
		
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
	console.log(selected + event.allDay);
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


</script>


</html>

