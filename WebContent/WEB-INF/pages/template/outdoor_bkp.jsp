<%@page
	import="org.springframework.format.datetime.joda.ReadableInstantPrinter"%>
<%@page import="org.joda.time.ReadableInstant"%>
<%@page import="org.joda.time.Minutes"%>
<%@page import="ms.client.model.RunActivity"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="it.eng.pathway.utility.*"%>


<jsp:useBean id="now" class="java.util.Date" />
<jsp:useBean id="TYPES" class="it.eng.pathway.utility.EnumManagerJSP" />
<%-- <fmt:formatDate value="${now}" dateStyle="long"/> --%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
			<spring:message code="outdoor.title" /> [<span><fmt:formatDate value="${toInvoke}" pattern="dd-MM-yyyy"/></span>]
		</h1>
	</div>
</div>

<div class="alert alert-info" role="alert">
  <p><strong><spring:message code="outdoor.info.1" /><span id="lastPresent">${lastPresent}</span></strong></p>
  <spring:message code="outdoor.info.2" />
</div>

<div class="row">
	<div class="col-lg-8">
		<form action="importFromMSGateway.html" method="post" id="formMS">
			<div class="row">
				<div class="col-md-6">

					<div id="datepicker_div" class="col-md-6" style="padding-top: 3px;">
						<div class="input-daterange input-group" id="datepicker" data-date-end-date="0d">
							<input id="day" type="text" class="input-sm form-control"
								name="day" 
								value=<fmt:formatDate value="${toInvoke}" pattern="dd-MM-yyyy"/> />
						</div>
					</div>
					<div class="col-md-2" style="padding-top: 3px;">
						<button type="submit" class="btn btn-primary btn-sm" id="mscloud">
						<spring:message code="outdoor.getfromms" htmlEscape="false"/>
						</button>
					</div>

				</div>
			</div>
		</form>
	</div>
	
</div>

<%-- <c:set var="count" value="0" scope="page" /> --%>
<%-- <c:forEach items="${resp.getRunActivities()}" var="currentRun"> --%>
<!-- 	<div class="col-lg-12"> -->
<!-- 		<div class="panel panel-default"> -->
<!-- 			<div class="panel-heading" align="left"></div> -->
<!-- 			<div class="panel-footer" align="center"></div> -->
<!-- 		</div> -->
<!-- 	</div> -->

<%-- </c:forEach> --%>
<!-- <form action="saveIntoPathway.html" method="post"> -->



<div class="row">
<div class="col-lg-8">
<!-- TAGGED -->
	<div class="col-lg-12" style="margin-top: 20px; padding:0">
<!-- 			<h4 class="page-header" style="margin-bottom: 5px"> -->
<!-- 				<a tabindex="0" role="button" data-placement="top" -->
<!-- 					data-toggle="popover" data-trigger="focus" -->
<!-- 					data-html="true" -->
<%-- 					title='<spring:message code="outdoor.tagged.title" />' --%>
<%-- 					data-content='<spring:message code="outdoor.tagged.info" />'><spring:message code="outdoor.tagged.title" /></a> --%>
<!-- 			</h4> -->
			<div class="row">
				<div class="col-lg-12">
					<h4 class="page-header" style="margin-bottom: 5px">
						 <img height="30px" src="resources/images/jpg/msband.png" style="margin-right: 5px"/> <spring:message code="outdoor.tagged.title" />
					</h4>
					<h6>
					<a id="taggedLink" role="button">
						<span>
							<spring:message code="details" />
						</span>
					</a>
					</h6>
				</div>
			</div>
			
<!-- 			<div class="alert alert-info" role="alert"> -->
<%-- 			  <p><spring:message code="outdoor.tagged.info" /></p> --%>
<!-- 			</div> -->
			
			<div id="taggedInfo" style="display:none" class="row" style="margin-top:5px">
				<div class="col-lg-12" >
					<div class="alert alert-info" role="alert">
						<p><spring:message code="outdoor.tagged.info"  htmlEscape="false"/></p>
					</div>
				</div>
			</div>
	
			<div class="panel-group" id="accordion" role="tablist"
				aria-multiselectable="true">
<%-- 				${sessions} --%>
				<c:set var="count" value="0" scope="page" />
				<c:forEach items="${cloudsessions}" var="curr">
