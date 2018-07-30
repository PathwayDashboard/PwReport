function creaC3Line(id) {
	var goal = 420;
	var chart = c3
			.generate({
				bindto : id,
				data : {
					x : 'x',
					columns : [
							[ 'x', '2015-02-10', '2015-02-12', '2015-02-18',
									'2015-02-20', '2015-02-28', '2015-03-05',
									'2015-03-09', '2015-03-22', '2015-03-25',
									'2015-03-30' ],
							[ 'goal', 420, 420, 420, 420, 420, 420, 420, 420,
									420, 420 ],
							[ 'kcal', 200, 250, 500, 400, 320, 275, 315, 320,
									600, 700 ] ],
					types : {
						kcal : 'area-spline' // ADD
					},
					colors : {
						goal : '#d9534f', // rosso
						kcal : '#337ab7' // blu
					},
					selection : {
						enabled : true,
						multiple : true
					}
				},
				axis : {
					x : {
						type : 'timeseries',
						tick : {
							format : '%d/%m/%Y'
						}
					}
				},
				point : {
					kcal : {
						show : true,
						r : 15
					},
					goal : {
						show : false,
						r : 15
					}
				},
				grid : {
					y : {
						show : true
					}
				},
				regions : [ {
					axis : 'y',
					start : goal * 0.8,
					end : goal * 1.2,
					class : 'goalArea'
				}, ],
				zoom : {
					enabled : false,
					rescale : false
				},
				point : {
					r : 4,
					select : {
						r : 6
					}
				}
			});
}

function creaC3LineDynamic(id, json) {
	var map = json;
	var keys = Object.keys(map);
	var tot = keys.length;

	var xlabels;
	var xclass;
	var xgame;
	var active;
	var goalvalues;
	
	var notacc;

	for (var i = 0; i < tot; i++) {
		var label = map[keys[i]][0]
		if (label == "x") {
			xlabels = map[keys[i]];
		} 
//		else if (label == "Goal") {
//			goalvalues = map[keys[i]];
//		} 
		else if (label == "ExerClass") {
			xclass = map[keys[i]];
		} else if (label == "ExerGame") {
			xgame = map[keys[i]];
		} else if (label == "ActiveLifeStyle") {
			active = map[keys[i]];
		} 
//		else if (label == "NotAcceptable") {
//			notacc = map[keys[i]];
//		}
	}

	var goalmin = 10000;
	var goalmax = 0;

//	var elements = goalvalues.length;
	var elements = xlabels.length;
	for (var i = 0; i < elements; i++) {
		var curr = elements[i];
		if (curr < goalmin) {
			goalmin = curr;
		}
		if (curr > goalmax) {
			goalmax = curr;
		}
	}

	// var valuename=xclass[0];
	// var goalname=goalvalues[0];

	var chart = c3.generate({
		bindto : id,
		data : {
			x : 'x',
			columns : [ xlabels, xclass, xgame, active ],
//			columns : [ xlabels, xclass, xgame, active, notacc ],
			types : {
				ExerClass : 'bar',
				ExerGame : 'bar',
				ActiveLifeStyle : 'bar'
//				NotAcceptable : 'bar'
			},
			groups : [ [ "ExerClass", "ExerGame", "ActiveLifeStyle" ] ],
//			groups : [ [ "ExerClass", "ExerGame", "ActiveLifeStyle", "NotAcceptable" ] ],
			colors : {
//				Goal : '#d9534f', // rosso
				ExerClass : '#2C628C', // navy
				ExerGame : '#551A8B', // purple
				ActiveLifeStyle : '#DCB4F2' // violet
//				NotAcceptable : "#DDD"
			},
			selection : {
				enabled : true,
				multiple : true
			}
		},
		axis : {
			x : {
				type : 'timeseries',
				tick : {
					format : '%d-%m-%Y'
				}
			}
		},
		point : {
			ExerClass : {
				show : true,
				r : 15
			},
			ExerGame : {
				show : true,
				r : 15
			},
			ActiveLifeStyle : {
				show : true,
				r : 15
			}
//			NotAcceptable : {
//				show : true,
//				r : 15
//			}
//			,
//			goal : {
//				show : false,
//				r : 15
//			}
		},
		grid : {
			y : {
				show : true
			}
		},
		regions : [ {
			axis : 'y',
			start : goalmin,
			end : goalmax,
			class : 'goalArea'
		}, ],
		zoom : {
			enabled : false,
			rescale : false
		},
		point : {
			r : 4,
			select : {
				r : 6
			}
		},
		bar: {
	        width: {
	            ratio: 0.9 // this makes bar width 50% of length between ticks
	        }
		}
	});
}

