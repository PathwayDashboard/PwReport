<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="it.eng.pathway.utility.*"%>
<jsp:useBean id="TYPES" class="it.eng.pathway.utility.EnumManagerJSP" />
<jsp:useBean id="LABELS" class="it.eng.pathway.utilitymodel.EnumLabelManagerJSP"/>

<div class="row">
	<div class="col-lg-12 col-md-12 panel-no-border-element">
	
		<c:choose>
			<c:when
				test="${session.getClass().name eq 'it.eng.pathway.fake.model.ExerClassSession'  || session.getClass().name eq 'it.eng.pathway.fake.model.ExerGameSession'}">
				<spring:eval expression="session.statusType == T(it.eng.pathway.fake.model.StatusType).completed" var="isCompleted" />
				<div class="col-lg-4 col-md-4 panel-no-border">
					<label class="panel-no-border-title"><spring:message code="session.label.status.title"/></label>
					<c:choose>
						<c:when test="${isCompleted}">
							<span
							class="label label-success"> <spring:message code='${session.statusType}'/> </span> <br> <i
							class="fa fa-thumbs-o-up fa-2x higlighted-icon greenicon"></i>
						</c:when>
						
						<c:when test="${isCompleted == false}">
							<span
							class="label label-danger"> <spring:message code='${session.statusType}'/> </span> <br> <i
							class="fa fa-stop fa-2x higlighted-icon redicon"></i>
						</c:when>
					</c:choose>
				</div>
			</c:when>
		</c:choose>

		<c:choose>
			<c:when
				test="${session.getClass().name eq 'it.eng.pathway.fake.model.ExerClassSession'  || session.getClass().name eq 'it.eng.pathway.fake.model.ExerGameSession'}">
				
				<spring:eval expression="session.rpe == T(it.eng.pathway.fake.model.RatedPerceivedEffort).aNothingAtAll || 
				session.rpe == T(it.eng.pathway.fake.model.RatedPerceivedEffort).bVeryVeryWeak || 
				session.rpe == T(it.eng.pathway.fake.model.RatedPerceivedEffort).cVeryWeak ||
				session.rpe == T(it.eng.pathway.fake.model.RatedPerceivedEffort).dWeak" var="yellow" />
				
				<spring:eval expression="session.rpe == T(it.eng.pathway.fake.model.RatedPerceivedEffort).eModerate || 
				session.rpe == T(it.eng.pathway.fake.model.RatedPerceivedEffort).fSomewhatStrong || 
				session.rpe == T(it.eng.pathway.fake.model.RatedPerceivedEffort).gStrong ||
				session.rpe == T(it.eng.pathway.fake.model.RatedPerceivedEffort).h" var="green" />
				
				<spring:eval expression="session.rpe == T(it.eng.pathway.fake.model.RatedPerceivedEffort).iVeryStrong || 
				session.rpe == T(it.eng.pathway.fake.model.RatedPerceivedEffort).j || 
				session.rpe == T(it.eng.pathway.fake.model.RatedPerceivedEffort).k" var="red" />
				
				<spring:eval expression="session.rpe == T(it.eng.pathway.fake.model.RatedPerceivedEffort).lMaximal" var="black" />
				
				<div class="col-lg-4 col-md-4 panel-no-border">
					<!-- 			<label class="panel-no-border-title">Satisfaction:</label><span class="label label-success">Just Right</span> -->
					<!-- 			<br> -->
					<!-- 			<i class="fa fa-smile-o fa-2x higlighted-icon greenicon"></i> -->
					<!-- 			<br> -->
					<!-- 			<label class="panel-no-border-title">Satisfaction:</label><span class="label label-danger">Too Hard</span> -->
					<!-- 			<br> -->
					<!-- 			<i class="fa fa-frown-o fa-2x higlighted-icon redicon"></i> -->
					<!-- 			<br> -->
					<label class="panel-no-border-title"><spring:message code="session.label.rpe.title"/></label>
						<c:choose>
						<c:when test="${yellow}">
							<span
							class="label label-success"> <spring:message code='${session.rpe}'/> </span> <br> <i
							class="fa fa-bed fa-2x higlighted-icon greenicon"></i> <br>
						</c:when>
						<c:when test="${green}">
							<span
							class="label label-warning"> <spring:message code='${session.rpe}'/> </span> <br> <i
							class="fa fa-plus-square fa-2x higlighted-icon yellowicon"></i> <br>
						</c:when>
						<c:when test="${red}">
							<span
							class="label label-danger"> <spring:message code='${session.rpe}'/> </span> <br> <i
							class="fa fa-exclamation-triangle fa-2x higlighted-icon redicon"></i> <br>
						</c:when>
						<c:when test="${black}">
							<span
							class="label label-default"> <spring:message code='${session.rpe}'/> </span> <br> <i
							class="fa fa-bomb fa-2x higlighted-icon blackicon"></i> <br>
						</c:when>
					</c:choose>
				</div>
				
				<spring:eval expression="session.satisfactionLevelType == T(it.eng.pathway.fake.model.SatisfactionLevelType).aNotAtAllEnjoyable || 
				session.satisfactionLevelType == T(it.eng.pathway.fake.model.SatisfactionLevelType).b2" var="noSatisfaction" />
				
				<spring:eval expression="session.satisfactionLevelType == T(it.eng.pathway.fake.model.SatisfactionLevelType).c3" var="averageSatisfaction" />
				
				<spring:eval expression="session.satisfactionLevelType == T(it.eng.pathway.fake.model.SatisfactionLevelType).d4 || 
				session.satisfactionLevelType == T(it.eng.pathway.fake.model.SatisfactionLevelType).eVeryEnjoyable" var="satisfaction" />

				<div class="col-lg-4 col-md-4 panel-no-border">
					<label class="panel-no-border-title"> <i
						class="fa fa-clock-o"></i> <spring:message
							code="session.label.satisfaction.title" />
					</label> 
					
					<c:choose>
						<c:when test="${noSatisfaction}">
							<span
							class="label label-default"> <spring:message code='${session.satisfactionLevelType}'/> </span> <br> <i
							class="fa fa-frown-o fa-2x higlighted-icon blackicon"></i> <br>
						</c:when>
						<c:when test="${averageSatisfaction}">
							<span
							class="label label-warning"> <spring:message code='${session.satisfactionLevelType}'/> </span> <br> <i
							class="fa fa-meh-o fa-2x higlighted-icon yellowicon"></i> <br>
						</c:when>
						<c:when test="${satisfaction}">
							<span
							class="label label-success"> <spring:message code='${session.satisfactionLevelType}'/> </span> <br> <i
							class="fa fa-smile-o fa-2x higlighted-icon greenicon"></i> <br>
						</c:when>
					</c:choose>
					
				</div>
			</c:when>
		</c:choose>
		
		
		<c:choose>
			<c:when
				test="${session.getClass().name eq 'it.eng.pathway.fake.model.ActiveLifestylePASession'}">
				<div class="col-lg-4 col-md-4 panel-no-border">
					<!-- 			<label class="panel-no-border-title">Satisfaction:</label><span class="label label-success">Just Right</span> -->
					<!-- 			<br> -->
					<!-- 			<i class="fa fa-smile-o fa-2x higlighted-icon greenicon"></i> -->
					<!-- 			<br> -->
					<!-- 			<label class="panel-no-border-title">Satisfaction:</label><span class="label label-danger">Too Hard</span> -->
					<!-- 			<br> -->
					<!-- 			<i class="fa fa-frown-o fa-2x higlighted-icon redicon"></i> -->
					<!-- 			<br> -->
					<label class="panel-no-border-title"><spring:message code="outdoor.type" /></label><span
						class="label label-warning" id="actType">${session.type}</span> <br> 