<%-- 					<c:set var="steps" value="0" scope="page" /> --%>
<%-- 					<c:forEach items="${curr.minuteSummaries}" var="minutes"> --%>
<%-- 						<c:set var="steps" value="${steps + minutes.stepsTaken}" --%>
<%-- 							scope="page" /> --%>
<%-- 					</c:forEach> --%>
					<%-- 	<c:choose> --%>
					<%-- 		<c:when test="${steps >0}"> --%>
					<%-- 			<c:out value="${steps}" /> steps --%>
					<%-- 				</c:when> --%>
					<%-- 	</c:choose> --%>
	
					<div class="panel panel-default" id="panel${count}">
						<div class="panel-heading" role="tab" id="heading${count}">
							<h4 class="panel-title">
	
								<table>
									<tr>
										<td style="padding-right: 20px"><a role="button"
											data-toggle="collapse" data-parent="#accordion"
											href="#collapse${count}" aria-expanded="true"
											aria-controls="collapse${count}"> <span
												class="btn btn-primary btn-xs" id="range_${count}"><fmt:parseDate value="${curr.startTime}" var="startTime" pattern="yyyyMMddHHmm" /><fmt:formatDate value="${startTime}" pattern="HH:mm" /> - <fmt:parseDate value="${curr.endTime}" var="endTime" pattern="yyyyMMddHHmm" /><fmt:formatDate value="${endTime}" pattern="HH:mm" /></span>
										</a></td>
										
										<td style="padding-right: 20px">
<%-- 								            <c:forEach items="${TYPES.getActivities()}" var="activity"> --%>
<%-- 								           		 <c:choose> --%>
<%-- 													<c:when test="${TYPES.equals(curr.type, activity)}"> --%>
<%-- 														<img height="25px" src="${TYPES.getImgPath(activity)}" /> --%>
<%-- 													</c:when> --%>
<%-- 												</c:choose> --%>
<%-- 								            </c:forEach> --%>
								            <img height="25px" src="${TYPES.getImgPath(curr.type)}" />
										</td>
										
											
										<td style="padding-right: 20px"><span
											class="glyphicon glyphicon-fire" aria-hidden="true"></span>
											<span id="kcal_${count}">${curr.energyExpenditure.value}</span></td>
										<td style="padding-right: 20px"><i class="fa fa-heartbeat"></i>
											<span id="hr_${count}">${curr.averageHeartRate}</span></td>
										<td style="padding-right: 20px"><img height="25px"
											src="resources/images/steps_black.png" /><span id="steps_${count}"> <c:out
												value="${curr.stepsNumber}" /></span></td>
										<td style="padding-right: 20px; padding-bottom: 1px"><spring:message
												code="outdoor.save.monitored.tagged" /> <input
											type="checkbox" aria-label="Save into PATHway" checked
											id="cb_${count}"></td>
									</tr>
								</table>
	
								<%-- 					${currentRun.activityType} --%>
							</h4>
						</div>
						<div id="collapse${count}" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="heading${count}">
							<div class="panel-body">
	
								<%-- 				<fmt:formatDate value="${currentRun.endTime - currentRun.startTime}" pattern="HH:mm" /> --%>
								<%-- 				${currentRun.endTime} - ${currentRun.startTime} --%>
	
								<table>
									<tr>
										<td style="padding: 5px">
											<h5>
												<spring:message code="outdoor.duration" />
											</h5>
										</td>
										<td style="padding: 5px">
												<c:out value="${curr.duration}"></c:out>  <spring:message code="minutes" /> 
										</td>
									</tr>
									<tr>
										<td style="padding: 5px">
											<h5>
												<spring:message code="outdoor.hr" />
											</h5>
										</td>
										<td style="padding: 5px">
											${curr.averageHeartRate} bpm</td>
									</tr>
									<tr>
										<td style="padding: 5px">
											<h5>
												<spring:message code="outdoor.energy" />
											</h5>
										</td>
										<td style="padding: 5px">
											${curr.energyExpenditure.value} kcal</td>
									</tr>
									<tr>
										<td style="padding: 5px">
											<h5>
												<spring:message code="outdoor.steps" />
											</h5>
										</td>
										<td style="padding: 5px">${curr.stepsNumber}</td>
									</tr>
									<tr>
										<td style="padding: 5px">
											<h5>
												<spring:message code="outdoor.type" />
											</h5>
										</td>
	
										<td style="padding: 5px"><select class="form-control"
											id="sel_${count}">
												<c:forEach items="${sports}" var="sport">
													<option value="${sport.code}" ${curr.type.code == sport.code ? 'selected="selected"' : ''}>${sport.name}</option>
														</c:forEach>
										</select></td>
									</tr>
								</table>
	
								<div class="form-group">
									<label for="comment"><spring:message
											code="outdoor.notes" /></label>
									<textarea class="form-control" rows="5" id="comment_${count}"
										placeholder='<spring:message
												code="outdoor.notes.hint" />'></textarea>
								</div>
	
	
								<%-- 					${count} ${currentRun.activityType} --%>
								<%-- 					 --%>
								<%-- 					 --%>
	
							</div>
						</div>
					</div>
	
					<c:set var="count" value="${count + 1}" scope="page" />
				</c:forEach>
			</div>
	
		</div>
		
		<button class="btn btn-success btn-lg" id="saveAll">
		<spring:message code="outdoor.save.monitored.tagged" />
	</button>
	
		<div class="row" style="margin-top:5px">
			<div class="col-lg-12" id="alert">
				<div class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong><spring:message code="msg.welldone"  htmlEscape="false"/></strong>
					<spring:message code="msg.saved"  htmlEscape="false"/>
				</div>
			</div>
		</div>
	
