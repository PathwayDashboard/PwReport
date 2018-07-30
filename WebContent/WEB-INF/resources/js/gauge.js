function animaGauge(start, done, goal) {
	var totTime = 500 // millisecondi dell'animazione
	var stepper = (Math.abs(goal - done)) / 10; // gli incrementi della progress

	var $topLoader = $("#topLoader").percentageLoader({
		width : 180,
		height : 180,
		controllable : false,
		progress : start,
		onProgressUpdate : function(val) {
			$topLoader.setValue(Math.round(val * 100.0));
		}
	});

	var topLoaderRunning = false;
	if (topLoaderRunning) {
		return;
	}
	topLoaderRunning = true;
	$topLoader.setProgress(start);
	$topLoader.setValue(start);
	// var kb = start;
	// var doneKb = done;
	// var goal = goal;
	var sleep = totTime / (done / stepper);

	var animateFunc = function() {
		start += stepper;
		// $topLoader.setProgress(kb / totalKb);
		$topLoader.setProgress(start / goal);

		if (start < done) {
			setTimeout(animateFunc, sleep);
		} else {
			topLoaderRunning = false;
		}
	}

	$topLoader.setValue(done + "/" + goal);
	// $topLoader.setValue(sleep);
	setTimeout(animateFunc, sleep);
}

function animaGaugeResponsive(id, start, done, goal, message, pos) {
	// var gauge;
	var present = document.getElementById(id);
	var refresh = false
	if (present != null && present.childNodes.length > 0) {
		refresh = true;
		// variables[pos].canvas.clear();

		var container = document.getElementById(id);
		var nodi = container.childNodes;
		var size = nodi.length;
		container.removeChild(nodi[size - 1]);

	}
	// var list=present.childNodes;
	// var size=list.length;
	// var i=0;
	// for (i=0;i<size;i++){
	// var idchild=list[i].getAttribute("id");
	// present.remove(list[i]);
	// }
	// var newChild = document.createElement("div");
	// newChild.setAttribute('id',id);
	// newChild.setAttribute('class', "gauge");
	// present.appendChild(newChild);

	var massimo = goal;
	if (goal < done) {
		massimo = done;
	}

	var primo = goal / 2;
	var secondo = 3 * (goal / 4);
	var terzo = 9 * (goal / 10);
	var quarto = 11 * (goal / 10);
	var quinto = 1.2 * massimo;

	variables[pos] = new JustGage({
		// gauge = new JustGage({
		id : id,
		value : done,
		min : start,
		max : massimo,
		// title: message,
		label : Math.round((done / goal) * 100) + "% (goal:" + goal + ")",
		customSectors : [ {
			color : "#d9534f", // rosso
			lo : start,
			hi : primo
		}, {
			color : "#f0ad4e", // giallo
			lo : primo + 0.1,
			hi : terzo
		}, {
			color : "#5cb85c", // verde
			lo : terzo + 0.1,
			hi : quarto
		}, {
			// color : "#d9534f", //rosso
			color : "#5cb85c", // verde - dopo il meeting di Belfast
			lo : quarto + 0.1,
			hi : quinto
		} ],
		// levelColors: [
		// "#d9534f",
		// "#f0ad4e",
		// "#5cb85c",
		// "#337ab7",
		// "#d9534f"
		// ],
		startAnimationTime : 1750,
		startAnimationType : "<>",
		refreshAnimationTime : 1000,
		refreshAnimationType : "bounce",
		counter : true,
		gaugeWidthScale : 0.8,
		// donut: goal<done,
		relativeGaugeSize : true
	});

}