<%-- 						<c:choose> --%>
<%-- 							<c:when --%>
<%-- 									test="${session.type eq 'WALKING' || session.type eq 'RUNNING' }"> --%>
<!-- 							<img height="25px" -->
<!-- 										src="resources/images/jpg/run.png" /><br> -->
<%-- 						</c:when> --%>
<%-- 						<c:when --%>
<%-- 									test="${session.type eq 'CYCLING' }"> --%>
<!-- 							<img height="25px" -->
<!-- 										src="resources/images/jpg/bike.png" /><br> -->
<%-- 						</c:when> --%>
<%-- 						</c:choose> --%>
						
						<img height="25px" src="${TYPES.getImgPath(session.type)}" />
						
				</div>
			</c:when>
		</c:choose>

	</div>


</div>

<div class="row">
<div class="col-lg-12 col-md-12 panel-no-border-element">

		<c:choose>
			<c:when
				test="${session.getClass().name eq 'it.eng.pathway.fake.model.ExerClassSession'  || session.getClass().name eq 'it.eng.pathway.fake.model.ExerGameSession'}">

				<div class="col-lg-4 col-md-4 panel-no-border">
					<label class="panel-no-border-title"> <i
						class="fa fa-clock-o"></i> <spring:message
							code="session.label.totalDuration.title" />
					</label> <span class="label label-info"> <i class="fa fa-clock-o"></i>
						${totalDuration} minutes</span> <br>
				</div>
				
				<div class="col-lg-4 col-md-4 panel-no-border">
					<label class="panel-no-border-title"> <span
						class="glyphicon glyphicon-fire"></span> <spring:message
							code="outdoor.energy" htmlEscape="false" />
					</label><span class="label label-success"> ${energy} kcal</span> <br>
					<!-- 				 <i class="fa fa-meh-o fa-2x higlighted-icon yellowicon"></i> <br> -->
				</div>
			</c:when>
		</c:choose>
		
		<c:choose>
			<c:when test="${not empty score}">
				<div class="col-lg-4 col-md-4 panel-no-border">
					<label class="panel-no-border-title">Score: ${score}</label>
				</div>
			</c:when>
		</c:choose>


	</div>
