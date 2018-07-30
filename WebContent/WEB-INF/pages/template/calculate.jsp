 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
  
 <div class="row" >
                <div class="col-lg-6">
                    <h1 class="page-header" >Dashboard  </h1>
                </div>
                <div class="col-lg-6 col-md-6 pull-right" style="margin-top: 40px">
					<ul class="nav nav-pills pull-right">
					  <li role="presentation" class="active" id="allPill"><a href="#"><spring:message code="dashboard.label.all" /></a></li>
					  <li role="presentation" id="classPill"><a href="#"><spring:message code="dashboard.label.class" /></a></li>
					  <li role="presentation" id="gamePill"><a href="#"><spring:message code="dashboard.label.game" /></a></li>
					  <li role="presentation" id="activePill"><a href="#"><spring:message code="dashboard.label.pa" /></a></li>
					</ul>
				</div>
            </div>
<!--             ALERT - OBSOLETE -->
 <div class="row">
			<div class="col-lg-12">
			
			<div class="alert alert-danger" role="alert" id="obsolete"><spring:message code="obsolete" htmlEscape="false"/></div>
			
			</div>
</div>           
            
<!-- CARD -->
<div class="row">
	<div id="card" class="row" style="color:#556453;">
			<div class="col-lg-12">
				<div class="w3-card-4 w3-hover-shadow w3-center">
				<header class="w3-container" style="color: #FFF; background-color:#556453;">
						<div class="col-lg-12">
							<h4>
								<spring:message code="lifestyle.physical.programme.title" />
								<br>
								[
								<fmt:formatDate value="${exProgramme.date}"
									pattern="dd-MM-yyyy" />
								]
							</h4>
						</div>
				</header>
					
					
					
<!-- 					<div class="row"> &nbsp;</div> -->
					
					<div class="w3-container w3-center">
						
							<div class="row">
								<div class="col-lg-3">
										<img src="resources/images/logo_trasparente.png"  height="136" alt="PATHway ExerciseProgramme">
								</div>
							
							
								<div class="col-lg-4" style = "padding-left: 5px; padding-right: 5px">
									
									<div class="col-lg-12" style="color: #556453; 
									background-color:#b8c8a9; height: 40px; padding-top: 10px; padding-left: 5px; padding-right: 5px; padding-bottom: 10px;
									margin-bottom: 5px">
										 <b><spring:message code="healthy.goal" /></b>
									</div>
									
								
									<c:choose>
									<c:when test="${exProgramme.personalWeeklyTime lt 1}">
									<div class="col-lg-12">
											<i class="fa fa-clock-o fa-3x" aria-hidden="true"></i> 
											<span id="weeklyTime">${exProgramme.weeklyTime}</span> <spring:message code="minutes" />
									</div>
									</c:when>
									
									
										<c:when test="${exProgramme.personalWeeklyTime gt 0}">
												<div class="col-lg-12">
														<i class="fa fa-clock-o fa-3x" aria-hidden="true"></i> 
														<span id="personalWeeklyTime">${exProgramme.personalWeeklyTime}</span> <spring:message code="minutes" />
												</div>
										</c:when>
									</c:choose>
									
									<div class="col-lg-12"> &nbsp;</div>
								
									<div class="col-lg-12">
											<i class="fa fa-hashtag fa-3x" aria-hidden="true"></i> 
											<span id="frequency">${exProgramme.weeklyFrequency}</span> <spring:message code="sessions.title" />
									</div>
								</div>
								
								
			<div class="col-lg-5" >
						<div class="row"  style = "padding-left: 5px; padding-right: 5px">
							<div class="col-lg-12" style="background-color:#b8c8a9; height: 40px; padding-top: 10px; padding-left: 5px; padding-right: 5px; padding-bottom: 10px;
									margin-bottom: 5px">
										<b><span style="vertical-align: middle"><spring:message code="dashboard.label.todo" /></span></b>
								</div>
						</div>
						
						
						<div class="row">
								<div class="col-lg-4 col-md-4 col-xs-4">
										<i class="fa fa-graduation-cap fa-2x"></i><br>
										<spring:message code="dashboard.label.class" />
								</div>
								
								<div class="col-lg-4 col-md-4 col-xs-4" >
										<i class="fa fa-clock-o" aria-hidden="true"></i> 
										<span id="classTime">${exProgramme.classDuration}</span> <spring:message code="minutes" />
								</div>
							
								<div class="col-lg-4 col-md-4 col-xs-4">
										<i class="fa fa-hashtag" aria-hidden="true"></i> 
										<span >${exProgramme.numberOfExerClass}</span> <spring:message code="sessions.title" />
								</div>
								
							</div>
							
							<div class="row">
								<div class="col-lg-4 col-md-4 col-xs-4">
										<i class="fa fa-gamepad fa-2x"></i><br>
										<spring:message code="dashboard.label.game" />
								</div>
								
								<div class="col-lg-4 col-md-4 col-xs-4">
										<i class="fa fa-clock-o" aria-hidden="true"></i> 
										<span id="gameTime">${exProgramme.gameDuration}</span> <spring:message code="minutes" />
								</div>
							
								<div class="col-lg-4 col-md-4 col-xs-4">
										<i class="fa fa-hashtag" aria-hidden="true"></i> 
										<span >${exProgramme.numberOfExerGame}</span> <spring:message code="sessions.title" />
								</div>
								
							</div>
							
							<div class="row">
								<div class="col-lg-4 col-md-4 col-xs-4">
										<i class="fa fa-futbol-o fa-2x"></i><br>
										<spring:message code="dashboard.label.pa" />
								</div>
								
								<div class="col-lg-4 col-md-4 col-xs-4">
										<i class="fa fa-clock-o" aria-hidden="true"></i> 
										<span id="classTime">${exProgramme.classDuration}</span> <spring:message code="minutes" />
								</div>
							
								<div class="col-lg-4 col-md-4 col-xs-4">
										<i class="fa fa-hashtag" aria-hidden="true"></i> 
										<span >${exProgramme.numberOfActiveLifestyleActivity}</span> <spring:message code="sessions.title" />
								</div>
								
							</div>
					</div>
				</div>
		</div>
  					
  					<div class="row"> &nbsp;</div>
  					
				</div> 
