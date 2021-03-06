<script>


function TextAnswer(id, value) {
    this.questionId = id;
    this.value = value;
}


function YesNoAnswer(id, value) {
	 this.questionId = id;
	 this.value = value;
}


function QuantitativeAnswer(id, value) {
	 this.questionId = id;
	 this.value = value;
}



var all=${lifestyleJ};
var category=all.category;
var qs=all.questionsList;
var tot=qs.length;

$(document).ready(function() {
	
	createQuestions();
	$("#create").click(
			function() {createAnswers();});
	
	$('.selectpicker').selectpicker({
		  style: 'btn-info',
		  size: 4
		});

});

function createQuestions(){
	
	var padre=$("#padre");
	var html="";
	
	for (var i=0;i<tot;i++){
		var q=qs[i];
		var text=q.questionText;
		var type=q.answerType;
		var list=q.closedAnswer;
		
		var htmlType;
		html+="<div class='row' id='row_"+i+"'><div class='col-lg-12'>"
		+"<div class='col-lg-12'><div class='col-lg-8'>"
		+ "<b>"+ i +")</b>"
		+ text 
		+"</div><div class='col-lg-4'>";
		
		if (!list){
				if (type=="STRING"){
					htmlType="text"
				}else if (type=="INTEGER"){
					htmlType="number";
				}else{
				htmlType="checkbox";
				}
			html+="<input type='"+htmlType+"' class='form-control' id='ans_"+i+"'>";
		}else{
			var tlist=list.length;
			html+="<select class='selectpicker' id='question_"+i+"'>";
			
			for (var j=0;j<tlist;j++){
				var ans=list[j];
				html+="<option id='ans_"+i+"'>"+ans.answerText+"</option>"
			}
			html+="</select>"
		}
		
		html+=" </div></div></div></div>";
	}
	
	padre.append(html);
}

function createAnswers(){
	console.log("createAnswers");
	var answers=new Array();
	
	
	for (var i=0;i<tot;i++){
		var q=qs[i];
		var id=q.id;
		
		var type=q.answerType;
		var list=q.closedAnswer;
		
		var value;
		
		var answer;

		if (!list){
				if (type=="STRING"){
					value=$("#ans_"+i).value();
					answer=new TextAnswer(id,value);
				}else if (type=="INTEGER"){
					value=$("#ans_"+i).value();
					answer=new QuantitativeAnswer(id,value);
				}else{
					obj=$("#ans_"+i);
					value=$("#ans_"+i).prop('checked') 
					answer=new YesNoAnswer(id,value);
				}
		}else{
			value = $("#question_"+i+" :selected").text();
			if (type=="STRING"){
				answer=new TextAnswer(id,value);
			}else if (type=="INTEGER"){
				answer=new QuantitativeAnswer(id,value);
			}else{
				answer=new YesNoAnswer(id,value);
			}
		}
		
		answers.push(answer);
	}
	
	var lifestyle={"read" : true, "score" : 12, "submissionDate" : moment() , "category" : all.category, "answers" : answers};
	console.log(JSON.stringify(lifestyle))
	
// 	console.log(JSON.stringify(answers));
	
	$("#risposte").append(JSON.stringify(lifestyle));
}

	
</script> 