</div>

<div class="row">
	<c:choose>
		<c:when
			test="${session.getClass().name eq 'it.eng.pathway.fake.model.ExerClassSession' 
	 || session.getClass().name eq 'it.eng.pathway.fake.model.ExerGameSession'}">
			<!-- 	 GAUGES -->

			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="row">
							<div class="col-lg-12">
								<i class="fa fa-th-list fa-fw"></i> <spring:message code="session.label.gauge.title"/>
							</div>		
						</div>
					</div>
					<!-- /.panel-heading -->

					<div class="panel-body">
						<ul class="timeline">
							<li class="timeline-inverted">

								<div class="timeline-badge ${wuClass}">
									<a class="accordion-toggle" data-toggle="collapse"
										href="#wu-desc"> 1 </a>
								</div>
								<div class="timeline-panel">
									<div class="timeline-heading">
										<a class="accordion-toggle" data-toggle="collapse"
											href="#wu-desc">
											<h4 class="timeline-title"><spring:message code="session.label.gauge.wu.title"/></h4>
										</a>
									</div>
									<div id="wu-desc" class="timeline-body collapse">
										<div class="col-lg-12 col-md-12">
											<div class="panel panel-default">
												<div class="panel-heading">
													<i class="fa fa-pie-chart fa-fw"></i> <label
														id="warmDurationTitle">
														${gauges.warmDuration.title}</label>
													<div id="warmDuration" class="chartdiv"></div>
												</div>
											</div>
										</div>

										<div class="col-lg-12 col-md-12">
											<div class="panel panel-default">
												<div class="panel-heading">
													<i class="fa fa-pie-chart fa-fw"></i> <label
														id="warmHRTitle"> ${gauges.warmHR.title}</label>
													<div id="warmHR" class="chartdiv"></div>
												</div>
											</div>
										</div>
										
										<div class="col-lg-12 col-md-12">
											<div class="panel panel-default">
												<div class="panel-heading">
													<i class="fa fa-heartbeat"></i> 
													<label><spring:message code="session.label.hr.minmax" /></label>
													<div style="text-align: center">
														<strong>${session.warmingDuration.minHR}/${session.warmingDuration.maxHR}</strong>
													</div>
												</div>
											</div>
										</div>
										
										
									</div>
								</div>
							</li>

							<li class="timeline-inverted">

								<div class="timeline-badge ${aeClass}">
									<a class="accordion-toggle" data-toggle="collapse"
										href="#ae-desc"> 2 </a>
								</div>
								<div class="timeline-panel">
									<div class="timeline-heading">
										<a class="accordion-toggle" data-toggle="collapse"
											href="#ae-desc">
											<h4 class="timeline-title"><spring:message code="session.label.gauge.ae.title"/></h4>
										</a>
									</div>
									<div id="ae-desc" class="timeline-body collapse">
										<div class="col-lg-12 col-md-12">
											<div class="panel panel-default">
												<div class="panel-heading">
													<i class="fa fa-pie-chart fa-fw"></i> <label
														id="aeroDurationTitle">
														${gauges.aeroDuration.title}</label>
													<div id="aeroDuration" class="chartdiv"></div>
												</div>
											</div>
										</div>

										<div class="col-lg-12 col-md-12">
											<div class="panel panel-default">
												<div class="panel-heading">
													<i class="fa fa-pie-chart fa-fw"></i> <label
														id="aeroHRTitle"> ${gauges.aeroHR.title}</label>
													<div id="aeroHR" class="chartdiv"></div>
												</div>
											</div>
										</div>
									
									
									
									<div class="col-lg-12 col-md-12">
											<div class="panel panel-default">
												<div class="panel-heading">
													<i class="fa fa-heartbeat"></i> 
													<label><spring:message code="session.label.hr.minmax" /></label>
													<div style="text-align: center">
														<strong>${session.mainDuration.minHR}/${session.mainDuration.maxHR}</strong>
													</div>
												</div>
											</div>
										</div>
									
									
									</div>
								</div>
							</li>


							<li class="timeline-inverted">

								<div class="timeline-badge ${cdClass}">
									<a class="accordion-toggle" data-toggle="collapse"
										href="#cd-desc"> 3 </a>
								</div>
								<div class="timeline-panel">
									<div class="timeline-heading">
										<a class="accordion-toggle" data-toggle="collapse"
											href="#cd-desc">
											<h4 class="timeline-title"><spring:message code="session.label.gauge.cd.title"/></h4>
										</a>
									</div>
									<div id="cd-desc" class="timeline-body collapse">
										<div class="col-lg-12 col-md-12">
											<div class="panel panel-default">
												<div class="panel-heading">
													<i class="fa fa-pie-chart fa-fw"></i> <label
														id="coolDurationTitle">
														${gauges.coolDuration.title}</label>
													<div id="coolDuration" class="chartdiv"></div>
												</div>
											</div>
										</div>

										<c:choose>
											<c:when test="${not empty gauges.coolHR}">
												<div class="col-lg-12 col-md-12">
													<div class="panel panel-default">
														<div class="panel-heading">
															<i class="fa fa-pie-chart fa-fw"></i> <label
																id="coolHRTitle"> ${gauges.coolHR.title}</label>
															<div id="coolHR" class="chartdiv"></div>
														</div>
													</div>
												</div>
											</c:when>
										</c:choose>

									
									
									<div class="col-lg-12 col-md-12">
											<div class="panel panel-default">
												<div class="panel-heading">
													<i class="fa fa-heartbeat"></i> 
													<label><spring:message code="session.label.hr.minmax" /></label>
													<div style="text-align: center">
														<strong>${session.coolDownDuration.minHR}/${session.coolDownDuration.maxHR}</strong>
													</div>
												</div>
											</div>
										</div>
									
									</div>
								</div>
							</li>
							
							
						</ul>
					</div>
				</div>
			</div>


		</c:when>


		<c:when
			test="${session.getClass().name eq 'it.eng.pathway.fake.model.ActiveLifestylePASession'}">
			<div class="col-lg-6">
				<c:choose>
					<c:when test="${session.monitored || session.averageHeartRate > 0}">
						
						<c:if test="${session.stepsNumber != null && session.stepsNumber > 0}">
						<div class="col-lg-6">
							<div class="panel panel-success">
								<div class="panel-heading">
									<div class="row">
										<div class="col-xs-3">
											<span class="glyphicons glyphicons-shoe-steps"></span> <img
												height="50px" src="resources/images/steps_black.png" />
										</div>
										<div class="col-xs-9 text-right">
											<div class="huge" id="steps">${session.stepsNumber}</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-3 col-md-offset-4"></div>
									</div>
								</div>
								<div class="panel-footer">
									<div>
										<spring:message code="outdoor.steps" />
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
						</c:if>
						

						<div class="col-lg-6 ">
							<div class="panel panel-success">
								<div class="panel-heading">
									<div class="row">
										<div class="col-xs-3">
											 <i	class="fa fa-clock-o fa-4x"></i> 
										</div>
										<div class="col-xs-9 text-right">
											<div class="huge">${session.duration}</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-3 col-md-offset-4"></div>
									</div>
								</div>
								<div class="panel-footer">
									<div>
										<spring:message code="outdoor.duration" />
										<spring:message code="unit.minutes" />
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
						
			<div class="col-lg-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <div class="row">
                                 <div class="col-xs-3 huge" style="padding-top:8px">
                                 <span	class="glyphicon glyphicon-fire"></span>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${energy}</div>
                                </div>
                            </div>
                            <div class="row">
                            	 <div class="col-xs-3 col-md-offset-4">
                                </div>
                             </div>
                        </div>
                             <div class="panel-footer">
                                 <div> <spring:message code="outdoor.energy" /> <spring:message code="unit.kcal" /></div>
                                <div class="clearfix"></div>
                            </div>
                    </div>
                </div>


				<c:choose>
					<c:when test="${not empty session.description}">
						<div class="col-lg-6">
							<div class="panel panel-default">
								<div class="panel-heading">
									<spring:message code="outdoor.notes" />
								</div>
								<div class="panel-body">
									<div>${session.description}</div>
								</div>
							</div>
						</div>


					</c:when>
				</c:choose>

					</c:when>
					<c:when test="${!session.monitored}">
					<c:choose>
					<c:when test="${not empty session.description}">
						<div class="col-lg-6">
								<div class="panel panel-default">
									<div class="panel-heading">
										<spring:message code="outdoor.notes" />
									</div>
									<div class="panel-body">
										<div>${session.description}</div>
									</div>
								</div>
							</div>
						
					
					</c:when>
					</c:choose>
					<c:choose>
					<c:when test="${not empty session.intensity}">
					<div class="col-lg-6">
								<div class="panel panel-default">
									<div class="panel-heading">
										<spring:message code="outdoor.intensity" />
									</div>
									<div class="panel-body">
										<div><spring:message code='${session.intensity}' /></div>
									</div>
								</div>
					</div>
					</c:when>
					</c:choose>
					
					<div class="col-lg-12 col-md-12">
							<div class="panel panel-success">
								<div class="panel-heading">
									<div class="row">
										<div class="col-xs-3">
											 <i	class="fa fa-clock-o fa-4x"></i> 
										</div>
										<div class="col-xs-9 text-right">
											<div class="huge">${session.duration}</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-3 col-md-offset-4"></div>
									</div>
								</div>
								<div class="panel-footer">
									<div>
										<spring:message code="outdoor.duration" />
										<spring:message code="unit.minutes" />
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					
					</c:when>
				</c:choose>
			</div>
		</c:when>
	</c:choose>

	<c:choose>
	<c:when test="${session.getClass().name eq 'it.eng.pathway.fake.model.ExerClassSession' 
	 || session.getClass().name eq 'it.eng.pathway.fake.model.ExerGameSession' || 
	 (session.getClass().name eq 'it.eng.pathway.fake.model.ActiveLifestylePASession' && 
	 	(session.monitored || session.averageHeartRate > 0))}">
		<div class="col-lg-6">
			<div class="panel panel-default">
				
					<div class="panel-heading">
					<div class="row">
						<div class="col-lg-9">
							<i class="fa fa-area-chart fa-fw white-tooltip" data-html="true" data-toggle="tooltip" data-placement="top" title='<spring:message code="hover.bpm" />'></i>
							 <spring:message code="session.label.chart.bpm.title" />
						</div>
						 
						 <div class="col-lg-3 pull-right">
