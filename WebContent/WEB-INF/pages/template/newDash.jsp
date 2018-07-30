
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div>
				 
 
 
  
 <div class="row">
                <div class="col-lg-6">
                    <h1 class="page-header">Dashboard  </h1>
                </div>
                <div class="col-lg-6 col-md-6 pull-right" style="margin-top: 40px">
					<ul class="nav nav-pills pull-right">
					  <li role="presentation" class="active" id="allPill"><a href="#">All</a></li>
					  <li role="presentation" id="classPill"><a href="#">Class</a></li>
					  <li role="presentation" id="gamePill"><a href="#">Game</a></li>
					  <li role="presentation" id="activePill"><a href="#">Activity Lifestyle</a></li>
					</ul>
				</div>
            </div>
            
            <div class="row">
	            <div class="col-md-8">

	            <h4><span class="label label-info" id="title" style="display: inline;">From: 12-03-2016 To: 11-04-2016</span></h4>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-6">
						<div class="btn-group" role="group" aria-label="...">
								<button type="button" class="btn btn-default" name="this" id="this">This Week</button>
							  <button type="button" class="btn btn-default" name="week" id="week">Last Week</button>
							  <button type="button" class="btn btn-default active" name="month" id="month">Last Month</button>
							  <button type="button" class="btn btn-default" name="custom" id="custom">Custom</button>
						</div>
					</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div id="output" style="display: none;">
					<div class="panel panel-default">
	            		<div class="panel-heading">
							<div class="col-md-6" id="datepicker_div">
								<div class="input-daterange input-group" id="datepicker">
									<input id="start" type="text" class="input-sm form-control" name="start"> <span class="input-group-addon">to</span> <input id="end" type="text" class="input-sm form-control" name="end">
								</div>
							</div>
								<button type="button" class="btn btn-primary" id="filter">Filter</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div id="todo" style="display: none;">
						<button class="btn btn-primary" type="button" id="todoButton" data-toggle="popover" title="" data-placement="right" data-content="1 Exerclass<br>1 Physical Activity<br>" data-original-title="To Do List for this Week">
							  ToDo <span class="badge">2</span>
						</button>
						
		</div>
				</div>
			</div>	
				
				
            <br>
             <div class="row">
             
<!--              COLONNA KCAL -->
                <div class="col-lg-4 col-md-4">
                    
                     <div class="row">
                     	 <div class="col-lg-12 col-md-12">
		                     	 <div class="panel panel-success">
				                        <div class="panel-heading  white-tooltip" data-toggle="tooltip" data-placement="top" title="" "="" data-original-title="kcal are units of food energy">
				                            <div class="row">
				                                 <div class="col-xs-3 huge">
				<!--                                     <i class="fa fa-fire fa-3x"></i> -->
												<span class="glyphicon glyphicon-fire" aria-hidden="true"></span>
				                                </div>
				                                <div class="col-xs-9 text-right">
				                                    <div class="huge" id="totalKcal">4666</div>
				                                    <b> <span> <br> </span></b>
				                                </div>
				                            </div>
				<!--                              <div class="row"> -->
				<!--                             	 <div class="col-xs-3 col-md-offset-4"> -->
				<!--                                     <i class="fa fa-thumbs-o-up fa-3x"></i> -->
				<!--                                 </div> -->
				<!--                              </div> -->
				                        </div>
<!--                         <a href="#"> -->
			                            <div class="panel-footer">
			                                 <div> Total burned kcal</div>
			                                <div class="clearfix"></div>
			                            </div>
<!--                         </a> -->
                   				 </div>
                     	 
                     	 </div>
                     </div>
                     
                      <div class="row">
                     	 <div class="col-lg-12 col-md-12">
		                     	  <div class="panel panel-success">
				                        <div class="panel-heading  white-tooltip" data-toggle="tooltip" data-placement="top" title="" "="" data-original-title="kcal are units of food energy">
				                            <div class="row">
				                                 <div class="col-xs-3 huge">
				<!--                                     <i class="fa fa-fire fa-3x"></i> -->
												<span class="glyphicon glyphicon-fire" aria-hidden="true"></span>
				                                </div>
				                                <div class="col-xs-9 text-right">
				                                    <div class="huge" id="avgKcal">466</div>
				                                    <b> <span> <br> </span></b>
				                                </div>
				                            </div>
				<!--                             <div class="row"> -->
				<!--                             	 <div class="col-xs-3 col-md-offset-4"> -->
				<!--                                     <i class="fa fa-thumbs-o-up fa-3x"></i> -->
				<!--                                 </div> -->
				<!--                              </div> -->
				                        </div>
				<!--                         <a href="#"> -->
				                             <div class="panel-footer">
				                                 <div> Average burned kcal</div>
				                                <div class="clearfix"></div>
				                            </div>
				<!--                         </a> -->
				                    </div>
                     	 
                     	 </div>
                     </div>
                </div>
                
<!--                 FINE COLONNA KCAL -->

<!-- 				COLONNA BPM -->
				 <div class="col-lg-4 col-md-4">
				 
				 	<div class="row">
							<div class="col-lg-12 col-md-12">
								<div class="panel panel-success" id="panelMaxHR">
									<div class="panel-heading white-tooltip" data-toggle="tooltip" data-placement="top" title="" data-original-title="bpm (Beats Per Minute) is the unit for measuring the speed of the heartbeat ">
										<div class="row">
											<div class="col-xs-3">
												<i class="fa fa-heartbeat fa-3x"></i>
											</div>
											<div class="col-xs-9 text-right">
												<div class="huge" id="maxHR">163</div>
												<b> <span> <br>
												</span></b>
											</div>
										</div>
									</div>
									<!--                         <a href="#"> -->
									<div class="panel-footer">
										<span class="pull-left"> Maximum Heart Rate [bpm]</span>
										<div class="clearfix"></div>
									</div>
									<!--                         </a> -->
								</div>
					
							</div>
				 	</div>
                    
                     <div class="row">
                     	 <div class="col-lg-12 col-md-12">
                     	 	 
							
								 <div class="panel panel-success" id="panelHR">
							
							
						
                        <div class="panel-heading white-tooltip" data-toggle="tooltip" data-placement="top" title="" data-original-title="bpm (Beats Per Minute) is the unit for measuring the speed of the heartbeat ">
                            <div class="row">
                                <div class="col-xs-6">
                                    <i class="fa fa-heartbeat fa-3x"></i>
                                     
											
<!-- 											 <div class="row" id="pollicione">  -->
<!-- 				                            	 <div class="col-xs-3 col-md-offset-4"> -->
				                                    <i id="pollicione" class="fa fa-thumbs-o-up fa-3x"></i>
<!-- 				                                </div> -->
<!-- 				                             </div> -->
											
									
                                </div>
                                <div class="col-xs-6 text-right">
                                    <div class="huge" id="hr">130</div> of <b> <span id="hrMin">111</span></b>
                                </div>
                            </div>
                            
                        </div>
<!--                         <a href="#"> -->
                            <div class="panel-footer">
                                <span class="pull-left"> Average Heart Rate [bpm]</span>
                                <div class="clearfix"></div>
                            </div>