//function creaC3LineDynamicMisurazioni(id, json, wpMax, stMax, aeMax, cdMax,
//		rxMax, etichetta) {
//	var array = json;
//
//	var tot = array.length;
//	var ids = new Array(tot + 1);
//	var values = new Array(tot + 1);
//	for (var i = 0; i <= tot; i++) {
//		if (i == 0) {
//			ids[i] = "Misurazione";
//			values[i] = "HR";
//		} else {
//			ids[i] = array[i - 1].id;
//			values[i] = array[i - 1].freq;
//		}
//	}
//
//	var chart = c3.generate({
//		bindto : id,
//		data : {
//			x : 'Misurazione',
//			columns : [ ids, values, ],
//			types : {
//				HR : 'spline'
//			},
//			colors : {
//				HR : '#d9534f'
////				HR : '#97C297'
//			},
//			selection : {
//				enabled : true,
//				multiple : true
//			}
//		},
//		axis : {
//			x : {
//				// type : 'timeseries',
//				// tick : {
//				// format : '%d-%m-%Y'
//				//						
//				show : false
//			}
//		},
//		point : {
//			HR : {
//				show : true,
//				r : 15
//			}
//		},
//		grid : {
//			y : {
//				show : true
//			}
//		},
//		regions : [ {
//			axis : 'x',
//			start : 0,
//			end : wpMax,
//			class : 'greenArea'
//		}, {
//			axis : 'x',
//			start : wpMax,
//			end : stMax,
//			class : 'yellowArea'
//		}, {
//			axis : 'x',
//			start : stMax,
//			end : aeMax,
//			class : 'goalArea'
//		}, {
//			axis : 'x',
//			start : aeMax,
//			end : cdMax,
//			class : 'blueArea'
//		}, {
//			axis : 'x',
//			start : cdMax,
//			end : rxMax,
//			class : 'greyArea'
//		},
//
//		{
//			axis : 'y',
//			start : 80,
//			end : 100,
//			class : 'darkgreenArea'
//		}, {
//			axis : 'y',
//			start : 100,
//			end : 110,
//			class : 'darkyellowArea'
//		}, {
//			axis : 'y',
//			start : 140,
//			end : 160,
//			class : 'darkgoalArea'
//		}, {
//			axis : 'y',
//			start : 110,
//			end : 120,
//			class : 'darkblueArea'
//		}, {
//			axis : 'y',
//			start : 80,
//			end : 100,
//			class : 'darkblueArea'
//		} ],
//		zoom : {
//			enabled : false,
//			rescale : false
//		},
//		point : {
//			r : 1,
//			select : {
//				r : 6
//			}
//		},
//		subchart : {
//			show : true
//		}
//	});
//	
//	chart.data.names({'HR' : etichetta});
//}

function creaC3LineDynamicMisurazioni(id, json, wpMax, aeMax, cdMax, wuHRMin, wuHRMax, aeHRMin, aeHRMax, cdHRMin, cdHRMax, etichetta, wuLabel, aeLabel, cdLabel) {
	var array = json;

	var tot = array.length;
	var ids = new Array(tot + 1);
	var values = new Array(tot + 1);
	for (var i = 0; i <= tot; i++) {
		if (i == 0) {
			ids[i] = "Misurazione";
			values[i] = "HR";
		} else {
			ids[i] = array[i - 1].id;
			values[i] = array[i - 1].freq;
		}
	}

	var chart = c3.generate({
		bindto : id,
		data : {
			x : 'Misurazione',
			columns : [ ids, values, ],
			types : {
				HR : 'spline'
			},
			colors : {
				HR : '#d9534f'
//				HR : '#97C297'
			},
			selection : {
				enabled : true,
				multiple : true
			}
		},
		axis : {
			x : {
				// type : 'timeseries',
				// tick : {
				// format : '%d-%m-%Y'
				//						
				show : false
			}
		},
		point : {
			HR : {
				show : true,
				r : 15
			}
		},
		grid : {
			y : {
				show : true
			}
		},
		regions : [ {
			axis : 'x',
			start : 0,
			end : wpMax,
			class : 'greenArea'
		}, {
			axis : 'x',
			start : wpMax,
			end : aeMax,
			class : 'goalArea'
		}, {
			axis : 'x',
			start : aeMax,
			end : cdMax,
			class : 'blueArea'
		},

		{
			axis : 'y',
			start : wuHRMin,
			end : wuHRMax,
			class : 'darkgreenArea'
		}, {
			axis : 'y',
			start : aeHRMin,
			end : aeHRMax,
			class : 'darkgoalArea'
		}, {
			axis : 'y',
			start : cdHRMin,
			end : cdHRMax,
			class : 'darkblueArea'
		}],
		zoom : {
			enabled : false,
			rescale : false
		},
		point : {
			r : 1,
			select : {
				r : 6
			}
		},
		subchart : {
			show : true
		},
		tooltip : {
			// format: {
			// title: function (x) { return 'Data ' + x; }
			// }
			contents : function(d, defaultTitleFormat,
					defaultValueFormat, color) {
				 var $$ = this, config = $$.config,
	              titleFormat = config.tooltip_format_title || defaultTitleFormat;
				 var title;
				 title = titleFormat ? titleFormat(d[0].x) : d[0].x;
				 
				 var campione=d[0].x;
				 
				 if (campione <= wpMax ){
					 title = wuLabel;
					 color="#EBFCE3";
				 }else if (campione <= aeMax){
					 title = aeLabel;
					 color="#ffebeb";
				 }else if (campione <= cdMax){
					 title = cdLabel;
					 color="#eff9ff";
				 }
				 
//				 return "<h6>"+title+"</h6>";
				 var value = d[0].value;
//				var mins=d[0].value;
//				var goal=d[1].value;
//				var color="";
//				if (mins<goal){
//					color="#D9726F";
//					toShow="<font color="+color+"><b> "+notAchieved+" </b><i class='fa fa-times'></i></color>";
//					goalToShow="";
//					
//				}else{
//					beep();
//					color="#337ab7";
//					toShow="<font color="+color+"><b> "+achieved+" </b><i class='fa fa-thumbs-up'></i></font>";
//					goalToShow= "";
//				}
//				toShow+= " "+mins;
//				goalToShow += " "+goal;
				return "<table class='c3-tooltip'><tbody><tr><th colspan='2' style='color: black; background-color:"
						+ color
						+ "';>"
						+ title
						+ "</th></tr><tr class='c3-tooltip-name-Minutes'><td class='name'><span style='background-color:#d9534f'></span>"
						+ value
						+ "</td></tr></tbody></table>";
			}
		}
	});
	
	chart.data.names({'HR' : etichetta});
}