<!-- 							<h6> -->
							<a id="moreInfos" role="button">
								<span>
									<spring:message code="healthy.info" />
								</span>
							</a>
<!-- 							</h6> -->
						</div>
					</div>

						<div id="chartInfo" class="row"
							style="margin-top: 5px; display: none">
							<div class="col-lg-12">
								<div class="alert alert-info" role="alert">
								<i class="fa fa-volume-up" id="readIt" role="button"></i>
								<span id="infos">
										<spring:message code="session.chart.info.1" htmlEscape="false"/>
										<spring:message code="session.label.chart.bpm.values"  htmlEscape="false" />
										<spring:message code="session.chart.info.2"  htmlEscape="false"/>
										<spring:message code="session.label.chart.bpm.min"  htmlEscape="false"/>
										<spring:message	code="session.chart.info.3"  htmlEscape="false"/>
										<spring:message code="session.label.chart.bpm.max"  htmlEscape="false"/>
										<spring:message	code="session.chart.info.4"  htmlEscape="false"/>
								</span>
								</div>
							</div>
						</div>

					</div>
				<div class="panel-body">
					<div id="c3chartDSummary"></div>
				</div>
			</div>
		</div>
	</c:when>
	</c:choose>

	<div class="col-lg-6" style="display:none">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-area-chart fa-fw"></i> Duration Summary Chart
			</div>
			<div class="panel-body">
				<div id="c3chartDSummaryDuration"></div>
			</div>
		</div>
	</div>

