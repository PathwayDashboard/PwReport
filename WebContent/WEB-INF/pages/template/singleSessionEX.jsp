<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- <div class="row"> -->
<!-- 	<div class="col-lg-12"> -->
<%-- 		<h1 class="page-header">Session ${session.date}  --%>
<%-- 		<c:choose> --%>
<%-- 		 	<c:when test="${session.type eq 'CLASS'}"><i class="fa fa-graduation-cap fa-fw"></i> [ExerClass]</c:when> --%>
<%-- 		 	<c:when test="${session.type eq 'GAME'}"><i class="fa fa-gamepad fa-fw"></i> [ExerGame]</c:when> --%>
<%-- 		 	<c:when test="${session.type eq 'ACTIVE'}"><i class="fa fa-futbol-o fa-fw"></i> [ActiveLifeStyle]</c:when> --%>
<%-- 	 	</c:choose> --%>
<!-- 		</h1> -->
<!-- 		<ul class="nav nav-tabs"> -->
<%-- 			<li role="presentation"><a href="singleSessionGauges?id=${id}">Summary</a></li> --%>
<%-- 			<li role="presentation"><a href="singleSessionHR?id=${id}">Heart --%>
<!-- 					Rates</a></li> -->
<!-- 			<li role="presentation" class="active"><a -->
<%-- 				href="singleSessionEx?id=${id}">Exercises</a></li> --%>
<!-- 		</ul> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- <div class="row"> -->
<!-- 	<div class="col-lg-12"> -->
<!-- 		<div class="table-responsive"> -->
<!-- 			<table class="table"> -->
<%-- 					<c:forEach var="ex" items="${lista}"> --%>
<!-- 						<tr> -->
<!-- 							<td> -->
<%-- 							<c:out value="${ex.date}" /> --%>
<!-- 							</td> -->
<!-- 							<td> -->
<%-- 							<c:out value="${ex.type}" /> --%>
<!-- 							</td> -->
<!-- 							<td> -->
<%-- 							<c:out value="${ex.duration}" /> --%>
<!-- 							</td> -->
<!-- 						</tr>						 -->
<%-- 					</c:forEach> --%>
<!-- 			</table> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->


<div class="row">
	<div class="col-lg-12">
	<div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i> Exercises Timeline
                        </div>
                        <!-- /.panel-heading -->
                        
                        <div class="panel-body">
                            <ul class="timeline">
                            <c:set var="count" value="0" scope="page" />
                            
                            <li class="timeline-inverted">
                            	<div class="timeline-badge success">
										   <i class="fa fa-play badgeIcon"></i>
										 </div>
										 <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Session started</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt obcaecati, quaerat tempore officia voluptas debitis consectetur culpa amet.</p>
                                        </div>
                               </div>
                                </li>
                            
                            	<c:forEach var="ex" items="${lista}">
                            		 <!-- creo le icone in base al tipo di esercizio -->
	                            	<c:choose>
									  <c:when test="${ex.type eq 'bici'}">
									  <li class="timeline-inverted">
                            			<div class="timeline-badge warning">
										   <i class="fa fa-bicycle badgeIcon"></i>
										 </div>
									  </c:when>
									  <c:when test="${ex.type eq 'cuore'}">
									  <li class="timeline-inverted">
                            			<div class="timeline-badge danger">
									   		 <i class="fa fa-heartbeat badgeIcon"></i>
									    </div>
									  </c:when>
									  <c:otherwise>
									  <li class="timeline-inverted">
                            			<div class="timeline-badge info">
									    	<i class="fa fa-check badgeIcon"></i>
									    </div>
									  </c:otherwise>
									</c:choose>
								
								<div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">${ex.type}</h4>
                                            <p>
                                            	<small class="text-muted"><i class="fa fa-clock-o"></i> ${ex.duration} minuti</small>
                                            </p>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt obcaecati, quaerat tempore officia voluptas debitis consectetur culpa amet.</p>
                                        </div>
                               </div>
                                </li>
								
								
								<c:set var="count" value="${count + 1}" scope="page"/>	
                            	</c:forEach>
                            	
                            	<li class="timeline-inverted">
                            	<div class="timeline-badge danger">
										   <i class="fa fa-stop badgeIcon"></i>
										 </div>
										 <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Session finished</h4>
                                            <p>
                                            	<small class="text-muted"><i class="fa fa-clock-o"></i> ${tot} minutes</small>
                                            </p>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt obcaecati, quaerat tempore officia voluptas debitis consectetur culpa amet.</p>
                                        </div>
                               </div>
                                </li>
                            	 
                           </ul>
                       </div>
    </div>
    </div>
</div>
                            	
<!-- 		<div class="table-responsive"> -->
<!-- 			<table class="table"> -->
<%-- 					<c:forEach var="ex" items="${lista}"> --%>
<!-- 						<tr> -->
<!-- 							<td> -->
<%-- 							<c:out value="${ex.date}" /> --%>
<!-- 							</td> -->
<!-- 							<td> -->
<%-- 							<c:out value="${ex.type}" /> --%>
<!-- 							</td> -->
<!-- 							<td> -->
<%-- 							<c:out value="${ex.duration}" /> --%>
<!-- 							</td> -->
<!-- 						</tr>						 -->
<%-- 					</c:forEach> --%>
<!-- 			</table> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->