function creaC3LineDynamicMisurazioniConFasce(id, json, wpMax, aeMax, cdMax, wuHRMin, wuHRMax, aeHRMin, aeHRMax, cdHRMin, cdHRMax, 
		etichetta, wuLabel, aeLabel, cdLabel,minHRLabel, maxHRLabel,inTargetLabel,outOfTargetLabel, freq) {
	var array = json;

	var tot = array.length;
	var ids = new Array(tot + 1);
	var values = new Array(tot + 1);
	var goalMin = new Array(tot+1);
	var goalMax = new Array(tot+1);
	var tags = new Array(tot+1);
	var d = 1
	var max = 120
	var v = 0.35;
	for (var i = 0; i <= tot; i++) {
		if (i == 0) {
			ids[i] = "Misurazione";
			values[i] = "HR";
			goalMin[i] = "goalMin";
			goalMax[i] = "goalMax";
			tags[i] = 0;
		} else {
			ids[i] = (array[i - 1].id);
			values[i] = array[i - 1].freq;
			tags[i]= Math.floor((ids[i])/freq);
			if (i<=wpMax){
				goalMin[i]=wuHRMin;
				goalMax[i]=wuHRMax;
			}else if(i<=aeMax){
				goalMin[i]=aeHRMin;
				goalMax[i]=aeHRMax;
			}else if(i<=tot){
//				goalMin[i]=cdHRMin;
//				goalMax[i]=cdHRMax;
				if (d <= max){
					d++;
				}
				goalMax[i]=aeHRMax-(d*v);
				goalMin[i]=wuHRMin;
			}
//			console.log("id: "+ids[i]+" value: "+values[i] + " goalMin: "+goalMin[i]+ " goalMax: "+goalMax[i])
		}
	}

	var chart = c3.generate({
		bindto : id,
		data : {
			x : 'Misurazione',
			columns : [ ids,goalMin, goalMax,values],
			types : {
				HR : 'spline',
				goalMin : 'step',
				goalMax : 'step'
			},
			colors : {
				HR : '#97C297',
				goalMin : '#337ab7',
				goalMax : '#d9534f'
			},
			selection : {
				enabled : true,
				multiple : true
			}
		},
		axis : {
			x : {
				// type : 'timeseries',
				// tick : {
				// format : '%d-%m-%Y'
				//						
				show : false
			}
		},
		point : {
			focus: {
			    expand: {
			      enabled: true,
			      r : 8
			    }
			  }
			},
		grid : {
			y : {
				show : true
			}
		},
		regions : [ {
			axis : 'x',
			start : 0,
			end : wpMax,
			class : 'greenArea'
		}, {
			axis : 'x',
			start : wpMax,
			end : aeMax,
			class : 'goalArea'
		}, {
			axis : 'x',
			start : aeMax,
			end : tot,
			class : 'blueArea'
		}

		],
		zoom : {
			enabled : true,
			rescale : true
		},
		subchart : {
			show : false
		},
		tooltip : {
			// format: {
			// title: function (x) { return 'Data ' + x; }
			// }
			contents : function(d, defaultTitleFormat,
					defaultValueFormat, color) {
				 var $$ = this, config = $$.config,
	              titleFormat = config.tooltip_format_title || defaultTitleFormat;
				 var title;
				 title = titleFormat ? titleFormat(d[0].x) : d[0].x;
				 
				 var campione=d[2].x;
				 var value = d[2].value;
				 var min=d[0].value;
				 var max=d[1].value;
				 var minToShow = moment(tags[campione],"mm").format("HH:mm");
				 
				 labelColor = "#000";
				 
				if (campione <= wpMax) {
					title = wuLabel;
					color = "#EBFCE3";
					rowColor = '#FFF';
					if (value >= min && value <= max) {
						toShow="<font color="+labelColor+"><b> "+inTargetLabel+" </b><i class='fa fa-thumbs-up'></i></font>";
						rowColor = '#97C297';
					}else {
						toShow="<font color="+labelColor+"><b> "+outOfTargetLabel+" </b><i class='fa fa-times'></i></font>";
						rowColor = '#D9726F';
					}
				} else if (campione <= aeMax) {
					title = aeLabel;
					color = "#ffebeb";
					if (value >= min && value <= max) {
						toShow="<font color="+labelColor+"><b> "+inTargetLabel+" </b><i class='fa fa-thumbs-up'></i></font>";
						rowColor = '#97C297';
					}else {
						toShow="<font color="+labelColor+"><b> "+outOfTargetLabel+" </b><i class='fa fa-times'></i></font>";
						rowColor = '#D9726F';
					}
				} else if (campione <= tot) {
					title = cdLabel;
					color = "#eff9ff";
					if (value >= min && value <= max) {
						toShow="<font color="+labelColor+"><b> "+inTargetLabel+" </b><i class='fa fa-thumbs-up'></i></font>";
						rowColor = '#97C297';
					}else {
						toShow="<font color="+labelColor+"><b> "+outOfTargetLabel+" </b><i class='fa fa-times'></i></font>";
						rowColor = '#D9726F';
					}
				}
				 
//				 return "<h6>"+title+"</h6>";
				
//				var color="";
//				if (mins<goal){
//					color="#D9726F";
//					toShow="<font color="+color+"><b> "+notAchieved+" </b><i class='fa fa-times'></i></color>";
//					goalToShow="";
//					
//				}else{
//					beep();
//					color="#337ab7";
//					toShow="<font color="+color+"><b> "+achieved+" </b><i class='fa fa-thumbs-up'></i></font>";
//					goalToShow= "";
//				}
//				toShow+= " "+mins;
//				goalToShow += " "+goal;
//				return "<table class='c3-tooltip'><tbody><tr><th colspan='2' style='color: black; background-color:"
//						+ color
//						+ "';>"
//						+ title
//						+ "</th></tr><tr class='c3-tooltip-name-Minutes'><td class='name'><span style='background-color:#d9534f'></span>"
//						+ value
//						+ "</td></tr></tbody></table>";
				
				return "<table class='c3-tooltip'><tbody><tr><th colspan='2' style='color: black; background-color:"
				+ color
				+ "';>"
				+ title +" ["+minToShow+"]"
				+ "</th></tr>"
				+ "<tr class='c3-tooltip-name-HR maximum'><td class='name'><span style='background-color:#d9534f'></span>"
				+ maxHRLabel
				+ "</td><td class='value'>"
//				+ goalToShowMax
				+ max
				+ "</td></tr>"
				+ "<tr class='c3-tooltip-name-goal'><td class='name'><span style='background-color:#97C297'></span>"
				+ etichetta
				+ "</td><td class='value' style=\"background-color: "+rowColor+"\">"
				+ toShow + " " + value
				+ "</td></tr>"
				+ "<tr class='c3-tooltip-name-HR minimum'><td class='name'><span style='background-color:#337ab7'></span>"
				+ minHRLabel
				+ "</td><td class='value'>"
//				+ goalToShowMin
				+ min
				+ "</td></tr>"
				+ "</tbody></table>";
			}
		}
	});
	
	chart.data.names({'HR' : etichetta, 'goalMin' : minHRLabel, 'goalMax' : maxHRLabel});
}