</div>



<!-- <div class="row"> -->
<!-- 	<div class="col-lg-12"> -->
<!-- 		<div class="panel panel-default"> -->
<!-- 			<div class="panel-heading"> -->
<!-- 				<i class="fa fa-area-chart fa-fw"></i> Summary Chart -->
<!-- 			</div> -->
<!-- 			<div class="panel-body"> -->
<!-- 				<div id="c3chartDSummary"></div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->



<!-- <div class="col-lg-6 col-md-6 panelDiv green-light"> -->
<!-- 	<div class="col-lg-12 col-md-12"> -->
<!-- 		<div class="alert alert-success" role="alert" -->
<!-- 			style="margin-bottom: 0px !important;">WarmUp</div> -->
<!-- 	</div> -->

<!-- 	<div class="col-lg-6 col-md-6"> -->
<!-- 		<div class="panel panel-default"> -->
<!-- 			<div class="panel-heading"> -->
<!-- 				<i class="fa fa-pie-chart fa-fw"></i> <label id="warmDurationTitle"> -->
<%-- 					 ${gauges.warmDuration.title}</label> --%>
<!-- 				<div id="warmDuration" class="gauge"></div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 	<div class="col-lg-6 col-md-6"> -->
<!-- 		<div class="panel panel-default"> -->
<!-- 			<div class="panel-heading"> -->
<!-- 				<i class="fa fa-pie-chart fa-fw"></i> <label id="warmHRTitle"> -->
<%-- 					 ${gauges.warmDuration.title}</label> --%>
<!-- 				<div id="warmHR" class="gauge"></div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->

