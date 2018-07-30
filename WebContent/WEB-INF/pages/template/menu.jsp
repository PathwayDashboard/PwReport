<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- <p>Menu 1</p> -->
<!-- <p>Menu 2</p> -->

<%-- <c:forEach items="${arrayEtichette.etichette}" var="current"> --%>
<%-- 	 <p><c:out value="${current}"/></p> --%>
<%-- </c:forEach> --%>

<c:if test="${xSessionId == null}">
		<ul class="nav" id="side-menu">
		<c:if test="${xSessionId == null}">
			<li>
				 <a href="logout"><i class="fa fa-sign-in fa-fw"></i><spring:message code="login.please" /></a>
			</li>
		</c:if>
		</ul>
</c:if>

<ul class="nav" id="side-menu"
<c:if test="${xSessionId == null}">
		style="display: none"
	</c:if>
>
	<!--                         <li class="sidebar-search"> -->
	<!--                             <div class="input-group custom-search-form"> -->
	<!--                                 <input type="text" class="form-control" placeholder="Search..."> -->
	<!--                                 <span class="input-group-btn"> -->
	<!--                                 <button class="btn btn-default" type="button"> -->
	<!--                                     <i class="fa fa-search"></i> -->
	<!--                                 </button> -->
	<!--                             </span> -->
	<!--                             </div> -->
	<!--                             /input-group -->
	<!--                         </li> -->
	
	<c:if test="${xSessionId == null}">
		<li>
			 <a href="logout"><spring:message code="login.please" /></a>
		</li>
	</c:if>
	
	<li><a href="dashboard.html"><i class="fa fa-dashboard fa-fw"></i>
			<spring:message code="dashboard.title" /></a></li>

	<li><a href="#"><i class="fa fa-heartbeat fa-fw"></i> <spring:message code="sessions.title" /><span
			class="fa arrow"></span></a>
		<ul class="nav nav-second-level" id="dateList">
<%-- 			<c:set var="count" value="0" scope="page" /> --%>
<%-- 			<c:forEach items="${sessions}" var="current"> --%>
<%-- 				<li><a href="singleSessionGauges.html?id=${count}"> --%>
<%-- 				<c:choose> --%>
				
<%-- 							<c:when test="${current.getClass().name eq 'it.eng.pathway.fake.model.ExerClassSession'}"> --%>
<!-- 							<i class="fa fa-graduation-cap fa-fw"></i> -->
<%-- 							</c:when> --%>
<%-- 							<c:when test="${current.getClass().name eq 'it.eng.pathway.fake.model.ExerGameSession'}"> --%>
<!-- 								<i class="fa fa-gamepad fa-fw"></i> -->
<%-- 							</c:when> --%>
<%-- 							<c:when test="${current.getClass().name eq 'it.eng.pathway.fake.model.ActiveLifestylePASession'}"> --%>
<!-- 								<i class="fa fa-futbol-o fa-fw"></i> -->
<%-- 							</c:when> --%>
		
<%-- 						</c:choose> --%>
<%-- 						<fmt:formatDate value="${current.date}" pattern="dd-MM-yyyy"/>  --%>
<%-- 						<c:if test="${current.startTime != null}"> --%>
<%--    							${current.startTime} --%>
<%-- 						</c:if> --%>
						
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${current.acceptable == false}"> --%>
<!-- 								<i class="fa fa-times-circle fa-fw" style='color: #d9534f;'></i> -->
<%-- 							</c:when> --%>
<%-- 						</c:choose> --%>
<!-- 				</a></li> -->
<%-- 				<c:set var="count" value="${count + 1}" scope="page" /> --%>
<%-- 			</c:forEach> --%>
		</ul></li>

<!-- 	<li><a href="risks.html"><i class="fa fa-exclamation-triangle"></i> -->
<!-- 			Risk Factors</a></li> -->
	<li><a href="healthy.html"> <i class="fa fa-thumbs-up"></i> <spring:message code="healthy" />
	</a></li>
	
