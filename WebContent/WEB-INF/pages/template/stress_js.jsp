<script src="resources/js/lang-all.js"></script>
<script>


$(document).ready(function() {
	
	//sezione per modifica VIDEO URL
	initURLVideoEditing();
	
	//SEZIONE PER UPLOAD DOCUMENTI 
	$('#addNewDoc').hide()
	$('.doubleclickDoc').click(function(){
		console.log(this.id); //firstD_
		var num=(this.id).substring(7);
		var spanId="removeD_"+num;
		$('#'+this.id).hide();
		$('#'+spanId).show();
	})
	
	$('.removeDoc').click(function() {
		console.log(this.id); //removeD_
		var num=(this.id).substring(8);
		$.ajax({
							type : "POST",
							contentType : 'application/json; charset=utf-8',
							url : "removeDocAjax?id="+num,
							success : function(msg) {
								console.log("Returned MSG: "+msg);
						 		$("#D"+num).hide();
							}
						})
		//qui chiamata ajax
// 		$("#"+num).hide();
	})
	$('#showAddNewDoc').click(function() {
		$('#addNewDoc').show();
	})
	$('#closeModalDoc').click(function(){
		refresh();
	})

	
});


function refresh() {
	window.location.replace("stress.html")
}

</script>