<!-- 				Fuori dalla card -->
			</div>
	</div>
</div> 

<div class="row"> &nbsp;</div>  
            
            <div class="row">
	            <div class="col-md-8">
<%-- 	            <h6 id="title">dsfasdn ajkd ${period}</h6> --%>
	            <h4><span class="label label-info" id="title">${period}</span></h4>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-md-12">
						<div class="btn-group" role="group" aria-label="...">
								<button type="button" class="btn btn-default ${this}" name="this" id="this"><spring:message code="dashboard.label.range1" /></button>
							  <button type="button" class="btn btn-default ${week}" name="week" id="week"><spring:message code="dashboard.label.range2" /></button>
							  <button type="button" class="btn btn-default ${month}" name="month" id="month"><spring:message code="dashboard.label.range3" /></button>
							  <button type="button" class="btn btn-default ${custom}" name="custom" id="custom"><spring:message code="dashboard.label.range4" /></button>
						</div>
					</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div id="output">
					<div class="panel panel-default">
	            		<div class="panel-heading">
							<div class="col-md-6" id="datepicker_div">
								<div class="input-daterange input-group" id="datepicker">
									<input id="start" type="text" class="input-sm form-control" name="start" /> <span
										class="input-group-addon"><spring:message code="to" /></span> <input id="end" type="text"
										class="input-sm form-control" name="end" />
								</div>
							</div>
								<button type="button" class="btn btn-primary" id="filter"><spring:message code="dashboard.label.filter" /></button>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div id="todo" style="display:none">
						<button class="btn btn-primary" type="button" id="todoButton" 
								data-toggle="popover" title='<spring:message code="dashboard.label.todo.title" />' 
								data-placement="right"
								data-content= "${todoList}">
							  <spring:message code="dashboard.label.todo" /> <span class="badge">${todo}</span>
						</button>
						
		</div>
				</div>
			</div>	
			
			<div id="msSummary">