function creaC3StepSummaryDuration(id, json) {
	var map = json;
	var keys = Object.keys(map);
	var tot = keys.length;

	var goal;
	var minutes;

	for (var i = 0; i < tot; i++) {
		var label = map[keys[i]][0]
		if (label == "goal") {
			goal = map[keys[i]];
		} else if (label == "Minutes") {
			minutes = map[keys[i]];
		}
	}

	var chart = c3
			.generate({
				bindto : id,
				data : {
					x : 'x',
					columns : [ [ 'x', 0, 1, 2, 3, 4 ], minutes, goal ],
					axes : {
						Minutes : 'y',
						goalMinutes : 'y'
					},
					types : {
						Minutes : 'bar',
						goal : 'area-step'
					},
					colors : {
//						Minutes : '#D9726F',
						Minutes: '#97C297',
						goal : '#337ab7'
					},
					selection : {
						enabled : true,
						multiple : true
					}
				},
				axis : {
					x : {
						label : 'Phase',
						type : 'category',
						categories : [ 'WarmUp', 'Aerobic',
								'Cooldown' ]
					},
					y : {
						label : 'Minutes'
					},
					y2 : {
						show : false
					}
				},
				point : {
					goal : {
						show : true,
						r : 15
					},
				},
				grid : {
					y : {
						show : true
					}
				},
				bar : {
					width : {
						ratio : 0.8
					// this makes bar width 50% of length between ticks
					}
				},
				// regions: [
				// {axis: 'x', start: 0, end: wpMax, class: 'greenArea' },
				// {axis: 'x', start: wpMax, end: stMax, class: 'yellowArea' },
				// {axis: 'x', start: stMax, end: aeMax, class: 'goalArea' },
				// {axis: 'x', start: aeMax, end: cdMax, class: 'blueArea' },
				// ],
				zoom : {
					enabled : false,
					rescale : false
				},
				point : {
					r : 4,
					select : {
						r : 6
					}
				},
				tooltip : {
					// format: {
					// title: function (x) { return 'Data ' + x; }
					// }
					contents : function(d, defaultTitleFormat,
							defaultValueFormat, color) {
						 var $$ = this, config = $$.config,
			              titleFormat = config.tooltip_format_title || defaultTitleFormat;
						 var title;
						 title = titleFormat ? titleFormat(d[0].x) : d[0].x;
						var mins=d[0].value;
						var goal=d[1].value;
						var color="";
						if (mins<goal){
							color="#D9726F";
							toShow="<font color="+color+"><i class='fa fa-times'></i></color>";
							goalToShow="<font color="+color+"><b> Goal <huge>NOT</huge> achieved </b></font>";
							
						}else{
							color="#337ab7";
							toShow="<font color="+color+"><i class='fa fa-thumbs-up'></i></font>";
							goalToShow= "<font color="+color+"><b> Goal ACHIEVED </b></font>";
						}
						toShow+= " "+mins;
						goalToShow += " "+goal;
						return "<table class='c3-tooltip'><tbody><tr><th colspan='2' style='background-color:"
								+ color
								+ "';>"
								+ title
								+ "</th></tr><tr class='c3-tooltip-name-Minutes'><td class='name'><span style='background-color:#D9726F'></span>"
								+ d[0].name
								+ "</td><td class='value'>"
								+ toShow
								+ "</td></tr><tr class='c3-tooltip-name-goal'><td class='name'><span style='background-color:#337ab7'></span>"
								+ d[1].name
								+ "</td><td class='value'>"
								+ goalToShow + "</td></tr></tbody></table>";
					}
				}
			});
}


