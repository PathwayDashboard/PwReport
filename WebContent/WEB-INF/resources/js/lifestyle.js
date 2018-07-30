function initURLVideoEditing(){
	//sezione per modifica VIDEO URL
	$.fn.editable.defaults.mode = 'inline'
	$('#addNew').hide()
	
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
		$.ajax({
			type : "POST",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			url : "removeVideoUrl",
			data : { "pk": num} ,
			success : function(msg) {
				var ret = msg;
				var regex = /ERROR/gi;
				var results = ret.match(regex);
				console.log(ret);
				$("#"+num).hide();
			}
		})
		
	})

	$('#addNewUrl').click(function() {
		$('#addNew').show();
	})
	
	$('#saveNewUrl').click(function() {
		
		var type = $('#newType option:selected').val();
		var link = $('#newUrl').val();
		
		$.ajax({
				type : "POST",
				contentType : 'application/x-www-form-urlencoded; charset=utf-8',
				url : "addVideoUrl",
				data : { "type": type, "url": link } ,
				success : function(msg) {
					var ret = msg;
					var regex = /ERROR/gi;
					var results = ret.match(regex);
					console.log(ret)
				}
			})
		
		refresh();
	})
	
	$(document).ready(function() {
	    $('.editable').editable();
	})
	
	$('#closeModal').click(function(){
		refresh();
	})
}


function checkParameter(variable){
	if (typeof variable == 'undefined'){
		return ""
	}
	else{
		return variable;
	}
}