<!-- Sezione di fasce non taggate -->
	<div class="col-lg-12" style="margin-top: 20px; padding:0" >

		<div class="row">
				<div class="col-lg-12">
					<h4 class="page-header" style="margin-bottom: 5px">
						 <img height="30px" src="resources/images/jpg/msband.png" 
						 style="margin-right: 5px; text-color: red"/>
						 <spring:message code="outdoor.notTagged.title"  htmlEscape="false"/>
					</h4>
					<h6>
					<a id="notTaggedLink" role="button">
						<span>
							<spring:message code="details"  htmlEscape="false"/>
						</span>
					</a>
					</h6>
				</div>
			</div>
			
			<div id="notTaggedInfo" style="display:none" class="alert alert-info" role="alert">
		  <p><spring:message code="outdoor.notTagged.info"  htmlEscape="false"/></p>
		</div>

		<c:set var="countNT" value="${count}" scope="page" />
		<c:forEach items="${notTagged}" var="currentRun">

			<div class="panel panel-default" id="panel${countNT}">
				<div class="panel-heading" role="tab" id="heading${countNT}">
					<h4 class="panel-title">

						<table>
							<tr>
								<td style="padding-right: 20px"><span
									class="label" style="color:black;" id="range_${countNT}"> <fmt:formatDate
											value="${currentRun.startDate}" pattern="HH:mm" /> - <fmt:formatDate
											value="${currentRun.endDate}" pattern="HH:mm" />
								</span> </a></td>
								<td style="padding-right: 20px"><i class="fa fa-question"></i></td>
<!-- 								<td style="padding-right: 20px"><span -->
<!-- 									class="glyphicon glyphicon-fire" aria-hidden="true"></span> <i -->
<!-- 									class="fa fa-question"></i></td> -->
<!-- 								<td style="padding-right: 20px"><i class="fa fa-heartbeat"></i> -->
<!-- 									<i class="fa fa-question"></i></td> -->
<!-- 								<td style="padding-right: 20px"><img height="25px" -->
<!-- 									src="resources/images/steps_black.png" /> <i -->
<!-- 									class="fa fa-question"></i></td> -->

								<td>
									<button class="btn btn-primary addNotTagged btn-lg" id="classify_${countNT}">
										<spring:message code="outdoor.add.notTagged" />
									</button>
								</td>
								<td style="padding-left: 20px">
									<span id="alredyTagged"></span>
								</td>
							</tr>
						</table>

						<%-- 					${currentRun.activityType} --%>
					</h4>
				</div>


			</div>

			<c:set var="countNT" value="${countNT + 1}" scope="page" />
		</c:forEach>

	</div>