<!--                         </a> -->
                   		 </div>
                     	 
                  		 </div>

	</div>
</div>
<!--                	FINE COLONNA BPM  -->
               	
               	 
<!--                	 COLONNA STEPS -->
               	  <div class="col-lg-4 col-md-4">
                    
                     <div class="row">
                     	 <div class="col-lg-12 col-md-12">
                     	 	<div class="panel panel-red">
		                        <div class="panel-heading">
		                            <div class="row">
		                                 <div class="col-xs-3">
		                                 <span class="glyphicons glyphicons-shoe-steps"></span>
		                                    <img height="50px" src="resources/images/steps_white.png">
		                                </div>
		                                <div class="col-xs-9 text-right">
		                                    <div class="huge" id="steps">575</div>of <b>10.000</b>
		                                </div>
		                            </div>
		                            <div class="row">
		                            	 <div class="col-xs-3 col-md-offset-4">
		<!--                                     <i class="fa fa-thumbs-o-down fa-3x"></i> -->
		                                </div>
		                             </div>
		                        </div>
	                             <div class="panel-footer">
	                                 <div> Average daily steps</div>
	                                <div class="clearfix"></div>
	                            </div>
                  		  	</div>
                     	 
                     	 
                   	 </div>
                   	</div>
                   	
                   	 <div class="row">
                     	 <div class="col-lg-12 col-md-12">
                     	 	<div class="panel panel-success">
		                        <div class="panel-heading">
		                            <div class="row">
		                                 <div class="col-xs-3">
		                                 <span class="glyphicons glyphicons-shoe-steps"></span>
		                                    <i class="fa fa-hashtag fa-3x"></i>
		                                </div>
		                                <div class="col-xs-9 text-right">
		                                    <div class="huge">10</div>
		                                </div>
		                            </div>
		                            <div class="row">
		                            	 <div class="col-xs-3 col-md-offset-4">
		                            	 <br>
		                                </div>
		                             </div>
		                        </div>
	                             <div class="panel-footer">
	                                 <div> <spring:message code="sessions.number" /></div>
	                            </div>
                  		  	</div>
                     	 
                     	 
                   	 </div>
                   	</div>
                   	
                 </div>
<!--                  FINE COLONNA STEPS  -->
               	 
               	 
			</div>
<!-- 			FINE RIGA BOXES -->

            
            <div class="row" id="gaugesRow">
<!--             	<div class="col-lg-3 col-md-3 col-sm-3"> -->
<!--             		<div class="panel panel-default"> -->
<!-- 	            		<div class="panel-heading"> -->
<!-- 	                            <i class="fa fa-pie-chart fa-fw"></i> Gauge Chart Example -->
	                            
<!-- 	                            <div id="topLoader"></div> -->
<!-- <!-- 	                            <button id="animateButton" onclick="animaGauge(0,8,12)"> Anima! </button> //CAMBIARE --> 

<!-- 	                    </div> -->
<!--             		</div> -->
<!--             	</div> -->
            	<div class="col-lg-12 col-md-12">
            	<div class="alert alert-info" role="alert">
            		<i class="fa fa-volume-up" id="readIt" role="button"></i>
            		<span id="slogan">You are half way there! Try to increase the number of sessions and the amount of time you spend in each one. You have come this far-you can do it!</span>
            	</div>
            	</div>
            	
<!--             	<div class="col-lg-4 col-md-4"> -->
            	<div class="col-lg-6 col-md-6">
            		<div class="panel panel-default">
	            		<div class="panel-heading">