function creaC3StepSummaryBPM(id, json, hrMaxLabel, hrMinLabel, hrValuesLabel, achievedLabel, exceededLabel, notReachedLabel,wuLabel, aeLabel, cdLabel) {
	var map = json;
	var keys = Object.keys(map);
	var tot = keys.length;

	var HR_min;
	var HR_max;
	var bpm;

//	for (var i = 0; i < tot; i++) {
//		var label = map[keys[i]][0]
//		if (label == hrMinLabel) {
//			HR_min = map[keys[i]];
//		} else if (label == hrMaxLabel) {
//			HR_max = map[keys[i]];
//		} else if (label == hrValuesLabel) {
//			bpm = map[keys[i]];
//		}
//	}
	
	for (var i = 0; i < tot; i++) {
		var label = map[keys[i]][0]
		if (label == 'min') {
			HR_min = map[keys[i]];
		} else if (label == 'max') {
			HR_max = map[keys[i]];
		} else if (label == 'values') {
			bpm = map[keys[i]];
		}
	}

	var chart = c3.generate({
		bindto : id,
		data : {
			x : 'x',
			columns : [ [ 'x', 0, 1, 2, 3, 4 ], HR_max, bpm, HR_min ],
			axes : {
				'values' : 'y',
				'min' : 'y',
				'max' : 'y'
			},
			types : {
				'values' : 'bar',
				'min' : 'area-step',
				'max' : 'step'
			},
			colors : {
//				'BPM average' : '#D97C7A',
				'values' : '#97C297',
				'min' : '#337ab7',
				'max' : '#d9534f'
			},
			selection : {
				enabled : true,
				multiple : true
			}
		},
		axis : {
			x : {
				label : "Phase",
				type : 'category',
				categories : [ 'WarmUp', 'Aerobic', 'Cooldown']
			},
			y : {
				label : "beats per minute"
			},
			y2 : {
				show : false
			}
		},
		point : {
			HR_max : {
				show : true,
				r : 15
			},
			HR_max : {
				show : true,
				r : 15
			}
		},
		grid : {
			y : {
				show : true
			}
		},
		bar : {
			width : {
				ratio : 0.8
			// this makes bar width 50% of length between ticks
			}
		},
		// regions: [
		// {axis: 'x', start: 0, end: wpMax, class: 'greenArea' },
		// {axis: 'x', start: wpMax, end: stMax, class: 'yellowArea' },
		// {axis: 'x', start: stMax, end: aeMax, class: 'goalArea' },
		// {axis: 'x', start: aeMax, end: cdMax, class: 'blueArea' },
		// ],
		zoom : {
			enabled : false,
			rescale : false
		},
		point : {
			r : 4,
			select : {
				r : 6
			}
		},
		tooltip : {
			// format: {
			// title: function (x) { return 'Data ' + x; }
			// }
			contents : function(d, defaultTitleFormat,
					defaultValueFormat, color) {
				 var $$ = this, config = $$.config,
	              titleFormat = config.tooltip_format_title || defaultTitleFormat;
				 var title;
				 title = titleFormat ? titleFormat(d[0].x) : d[0].x;
				 
				var min=d[2].value;
				var bpm=d[1].value;
				var max=d[0].value;
				var minLabel = d[2].name;
				var maxLabel = d[0].name;
				var bpmLabel = d[1].name;
				
				var toShow;
				var goalToShowMax="";
				var goalToShowMin="";
				if (bpm<=max && bpm>=min){
					color="#337ab7";
					toShow="<font color="+color+"><b><huge>"+achievedLabel+" </huge></b><i class='fa fa-thumbs-up'></i></color>";
					goalToShowMax = goalToShowMin = "<font color="+color+"><b> Goal ACHIEVED </b></font>";
				} else if (bpm>max){
					color="#D9726F";
					toShow="<font  color="+color+"><b><huge>"+exceededLabel+" </huge></b><i class='fa fa-times'></i></color>";
					goalToShowMax ="<font  color="+color+"><b> HR maximum <huge>EXCEEDED</huge></b></font>";
				} else if (bpm<min) {
					color="#D9726F";
					toShow="<font color="+color+"><b><huge>"+notReachedLabel+" </huge></b><i class='fa fa-times'></i></color>";
					goalToShowMin="<font  color="+color+"><b> HR minimum <huge>NOT REACHED</huge></b></font>";
				}
				toShow+= " "+bpm;
				goalToShowMax+= " "+max;
				goalToShowMin+=" "+min;
						return "<table class='c3-tooltip'><tbody><tr><th colspan='2' style='background-color:"
								+ color
								+ "';>"
								+ title
								+ "</th></tr>"
								+ "<tr class='c3-tooltip-name-HR maximum'><td class='name'><span style='background-color:#d9534f'></span>"
								+ maxLabel
								+ "</td><td class='value'>"
//								+ goalToShowMax
								+ max
								+ "</td></tr>"
								+ "<tr class='c3-tooltip-name-goal'><td class='name'><span style='background-color:#97C297'></span>"
								+ bpmLabel
								+ "</td><td class='value'>"
								+ toShow
								+ "</td></tr>"
								+ "<tr class='c3-tooltip-name-HR minimum'><td class='name'><span style='background-color:#337ab7'></span>"
								+ minLabel
								+ "</td><td class='value'>"
//								+ goalToShowMin
								+ min
								+ "</td></tr>"
								+ "</tbody></table>";
				
			}
		}
	});
	
	chart.data.names({'values' : hrValuesLabel, 'max' : hrMaxLabel, 'min' : hrMinLabel});
	if (bpm.length==2){
		chart.load({
			categories : [aeLabel]
		});
	}else{
		chart.load({
			categories : [wuLabel, aeLabel, cdLabel]
		});
	}

}