<!-- SEZIONE NON MONITORATE -->
	<div class="col-lg-12" style="margin-top: 20px; padding:0" >
	
	
	<div class="row">
				<div class="col-lg-12">
					<h4 class="page-header" style="margin-bottom: 5px">
						<img height="30px" src="resources/images/jpg/msband_grigio.png" 
						 style="margin-right: 5px"/>
						<spring:message code="outdoor.notMonitored.title"  htmlEscape="false"/>
					</h4>
					<h6>
					<a id="notMonitoredLink" role="button">
						<span>
							<spring:message code="details" />
						</span>
					</a>
					</h6>
				</div>
			</div>
			
		<div id="notMonitoredInfo" class="alert alert-info" role="alert">
		  <p><spring:message code="outdoor.notMonitored.info"  htmlEscape="false"/></p>
		</div>
		
			<!-- Trigger the modal with a button -->
				<button type="button" class="btn btn-primary btn-lg" data-toggle="modal"
					data-target="#notMonitored" style="margin-bottom: 10px">
					<spring:message code="outdoor.add.notMonitored.button"  htmlEscape="false"/>
				</button>
	
	</div>

</div>


	<div class="col-lg-4">
					<!-- Sezione di ALREADY SAVED -->
				<div class="row">
					<div class="col-lg-12" style="margin-top: 20px; background-color: #dff0d8 ">
						<h4 class="page-header" style="margin-bottom: 5px">
							<spring:message code="outdoor.saved" />
						</h4>
				<div id="alreadySaved">
				<c:forEach items="${saved}" var="current">
					<div class='panel panel-default'>
						<div class='panel-heading' role='tab'>
							<h4 class='panel-title'>
								<table>
									<tr>
										<c:choose>
										    <c:when test="${current.monitored}">
										       <td style='padding-right: 20px'>[ ${current.startTime} - ${current.endTime} ]</td>
										    </c:when>
										    <c:otherwise>
										        <td style='padding-right: 20px'>${current.duration} minutes</td>
										    </c:otherwise>
										</c:choose>
										<td style='padding-right: 20px'> ${aLabels[current.type]} </td>
									</tr>
								</table>
							</h4>
						</div>
					</div>
				</c:forEach>
				
				</div>
			</div>
				</div>
	
		</div>

</div>



<!-- 	<button type="submit" class="btn btn-success" id="saveAll"> -->
<%-- 		<spring:message code="outdoor.save.monitored.tagged" /> --%>
<!-- 	</button> -->






<!-- Modal NOT MONITORED -->
<div id="notMonitored" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					<spring:message code="outdoor.notMonitored.title" />
				</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-lg-12">
					
<!-- 					<div class="row"> -->
<!-- 	<div class="col-md-12"> -->
<!-- 		<div id="todo"> -->
<!-- 			<button class="btn btn-primary" type="button" id="todoButton" -->
<!-- 				data-toggle="popover" -->
<%-- 				title='<spring:message code="dashboard.label.todo.title" />' --%>
<%-- 				data-placement="right" data-content="${todoList}"> --%>
<%-- 				<spring:message code="dashboard.label.todo" /> --%>
<%-- 				<span class="badge">${todo}</span> --%>
<!-- 			</button> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="col-md-12"> -->
<!-- 		<label class="btn btn-info ">  -->
<!-- 		<input type="radio" -->
<!-- 			name="intensity" id="0" autocomplete="off" data-toggle="popover" -->
<%-- 			title='<spring:message code="outdoor.intensity.moderate" />' --%>
<!-- 			data-placement="bottom" -->
<%-- 			data-content='<spring:message code="outdoor.intensity.description.light" />'> --%>
<%-- 			<spring:message code="outdoor.intensity.light" /> --%>
<!-- 		</label> -->
<!-- 	</div> -->
<!-- </div> -->
					
						<table>
							<tr>
								<td style="padding: 5px">
									<h5>
										<spring:message code="outdoor.type" />
									</h5>
								</td>
								<td><select class="form-control" id="sel_NotMonitored">
										<c:forEach items="${sports}" var="sport">
											<option value="${sport.code}">${sport.name}</option>
													</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td style="padding: 5px">
									<h5>
										<spring:message code="outdoor.duration" />
									</h5>
								</td>
								<td>
									<div class="input-group spinner">
										<input type="text" class="form-control" value="45"
											id="duration_NotMonitored">
										<div class="input-group-btn-vertical">
											<button class="btn btn-default" type="button">
												<i class="fa fa-caret-up"></i>
											</button>
											<button class="btn btn-default" type="button">
												<i class="fa fa-caret-down"></i>
											</button>
										</div>
									</div>
								</td>
								<td><spring:message code="minutes" /></td>
							</tr>
							<tr>
								<td style="padding: 5px">
									<h5>
										<spring:message code="outdoor.intensity" />
									</h5>
								</td>
								<td>
									<div class="btn-group" data-toggle="buttons"
										id="intensity_NotMonitored">
										<label class="btn btn-info "> <input type="radio"
											name="intensity" id="0" autocomplete="off"> <spring:message
 												code="outdoor.intensity.light" /> 
										</label> <label class="btn btn-info"> <input type="radio"
											name="intensity" id="1" autocomplete="off"> <spring:message
 												code="outdoor.intensity.moderate" /> 
										</label> <label class="btn btn-info"> <input type="radio"
											name="intensity" id="2" autocomplete="off"> <spring:message
 												code="outdoor.intensity.vigorous" />
										</label>
									</div>
								</td>
							</tr>
							