<!-- <div class="col-lg-6 col-md-6 panelDiv yellow-light"> -->
<!-- 	<div class="col-lg-12 col-md-12"> -->
<!-- 		<div class="alert alert-warning" role="alert" -->
<!-- 			style="margin-bottom: 0px !important;">Stretching</div> -->
<!-- 	</div> -->

<!-- 	<div class="col-lg-6 col-md-6"> -->
<!-- 		<div class="panel panel-default"> -->
<!-- 			<div class="panel-heading"> -->
<!-- 				<i class="fa fa-pie-chart fa-fw"></i> <label -->
<!-- 					id="stretchDurationTitle">  -->
<%-- 					${gauges.stretchDuration.title}</label> --%>
<!-- 				<div id="stretchDuration" class="gauge"></div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 	<div class="col-lg-6 col-md-6"> -->
<!-- 		<div class="panel panel-default"> -->
<!-- 			<div class="panel-heading"> -->
<!-- 				<i class="fa fa-pie-chart fa-fw"></i> <label id="stretchHRTitle"> -->
<%-- 					 ${gauges.warmDuration.title}</label> --%>
<!-- 				<div id="stretchHR" class="gauge"></div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->


<!-- <div class="col-lg-12 col-md-12 panelDiv red-light"> -->
<!-- 	<div class="col-lg-12 col-md-12"> -->
<!-- 		<div class="alert alert-danger" role="alert" -->
<!-- 			style="margin-bottom: 0px !important;">Aerobic</div> -->
<!-- 	</div> -->