function creaC3HorizontalBar(id, wuInTarget, stInTarget, aeInTarget,
		cdInTarget, rxInTarget) {
	var chart = c3.generate({
		bindto : id,
		data : {
			x : 'x',
			columns : [
					[ 'x', 0, 1, 2, 3, 4 ],
					[ 'Minutes on Target', wuInTarget, stInTarget, aeInTarget,
							cdInTarget, rxInTarget ] ],
			types : {
				'Minutes on Target' : 'bar' // ADD
			},
			// colors : {
			// goal: '#d9534f', //rosso
			// kcal: '#337ab7' //blu
			// },
			selection : {
				enabled : true,
				multiple : true
			}
		},
		axis : {
			x : {
				type : 'category',
				categories : [ 'WarmUp', 'Stretching', 'Aerobic', 'Cooldown',
						'Relax' ]
			},
			rotated : true
		},
		grid : {
			y : {
				show : true
			}
		},
		zoom : {
			enabled : false,
			rescale : false
		},
		point : {
			r : 4,
			select : {
				r : 6
			}
		}
	});
}


function creaC3HorizontalBarWithGoal(id, wuInTarget, aeInTarget,
		cdInTarget, wuDuration,  aeDuration, cdDuration, onTargetLabel, goalLabel, wuLabel, aeLabel, cdLabel, achieved, notAchieved) {

	var chart = c3.generate({
		bindto : id,
		data : {
			x : 'x',
			columns : [
					[ 'x', 0, 1, 2, 3, 4 ],
					[ 'Minutes on Target', wuInTarget, aeInTarget,
							cdInTarget ],
					[ 'Goal', wuDuration, aeDuration, cdDuration ] ],
			types : {
				'Minutes on Target' : 'bar', // ADD
				'Goal' : 'step'
			},
			colors : {
				'Goal' : '#d9534f', // rosso
				'Minutes on Target' : '#97C297' //Verde
			},
			selection : {
				enabled : true,
				multiple : true
			}
		},
		axis : {
			x : {
				type : 'category',
				categories : [ 'WarmUp', 'Aerobic', 'Cooldown' ]
			},
		// rotated : true
		},
		grid : {
			y : {
				show : true
			}
		},
		zoom : {
			enabled : false,
			rescale : false
		},
		point : {
			r : 6,
			select : {
				r : 8
			}
		},
		regions : [ {
			axis : 'x',
			start : -1,
			end : 0.5,
			class : 'greenArea'
		}, {
			axis : 'x',
			start : 0.5,
			end : 1.5,
			class : 'goalArea'
		}, {
			axis : 'x',
			start : 1.5,
			end : 2.5,
			class : 'blueArea'
		}],
		tooltip : {
			// format: {
			// title: function (x) { return 'Data ' + x; }
			// }
			contents : function(d, defaultTitleFormat,
					defaultValueFormat, color) {
				 var $$ = this, config = $$.config,
	              titleFormat = config.tooltip_format_title || defaultTitleFormat;
				 var title;
				 title = titleFormat ? titleFormat(d[0].x) : d[0].x;
				var mins=d[0].value;
				var goal=d[1].value;
				var color="";
				var titleColor="#CCC";
				if (mins<goal){
					color="#D9726F";
					toShow="<font color="+color+"><b> "+notAchieved+" </b><i class='fa fa-times'></i></color>";
					goalToShow="";
					
				}else{
					color="#97C297";
					toShow="<font color="+color+"><b> "+achieved+" </b><i class='fa fa-thumbs-up'></i></font>";
					goalToShow= "";
				}
				switch (d[0].x){
				case 0: 
					titleColor="#EBFCE3";
					break;
				case 1:
					titleColor="#ffebeb";
					break;
				default:
					titleColor="#eff9ff";
					break;
				}
				toShow+= " "+mins;
				goalToShow += " "+goal;
				return "<table class='c3-tooltip'><tbody><tr><th colspan='2' style='color: black; background-color:"
						+ titleColor
						+ "';>"
						+ title
						+ "</th></tr><tr class='c3-tooltip-name-Minutes'><td class='name'><span style='background-color:#97C297'></span>"
						+ d[0].name
						+ "</td><td class='value'>"
						+ toShow
						+ "</td></tr><tr class='c3-tooltip-name-goal'><td class='name'><span style='background-color:#d9534f'></span>"
						+ d[1].name
						+ "</td><td class='value'>"
						+ goalToShow + "</td></tr></tbody></table>";
			}
		}
	});
	
	//funzione per modificare le etichette
	
	chart.data.names({
		'Minutes on Target' : onTargetLabel, 
		'Goal' : goalLabel
	});
	
		chart.load({
			categories : [wuLabel, aeLabel, cdLabel]
		});
	
}