<!-- 							TEST POPOVER -->
<!-- 							<tr> -->
<!-- 								<td style="padding: 5px"> -->
<!-- 									<h5> -->
<%-- 										<spring:message code="outdoor.intensity" /> --%>
<!-- 									</h5> -->
<!-- 								</td> -->
<!-- 								<td> -->
<!-- 									<div class="btn-group"  -->
<!-- 										id="intensity_NotMonitored"> -->
<!-- 										<label class="btn btn-info "> <input type="radio" -->
<!-- 											name="intensity" id="0" autocomplete="off"  -->
<%-- 											data-toggle="popover" title='<spring:message code="outdoor.intensity.moderate" />'  --%>
<!-- 								data-placement="bottom" -->
<%-- 								data-content= '<spring:message code="outdoor.intensity.description.light" />'> <spring:message --%>
<%-- 												code="outdoor.intensity.light" /> --%>
<!-- 										</label> <label class="btn btn-info"> <input type="radio" -->
<%-- 											name="intensity" id="1" autocomplete="off" data-toggle="popover" title='<spring:message code="outdoor.intensity.moderate" />'  --%>
<!-- 								data-placement="bottom" -->
<%-- 								data-content= '<spring:message code="outdoor.intensity.description.moderate" />'> <spring:message --%>
<%-- 												code="outdoor.intensity.moderate" /> --%>
<!-- 										</label> <label class="btn btn-info"> <input type="radio" -->
<%-- 											name="intensity" id="2" autocomplete="off" data-toggle="popover" title='<spring:message --%>
<%-- 												code="outdoor.intensity.vigorous" />'  --%>
<!-- 								data-placement="bottom" -->
<%-- 								data-content= '<spring:message code="outdoor.intensity.description.vigorous" />'> <spring:message --%>
<%-- 												code="outdoor.intensity.vigorous" /> --%>
<!-- 										</label> -->
<!-- 									</div> -->
<!-- 								</td> -->
<!-- 							</tr> -->
						</table>

					</div>

					<div class="col-lg-12">
						<div class="alert alert-success alert-dismissible" role="alert"
							id="alert_modal">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<strong><spring:message code="msg.welldone"  htmlEscape="false"/></strong>
							<spring:message code="msg.saved"  htmlEscape="false"/>
						</div>
					</div>
					
					<div class="col-lg-12">
						<div class="alert alert-info alert-dismissible" role="alert"
							id="alert_modal_0">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<strong><spring:message code="outdoor.intensity.light"  htmlEscape="false"/></strong>
							<spring:message code="outdoor.intensity.description.light"  htmlEscape="false"/>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="alert alert-info alert-dismissible" role="alert"
							id="alert_modal_1">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<strong><spring:message code="outdoor.intensity.moderate"  htmlEscape="false"/></strong>
							<spring:message code="outdoor.intensity.description.moderate"  htmlEscape="false"/>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="alert alert-info alert-dismissible" role="alert"
							id="alert_modal_2">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<strong><spring:message code="outdoor.intensity.vigorous"  htmlEscape="false"/></strong>
							<spring:message code="outdoor.intensity.description.vigorous"  htmlEscape="false"/>
						</div>
					</div>
					

				</div>

			</div>
			<div class="modal-footer">

				<button type="button" class="btn btn-success" id="saveNotMonitored">
					<spring:message code="outdoor.save.monitored.tagged"  htmlEscape="false"/>
				</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">
					<spring:message code="close" />
				</button>

			</div>
		</div>
	</div>