function animaAmGaugeResponsive(id, start, done, goal, message, pos) {
	
	// var gauge;
	var present = document.getElementById(id);
	var refresh = false
	if (present != null && present.childNodes.length > 0) {
		refresh = true;
		// variables[pos].canvas.clear();

		var container = document.getElementById(id);
		var nodi = container.childNodes;
		var size = nodi.length;
		container.removeChild(nodi[size - 1]);

	}
	// var list=present.childNodes;
	// var size=list.length;
	// var i=0;
	// for (i=0;i<size;i++){
	// var idchild=list[i].getAttribute("id");
	// present.remove(list[i]);
	// }
	// var newChild = document.createElement("div");
	// newChild.setAttribute('id',id);
	// newChild.setAttribute('class', "gauge");
	// present.appendChild(newChild);

	var massimo = goal;
	if (goal < done) {
		massimo = done;
	}
	
	var colors = ["#d9534f","#D9726F","#f0ad4e","#f0ad4e", "#97C297", "#5cb85c"];
	var ncp=5;
	
	var settori=6;
	var percs= [];
	var valori = [];
	var perc=1/settori;
	for (i=0;i<settori;i++){
		percs[i]=perc*i;
		valori[i] = percs[i]*massimo;
		if (done>valori[i])
			ncp=i;
	}
	
	
//	var primo = 0;
//	var secondo = 0.12 * massimo;
//	var terzo = 0.27 * massimo;
//	var quarto = 0.43 * massimo;
//	var quinto = 0.65 * massimo;
//	var sesto = 0.82 * massimo;
//	var settimo = massimo;

	var mainThick = massimo / 10;
	var minThick = massimo / 20;
	
	if (done==0){
		amcharts[pos] = AmCharts.makeChart(id, {
			"type" : "gauge",
			"fontFamily" : "Open Sans",
			"autoDisplay" : true,
			"theme" : "light",
			"precision" : -1,
//			"titles" : [ {
//				"text" : message,
//				"size" : 20
//			} ],
			"arrows" : [ {
				"value" : 0,
				"innerRadius" : "5%",
				"startWidth" : 40,
//				"radius" : "90%",
				"nailAlpha" : 1,
				"nailBorderAlpha" : 1,
				"nailBorderThickness" : 3,
				"nailRadius" : 20,
				"color" : colors[ncp]
			} ],
			"axes" : [ {
				"startAngle" : -90,
				"endAngle" : 90,
				"axisThickness" : 0.2,
				"bandAlpha" : 0.8,
				"bandOutlineAlpha" : 0.5,
				"bandOutlineThickness" : 2,
				"bandOutlineColor" : "#FFF",
//				"axisAlpha" : 0.2,
//				"tickAlpha" : 0.2,
//				"valueInterval" : mainThick * 2,
				"valueInterval" : massimo/6,
				"labelsEnabled" : true,
				"labelFunction" : function (value) {
					return creaEtichette(value);
	            },
				"labelOffset" : settori,
				"minorTickLength" : 0,
				"tickAplpha" : 0.5,
				"tickLength" : 5,
				"inside" : false,
				"bands" : [ {
					"color" : colors[5],
					"endValue" : massimo,
//					"innerRadius" : "70%",
//					"innerRadius" : "20%",
					"innerRadius" : "75%",
					"startValue" : valori[5]
				}, {
					"color" : colors[4],
					"endValue" :  valori[5],
//					"innerRadius" : "75%",
//					"innerRadius" : "20%",
					"innerRadius" : "75%",
					"startValue" : valori[4]
				}, {
					"color" : colors[3],
					"endValue" :  valori[4],
//					"innerRadius" : "80%",
//					"innerRadius" : "20%",
					"innerRadius" : "75%",
					"startValue" : valori[3]
				}, {
					"color" : colors[2],
					"endValue" :  valori[3],
//					"innerRadius" : "85%",
//					"innerRadius" : "20%",
					"innerRadius" : "75%",
					"startValue" : valori[2]
				}, {
					"color" : colors[1],
					"endValue" : valori[2],
//					"innerRadius" : "90%",
//					"innerRadius" : "20%",
					"innerRadius" : "75%",
					"startValue" : valori[1]
				}, {
					"color" : colors[0],
					"endValue" :  valori[1],
//					"innerRadius" : "95%",
//					"innerRadius" : "20%",
					"innerRadius" : "75%",
					"startValue" : valori[0]
				} ],
				"bottomText" : done,
//				"bottomTextYOffset" : -60,
//				"bottomTextFontSize" : 20,
//				"bottomTextYOffset" : -65,
				"bottomTextFontSize" : 30,
				"bottomTextColor" : colors[ncp],
				"endValue" : massimo
			} ]
		// ,
		// "export": {
		// "enabled": false
		// }
		});
	}
	else {
		amcharts[pos] = AmCharts.makeChart(id, {
			"type" : "gauge",
			"fontFamily" : "Open Sans",
			"autoDisplay" : true,
			"theme" : "light",
			"precision" : 0,
//			"titles" : [ {
//				"text" : message,
//				"size" : 20
//			} ],
			"arrows" : [ {
				"value" : done,
				"innerRadius" : "5%",
				"startWidth" : 40,
//				"radius" : "90%",
				"nailAlpha" : 1,
				"nailBorderAlpha" : 1,
				"nailBorderThickness" : 3,
				"nailRadius" : 20,
				"color" : colors[ncp]
			} ],
			"axes" : [ {
				"startAngle" : -90,
				"endAngle" : 90,
				"axisThickness" : 0.2,
				"bandAlpha" : 0.8,
				"bandOutlineAlpha" : 0.5,
				"bandOutlineThickness" : 2,
				"bandOutlineColor" : "#FFF",
//				"axisAlpha" : 0.2,
//				"tickAlpha" : 0.2,
//				"valueInterval" : mainThick * 2,
				"valueInterval" : massimo/6,
				"labelsEnabled" : true,
				"labelFunction" : function (value) {
	                return creaEtichette(value);
	            },
				"labelOffset" : settori,
				"minorTickLength" : 0,
				"tickAplpha" : 0.5,
				"tickLength" : 5,
				"inside" : false,
				"bands" : [ {
					"color" : colors[5],
					"endValue" : massimo,
//					"innerRadius" : "70%",
//					"innerRadius" : "20%",
					"innerRadius" : "75%",
					"startValue" : valori[5]
				}, {
					"color" : colors[4],
					"endValue" :  valori[5],
//					"innerRadius" : "75%",
//					"innerRadius" : "20%",
					"innerRadius" : "75%",
					"startValue" : valori[4]
				}, {
					"color" : colors[3],
					"endValue" :  valori[4],
//					"innerRadius" : "80%",
//					"innerRadius" : "20%",
					"innerRadius" : "75%",
					"startValue" : valori[3]
				}, {
					"color" : colors[2],
					"endValue" :  valori[3],
//					"innerRadius" : "85%",
//					"innerRadius" : "20%",
					"innerRadius" : "75%",
					"startValue" : valori[2]
				}, {
					"color" : colors[1],
					"endValue" : valori[2],
//					"innerRadius" : "90%",
//					"innerRadius" : "20%",
					"innerRadius" : "75%",
					"startValue" : valori[1]
				}, {
					"color" : colors[0],
					"endValue" :  valori[1],
//					"innerRadius" : "95%",
//					"innerRadius" : "20%",
					"innerRadius" : "75%",
					"startValue" : valori[0]
				} ],
				"bottomText" : done+" on "+goal,
//				"bottomTextYOffset" : -60,
//				"bottomTextFontSize" : 20,
//				"bottomTextYOffset" : -65,
				"bottomTextFontSize" : 30,
				"bottomTextColor" : colors[ncp],
				"endValue" : massimo
			} ]
		// ,
		// "export": {
		// "enabled": false
		// }
		});
	}
	
function creaEtichette(value){
	var v=value;
	v= Math.round(value*10)/10; //etichette del gauge appossimati alla prima cifra decimale
	return v;
}	
	
}