<!-- 	                            <i class="fa fa-pie-chart fa-fw"></i>  -->
 								<i class="fa fa-clock-o"></i>
	                            <span id="gaugeTimeTitle">Sessions Duration (total in minutes)</span>
					<div id="gaugeTime" class="chartdiv"
						style="overflow: hidden; text-align: left;">
						<div class="amcharts-main-div" style="position: relative;">
							<div class="amcharts-chart-div"
								style="overflow: hidden; position: relative; text-align: left; width: 429px; height: 200px; padding: 0px; touch-action: none;">
								<svg version="1.1"
									style="position: absolute; width: 429px; height: 200px; top: 0px; left: 0px;">
									<desc>JavaScript chart by amCharts 3.19.0</desc>
									<g>
									<path cs="100,100"
										d="M0.5,0.5 L428.5,0.5 L428.5,199.5 L0.5,199.5 Z"
										fill="#FFFFFF" stroke="#000000" fill-opacity="0"
										stroke-width="1" stroke-opacity="0"></path></g>
									<g></g>
									<g></g>
									<g></g>
									<g></g>
									<g></g>
									<g>
									<g>
									<g opacity="0.8">
									<path cs="1000,1000"
										d=" M264.7294734194974,78.57499999999997 L282.0499814951862,68.57499999999996 A78,78,0,0,1,292.5,107.57499999999997 L272.5,107.57499999999999 A58,58,0,0,0,264.7294734194974,78.57499999999997 Z"
										fill="#5cb85c" stroke="#FFF" stroke-width="2"
										stroke-opacity="0.5"></path></g>
									<g opacity="0.8">
									<path cs="1000,1000"
										d=" M243.5,57.34552658050256 L253.5,40.02501850481379 A78,78,0,0,1,282.0499814951862,68.57499999999997 L264.7294734194974,78.57499999999999 A58,58,0,0,0,243.5,57.34552658050256 Z"
										fill="#97C297" stroke="#FFF" stroke-width="2"
										stroke-opacity="0.5"></path></g>
									<g opacity="0.8">
									<path cs="1000,1000"
										d=" M214.5,49.575 L214.5,29.575000000000003 A78,78,0,0,1,253.5,40.02501850481379 L243.5,57.34552658050256 A58,58,0,0,0,214.5,49.575 Z"
										fill="#f0ad4e" stroke="#FFF" stroke-width="2"
										stroke-opacity="0.5"></path></g>
									<g opacity="0.8">
									<path cs="1000,1000"
										d=" M185.5,57.34552658050256 L175.5,40.02501850481379 A78,78,0,0,1,214.5,29.575000000000003 L214.5,49.575 A58,58,0,0,0,185.5,57.34552658050256 Z"
										fill="#f0ad4e" stroke="#FFF" stroke-width="2"
										stroke-opacity="0.5"></path></g>
									<g opacity="0.8">
									<path cs="1000,1000"
										d=" M164.27052658050258,78.57499999999999 L146.95001850481378,68.57499999999999 A78,78,0,0,1,175.5,40.02501850481379 L185.5,57.34552658050256 A58,58,0,0,0,164.27052658050258,78.57499999999999 Z"
										fill="#D9726F" stroke="#FFF" stroke-width="2"
										stroke-opacity="0.5"></path></g>
									<g opacity="0.8">
									<path cs="1000,1000"
										d=" M156.5,107.575 L136.5,107.575 A78,78,0,0,1,146.95001850481378,68.57499999999999 L164.27052658050258,78.57499999999999 A58,58,0,0,0,156.5,107.575 Z"
										fill="#d9534f" stroke="#FFF" stroke-width="2"
										stroke-opacity="0.5"></path></g>
									<g>
									<path cs="1000,1000"
										d=" M136.5,107.575 L136.5,107.575 A78,78,0,0,1,292.5,107.575 L292.5,107.575 A78,78,0,0,0,136.5,107.575 Z"
										fill="#000000" fill-opacity="1" stroke-width="0"
										stroke-opacity="0"></path></g>
									<path cs="100,100" d="M137.30375,108.075 L142.30375,108.075"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<text y="6" fill="#000000" font-family="Open Sans"
										font-size="11px" opacity="1" text-anchor="middle"
										transform="translate(128,108)">
									<tspan y="6" x="0">0</tspan></text>
									<path cs="100,100" d="M137.72938,99.95353 L137.72938,99.95353"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M139.0016,91.92104 L139.0016,91.92104"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M141.10648,84.06554 L141.10648,84.06554"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M144.02094,76.47309 L144.02094,76.47309"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M147.71307,69.22687 L152.0432,71.72687"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<text y="6" fill="#000000" font-family="Open Sans"
										font-size="11px" opacity="1" text-anchor="middle"
										transform="translate(134,62)">
									<tspan y="6" x="0">100</tspan></text>
									<path cs="100,100" d="M152.14241,62.40629 L152.14241,62.40629"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M157.26043,56.08606 L157.26043,56.08606"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M163.01106,50.33543 L163.01106,50.33543"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M169.33129,45.21741 L169.33129,45.21741"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M176.15188,40.78807 L178.65188,45.1182"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<text y="6" fill="#000000" font-family="Open Sans"
										font-size="11px" opacity="1" text-anchor="middle"
										transform="translate(168,29)">
									<tspan y="6" x="0">200</tspan></text>
									<path cs="100,100" d="M183.39809,37.09594 L183.39809,37.09594"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M190.99054,34.18148 L190.99054,34.18148"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M198.84604,32.0766 L198.84604,32.0766"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M206.87853,30.80438 L206.87853,30.80438"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M215,30.37875 L215,35.37875" fill="none"
										stroke-width="1" stroke-opacity="1" stroke="#000000"></path>
									<text y="6" fill="#000000" font-family="Open Sans"
										font-size="11px" opacity="1" text-anchor="middle"
										transform="translate(215,16)">
									<tspan y="6" x="0">300</tspan></text>
									<path cs="100,100" d="M223.12147,30.80438 L223.12147,30.80438"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M231.15396,32.0766 L231.15396,32.0766"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M239.00946,34.18148 L239.00946,34.18148"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M246.60191,37.09594 L246.60191,37.09594"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M253.84813,40.78807 L251.34813,45.1182"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<text y="6" fill="#000000" font-family="Open Sans"
										font-size="11px" opacity="1" text-anchor="middle"
										transform="translate(261,29)">
									<tspan y="6" x="0">400</tspan></text>
									<path cs="100,100" d="M260.66871,45.21741 L260.66871,45.21741"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M266.98894,50.33543 L266.98894,50.33543"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M272.73957,56.08606 L272.73957,56.08606"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M277.85759,62.40629 L277.85759,62.40629"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M282.28693,69.22687 L277.9568,71.72687"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<text y="6" fill="#000000" font-family="Open Sans"
										font-size="11px" opacity="1" text-anchor="middle"
										transform="translate(295,62)">
									<tspan y="6" x="0">500</tspan></text>
									<path cs="100,100" d="M285.97906,76.47309 L285.97906,76.47309"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M288.89352,84.06554 L288.89352,84.06554"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M290.9984,91.92104 L290.9984,91.92104"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M292.27062,99.95353 L292.27062,99.95353"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<path cs="100,100" d="M292.69625,108.075 L287.69625,108.075"
										fill="none" stroke-width="1" stroke-opacity="1"
										stroke="#000000"></path>
									<text y="6" fill="#000000" font-family="Open Sans"
										font-size="11px" opacity="1" text-anchor="middle"
										transform="translate(308,108)">
									<tspan y="6" x="0">590</tspan></text>
									<text y="15" fill="#97C297" font-family="Open Sans"
										font-size="30px" opacity="1" font-weight="bold"
										text-anchor="middle" transform="translate(215,154)">
									<tspan y="15" x="0">439 on 590</tspan></text></g>
									<g>
									<circle r="20" cx="0" cy="0" fill="#97C297" stroke="#97C297"
										fill-opacity="1" stroke-width="3" stroke-opacity="1"
										transform="translate(215,108)"></circle>
									<path cs="100,100"
										d="M203.15045431742362,91.30986492667917 L260.51947,56.98507 L260.51947,56.98507 L233.01598,117.91908 Z"
										fill="#97C297" stroke="#97C297" fill-opacity="0.8"
										stroke-width="1" stroke-opacity="0.8"></path></g></g>
									<g></g>
									<g></g>
									<g></g>
									<g></g>
									<g></g>
									<g>
									<g></g></g>
									<g></g>
									<g></g>
									<g></g>
									<g></g>
									<g></g></svg>
								<a href="http://www.amcharts.com/javascript-charts/"
									title="JavaScript charts"
									style="position: absolute; text-decoration: none; color: rgb(0, 0, 0); font-family: 'Open Sans'; font-size: 11px; opacity: 0.7; display: block; left: 5px; top: 5px;"></a>
							</div>
						</div>
					</div>
				</div>
            		</div>
            	</div>
            	
            	<div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> Sessions duration chart
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="c3chartDduration"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
            	
            	
            </div>
            
            
            