</div>


<!-- Modal NOT TAGGED -->
<div id="notTagged" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					<spring:message code="outdoor.add.notTagged.title" /> <span id="day"><fmt:formatDate value="${toInvoke}" pattern="dd-MM-yyyy"/></span> <span id="time"></span>
				</h4>
				<div class="alert alert-warning" role="alert" id="errorDates"><spring:message code="error.dates" /></div>
			</div>
			<div class="modal-body">
				<div class="alert alert-info" role="alert">
		 			 <p><spring:message code="outdoor.add.notTagged.infos"  htmlEscape="false"/></p>
				</div>
				<div class="row">
					<div class="col-lg-12">

						<div class="col-lg-4">
							<spring:message code="from" />
						</div>
						<div class="col-lg-4">
							<spring:message code="to" />
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
					
						<div class="col-lg-4">
								<div class='input-group date' id='datetimepickerFrom'>
									<input type='text' class="form-control" > <span
										class="input-group-addon"> <span
										class="glyphicon glyphicon-time"></span>
									</span>
								</div>
							</div>
						<div class="col-lg-4">
						<div class='input-group date' id='datetimepickerTo'>
									<input type='text' class="form-control" > <span
										class="input-group-addon"> <span
										class="glyphicon glyphicon-time"></span>
									</span>
								</div>
						</div>
						<div class="col-lg-4">
						<button type="button" class="btn btn-primary" id="retrieveSummary">
						<spring:message code="outdoor.add.notTagged.button" />
						</button>
						</div>
					</div>
				</div>
				
				<div class="row" id="row_summary">
					<div class="col-lg-12">
						<table>
							<tr>
								<td style="padding: 5px">
									<h5>
										<spring:message code="outdoor.type" />
									</h5>
								</td>
								<td><select class="form-control" id="sel_NotTagged">
										<c:forEach items="${sports}" var="sport">
											<option value="${sport.code}">${sport.name}</option>
													</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td style="padding: 5px">
									<h5>
										<spring:message code="outdoor.duration" />
									</h5>
								</td>
								<td>
									<span id="summary_duration"></span>

								</td>
								<td><spring:message code="minutes" /></td>
							</tr>
							<tr>
								<td style="padding: 5px">
									<h5>
										HR
									</h5>
								</td>
								<td>
									 <span id="summary_hr"></span>
								</td>
							</tr>
							<tr>
								<td style="padding: 5px">
									<h5>
										kcal
									</h5>
								</td>
								<td>
									 <span id="summary_kcal"></span>
								</td>
							</tr>
							<tr>
								<td style="padding: 5px">
									<h5>
										steps
									</h5>
								</td>
								<td>
									 <span id="summary_steps"></span>
								</td>
							</tr>
						</table>
						
						<div class="form-group">
								<label for="comment"><spring:message
										code="outdoor.notes" /></label>
								<textarea class="form-control" rows="5" id="summary_comment"
									placeholder='<spring:message
											code="outdoor.notes.hint" />'></textarea>
						</div>

					</div>

					<div class="col-lg-12">
						<div class="alert alert-success alert-dismissible" role="alert"
							id="alert_modal_nt">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<strong><spring:message code="msg.welldone" htmlEscape="false"/></strong>
							<spring:message code="msg.saved" htmlEscape="false"/>
						</div>
					</div>

				</div>

			</div>
			<div class="modal-footer">

				<button type="button" class="btn btn-success" id="saveNotTagged">
					<spring:message code="outdoor.save.monitored.tagged" />
				</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">
					<spring:message code="close" />
				</button>

			</div>
		</div>
	</div>
</div>

