function readit(gaugemodeller){
	var gauge=gaugemodeller;
	alert(gauge.title);
}


function popolaGauge(id, gaugeModel,pos){
	animaGaugeResponsive(id, parseInt(gaugeModel.start),parseInt(gaugeModel.done),parseInt(gaugeModel.goal),gaugeModel.message,pos);
}

function popolaAmGauge(id, gaugeModel,pos){
	animaAmGaugeResponsive(id, parseInt(gaugeModel.start),parseInt(gaugeModel.done),parseInt(gaugeModel.goal),gaugeModel.title,pos);
}

function parseDDMMYYYY(str){
	var parts = str.split("-");
	var dt = new Date(parseInt(parts[2], 10),
	                  parseInt(parts[1], 10) - 1,
	                  parseInt(parts[0], 10));
	dt.setHours(0, -dt.getTimezoneOffset(), 0 ,0);
	return dt;
}

function toStringDDMMYYYY(str){
	var parts = str.split("-");
	var dt = parts[2]+"-"+parts[1]+"-"+parts[0];
	return dt;
}

bootstrap_alert = function() {}; //alert for errors
bootstrap_alert.warning = function(message) {
            $('#alert_placeholder').html('<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><span>'+message+'</span></div>')
        }


