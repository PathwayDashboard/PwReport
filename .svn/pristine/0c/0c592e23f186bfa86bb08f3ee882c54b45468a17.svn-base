<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- <div class="row"> -->
<!-- 	<div class="col-lg-12"> -->
<%-- 		<h1 class="page-header">Session ${session.date}   --%>
<%-- 		<c:choose> --%>
<%-- 		 	<c:when test="${session.type eq 'CLASS'}"><i class="fa fa-graduation-cap fa-fw"></i> [ExerClass]</c:when> --%>
<%-- 		 	<c:when test="${session.type eq 'GAME'}"><i class="fa fa-gamepad fa-fw"></i> [ExerGame]</c:when> --%>
<%-- 		 	<c:when test="${session.type eq 'ACTIVE'}"><i class="fa fa-futbol-o fa-fw"></i> [ActiveLifeStyle]</c:when> --%>
<%-- 	 	</c:choose> --%>
<!-- 		</h1> -->
<!-- 		<ul class="nav nav-tabs"> -->
<%-- 			<li role="presentation"><a href="singleSessionGauges?id=${id}">Summary</a></li> --%>
<!-- 			<li role="presentation" class="active"><a -->
<%-- 				href="singleSessionHR?id=${id}">Heart Rates</a></li> --%>
<%-- 			<li role="presentation"><a href="singleSessionEx?id=${id}">Exercises</a></li> --%>
<!-- 		</ul> -->
<!-- 	</div> -->
<!-- </div> -->


<!-- <div class="row"> -->
<!-- 	<div class="col-lg-12"> -->
<!-- 		<div class="panel panel-default"> -->
<!-- 			<div class="panel-heading"> -->
<%-- 				<i class="fa fa-area-chart fa-fw"></i><spring:message code="session.label.hrchart.title"/> <br> <span --%>
<%-- 					class="label label-success green-light" style="color: #000"><spring:message code="session.label.gauge.wu.title"/></span> --%>
<%-- 				<span class="label label-warning yellow-light" style="color: #000"><spring:message code="session.label.gauge.st.title"/></span> --%>
<%-- 				<span class="label label-danger red-light" style="color: #000"><spring:message code="session.label.gauge.ae.title"/></span> --%>
<%-- 				<span class="label label-info blue-light" style="color: #000"><spring:message code="session.label.gauge.cd.title"/></span> --%>
<%-- 				<span class="label label-info grey-light" style="color: #000"><spring:message code="session.label.gauge.rx.title"/></span> --%>
<!-- 			</div> -->
<!-- 			<div class="panel-body"> -->
<!-- 				<div id="c3chartD"></div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
<c:choose>
<c:when
	test="${session.getClass().name eq 'it.eng.pathway.fake.model.ExerClassSession'  || session.getClass().name eq 'it.eng.pathway.fake.model.ExerGameSession'}">

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
			<div class="row">
				<div class="col-lg-9">
					<i class="fa fa-area-chart fa-fw"></i><spring:message code="session.label.hrchart.title"/> <br> <span
						class="label label-success green-light" style="color: #000"><spring:message code="session.label.gauge.wu.title"/></span>
	<%-- 				<span class="label label-warning yellow-light" style="color: #000"><spring:message code="session.label.gauge.st.title"/></span> --%>
					<span class="label label-danger red-light" style="color: #000"><spring:message code="session.label.gauge.ae.title"/></span>
					<span class="label label-info blue-light" style="color: #000"><spring:message code="session.label.gauge.cd.title"/></span>
	<%-- 				<span class="label label-info grey-light" style="color: #000"><spring:message code="session.label.gauge.rx.title"/></span> --%>
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
										<spring:message code="session.hrs.chart.info.1" htmlEscape="false"/>
										<spring:message code="session.label.chart.bpm.values"  htmlEscape="false" />
										<spring:message code="session.hrs.chart.info.2"  htmlEscape="false"/>
										<spring:message code="session.label.chart.bpm.min"  htmlEscape="false"/>
										<spring:message	code="session.hrs.chart.info.3"  htmlEscape="false"/>
										<spring:message code="session.label.chart.bpm.max"  htmlEscape="false"/>
										<spring:message	code="session.hrs.chart.info.4"  htmlEscape="false"/>
								</span>
								</div>
							</div>
						</div>
			
			</div>
			
			</div>
			<div class="panel-body">
				<div id="c3chartDLines"></div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="row">
					<div class="col-lg-9">
						<i class="fa fa-area-chart fa-fw"></i> <spring:message code="session.label.hrchart.timeOnTarget.title"/>
					</div>
						<div class="col-lg-3 pull-right">
								<a id="moreInfoTime" role="button"><span><spring:message code="healthy.info" /></span></a>
						</div>
				</div>
				<div id="chartInfoTime" class="row"
					style="margin-top: 5px; display: none">
					<div class="col-lg-12">
						<div class="alert alert-info" role="alert">
						<i class="fa fa-volume-up" id="readIt" role="button"></i>
						<span >
								<spring:message code="session.hrs.time.info" htmlEscape="false"/>
						</span>
						</div>
					</div>
				</div>
				
				
			</div>
			<div class="panel-body">
				<div id="hrTimeOnTarget"></div>
			</div>
		</div>
	</div>
