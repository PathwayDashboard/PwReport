<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
			<spring:message code="session.label.title"/> <fmt:formatDate value="${session.date}" pattern="dd-MM-yyyy"/> ${session.startTime}
			<small>
			<c:choose>
				<c:when test="${session.getClass().name eq 'it.eng.pathway.fake.model.ExerClassSession'}">
					<i class="fa fa-graduation-cap fa-fw"></i> <spring:message code="dashboard.label.class"/></c:when>
				<c:when test="${session.getClass().name eq 'it.eng.pathway.fake.model.ExerGameSession'}">
					<i class="fa fa-gamepad fa-fw"></i> <spring:message code="dashboard.label.game"/></c:when>
				<c:when test="${session.getClass().name eq 'it.eng.pathway.fake.model.ActiveLifestylePASession'}">
					<i class="fa fa-futbol-o fa-fw"></i> <spring:message code="dashboard.label.pa"/></c:when>
			</c:choose>
			
			<c:choose>
				<c:when test="${session.acceptable == false}">
					<i class="fa fa-times-circle fa-fw"></i> <spring:message code="notAcceptable"/></c:when>
			</c:choose>
			</small>

		</h1>
		<ul class="nav nav-tabs">
			<li role="presentation" class="${summaryActive}"><a
				href="singleSessionGauges?id=${id}"><spring:message code="session.label.summary.title"/></a></li>
			<c:choose>
				<c:when test="${session.getClass().name != 'it.eng.pathway.fake.model.ActiveLifestylePASession' or (session.getClass().name eq 'it.eng.pathway.fake.model.ActiveLifestylePASession' and session.minIn5160 != null)}">
					<li role="presentation"  class="${hrActive}"><a href="singleSessionHR?id=${id}"><spring:message code="session.label.hr.title"/></a></li>
					</c:when>
			</c:choose>
			
<%-- 			<li role="presentation"  class="${exActive}"><a href="singleSessionEx?id=${id}">Exercises*</a></li> --%>
		</ul>
	</div>
	<!-- /.col-lg-12 -->
</div>