function creaC3MixSummary2(id) {

	var chart = c3.generate({
		bindto : id,
		data : {
			x : 'x',
			columns : [ [ 'x', 0, 1, 2, 3, 4 ],
					[ 'goalMin', 5, 5, 35, 10, 10 ],
					[ 'goalBpm', 80, 80, 180, 75, 60 ],
					[ 'Minutes', 7, 10, 40, 20, 10 ],
					[ 'Bpm', 75, 85, 160, 75, 70 ] ],
			axes : {
				Minutes : 'y',
				Bpm : 'y2',
				goalMin : 'y',
				goalBpm : 'y2'
			},
			types : {
				Minutes : 'bar',
				Bpm : 'bar',
				goalMin : 'area-step',
				goalBpm : 'area-step'
			},
			colors : {
				Minutes : '#A5BDE8',
				// Bpm: '#C5E8B5',
				Bpm : '#D97C7A',
				goalMin : '#337ab7',
				// goalBpm: '#5cb85c'
				goalBpm : '#d9534f'
			},
			selection : {
				enabled : true,
				multiple : true
			}
		},
		axis : {
			x : {
				type : 'category',
				categories : [ 'WarmUp', 'Stretching', 'Aerobic', 'Cooldown',
						'Relax' ]
			},
			y2 : {
				show : true
			}
		},
		point : {
			goalMin : {
				show : true,
				r : 15
			},
			goalBpm : {
				show : true,
				r : 15
			}
		},
		grid : {
			y : {
				show : true
			}
		},
		// regions: [
		// {axis: 'x', start: 0, end: wpMax, class: 'greenArea' },
		// {axis: 'x', start: wpMax, end: stMax, class: 'yellowArea' },
		// {axis: 'x', start: stMax, end: aeMax, class: 'goalArea' },
		// {axis: 'x', start: aeMax, end: cdMax, class: 'blueArea' },
		// ],
		zoom : {
			enabled : false,
			rescale : false
		},
		point : {
			r : 4,
			select : {
				r : 6
			}
		}
	});
}


function creaC3Gauge(id) {

	var chart = c3.generate({
		bindto : id,
		data : {
			columns : [ [ 'data', 5 ] ],
			type : 'gauge'
		},
		gauge : {
			min : 0,
			max : 12,
			// units: ' %',
			width : 28,
			label : {
				show : true
			}
		},
		color : {
			pattern : [ '#FF0000', '#F97600', '#F6C600', '#60B044' ], // the
																		// three
																		// color
																		// levels
																		// for
																		// the
																		// percentage
																		// values.
			threshold : {
				// unit: 'value', // percentage is default
				// max: 100, // 100 is default
				values : [ 30, 60, 90, 100 ]
			}
		}
	});
}

function creaPie(id, val1, val2, label1, label2) {
	var chart = c3.generate({
		bindto : id,
		data : {
			columns : [ [ 'verde', val1 ], [ 'rosso', val2 ], ],
			colors : {
				'verde' : '#97C297', //verde
				'rosso' : '#d9534f'
			},
			type : 'pie',
		}
	});
	chart.data.names({
		'verde' : label1, 
		'rosso' : label2
	});
}

function creaC3LineDynamicDRAFT(id){

	var chart = c3.generate({
		bindto : id,
		data : {
			x : 'x',
			columns : [ [ 'x', 0, 1, 2, 3 ], [ 'Total Session duration', 80, 104, 135, 120 ], [ 'Weekly Goal', 150, 150, 145, 145 ] ],
			axes : {
				'values' : 'y',
				'max' : 'y'
			},
			types : {
				'Total Session duration' : 'bar',
				'Weekly Goal' : 'step'
			},
			colors : {
//				'BPM average' : '#D97C7A',
				'Total Session duration' : '#97C297',
				'Weekly Goal' : '#d9534f'
			},
			selection : {
				enabled : true,
				multiple : true
			}
		},
		axis : {
			x : {
				label : "Week",
				type : 'category',
				categories : [ 'Week 1', 'Week 2', 'Week 3', 'Week 4']
			},
			y : {
				label : "session duration"
			},
			y2 : {
				show : false
			}
		},
		point : {
			HR_max : {
				show : true,
				r : 15
			},
			HR_max : {
				show : true,
				r : 15
			}
		},
		grid : {
			y : {
				show : true
			}
		},
		bar : {
			width : {
				ratio : 0.8
			// this makes bar width 50% of length between ticks
			}
		},
		// regions: [
		// {axis: 'x', start: 0, end: wpMax, class: 'greenArea' },
		// {axis: 'x', start: wpMax, end: stMax, class: 'yellowArea' },
		// {axis: 'x', start: stMax, end: aeMax, class: 'goalArea' },
		// {axis: 'x', start: aeMax, end: cdMax, class: 'blueArea' },
		// ],
		zoom : {
			enabled : false,
			rescale : false
		},
		point : {
			r : 4,
			select : {
				r : 6
			}
		}
	});
}


function creaC3LineDynamicWeekly(id, weeksLabels,weeksGoal,weeksTot, xLabel ,yLabel){
	
	var goalLabel=weeksGoal.TITLE;
	var valueLabel=weeksTot.TITLE;
	
	var goalValues=weeksGoal.VALUES;
	var valueValues=weeksTot.VALUES;
	
	var labels=weeksLabels;
	
	var tot=goalValues.length+1;
	var xs=new Array();
	var tots=new Array();
	var goals=new Array();
	
	for (var i = 0; i < tot; i++) {
		if (i==0){
			xs.push('x');
			tots.push('tot');
			goals.push('goal')
		}else{
			xs.push(labels[i-1]);
			tots.push(valueValues[i-1]);
			goals.push(goalValues[i-1])
		}
	}
	
	var chart = c3.generate({
		bindto : id,
		data : {
			x : 'x',
			columns : [ xs, tots, goals ],
			types : {
				'tot' : 'bar',
				'goal' : 'step'
			},
			colors : {
//				'BPM average' : '#D97C7A',
				'tot' : '#97C297',
				'goal' : '#d9534f'
			},
			selection : {
				enabled : true,
				multiple : true
			}
		},
		axis : {
			x : {
				label : xLabel,
				type : 'category',
				categories : [ 'Week 1', 'Week 2', 'Week 3', 'Week 4']
			},
			y : {
				label : yLabel
			},
			y2 : {
				show : false
			}
		},
		grid : {
			y : {
				show : true
			}
		},
		bar : {
			width : {
				ratio : 0.8
			// this makes bar width 50% of length between ticks
			}
		},
		// regions: [
		// {axis: 'x', start: 0, end: wpMax, class: 'greenArea' },
		// {axis: 'x', start: wpMax, end: stMax, class: 'yellowArea' },
		// {axis: 'x', start: stMax, end: aeMax, class: 'goalArea' },
		// {axis: 'x', start: aeMax, end: cdMax, class: 'blueArea' },
		// ],
		zoom : {
			enabled : false,
			rescale : false
		},
		point : {
			r : 4,
			select : {
				r : 6
			}
		}
	});
	
	chart.data.names({
		'tot' : valueLabel, 
		'goal' : goalLabel
	});
}


