<script>
	var gauge1 = new JustGage();
	var gauge2 = new JustGage();
	var gauge3 = new JustGage();

	var gauge4;
	var gauge5;
	var gauge6;

	var variables = [ gauge1, gauge2, gauge3 ];
	var amcharts = [ gauge4, gauge5, gauge6 ];

	$(document).ready(
			function() {
				
				
				var today = new Date();
				var week = new Date();
				week.setDate(week.getDate() - 7);
				var month = new Date();
				month.setDate(month.getDate() - 30);
				var start;
				var end;

				$('[data-toggle="popover"]').popover({
					title : 'Default title value',
					html : true
				});
				
				$(document).ready(function(){
				    $('[data-toggle="tooltip"]').tooltip(); 
				});


				$('.input-daterange').datepicker({
					format : "dd-mm-yyyy",
					todayBtn : true,
					clearBtn : true
				});

				$('#output').hide();

				$('#this').click(function() {
					$("#todo").show()
					thisWeek();
				});

				$('#readIt').click(
						function() {
							var text = $("#slogan").text();
							var msg = new SpeechSynthesisUtterance(text);
						    window.speechSynthesis.speak(msg);
						});
				
				creaC3LineDynamicDRAFT("#c3chartDduration");
				
				
			});

	
</script>
