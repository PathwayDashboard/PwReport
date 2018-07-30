/**
 * 
 */

//function creaMorrisArea(id){
//	
//	Morris.Area({
//        element: id,
//        data: [{
//            period: '2010 Q1',
//            iphone: 2666,
//            ipad: null,
//            itouch: 2647
//        }, {
//            period: '2010 Q2',
//            iphone: 2778,
//            ipad: 2294,
//            itouch: 2441
//        }, {
//            period: '2010 Q3',
//            iphone: 4912,
//            ipad: 1969,
//            itouch: 2501
//        }, {
//            period: '2010 Q4',
//            iphone: 3767,
//            ipad: 3597,
//            itouch: 5689
//        }, {
//            period: '2011 Q1',
//            iphone: 6810,
//            ipad: 1914,
//            itouch: 2293
//        }, {
//            period: '2011 Q2',
//            iphone: 5670,
//            ipad: 4293,
//            itouch: 1881
//        }, {
//            period: '2011 Q3',
//            iphone: 4820,
//            ipad: 3795,
//            itouch: 1588
//        }, {
//            period: '2011 Q4',
//            iphone: 15073,
//            ipad: 5967,
//            itouch: 5175
//        }, {
//            period: '2012 Q1',
//            iphone: 10687,
//            ipad: 4460,
//            itouch: 2028
//        }, {
//            period: '2012 Q2',
//            iphone: 8432,
//            ipad: 5713,
//            itouch: 1791
//        }],
//        xkey: 'period',
//        ykeys: ['iphone', 'ipad', 'itouch'],
//        labels: ['iPhone', 'iPad', 'iPod Touch'],
//        pointSize: 2,
//        hideHover: 'auto',
//        resize: true
//    });
	
	
	function creaMorrisArea(id){
		
		Morris.Area({
	        element: id,
	        data: [{
	            period: '2015-02-10',
	            kcal: 200,
	            goal: 420
	        }, {
	        	period: '2015-02-12',
	        	kcal: 250,
	            goal: 420
	        }, {
	        	period: '2015-02-18',
	        	kcal: 500,
	            goal: 420
	        }, {
	        	period: '2015-02-20',
	        	kcal: 400,
	            goal: 420
	        }, {
	        	period: '2015-02-28',
	        	kcal: 320,
	            goal: 420
	        }, {
	        	period: '2015-03-05',
	        	kcal: 275,
	            goal: 420
	        }, {
	        	period: '2015-03-09',
	        	kcal: 315,
	            goal: 420
	        }, {
	        	period: '2015-03-22',
	        	kcal: 320,
	            goal: 420
	        }, {
	        	period: '2015-03-25',
	        	kcal: 600,
	            goal: 420
	        }, {
	        	period: '2015-03-30',
	        	kcal: 700,
	            goal: 420
	        }],
	        xkey: 'period',
	        ykeys: ['goal','kcal'],
	        labels: ['goal','kcal'],
//	        ykeys: ['kcal'],
//	        labels: ['kcal'],
	        pointSize: 4,
	        hideHover: 'true',
	        goals: [420],
	        goalLineColors: ['#337ab7','#d9534f'],
	        goalStrokeWidth: 2,
	        lineColors:['#d9534f','#337ab7'],
//	        lineColors:['#337ab7'],
	        behaveLikeLine: true,
	        resize: true
	    });
	
}