function creaC3BarZonesDynamic(id, session){
	
	var colors = ['#CCC', '#CCC', '#97C297', '#97C297', '#97C297' , '#CCC' ,'#d9534f'];

	
//	var chart = c3.generate({
//		bindto : id,
//		data : {
////			x : 'x',
//			columns : [ 
////			           ['0', session.minIn050],
////			           ['1', session.minIn5160],
////			           ['2', session.minIn6170],
////			           ['3', session.minIn7180],
////			           ['4', session.minIn8190],
////			           ['5', session.minIn91100],
////			           ['6', session.minIn101]
//
//						['0', session.minIn050, session.minIn5160, session.minIn6170, session.minIn7180, session.minIn8190, session.minIn91100, session.minIn101]
//
//			          ],
//			types : { '0' : 'bar'},
//			color: function (color, d) {
//	            return colors[d.index];
//	        },
////			colors : {
////				'0' : '#97C297'
////			},
//			selection : {
//				enabled : true,
//				multiple : true
//			}
//		},
//		axis : {
//			rotated : false,
//			x : {
//				label : 'HR Zones',
//				type : 'category',
//				categories : [ '0-50%', '51%-60%',  '61%-70%',  '71%-80%',  '81%-90%',  '91%-100%', '>100%' ]
//			},
//			y : {
//				label : 'minutes'
//			}
//		},
//		grid : {
//			y : {
//				show : true
//			}
//		},
//		bar : {
//			width : {
//				ratio : 0.8
//			}
//		},
//		 regions: [
//		 {axis: 'x', start: 1.5, end: 4.5, class: 'darkgoalArea' },
//		 {axis: 'x', start: 1.5, end: 4.5, class: 'darkgoalArea' },
//		 {axis: 'x', start: 1.5, end: 4.5, class: 'darkgoalArea' }
//		 ],
//		zoom : {
//			enabled : false,
//			rescale : false
//		},
//		point : {
//			r : 4,
//			select : {
//				r : 6
//			}
//		},
//		tooltip: {
//	        contents: function (d, defaultTitleFormat, defaultValueFormat, color) {
//	            color = function() {
//	            	var id = d[0].index
//	                return colors[id];
//	            };
//	            return chart.internal.getTooltipContent.call(this, d, defaultTitleFormat, defaultValueFormat, color)
//	        }
//	    },
//	    legend : {
//	    	hide : true
//	    }
//	});
//	
//	chart.data.names({
//		'0' : 'Minutes in the zone' 
//	});
//	
	
	var chart = c3.generate({
		bindto : id,
		data : {
//			x : 'x',
			columns : [ 
//			           ['0', session.minIn050],
//			           ['1', session.minIn5160],
//			           ['2', session.minIn6170],
//			           ['3', session.minIn7180],
//			           ['4', session.minIn8190],
//			           ['5', session.minIn91100],
//			           ['6', session.minIn101]

						['0', session.minIn101, session.minIn91100, session.minIn8190, session.minIn7180 , session.minIn6170, session.minIn5160 ,session.minIn050]

			          ],
			types : { '0' : 'bar'},
			color: function (color, d) {
	            return colors[6-d.index];
	        },
//			
			colors : {
				'0' : '#97C297'
			},
			selection : {
				enabled : true,
				multiple : true
			}
		},
		axis : {
			rotated : true,
			x : {
				label : 'HR Zones',
				type : 'category',
				categories : ['>100%', '91%-100%', '81%-90%', '71%-80%',  '61%-70%', '51%-60%', '0-50%' ]
			},
			y : {
				label : 'minutes'
			}
		},
		grid : {
			y : {
				show : true
			}
		},
		bar : {
			width : {
				ratio : 0.8
			}
		},
		 regions: [
		 {axis: 'x', start: 1.5, end: 4.5, class: 'darkgoalArea' },
		 {axis: 'x', start: 1.5, end: 4.5, class: 'darkgoalArea' },
		 {axis: 'x', start: 1.5, end: 4.5, class: 'darkgoalArea' }
		 ],
		zoom : {
			enabled : false,
			rescale : false
		},
		point : {
			r : 4,
			select : {
				r : 6
			}
		},
		tooltip: {
	        contents: function (d, defaultTitleFormat, defaultValueFormat, color) {
	            color = function() {
	            	var id = d[0].index
	                return colors[6-id];
	            };
	            return chart.internal.getTooltipContent.call(this, d, defaultTitleFormat, defaultValueFormat, color)
	        }
	    },
	    legend : {
	    	hide : true
	    }
	});

	
	
	chart.data.names({
		'0' : 'Minutes in the zone' 
	});
}