<script>


var colorArray=["#97C297","#D9726F","#2C628C"];


$(document).ready(function() {
	
	$.fn.editable.defaults.mode = 'inline'
	$('#addNew').hide()
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
	
	$(document).ready(function() {
	    $('.editable').editable();
	})
	
	$('#print').click(function() {
            printDiv();
	})
	
	$('.doubleclick').click(function(){
		console.log(this.id); //first_
		var num=(this.id).substring(6);
		var spanId="remove_"+num;
		$('#'+this.id).hide();
		$('#'+spanId).show();
	})
	
	$('.remove').click(function() {
		console.log(this.id); //remove_
		var num=(this.id).substring(7);
		//qui chiamata ajax
		$("#"+num).hide();
	})

	$('#addNewUrl').click(function() {
		$('#addNew').show();
	})
	
	$('#closeModalDoc').click(function(){
		refresh();
	})
	
	
	$('#saveNewUrl').click(function() {
			//chiamata ajax + refresh su ok
// 			dimension=
			
// 			$.ajax({
// 				type : "POST",
// 				contentType : 'application/json; charset=utf-8',
// 				url : "addVideoUrl",
// 				dataType : 'json',
// 				data : { dimension: dimension, type: type, url: link } ,
// 				success : function(msg) {
// 					var ret = msg;
// 					var regex = /ERROR/gi;
// 					var results = ret.match(regex);
// 					if (results == null || results.length == 0) {
// 						// 									if (count>0) {
// 						// 										showAlert();
// 						// 										if (count=cbs.length){
// 						// 											$("#saveAll").prop("disabled",true);
// 						// 										}
// 						// 									}
// 						//// 									addSession(session,null);
// 					} else {
// 						$("#notMonitored").modal('hide');
// 						bootstrap_alert.warning(ret);
// 					}
// 				}
// 			})

			refresh();

		})

		// 	$('#closeModal').click(function() {
		// 		//chiamata ajax + refresh su ok
		// 		refresh();
		// 	})

	})

	function refresh() {
// 		window.location.reload();
		window.location.replace("physicalActivity.html")
	}
	
	function printDiv() {
		//Get the HTML of div
		var divElements = $('#card').html();
		//Get the HTML of whole page
		var oldPage = document.body.innerHTML;

		//Reset the page's HTML with div's HTML only
		document.body.innerHTML = "<html><head>" + divElements + "</body>";

		//Print Page
		window.print();

		//Restore orignal HTML
		document.body.innerHTML = oldPage;
		$('#print').click(function() {
			printDiv();
		})
	}
</script>


<!-- + -->
<%--               +"<head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8>" --%>
<!--               +"<meta name='viewport' 	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'>" -->
<!--               +"<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1' />" -->
<!--               +"<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>" -->
<!--               +"<link rel='shortcut icon' href='resources/images/logo_trasparente.png'>" -->
<!--               +"<title><tiles:insertAttribute name='title' ignore='true' /></title>" -->
<!--               +"<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic' rel='stylesheet' type='text/css'>" -->
<!--               +"<link href='resources/css/w3.css' rel='stylesheet'>" -->
<!--               +"<link href='resources/css/bootstrap.css' rel='stylesheet'>" -->
<!--               +"<title></title></head><body>" +  -->