<!-- 	<div class="col-lg-6 col-md-6"> -->
<!-- 		<div class="panel panel-default"> -->
<!-- 			<div class="panel-heading"> -->
<!-- 				<i class="fa fa-pie-chart fa-fw"></i> <label id="aeroDurationTitle"> -->
<%-- 					 ${gauges.warmDuration.title}</label> --%>
<!-- 				<div id="aeroDuration" class="gauge"></div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 	<div class="col-lg-6 col-md-6"> -->
<!-- 		<div class="panel panel-default"> -->
<!-- 			<div class="panel-heading"> -->
<!-- 				<i class="fa fa-pie-chart fa-fw"></i> <label id="aeroHRTitle"> -->
<%-- 					 ${gauges.warmDuration.title}</label> --%>
<!-- 				<div id="aeroHR" class="gauge"></div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->

<!-- <div class="col-lg-6 col-md-6 panelDiv blue-light"> -->
<!-- 	<div class="col-lg-12 col-md-12"> -->
<!-- 		<div class="alert alert-info" role="alert" -->
<!-- 			style="margin-bottom: 0px !important;">Cool Down</div> -->
<!-- 	</div> -->

<!-- 	<div class="col-lg-6 col-md-6"> -->
<!-- 		<div class="panel panel-default"> -->
<!-- 			<div class="panel-heading"> -->
<!-- 				<i class="fa fa-pie-chart fa-fw"></i> <label id="coolDurationTitle"> -->
<%-- 					 ${gauges.warmDuration.title}</label> --%>
<!-- 				<div id="coolDuration" class="gauge"></div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 	<div class="col-lg-6 col-md-6"> -->
<!-- 		<div class="panel panel-default"> -->
<!-- 			<div class="panel-heading"> -->
<!-- 				<i class="fa fa-pie-chart fa-fw"></i> <label id="coolHRTitle"> -->
<%-- 					 ${gauges.warmDuration.title}</label> --%>
<!-- 				<div id="coolHR" class="gauge"></div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->


<!-- <div class="col-lg-6 col-md-6 panelDiv blue-light"> -->
<!-- 	<div class="col-lg-12 col-md-12"> -->
<!-- 		<div class="alert alert-info" role="alert" -->
<!-- 			style="margin-bottom: 0px !important;">Relax</div> -->
<!-- 	</div> -->

<!-- 	<div class="col-lg-6 col-md-6"> -->
<!-- 		<div class="panel panel-default"> -->
<!-- 			<div class="panel-heading"> -->
<!-- 				<i class="fa fa-pie-chart fa-fw"></i> <label id="realxDurationTitle"> -->
<%-- 					 ${gauges.relaxDuration.title}</label> --%>
<!-- 				<div id="realxDuration" class="gauge"></div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 	<div class="col-lg-6 col-md-6"> -->
<!-- 		<div class="panel panel-default"> -->
<!-- 			<div class="panel-heading"> -->
<!-- 				<i class="fa fa-pie-chart fa-fw"></i> <label id="relaxHRTitle"> -->
<%-- 					 ${gauges.relaxDuration.title}</label> --%>
<!-- 				<div id="relaxHR" class="gauge"></div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->


<!-- /.row -->