<!-- 			RIGA SUMMARY MS -->
						<br>
						<h4><spring:message code="home.period.label"/></h4>
						<hr>
						<div class="row">
								<div class="col-lg-6 col-md-6">
											<div class="panel panel-info" id="panelMsSteps">
												<div class="panel-heading">
													<div class="row">
														<div class="col-xs-3">
															<span class="glyphicons glyphicons-shoe-steps"></span> <img
																height="50px" src="resources/images/steps_white.png" id="stepsImg"/>
														</div>
														<div class="col-xs-9 text-right">
															<div class="huge" id="steps"></div>
															<spring:message code="hr.of.label" />
															<b><spring:message code="steps.total" /></b>
														</div>
													</div>
													<div class="row">
														<div class="col-xs-3 col-md-offset-4">
															<!--                                     <i class="fa fa-thumbs-o-down fa-3x"></i> -->
														</div>
													</div>
												</div>
												<div class="panel-footer">
													<div align="right">
														<spring:message code="steps.avg" />
													</div>
													<div class="clearfix"></div>
												</div>
											</div>
								</div>
								
								<div class="col-lg-6 col-md-6">
											<div class="panel panel-info">
												<div class="panel-heading">
													<div class="row">
														<div class="col-xs-3 huge">
															<span class="glyphicon glyphicon-fire" aria-hidden="true"></span>
														</div>
														<div class="col-xs-9 text-right">
															<div class="huge" id="kcalday"></div>
															<span><br></span>
														</div>
													</div>
													<div class="row">
														<div class="col-xs-3 col-md-offset-4">
															<!--                                     <i class="fa fa-thumbs-o-down fa-3x"></i> -->
														</div>
													</div>
												</div>
												<div class="panel-footer">
													<div align="right">
														<spring:message code="kcal.avg" />
													</div>
													<div class="clearfix"></div>
												</div>
											</div>
								</div>
						</div>
			
<!-- 			FINE RIGA SUMMARY MS -->
</div>


<br>

<h4><spring:message code="home.sessions.label"/></h4>
<hr>
             <div class="row">
             
<!--              COLONNA KCAL -->
                <div class="col-lg-6 col-md-6">
                    
                     <div class="row">
                     	 <div class="col-lg-12 col-md-12">
		                     	 <div class="panel panel-success">
				                        <div class="panel-heading  white-tooltip" data-toggle="tooltip" data-placement="top" title='<spring:message code="hover.kcal" />'">
				                            <div class="row">
				                                 <div class="col-xs-3 huge">
												<span class="glyphicon glyphicon-fire" aria-hidden="true"></span>
				                                </div>
				                                <div class="col-xs-9 text-right">
				                                    <div class="huge" id="totalKcal"></div>
				                                </div>
				                                 <div align="right" style="margin-right: 10px;"> <spring:message code="kcal.total" /></div>
				                            </div>
				                        </div>
			                            <div class="panel-footer">
			                                 <div align="center"> <b><span id="avgKcal"></span></b> <spring:message code="kcal.avg" /> </div> 
			                                 
			                                <div class="clearfix"></div>
			                            </div>
                   				 </div>
                     	 
                     	 </div>
                     </div>
                     
                </div>
                
<!--                 FINE COLONNA KCAL -->

<!-- 				COLONNA BPM -->
				 <div class="col-lg-6 col-md-6">
				 
				 	<div class="row">
							<div class="col-lg-12 col-md-12">
								
								 <c:choose>
							<c:when test="${avgHR >= hrMin}">
								 <div class="panel panel-success" id="panelMaxHR">
							</c:when>
							<c:when test="${avgHR < hrMin}">
								 <div class="panel panel-danger" id="panelMaxHR">
							</c:when>
						</c:choose>
								
									<div class="panel-heading white-tooltip" data-toggle="tooltip"
										data-placement="top" title='<spring:message code="hover.bpm" />'>
										<div class="row">
											<div class="col-xs-3">
												<i class="fa fa-heartbeat fa-3x"></i>
												<c:choose>
													<c:when test="${avgHR >= hrMin}">
														<i id="pollicione" class="fa fa-thumbs-o-up fa-3x"></i>
													</c:when>
												</c:choose>
											</div>
											<div class="col-xs-9 text-right">
												<div class="huge" id="maxHR"></div>
											</div>
											 <div align="right" style="margin-right: 10px;"> <spring:message code="bpm.max" /></div>
										</div>
									</div>
									<div class="panel-footer">
										<div align="center">
										 <span id="hr" style="font-weight:bold"></span> <span id="of"><spring:message code="hr.of.label"/></span>  <span id="hrMin"></span> <span><spring:message code="bpm.avg"/></span>
										</div>
										<div class="clearfix"></div>
									</div>
									<!--                         </a> -->
								</div>
					
							</div>
				 	</div>
                    
	</div>
