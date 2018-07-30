<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%-- <tiles:importAttribute name="stylesheets" /> --%>
<%-- <tiles:importAttribute name="header_javascripts" /> --%>
<%-- <tiles:importAttribute name="footer_javascripts" /> --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title><tiles:insertAttribute name="title" ignore="true" /></title>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-79730449-1', 'auto');
  ga('send', 'pageview');

</script>

<!-- Stylesheets -->
<c:forEach var="css" items="${stylesheets}">
	<link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
</c:forEach>
<!-- end stylesheets -->

<!-- Header scripts -->
<c:forEach var="hscript" items="${header_javascripts}">
	<script src="<c:url value="${hscript}"/>"></script>
</c:forEach>
<!-- end header scripts -->

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic'
	rel='stylesheet' type='text/css'>

<link href="resources/css/bootstrap.css" rel="stylesheet">
<!-- Bootstrap Core CSS -->

<!-- MetisMenu CSS -->
<link href="resources/css/metisMenu.css" rel="stylesheet">

<!-- Timeline CSS -->
<link href="resources/css/timeline.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="resources/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<!-- <link href="resources/css/morris.css" rel="stylesheet"> -->

<!-- Custom Fonts -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- Gauge Charts  -->
<link rel="stylesheet"
	href="resources/css/jquery.percentageloader-0.1.css">

<link href="resources/css/c3.css" rel="stylesheet">

<link href="resources/css/pathway.css" rel="stylesheet">

</head>
<body>
	<div>
		<tiles:insertAttribute name="header" />
	</div>
	<div id="wrapper">
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<tiles:insertAttribute name="menu" />
			</div>
		</div>

		<div id="page-wrapper">
			<div>
				<tiles:insertAttribute name="subheader" />
				<tiles:insertAttribute name="body" />
			</div>
		</div>

	</div>


	<div style="clear: both">
		<tiles:insertAttribute name="footer" />
	</div>



	<!-- Footer scripts -->
	<c:forEach var="fscript" items="${footer_javascripts}">
		<script src="<c:url value="${fscript}"/>"></script>
	</c:forEach>

	<script src="resources/js/jquery-2.1.4.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="resources/js/bootstrap.js"></script>
	<!-- 	<script src="resources/js/angular.js"></script> -->
	<!-- 	<script src="resources/js/ui-bootstrap-tpls-0.13.4.js"></script>	 -->

	<!-- Metis Menu Plugin JavaScript -->
	<script src="resources/js/metisMenu.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="resources/js/sb-admin-2.js"></script>

	<script src="resources/js/justgage.js"></script>
<!-- 	<script src="resources/js/raphael-2.1.4.min.js"></script> -->
	<script src="resources/js/d3.min.js"></script>
	<script src="resources/js/c3.js"></script>
	
	<script src="resources/js/moment.js"></script>

	<script src="resources/js/gauge.js"></script>
	<script src="resources/js/drawC3.js"></script>
	<script src="resources/js/pathway.js"></script>

	<script src="resources/js/amcharts.js"></script>
	<script src="resources/js/amgauge.js"></script>
	<script src="resources/js/light.js"></script>

	<!-- Embedded script -->
	<tiles:insertAttribute name="inlinescript" ignore="true" />

</body>
</html>