<!-- 	<li><a href="outdoor.html"><i class="fa fa-globe"></i> -->
<%-- 			<spring:message code="outdoor.title" /></a></li> --%>
			
			<li><a href="outdoorGateway.html"><i class="fa fa-globe"></i>
			<spring:message code="outdoor.title" /></a></li>
			
			
	

	<!--                         <li> -->
	<!--                             <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a> -->
	<!--                             <ul class="nav nav-second-level"> -->
	<!--                                 <li> -->
	<!--                                     <a href="flot.html">Flot Charts</a> -->
	<!--                                 </li> -->
	<!--                                 <li> -->
	<!--                                     <a href="morris.html">Morris.js Charts</a> -->
	<!--                                 </li> -->
	<!--                             </ul> -->
	<!--                             /.nav-second-level -->
	<!--                         </li> -->
	<!--                         <li> -->
	<!--                             <a href="tables.html"><i class="fa fa-table fa-fw"></i> Tables</a> -->
	<!--                         </li> -->
	<!--                         <li> -->
	<!--                             <a href="forms.html"><i class="fa fa-edit fa-fw"></i> Forms</a> -->
	<!--                         </li> -->
	<!--                         <li> -->
	<!--                             <a href="#"><i class="fa fa-wrench fa-fw"></i> UI Elements<span class="fa arrow"></span></a> -->
	<!--                             <ul class="nav nav-second-level"> -->
	<!--                                 <li> -->
	<!--                                     <a href="panels-wells.html">Panels and Wells</a> -->
	<!--                                 </li> -->
	<!--                                 <li> -->
	<!--                                     <a href="buttons.html">Buttons</a> -->
	<!--                                 </li> -->
	<!--                                 <li> -->
	<!--                                     <a href="notifications.html">Notifications</a> -->
	<!--                                 </li> -->
	<!--                                 <li> -->
	<!--                                     <a href="typography.html">Typography</a> -->
	<!--                                 </li> -->
	<!--                                 <li> -->
	<!--                                     <a href="icons.html"> Icons</a> -->
	<!--                                 </li> -->
	<!--                                 <li> -->
	<!--                                     <a href="grid.html">Grid</a> -->
	<!--                                 </li> -->
	<!--                             </ul> -->
	<!--                             /.nav-second-level -->
	<!--                         </li> -->
	<!--                         <li> -->
	<!--                             <a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span class="fa arrow"></span></a> -->
	<!--                             <ul class="nav nav-second-level"> -->
	<!--                                 <li> -->
	<!--                                     <a href="#">Second Level Item</a> -->
	<!--                                 </li> -->
	<!--                                 <li> -->
	<!--                                     <a href="#">Second Level Item</a> -->
	<!--                                 </li> -->
	<!--                                 <li> -->
	<!--                                     <a href="#">Third Level <span class="fa arrow"></span></a> -->
	<!--                                     <ul class="nav nav-third-level"> -->
	<!--                                         <li> -->
	<!--                                             <a href="#">Third Level Item</a> -->
	<!--                                         </li> -->
	<!--                                         <li> -->
	<!--                                             <a href="#">Third Level Item</a> -->
	<!--                                         </li> -->
	<!--                                         <li> -->
	<!--                                             <a href="#">Third Level Item</a> -->
	<!--                                         </li> -->
	<!--                                         <li> -->
	<!--                                             <a href="#">Third Level Item</a> -->
	<!--                                         </li> -->
	<!--                                     </ul> -->
	<!--                                     /.nav-third-level -->
	<!--                                 </li> -->
	<!--                             </ul> -->
	<!--                             /.nav-second-level -->
	<!--                         </li> -->
	<!--                         <li> -->
	<!--                             <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a> -->
	<!--                             <ul class="nav nav-second-level"> -->
	<!--                                 <li> -->
	<!--                                     <a href="blank.html">Blank Page</a> -->
	<!--                                 </li> -->
	<!--                                 <li> -->
	<!--                                     <a href="login.html">Login Page</a> -->
	<!--                                 </li> -->
	<!--                             </ul> -->
	<!--                             /.nav-second-level -->
	<!--                         </li> -->
</ul>