</div>
<!--                	FINE COLONNA BPM  -->
               	
               	 
<!--                	 COLONNA STEPS -->
               	 
                   	
                   	<div class="row" id="numberOfSessionsBox">
                     	 <div class="col-lg-12 col-md-12">
                     	 	<div class="panel panel-success">
		                        <div class="panel-heading">
		                            <div class="row">
		                                 <div class="col-xs-3">
		                                 <span class="glyphicons glyphicons-shoe-steps"></span>
		                                    <i class="fa fa-hashtag fa-3x"></i>
		                                </div>
		                                <div class="col-xs-9 text-right">
		                                    <div class="huge" id="totalSessions">${totalSessions}</div>
		                                </div>
		                            </div>
		                        </div>
	                             <div class="panel-footer">
	                                 <div> <spring:message code="sessions.number" /></div>
	                            </div>
                  		  	</div>
                     	 
                     	 
                   	 </div>
                   	</div>
                   	
<!--                  FINE COLONNA session number  -->
               	 
<!-- 			FINE RIGA BOXES -->

            
            <div class="row" id="gaugesRow">
<!--             	<div class="col-lg-3 col-md-3 col-sm-3"> -->
<!--             		<div class="panel panel-default"> -->
<!-- 	            		<div class="panel-heading"> -->
<!-- 	                            <i class="fa fa-pie-chart fa-fw"></i> Gauge Chart Example -->
	                            
<!-- 	                            <div id="topLoader"></div> -->
<!-- <!-- 	                            <button id="animateButton" onclick="animaGauge(0,8,12)"> Anima! </button> //CAMBIARE --> 
<%-- <%-- 	                             <button id="animateButton" onclick="animaGauge(${start},${done},${goal})"> Anima! </button>  --%>
<!-- 	                    </div> -->
<!--             		</div> -->
<!--             	</div> -->
            	<div class="col-lg-12 col-md-12">
            	<div class="alert alert-info" role="alert">
            		<i class="fa fa-volume-up" id="readIt" role="button"></i>
            		<span id="slogan">${messageSession}</span>
            	</div>
            	</div>
            	
<!--             	<div class="col-lg-4 col-md-4"> -->
            	<div class="col-lg-6 col-md-6" id="divNumberOfSessions">
            		<div class="panel panel-default">
	            		<div class="panel-heading">
	            		<i class="fa fa-hashtag"></i>
	                     <span id="gaugeFreqTitle">${gauges.gaugeFreq.title}</span>
	                            <div id="gaugeFreq" class="chartdiv"></div>
	                    </div>
            		</div>
            	</div>
            	
<!--             	<div class="col-lg-4 col-md-4"> -->
            	<div class="col-lg-6 col-md-6" id="divTotalDuration">
            		<div class="panel panel-default">
	            		<div class="panel-heading">
<!-- 	                            <i class="fa fa-pie-chart fa-fw"></i>  -->
 								<i class="fa fa-clock-o"></i>
	                            <span id="gaugeTimeTitle">${gauges.gaugeTime.title}</span>
	                            <div id="gaugeTime" class="chartdiv"></div>
	                    </div>
            		</div>
            	</div>
            	
            	<div class="col-lg-12 col-md-12" id="divWeeklyChart">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> <spring:message code="sessions.duration.total"/>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="c3chartDduration"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
            	
            	<div class="col-lg-4 col-md-4" style="display:none">
            		<div class="panel panel-default">
	            		<div class="panel-heading">
<!-- 	                            <i class="fa fa-pie-chart fa-fw"></i>  -->
								 <i class="fa fa-clock-o"></i>
	                            <span id="gaugeAvgDurationTitle">${gauges.gaugeAvgDuration.title}</span>
	                            <div id="gaugeAvgDuration" class="chartdiv"></div>
	                    </div>
            		</div>
            	</div>
            	
<!--             	<div class="col-lg-4 col-md-4"> -->
<!--             		<div class="panel panel-default"> -->
<!-- 	            		<div class="panel-heading"> -->
<!-- 	                            <i class="fa fa-pie-chart fa-fw"></i> C3 Chart Example -->
<!-- 	                            <div id="gaugeC3"></div> -->
<!-- 	                    </div> -->
<!--             		</div> -->
<!--             	</div> -->
            	
            	
<!--             	<div class="col-lg-4 col-md-4"> -->
<!--             		<div class="panel panel-default"> -->
<!-- 	            		<div class="panel-heading"> -->
<!-- 	            		<i class="fa fa-hashtag"></i> -->
<%-- 	                     <span id="gaugeFreq2Title">${gauges.gaugeFreq.title}</span> --%>
<!-- 	                            <div id="gaugeFreq2" class="chartdiv"></div> -->
<!-- 	                    </div> -->
<!--             		</div> -->
<!--             	</div> -->
            	