<!--             FINE RIGA GAUGES -->
 
 
 <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> Sessions chart
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="c3chartD" class="c3" style="max-height: 320px; position: relative;"><svg width="920" height="320" style="overflow: hidden;"><defs><clipPath id="c3-1460377397732-clip"><rect width="878" height="266"></rect></clipPath><clipPath id="c3-1460377397732-clip-xaxis"><rect x="-41" y="-20" width="950" height="70"></rect></clipPath><clipPath id="c3-1460377397732-clip-yaxis"><rect x="-39" y="-4" width="60" height="290"></rect></clipPath><clipPath id="c3-1460377397732-clip-grid"><rect width="878" height="266"></rect></clipPath><clipPath id="c3-1460377397732-clip-subchart"><rect width="878"></rect></clipPath></defs><g transform="translate(40.5,4.5)"><text class="c3-text c3-empty" text-anchor="middle" dominant-baseline="middle" x="439" y="133" style="opacity: 0;"></text><rect class="c3-zoom-rect" width="878" height="266" style="opacity: 0;"></rect><g clip-path="url(http://localhost:8080/PwReport/login.html#c3-1460377397732-clip)" class="c3-regions" style="visibility: visible;"><g class=" c3-region c3-region-0 goalArea"><rect x="0" y="266" width="878" height="0" style="fill-opacity: 0.1;"></rect></g></g><g clip-path="url(http://localhost:8080/PwReport/login.html#c3-1460377397732-clip-grid)" class="c3-grid" style="visibility: visible;"><g class="c3-ygrids"><line class="c3-ygrid" x1="0" x2="878" y1="266" y2="266"></line><line class="c3-ygrid" x1="0" x2="878" y1="242" y2="242"></line><line class="c3-ygrid" x1="0" x2="878" y1="218" y2="218"></line><line class="c3-ygrid" x1="0" x2="878" y1="194" y2="194"></line><line class="c3-ygrid" x1="0" x2="878" y1="170" y2="170"></line><line class="c3-ygrid" x1="0" x2="878" y1="146" y2="146"></line><line class="c3-ygrid" x1="0" x2="878" y1="122" y2="122"></line><line class="c3-ygrid" x1="0" x2="878" y1="98" y2="98"></line><line class="c3-ygrid" x1="0" x2="878" y1="74" y2="74"></line><line class="c3-ygrid" x1="0" x2="878" y1="50" y2="50"></line><line class="c3-ygrid" x1="0" x2="878" y1="26" y2="26"></line><line class="c3-ygrid" x1="0" x2="878" y1="1" y2="1"></line></g><g class="c3-xgrid-focus"><line class="c3-xgrid-focus" x1="-10" x2="-10" y1="0" y2="266" style="visibility: hidden;"></line></g></g><g clip-path="url(http://localhost:8080/PwReport/login.html#c3-1460377397732-clip)" class="c3-chart"><g class="c3-event-rects c3-event-rects-single" style="fill-opacity: 0;"><rect class=" c3-event-rect c3-event-rect-0" x="7.5" y="0" width="22" height="266"></rect><rect class=" c3-event-rect c3-event-rect-1" x="29.5" y="0" width="29.5" height="266"></rect><rect class=" c3-event-rect c3-event-rect-2" x="59" y="0" width="29.5" height="266"></rect><rect class=" c3-event-rect c3-event-rect-3" x="88.5" y="0" width="29" height="266"></rect><rect class=" c3-event-rect c3-event-rect-4" x="117.5" y="0" width="29.5" height="266"></rect><rect class=" c3-event-rect c3-event-rect-5" x="147" y="0" width="29.5" height="266"></rect><rect class=" c3-event-rect c3-event-rect-6" x="176.5" y="0" width="29" height="266"></rect><rect class=" c3-event-rect c3-event-rect-7" x="205.5" y="0" width="29.5" height="266"></rect><rect class=" c3-event-rect c3-event-rect-8" x="235" y="0" width="29.5" height="266"></rect><rect class=" c3-event-rect c3-event-rect-9" x="264.5" y="0" width="29" height="266"></rect><rect class=" c3-event-rect c3-event-rect-10" x="293.5" y="0" width="29.5" height="266"></rect><rect class=" c3-event-rect c3-event-rect-11" x="323" y="0" width="29.5" height="266"></rect><rect class=" c3-event-rect c3-event-rect-12" x="352.5" y="0" width="29" height="266"></rect><rect class=" c3-event-rect c3-event-rect-13" x="381.5" y="0" width="29" height="266"></rect><rect class=" c3-event-rect c3-event-rect-14" x="410.5" y="0" width="29.5" height="266"></rect><rect class=" c3-event-rect c3-event-rect-15" x="440" y="0" width="29" height="266"></rect><rect class=" c3-event-rect c3-event-rect-16" x="469" y="0" width="28.5" height="266"></rect><rect class=" c3-event-rect c3-event-rect-17" x="497.5" y="0" width="29" height="266"></rect><rect class=" c3-event-rect c3-event-rect-18" x="526.5" y="0" width="29.5" height="266"></rect><rect class=" c3-event-rect c3-event-rect-19" x="556" y="0" width="29.5" height="266"></rect><rect class=" c3-event-rect c3-event-rect-20" x="585.5" y="0" width="29" height="266"></rect><rect class=" c3-event-rect c3-event-rect-21" x="614.5" y="0" width="29.5" height="266"></rect><rect class=" c3-event-rect c3-event-rect-22" x="644" y="0" width="29.5" height="266"></rect><rect class=" c3-event-rect c3-event-rect-23" x="673.5" y="0" width="29" height="266"></rect><rect class=" c3-event-rect c3-event-rect-24" x="702.5" y="0" width="29.5" height="266"></rect><rect class=" c3-event-rect c3-event-rect-25" x="732" y="0" width="29.5" height="266"></rect><rect class=" c3-event-rect c3-event-rect-26" x="761.5" y="0" width="29" height="266"></rect><rect class=" c3-event-rect c3-event-rect-27" x="790.5" y="0" width="29.5" height="266"></rect><rect class=" c3-event-rect c3-event-rect-28" x="820" y="0" width="29.5" height="266"></rect><rect class=" c3-event-rect c3-event-rect-29" x="849.5" y="0" width="21.5" height="266"></rect></g><g class="c3-chart-bars"><g class="c3-chart-bar c3-target c3-target-ExerClass" style="opacity: 1; pointer-events: none;"><g class=" c3-shapes c3-shapes-ExerClass c3-bars c3-bars-ExerClass" style="cursor: pointer;"><path class=" c3-shape c3-shape-0 c3-bar c3-bar-0" d="M 1.83,266 L1.83,266 L28.17,266 L28.17,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-1 c3-bar c3-bar-1" d="M 30.83,266 L30.83,266 L57.17,266 L57.17,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-2 c3-bar c3-bar-2" d="M 60.83,266 L60.83,266 L87.17,266 L87.17,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-3 c3-bar c3-bar-3" d="M 89.83,266 L89.83,266 L116.17,266 L116.17,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-4 c3-bar c3-bar-4" d="M 118.83,145.54545454545456 L118.83,145.54545454545456 L145.17,145.54545454545456 L145.17,145.54545454545456 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-5 c3-bar c3-bar-5" d="M 148.83,145.54545454545456 L148.83,145.54545454545456 L175.17000000000002,145.54545454545456 L175.17000000000002,145.54545454545456 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-6 c3-bar c3-bar-6" d="M 177.83,266 L177.83,266 L204.17000000000002,266 L204.17000000000002,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-7 c3-bar c3-bar-7" d="M 206.83,145.54545454545456 L206.83,145.54545454545456 L233.17000000000002,145.54545454545456 L233.17000000000002,145.54545454545456 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-8 c3-bar c3-bar-8" d="M 236.83,266 L236.83,266 L263.17,266 L263.17,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-9 c3-bar c3-bar-9" d="M 265.83,266 L265.83,266 L292.16999999999996,266 L292.16999999999996,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-10 c3-bar c3-bar-10" d="M 294.83,266 L294.83,266 L321.16999999999996,266 L321.16999999999996,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-11 c3-bar c3-bar-11" d="M 324.83,266 L324.83,266 L351.16999999999996,266 L351.16999999999996,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-12 c3-bar c3-bar-12" d="M 353.83,266 L353.83,266 L380.16999999999996,266 L380.16999999999996,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-13 c3-bar c3-bar-13" d="M 382.83,266 L382.83,266 L409.16999999999996,266 L409.16999999999996,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-14 c3-bar c3-bar-14" d="M 411.83,266 L411.83,266 L438.16999999999996,266 L438.16999999999996,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-15 c3-bar c3-bar-15" d="M 441.83,266 L441.83,266 L468.16999999999996,266 L468.16999999999996,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-16 c3-bar c3-bar-16" d="M 469.83,266 L469.83,266 L496.16999999999996,266 L496.16999999999996,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-17 c3-bar c3-bar-17" d="M 498.83,266 L498.83,266 L525.17,266 L525.17,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-18 c3-bar c3-bar-18" d="M 527.83,266 L527.83,266 L554.1700000000001,266 L554.1700000000001,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-19 c3-bar c3-bar-19" d="M 557.83,145.54545454545456 L557.83,25.090909090909122 L584.1700000000001,25.090909090909122 L584.1700000000001,145.54545454545456 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-20 c3-bar c3-bar-20" d="M 586.83,266 L586.83,266 L613.1700000000001,266 L613.1700000000001,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-21 c3-bar c3-bar-21" d="M 615.83,266 L615.83,266 L642.1700000000001,266 L642.1700000000001,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-22 c3-bar c3-bar-22" d="M 645.83,266 L645.83,266 L672.1700000000001,266 L672.1700000000001,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-23 c3-bar c3-bar-23" d="M 674.83,266 L674.83,25.0909090909091 L701.1700000000001,25.0909090909091 L701.1700000000001,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-24 c3-bar c3-bar-24" d="M 703.83,145.54545454545456 L703.83,145.54545454545456 L730.1700000000001,145.54545454545456 L730.1700000000001,145.54545454545456 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-25 c3-bar c3-bar-25" d="M 733.83,266 L733.83,266 L760.1700000000001,266 L760.1700000000001,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-26 c3-bar c3-bar-26" d="M 762.83,266 L762.83,145.54545454545456 L789.1700000000001,145.54545454545456 L789.1700000000001,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-27 c3-bar c3-bar-27" d="M 791.83,266 L791.83,266 L818.1700000000001,266 L818.1700000000001,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-28 c3-bar c3-bar-28" d="M 821.83,266 L821.83,266 L848.1700000000001,266 L848.1700000000001,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path><path class=" c3-shape c3-shape-29 c3-bar c3-bar-29" d="M 850.83,266 L850.83,145.54545454545456 L877.1700000000001,145.54545454545456 L877.1700000000001,266 z" style="stroke: rgb(44, 98, 140); fill: rgb(44, 98, 140); opacity: 1;"></path></g></g><g class="c3-chart-bar c3-target c3-target-ExerGame" style="opacity: 1; pointer-events: none;"><g class=" c3-shapes c3-shapes-ExerGame c3-bars c3-bars-ExerGame" style="cursor: pointer;"><path class=" c3-shape c3-shape-0 c3-bar c3-bar-0" d="M 1.83,266 L1.83,266 L28.17,266 L28.17,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-1 c3-bar c3-bar-1" d="M 30.83,266 L30.83,266 L57.17,266 L57.17,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-2 c3-bar c3-bar-2" d="M 60.83,266 L60.83,266 L87.17,266 L87.17,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-3 c3-bar c3-bar-3" d="M 89.83,266 L89.83,266 L116.17,266 L116.17,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-4 c3-bar c3-bar-4" d="M 118.83,266 L118.83,266 L145.17,266 L145.17,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-5 c3-bar c3-bar-5" d="M 148.83,266 L148.83,145.54545454545456 L175.17000000000002,145.54545454545456 L175.17000000000002,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-6 c3-bar c3-bar-6" d="M 177.83,266 L177.83,266 L204.17000000000002,266 L204.17000000000002,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-7 c3-bar c3-bar-7" d="M 206.83,266 L206.83,145.54545454545456 L233.17000000000002,145.54545454545456 L233.17000000000002,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-8 c3-bar c3-bar-8" d="M 236.83,266 L236.83,266 L263.17,266 L263.17,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-9 c3-bar c3-bar-9" d="M 265.83,266 L265.83,266 L292.16999999999996,266 L292.16999999999996,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-10 c3-bar c3-bar-10" d="M 294.83,266 L294.83,266 L321.16999999999996,266 L321.16999999999996,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-11 c3-bar c3-bar-11" d="M 324.83,266 L324.83,266 L351.16999999999996,266 L351.16999999999996,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-12 c3-bar c3-bar-12" d="M 353.83,266 L353.83,266 L380.16999999999996,266 L380.16999999999996,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-13 c3-bar c3-bar-13" d="M 382.83,266 L382.83,266 L409.16999999999996,266 L409.16999999999996,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-14 c3-bar c3-bar-14" d="M 411.83,266 L411.83,266 L438.16999999999996,266 L438.16999999999996,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-15 c3-bar c3-bar-15" d="M 441.83,266 L441.83,266 L468.16999999999996,266 L468.16999999999996,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-16 c3-bar c3-bar-16" d="M 469.83,266 L469.83,266 L496.16999999999996,266 L496.16999999999996,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-17 c3-bar c3-bar-17" d="M 498.83,266 L498.83,266 L525.17,266 L525.17,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-18 c3-bar c3-bar-18" d="M 527.83,266 L527.83,266 L554.1700000000001,266 L554.1700000000001,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-19 c3-bar c3-bar-19" d="M 557.83,266 L557.83,266 L584.1700000000001,266 L584.1700000000001,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-20 c3-bar c3-bar-20" d="M 586.83,266 L586.83,266 L613.1700000000001,266 L613.1700000000001,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-21 c3-bar c3-bar-21" d="M 615.83,266 L615.83,266 L642.1700000000001,266 L642.1700000000001,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-22 c3-bar c3-bar-22" d="M 645.83,266 L645.83,266 L672.1700000000001,266 L672.1700000000001,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-23 c3-bar c3-bar-23" d="M 674.83,266 L674.83,266 L701.1700000000001,266 L701.1700000000001,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-24 c3-bar c3-bar-24" d="M 703.83,266 L703.83,266 L730.1700000000001,266 L730.1700000000001,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-25 c3-bar c3-bar-25" d="M 733.83,266 L733.83,266 L760.1700000000001,266 L760.1700000000001,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-26 c3-bar c3-bar-26" d="M 762.83,266 L762.83,266 L789.1700000000001,266 L789.1700000000001,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-27 c3-bar c3-bar-27" d="M 791.83,266 L791.83,266 L818.1700000000001,266 L818.1700000000001,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-28 c3-bar c3-bar-28" d="M 821.83,266 L821.83,266 L848.1700000000001,266 L848.1700000000001,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path><path class=" c3-shape c3-shape-29 c3-bar c3-bar-29" d="M 850.83,266 L850.83,266 L877.1700000000001,266 L877.1700000000001,266 z" style="stroke: rgb(85, 26, 139); fill: rgb(85, 26, 139); opacity: 1;"></path></g></g><g class="c3-chart-bar c3-target c3-target-ActiveLifeStyle" style="opacity: 1; pointer-events: none;"><g class=" c3-shapes c3-shapes-ActiveLifeStyle c3-bars c3-bars-ActiveLifeStyle" style="cursor: pointer;"><path class=" c3-shape c3-shape-0 c3-bar c3-bar-0" d="M 1.83,266 L1.83,266 L28.17,266 L28.17,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-1 c3-bar c3-bar-1" d="M 30.83,266 L30.83,266 L57.17,266 L57.17,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-2 c3-bar c3-bar-2" d="M 60.83,266 L60.83,266 L87.17,266 L87.17,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-3 c3-bar c3-bar-3" d="M 89.83,266 L89.83,266 L116.17,266 L116.17,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-4 c3-bar c3-bar-4" d="M 118.83,266 L118.83,145.54545454545456 L145.17,145.54545454545456 L145.17,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-5 c3-bar c3-bar-5" d="M 148.83,145.54545454545456 L148.83,145.54545454545456 L175.17000000000002,145.54545454545456 L175.17000000000002,145.54545454545456 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-6 c3-bar c3-bar-6" d="M 177.83,266 L177.83,266 L204.17000000000002,266 L204.17000000000002,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-7 c3-bar c3-bar-7" d="M 206.83,145.54545454545456 L206.83,145.54545454545456 L233.17000000000002,145.54545454545456 L233.17000000000002,145.54545454545456 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-8 c3-bar c3-bar-8" d="M 236.83,266 L236.83,266 L263.17,266 L263.17,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-9 c3-bar c3-bar-9" d="M 265.83,266 L265.83,266 L292.16999999999996,266 L292.16999999999996,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-10 c3-bar c3-bar-10" d="M 294.83,266 L294.83,266 L321.16999999999996,266 L321.16999999999996,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-11 c3-bar c3-bar-11" d="M 324.83,266 L324.83,266 L351.16999999999996,266 L351.16999999999996,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-12 c3-bar c3-bar-12" d="M 353.83,266 L353.83,266 L380.16999999999996,266 L380.16999999999996,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-13 c3-bar c3-bar-13" d="M 382.83,266 L382.83,266 L409.16999999999996,266 L409.16999999999996,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-14 c3-bar c3-bar-14" d="M 411.83,266 L411.83,266 L438.16999999999996,266 L438.16999999999996,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-15 c3-bar c3-bar-15" d="M 441.83,266 L441.83,266 L468.16999999999996,266 L468.16999999999996,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-16 c3-bar c3-bar-16" d="M 469.83,266 L469.83,266 L496.16999999999996,266 L496.16999999999996,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-17 c3-bar c3-bar-17" d="M 498.83,266 L498.83,266 L525.17,266 L525.17,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-18 c3-bar c3-bar-18" d="M 527.83,266 L527.83,266 L554.1700000000001,266 L554.1700000000001,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-19 c3-bar c3-bar-19" d="M 557.83,266 L557.83,145.54545454545456 L584.1700000000001,145.54545454545456 L584.1700000000001,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-20 c3-bar c3-bar-20" d="M 586.83,266 L586.83,266 L613.1700000000001,266 L613.1700000000001,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-21 c3-bar c3-bar-21" d="M 615.83,266 L615.83,266 L642.1700000000001,266 L642.1700000000001,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-22 c3-bar c3-bar-22" d="M 645.83,266 L645.83,266 L672.1700000000001,266 L672.1700000000001,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-23 c3-bar c3-bar-23" d="M 674.83,266 L674.83,266 L701.1700000000001,266 L701.1700000000001,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-24 c3-bar c3-bar-24" d="M 703.83,266 L703.83,145.54545454545456 L730.1700000000001,145.54545454545456 L730.1700000000001,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-25 c3-bar c3-bar-25" d="M 733.83,266 L733.83,266 L760.1700000000001,266 L760.1700000000001,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-26 c3-bar c3-bar-26" d="M 762.83,266 L762.83,266 L789.1700000000001,266 L789.1700000000001,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-27 c3-bar c3-bar-27" d="M 791.83,266 L791.83,266 L818.1700000000001,266 L818.1700000000001,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-28 c3-bar c3-bar-28" d="M 821.83,266 L821.83,266 L848.1700000000001,266 L848.1700000000001,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path><path class=" c3-shape c3-shape-29 c3-bar c3-bar-29" d="M 850.83,266 L850.83,266 L877.1700000000001,266 L877.1700000000001,266 z" style="stroke: rgb(220, 180, 242); fill: rgb(220, 180, 242); opacity: 1;"></path></g></g></g><g class="c3-chart-lines"><g class="c3-chart-line c3-target c3-target-ExerClass" style="opacity: 1; pointer-events: none;"><g class=" c3-shapes c3-shapes-ExerClass c3-lines c3-lines-ExerClass"></g><g class=" c3-shapes c3-shapes-ExerClass c3-areas c3-areas-ExerClass"></g><g class=" c3-selected-circles c3-selected-circles-ExerClass"></g><g class=" c3-shapes c3-shapes-ExerClass c3-circles c3-circles-ExerClass" style="cursor: pointer;"></g></g><g class="c3-chart-line c3-target c3-target-ExerGame" style="opacity: 1; pointer-events: none;"><g class=" c3-shapes c3-shapes-ExerGame c3-lines c3-lines-ExerGame"></g><g class=" c3-shapes c3-shapes-ExerGame c3-areas c3-areas-ExerGame"></g><g class=" c3-selected-circles c3-selected-circles-ExerGame"></g><g class=" c3-shapes c3-shapes-ExerGame c3-circles c3-circles-ExerGame" style="cursor: pointer;"></g></g><g class="c3-chart-line c3-target c3-target-ActiveLifeStyle" style="opacity: 1; pointer-events: none;"><g class=" c3-shapes c3-shapes-ActiveLifeStyle c3-lines c3-lines-ActiveLifeStyle"></g><g class=" c3-shapes c3-shapes-ActiveLifeStyle c3-areas c3-areas-ActiveLifeStyle"></g><g class=" c3-selected-circles c3-selected-circles-ActiveLifeStyle"></g><g class=" c3-shapes c3-shapes-ActiveLifeStyle c3-circles c3-circles-ActiveLifeStyle" style="cursor: pointer;"></g></g></g><g class="c3-chart-arcs" transform="translate(439,128)"><text class="c3-chart-arcs-title" style="text-anchor: middle; opacity: 0;"></text></g><g class="c3-chart-texts"><g class="c3-chart-text c3-target c3-target-ExerClass" style="opacity: 1; pointer-events: none;"><g class=" c3-texts c3-texts-ExerClass"></g></g><g class="c3-chart-text c3-target c3-target-ExerGame" style="opacity: 1; pointer-events: none;"><g class=" c3-texts c3-texts-ExerGame"></g></g><g class="c3-chart-text c3-target c3-target-ActiveLifeStyle" style="opacity: 1; pointer-events: none;"><g class=" c3-texts c3-texts-ActiveLifeStyle"></g></g></g></g><g clip-path="url(http://localhost:8080/PwReport/login.html#c3-1460377397732-clip-grid)" class="c3-grid c3-grid-lines"><g class="c3-xgrid-lines"></g><g class="c3-ygrid-lines"></g></g><g class="c3-axis c3-axis-x" clip-path="url(http://localhost:8080/PwReport/login.html#c3-1460377397732-clip-xaxis)" transform="translate(0,266)" style="visibility: visible; opacity: 1;"><text class="c3-axis-x-label" transform="" x="878" dx="-0.5em" dy="-0.5em" style="text-anchor: end;"></text><g class="tick" transform="translate(15, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: block;"><tspan x="0" dy=".71em" dx="0">12-03-2016</tspan></text></g><g class="tick" transform="translate(44, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">13-03-2016</tspan></text></g><g class="tick" transform="translate(74, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">14-03-2016</tspan></text></g><g class="tick" transform="translate(103, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">15-03-2016</tspan></text></g><g class="tick" transform="translate(132, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: block;"><tspan x="0" dy=".71em" dx="0">16-03-2016</tspan></text></g><g class="tick" transform="translate(162, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">17-03-2016</tspan></text></g><g class="tick" transform="translate(191, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">18-03-2016</tspan></text></g><g class="tick" transform="translate(220, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">19-03-2016</tspan></text></g><g class="tick" transform="translate(250, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: block;"><tspan x="0" dy=".71em" dx="0">20-03-2016</tspan></text></g><g class="tick" transform="translate(279, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">21-03-2016</tspan></text></g><g class="tick" transform="translate(308, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">22-03-2016</tspan></text></g><g class="tick" transform="translate(338, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">23-03-2016</tspan></text></g><g class="tick" transform="translate(367, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: block;"><tspan x="0" dy=".71em" dx="0">24-03-2016</tspan></text></g><g class="tick" transform="translate(396, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">25-03-2016</tspan></text></g><g class="tick" transform="translate(425, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">26-03-2016</tspan></text></g><g class="tick" transform="translate(455, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">27-03-2016</tspan></text></g><g class="tick" transform="translate(483, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: block;"><tspan x="0" dy=".71em" dx="0">28-03-2016</tspan></text></g><g class="tick" transform="translate(512, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">29-03-2016</tspan></text></g><g class="tick" transform="translate(541, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">30-03-2016</tspan></text></g><g class="tick" transform="translate(571, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">31-03-2016</tspan></text></g><g class="tick" transform="translate(600, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: block;"><tspan x="0" dy=".71em" dx="0">01-04-2016</tspan></text></g><g class="tick" transform="translate(629, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">02-04-2016</tspan></text></g><g class="tick" transform="translate(659, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">03-04-2016</tspan></text></g><g class="tick" transform="translate(688, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">04-04-2016</tspan></text></g><g class="tick" transform="translate(717, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: block;"><tspan x="0" dy=".71em" dx="0">05-04-2016</tspan></text></g><g class="tick" transform="translate(747, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">06-04-2016</tspan></text></g><g class="tick" transform="translate(776, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">07-04-2016</tspan></text></g><g class="tick" transform="translate(805, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">08-04-2016</tspan></text></g><g class="tick" transform="translate(835, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: block;"><tspan x="0" dy=".71em" dx="0">09-04-2016</tspan></text></g><g class="tick" transform="translate(864, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">10-04-2016</tspan></text></g><path class="domain" d="M0,6V0H878V6"></path></g><g class="c3-axis c3-axis-y" clip-path="url(http://localhost:8080/PwReport/login.html#c3-1460377397732-clip-yaxis)" transform="translate(0,0)" style="visibility: visible; opacity: 1;"><text class="c3-axis-y-label" transform="rotate(-90)" x="0" dx="-0.5em" dy="1.2em" style="text-anchor: end;"></text><g class="tick" transform="translate(0,266)" style="opacity: 1;"><line x2="-6"></line><text x="-9" y="0" style="text-anchor: end;"><tspan x="-9" dy="3">0</tspan></text></g><g class="tick" transform="translate(0,242)" style="opacity: 1;"><line x2="-6"></line><text x="-9" y="0" style="text-anchor: end;"><tspan x="-9" dy="3">0.2</tspan></text></g><g class="tick" transform="translate(0,218)" style="opacity: 1;"><line x2="-6"></line><text x="-9" y="0" style="text-anchor: end;"><tspan x="-9" dy="3">0.4</tspan></text></g><g class="tick" transform="translate(0,194)" style="opacity: 1;"><line x2="-6"></line><text x="-9" y="0" style="text-anchor: end;"><tspan x="-9" dy="3">0.6</tspan></text></g><g class="tick" transform="translate(0,170)" style="opacity: 1;"><line x2="-6"></line><text x="-9" y="0" style="text-anchor: end;"><tspan x="-9" dy="3">0.8</tspan></text></g><g class="tick" transform="translate(0,146)" style="opacity: 1;"><line x2="-6"></line><text x="-9" y="0" style="text-anchor: end;"><tspan x="-9" dy="3">1</tspan></text></g><g class="tick" transform="translate(0,122)" style="opacity: 1;"><line x2="-6"></line><text x="-9" y="0" style="text-anchor: end;"><tspan x="-9" dy="3">1.2</tspan></text></g><g class="tick" transform="translate(0,98)" style="opacity: 1;"><line x2="-6"></line><text x="-9" y="0" style="text-anchor: end;"><tspan x="-9" dy="3">1.4</tspan></text></g><g class="tick" transform="translate(0,74)" style="opacity: 1;"><line x2="-6"></line><text x="-9" y="0" style="text-anchor: end;"><tspan x="-9" dy="3">1.6</tspan></text></g><g class="tick" transform="translate(0,50)" style="opacity: 1;"><line x2="-6"></line><text x="-9" y="0" style="text-anchor: end;"><tspan x="-9" dy="3">1.8</tspan></text></g><g class="tick" transform="translate(0,26)" style="opacity: 1;"><line x2="-6"></line><text x="-9" y="0" style="text-anchor: end;"><tspan x="-9" dy="3">2</tspan></text></g><g class="tick" transform="translate(0,1)" style="opacity: 1;"><line x2="-6"></line><text x="-9" y="0" style="text-anchor: end;"><tspan x="-9" dy="3">2.2</tspan></text></g><path class="domain" d="M-6,1H0V266H-6"></path></g><g class="c3-axis c3-axis-y2" transform="translate(878,0)" style="visibility: hidden; opacity: 1;"><text class="c3-axis-y2-label" transform="rotate(-90)" x="0" dx="-0.5em" dy="-0.5em" style="text-anchor: end;"></text><g class="tick" transform="translate(0,266)" style="opacity: 1;"><line x2="6" y2="0"></line><text x="9" y="0" style="text-anchor: start;"><tspan x="9" dy="3">0</tspan></text></g><g class="tick" transform="translate(0,240)" style="opacity: 1;"><line x2="6" y2="0"></line><text x="9" y="0" style="text-anchor: start;"><tspan x="9" dy="3">0.1</tspan></text></g><g class="tick" transform="translate(0,213)" style="opacity: 1;"><line x2="6" y2="0"></line><text x="9" y="0" style="text-anchor: start;"><tspan x="9" dy="3">0.2</tspan></text></g><g class="tick" transform="translate(0,187)" style="opacity: 1;"><line x2="6" y2="0"></line><text x="9" y="0" style="text-anchor: start;"><tspan x="9" dy="3">0.3</tspan></text></g><g class="tick" transform="translate(0,160)" style="opacity: 1;"><line x2="6" y2="0"></line><text x="9" y="0" style="text-anchor: start;"><tspan x="9" dy="3">0.4</tspan></text></g><g class="tick" transform="translate(0,134)" style="opacity: 1;"><line x2="6" y2="0"></line><text x="9" y="0" style="text-anchor: start;"><tspan x="9" dy="3">0.5</tspan></text></g><g class="tick" transform="translate(0,107)" style="opacity: 1;"><line x2="6" y2="0"></line><text x="9" y="0" style="text-anchor: start;"><tspan x="9" dy="3">0.6</tspan></text></g><g class="tick" transform="translate(0,81)" style="opacity: 1;"><line x2="6" y2="0"></line><text x="9" y="0" style="text-anchor: start;"><tspan x="9" dy="3">0.7</tspan></text></g><g class="tick" transform="translate(0,54)" style="opacity: 1;"><line x2="6" y2="0"></line><text x="9" y="0" style="text-anchor: start;"><tspan x="9" dy="3">0.8</tspan></text></g><g class="tick" transform="translate(0,28)" style="opacity: 1;"><line x2="6" y2="0"></line><text x="9" y="0" style="text-anchor: start;"><tspan x="9" dy="3">0.9</tspan></text></g><g class="tick" transform="translate(0,1)" style="opacity: 1;"><line x2="6" y2="0"></line><text x="9" y="0" style="text-anchor: start;"><tspan x="9" dy="3">1</tspan></text></g><path class="domain" d="M6,1H0V266H6"></path></g></g><g transform="translate(20.5,320.5)" style="visibility: hidden;"><g clip-path="url(http://localhost:8080/PwReport/login.html#c3-1460377397732-clip-subchart)" class="c3-chart"><g class="c3-chart-bars"></g><g class="c3-chart-lines"></g></g><g clip-path="url(http://localhost:8080/PwReport/login.html#c3-1460377397732-clip)" class="c3-brush" style="pointer-events: all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><rect class="background" x="0" width="898" style="visibility: hidden; cursor: crosshair;"></rect><rect class="extent" x="0" width="0" style="cursor: move;"></rect><g class="resize e" transform="translate(0,0)" style="cursor: ew-resize; display: none;"><rect x="-3" width="6" height="6" style="visibility: hidden;"></rect></g><g class="resize w" transform="translate(0,0)" style="cursor: ew-resize; display: none;"><rect x="-3" width="6" height="6" style="visibility: hidden;"></rect></g></g><g class="c3-axis-x" transform="translate(0,0)" clip-path="url(http://localhost:8080/PwReport/login.html#c3-1460377397732-clip-xaxis)" style="opacity: 1;"><g class="tick" transform="translate(15, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: block;"><tspan x="0" dy=".71em" dx="0">12-03-2016</tspan></text></g><g class="tick" transform="translate(44, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">13-03-2016</tspan></text></g><g class="tick" transform="translate(74, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">14-03-2016</tspan></text></g><g class="tick" transform="translate(103, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">15-03-2016</tspan></text></g><g class="tick" transform="translate(132, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: block;"><tspan x="0" dy=".71em" dx="0">16-03-2016</tspan></text></g><g class="tick" transform="translate(162, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">17-03-2016</tspan></text></g><g class="tick" transform="translate(191, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">18-03-2016</tspan></text></g><g class="tick" transform="translate(220, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">19-03-2016</tspan></text></g><g class="tick" transform="translate(250, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: block;"><tspan x="0" dy=".71em" dx="0">20-03-2016</tspan></text></g><g class="tick" transform="translate(279, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">21-03-2016</tspan></text></g><g class="tick" transform="translate(308, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">22-03-2016</tspan></text></g><g class="tick" transform="translate(338, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">23-03-2016</tspan></text></g><g class="tick" transform="translate(367, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: block;"><tspan x="0" dy=".71em" dx="0">24-03-2016</tspan></text></g><g class="tick" transform="translate(396, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">25-03-2016</tspan></text></g><g class="tick" transform="translate(425, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">26-03-2016</tspan></text></g><g class="tick" transform="translate(455, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">27-03-2016</tspan></text></g><g class="tick" transform="translate(483, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: block;"><tspan x="0" dy=".71em" dx="0">28-03-2016</tspan></text></g><g class="tick" transform="translate(512, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">29-03-2016</tspan></text></g><g class="tick" transform="translate(541, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">30-03-2016</tspan></text></g><g class="tick" transform="translate(571, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">31-03-2016</tspan></text></g><g class="tick" transform="translate(600, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: block;"><tspan x="0" dy=".71em" dx="0">01-04-2016</tspan></text></g><g class="tick" transform="translate(629, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">02-04-2016</tspan></text></g><g class="tick" transform="translate(659, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">03-04-2016</tspan></text></g><g class="tick" transform="translate(688, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">04-04-2016</tspan></text></g><g class="tick" transform="translate(717, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: block;"><tspan x="0" dy=".71em" dx="0">05-04-2016</tspan></text></g><g class="tick" transform="translate(747, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">06-04-2016</tspan></text></g><g class="tick" transform="translate(776, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">07-04-2016</tspan></text></g><g class="tick" transform="translate(805, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">08-04-2016</tspan></text></g><g class="tick" transform="translate(835, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: block;"><tspan x="0" dy=".71em" dx="0">09-04-2016</tspan></text></g><g class="tick" transform="translate(864, 0)" style="opacity: 1;"><line y2="6" x1="0" x2="0"></line><text y="9" x="0" transform="" style="text-anchor: middle; display: none;"><tspan x="0" dy=".71em" dx="0">10-04-2016</tspan></text></g><path class="domain" d="M0,6V0H878V6"></path></g></g><g transform="translate(0,300)"><g class=" c3-legend-item c3-legend-item-ExerClass" style="visibility: visible; cursor: pointer;"><text x="346.140625" y="9" style="pointer-events: none;">ExerClass</text><rect class="c3-legend-item-event" x="332.140625" y="-5" width="79.671875" height="18" style="fill-opacity: 0;"></rect><rect class="c3-legend-item-tile" x="332.140625" y="0" width="10" height="10" style="pointer-events: none; fill: rgb(44, 98, 140);"></rect></g><g class=" c3-legend-item c3-legend-item-ExerGame" style="visibility: visible; cursor: pointer;"><text x="425.8125" y="9" style="pointer-events: none;">ExerGame</text><rect class="c3-legend-item-event" x="411.8125" y="-5" width="82.34375" height="18" style="fill-opacity: 0;"></rect><rect class="c3-legend-item-tile" x="411.8125" y="0" width="10" height="10" style="pointer-events: none; fill: rgb(85, 26, 139);"></rect></g><g class=" c3-legend-item c3-legend-item-ActiveLifeStyle" style="visibility: visible; cursor: pointer;"><text x="508.15625" y="9" style="pointer-events: none;">ActiveLifeStyle</text><rect class="c3-legend-item-event" x="494.15625" y="-5" width="93.703125" height="18" style="fill-opacity: 0;"></rect><rect class="c3-legend-item-tile" x="494.15625" y="0" width="10" height="10" style="pointer-events: none; fill: rgb(220, 180, 242);"></rect></g></g></svg><div class="c3-tooltip-container" style="position: absolute; pointer-events: none; display: none;"></div></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
 </div>
</div>