</div>

 <div class="row">
			<div class="col-lg-4 col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="row">
							<div class="col-lg-8">
								<i class="fa fa-pie-chart fa-fw"></i>
								<spring:message code="session.label.gauge.wu.title" />
							</div>
							<div class="col-lg-4 pull-right">
								<a id="moreInfoCakes" role="button"><span><spring:message
											code="healthy.info" /></span></a>
							</div>
						</div>
						<div id="pieWu" class="gauge"></div>
					</div>
				</div>
			</div>


			<div class="col-lg-4 col-md-4">
            		<div class="panel panel-default">
	            		<div class="panel-heading">
	                            <div class="row">
							<div class="col-lg-8">
								<i class="fa fa-pie-chart fa-fw"></i>
								<spring:message code="session.label.gauge.ae.title" />
							</div>
							<div class="col-lg-4 pull-right">
								<a id="moreInfoCakes2" role="button"><span><spring:message
											code="healthy.info" /></span></a>
							</div>
						</div>
	                            <div id="pieAe" class="gauge"></div>
	                    </div>
            		</div>
            	</div>
            	
            	<div class="col-lg-4 col-md-4">
            		<div class="panel panel-default">
	            		<div class="panel-heading">
	            		<div class="row">
							<div class="col-lg-8">
								<i class="fa fa-pie-chart fa-fw"></i> <spring:message code="session.label.gauge.cd.title"/>/<spring:message code="session.label.gauge.rx.title"/>
							</div>
							<div class="col-lg-4 pull-right">
								<a id="moreInfoCakes3" role="button"><span><spring:message
											code="healthy.info" /></span></a>
							</div>
						</div>
	                            <div id="pieCd" class="gauge"></div>
	                    </div>
            		</div>
            	</div>
 </div>
 <div class="row">
 	<div class="col-lg-12">
		<div id="chartInfoCakes" class="row"
		style="margin-top: 5px; display: none">
		<div class="col-lg-12">
			<div class="alert alert-info" role="alert">
				<i class="fa fa-volume-up" id="readIt" role="button"></i> <span>
					<spring:message code="session.hrs.cake.info" htmlEscape="false" />
				</span>
			</div>
		</div>
	</div>
 	</div>
 </div>
</c:when>
</c:choose>
<c:choose>
		<c:when test="${session.getClass().name eq 'it.eng.pathway.fake.model.ActiveLifestylePASession'}">
<!-- 		<div class="row"> -->
<!-- 			<div class="col-lg-12 col-md-12"> -->
<!-- 				<br> -->
<!-- 					<span class="label label-default"> Simulated data</span> <br> -->
<!-- 				<br> -->
<!-- 			</div> -->
<!-- 		</div> -->
			<div class="row">
				<div class="col-lg-8 col-md-8">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw fa-rotate-90"></i> <spring:message code="session.label.hrchart.timeOnTarget.title"/>
							<br/> <br/>
                            <span class="label label-danger red-dark" style="color: #000"><spring:message code="session.label.hrchart.targetzone"/></span> 
						</div>
						<div class="panel-body">
							<div id="hrPATimeOnTarget"></div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-4 col-md-4">
            		<div class="panel panel-default">
	            		<div class="panel-heading">
	                            <i class="fa fa-pie-chart fa-fw"></i> <spring:message code="session.label.hrchart.timeOnTarget.title"/>
	                            <div id="piePA" class="gauge"></div>
	                    </div>
            		</div>
            	</div>
			</div>
						
		</c:when>
</c:choose>