<!--             	<div class="col-lg-4 col-md-4"> -->
<!--             		<div class="panel panel-default"> -->
<!-- 	            		<div class="panel-heading"> -->
<!-- 	                            <i class="fa fa-pie-chart fa-fw"></i>  -->
<!--  								<i class="fa fa-clock-o"></i> -->
<%-- 	                            <span id="gaugeTime2Title">${gauges.gaugeTime.title}</span> --%>
<!-- 	                            <div id="gaugeTime2" class="chartdiv"></div> -->
<!-- 	                    </div> -->
<!--             		</div> -->
<!--             	</div> -->
            	
<!--             	<div class="col-lg-4 col-md-4"> -->
<!--             		<div class="panel panel-default"> -->
<!-- 	            		<div class="panel-heading"> -->
<!-- 	                            <i class="fa fa-pie-chart fa-fw"></i>  -->
<!-- 								 <i class="fa fa-clock-o"></i> -->
<%-- 	                            <span id="gaugeAvgDuration2Title">${gauges.gaugeAvgDuration.title}</span> --%>
<!-- 	                            <div id="gaugeAvgDuration2" class="chartdiv"></div> -->
<!-- 	                    </div> -->
<!--             		</div> -->
<!--             	</div> -->
            	
            	
            	
            	
            </div>
            
            
            
<!--             FINE RIGA GAUGES -->
 
<!--   <div class="row"> -->
<!--                 <div class="col-lg-12"> -->
<!--                     <div class="panel panel-default"> -->
<!--                         <div class="panel-heading"> -->
<!--                             <i class="fa fa-bar-chart-o fa-fw"></i> Morris Chart Example -->
<!--                             <div class="pull-right"> -->
<!--                                 <div class="btn-group"> -->
<!--                                     <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown"> -->
<!--                                         Actions -->
<!--                                         <span class="caret"></span> -->
<!--                                     </button> -->
<!--                                     <ul class="dropdown-menu pull-right" role="menu"> -->
<!--                                         <li><a href="#">Action</a> -->
<!--                                         </li> -->
<!--                                         <li><a href="#">Another action</a> -->
<!--                                         </li> -->
<!--                                         <li><a href="#">Something else here</a> -->
<!--                                         </li> -->
<!--                                         <li class="divider"></li> -->
<!--                                         <li><a href="#">Separated link</a> -->
<!--                                         </li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         /.panel-heading -->
<!--                         <div class="panel-body"> -->
<!--                             <div id="morris-area-chart"></div> -->
<!--                         </div> -->
<!--                         /.panel-body -->
<!--                     </div> -->
<!--                 </div> -->
<!--  </div> -->
 
<!--    <div class="row"> -->
<!--                 <div class="col-lg-12"> -->
<!--                     <div class="panel panel-default"> -->
<!--                         <div class="panel-heading"> -->
<!--                             <i class="fa fa-bar-chart-o fa-fw"></i> C3 Line chart -->
<!--                             <div class="pull-right"> -->
<!--                                 <div class="btn-group"> -->
<!--                                     <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown"> -->
<!--                                         Actions -->
<!--                                         <span class="caret"></span> -->
<!--                                     </button> -->
<!--                                     <ul class="dropdown-menu pull-right" role="menu"> -->
<!--                                         <li><a href="#">Action</a> -->
<!--                                         </li> -->
<!--                                         <li><a href="#">Another action</a> -->
<!--                                         </li> -->
<!--                                         <li><a href="#">Something else here</a> -->
<!--                                         </li> -->
<!--                                         <li class="divider"></li> -->
<!--                                         <li><a href="#">Separated link</a> -->
<!--                                         </li> -->
<!--                                     </ul> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         /.panel-heading -->
<!--                         <div class="panel-body"> -->
<!--                             <div id="c3chart"></div> -->
<!--                         </div> -->
<!--                         /.panel-body -->
<!--                     </div> -->
<!--                 </div> -->
<!--  </div> -->
 
 <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> <spring:message code="dashboard.label.chart.sessions.label" />
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="c3chartD"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
 </div>
