<script>


var colorArray=["#97C297","#D9726F","#2C628C"];


$(document).ready(function() {
	
	$('#addNew').hide()
	
	$(document).ready(function() {
	    $('.editable').editable();
	})
	
	
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
								refresh();
						 		$("#D"+num).hide();
							}
						})
		//qui chiamata ajax
// 		$("#"+num).hide();
	})

	$('#addNewDoc').click(function() {
		$('#addNew').show();
	})
	
	
// 	$('#saveNewUrl').click(function() {
// 			//chiamata ajax + refresh su ok
// // 			dimension=
			
// // 			$.ajax({
// // 				type : "POST",
// // 				contentType : 'application/json; charset=utf-8',
// // 				url : "addVideoUrl",
// // 				dataType : 'json',
// // 				data : { dimension: dimension, type: type, url: link } ,
// // 				success : function(msg) {
// // 					var ret = msg;
// // 					var regex = /ERROR/gi;
// // 					var results = ret.match(regex);
// // 					if (results == null || results.length == 0) {
// // 						// 									if (count>0) {
// // 						// 										showAlert();
// // 						// 										if (count=cbs.length){
// // 						// 											$("#saveAll").prop("disabled",true);
// // 						// 										}
// // 						// 									}
// // 						//// 									addSession(session,null);
// // 					} else {
// // 						$("#notMonitored").modal('hide');
// // 						bootstrap_alert.warning(ret);
// // 					}
// // 				}
// // 			})

// 			refresh();

// 		})

// 		// 	$('#closeModal').click(function() {
// 		// 		//chiamata ajax + refresh su ok
// 		// 		refresh();
// 		// 	})

	})

	function refresh() {
		window.location.reload();
	}

</script>