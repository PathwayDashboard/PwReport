<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="date" class="java.util.Date" />

<!-- <meta http-equiv="Refresh" content="0; url='/PwReport/dashboard.html'"> -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" target="_blank" href="resources/images/logo_trasparente.png">

<link target="_blank" href="resources/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link target="_blank" href="resources/css/login.css" rel="stylesheet" id="fordemo">


<link target="_blank" href="resources/css/animation.css" rel="stylesheet">
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->

<!--      <script src="js/custom.modernizr.js" type="text/javascript" ></script> -->

</head>
<body class="fade-in">
	<!-- start Login box -->
	<div class="container" id="login-block">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-sm-offset-3 col-md-offset-4">
				<div class="page-icon-shadow animated bounceInDown"></div>
				<div class="login-box clearfix animated flipInY">
					<div class="page-icon animated bounceInDown">
						<i class="glyphicon glyphicon-user"></i>
					</div>
					<div class="login-logo">
						<a target="_blank" href="#"><img height="136"
							src="resources/images/logo_trasparente.png" alt="Company Logo" /></a>
					</div>
					<hr />
					<div class="login-form">
						<!-- Start Error box -->
						<c:choose>
							<c:when test="${not empty param.msg}">
								<div class="alert alert-danger">
							</c:when>
							<c:otherwise>
								<div class="alert alert-danger hide">
							</c:otherwise>
						</c:choose>

						<button type="button" class="close" data-dismiss="alert">
							&times;</button>
						<h4>Error!</h4>
						${param.msg}
					</div>
					<!-- End Error box -->
					<form action="login.html" method="post">
						<input type="text" placeholder="User name" class="input-field"
							required name="username" /> <input type="password"
							placeholder="Password" class="input-field" required
							name="password" />
						<button type="submit" class="btn btn-login">Login</button>
					</form>

					<div class="row">
						<div class="col-lg-12 col-md-12" style="padding-left: 25px; padding-right: 25px">
							<div class="panel panel-warning">
								<div class="panel-heading">
									<div class="row">
										<div>
											<small>
													<span style="padding-left: 5px;">By clicking &ldquo;Log-In&rdquo; I ACCEPT and
														I AGREE that:</span>
												<ul>
													<li><span>I have read and accepted the PATHway:</span></li>
													<ul>
														<li><a target="_blank" href="PIC.pdf"><span>Informed
																	Consent</span></a></li>
														<li><a target="_blank" href="PLS.pdf"><span>Plain Language
																	&nbsp;Statement</span></a></li>
														<li><a target="_blank" href="detailed.jsp"><span>Privacy
																	Policy</span></a><span>.</span></li>
													</ul>
													<li><span>I am correctly enrolled in the
															PATHway project and I have username and password provided
															by my supervisor</span></li>
												</ul>
											</small>
										</div>
									</div>
								</div>
<!-- 								<div class="panel-footer"></div> -->
							</div>

						</div>
					</div>


					<!-- 							<div class="login-links">  -->
					<!-- 					            <a target="_blank" href="forgot-password.html"> -->
					<!-- 					          	   Forgot password? -->
					<!-- 					            </a> -->
					<!-- 					            <br /> -->
					<!-- 					            <a target="_blank" href="sign-up.html"> -->
					<!-- 					              Don't have an account? <strong>Sign Up</strong> -->
					<!-- 					            </a> -->
					<!-- 							</div>      		 -->
				</div>
			</div>

		</div>
	</div>
	
	
	</div>

	<!-- End Login box -->
	<footer class="container">
	<p id="footer-text">
		<a style="text-align:center;display:block;" href="https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=1200408420&mt=8">
			<img src="resources/images/appStore.svg"/>
		</a>
		<small>Copyright &copy; 2015-<fmt:formatDate value="${date}"
				pattern="yyyy" /> Engineering Ingegneria Informatica</a></small> <small>
			<span>This app is made available to you by </span><a
			target="_blank" href="http://www.eng.it/"><span>Engineering Ingegneria
					Informatica S.p.A.</span></a><span> in the context of the </span><a
			target="_blank" href="http://www.pathway2health.eu/"><span>PATHway Project</span></a><span>.
				The app allows you to look at your exercises, performed using the
				component provided in the </span><a target="_blank" href="PIC.pdf"><span>enrollment
					phase</span></a><span>, and to log the daily healthy behaviour. We will
				not store your personal data, but we will transmit those to the
				DataManager of the Consortium &nbsp;(</span><a
			target="_blank" href="http://www.e-recordservices.eu/contact"><span>ERS</span></a><span>)
				for the purpose of the project [</span><a
			target="_blank" href="http://www.pathway2health.eu/"><span>Who We Are</span></a><span>].</span>

			<span>This application only requires data for providing you
				the service, and the efficient use of the app.</span> <span>You can
				access, view and add your personal data at any time via the app
				itself. </span> <span>For deleting all your data and withdraw from
				the project you should contact your supervisor as signed in the </span><a
			target="_blank" href="http://wellness.esl.eng.it/PwReport/PIC.pdf"><span>Informed
					Consent</span></a><span>.</span> <span>For any questions regarding your
				data or privacy protection, please </span><a
			target="_blank" href="http://www.pathway2health.eu/contact-us-2/"><span>contact
					us</span></a><span>. For more detailed information visit: </span><a
			target="_blank" href="detailed.jsp"><span>Privacy Policy</span></a><span>.</span>
		</small>
	</p>
	</footer>

	<script src="resources/js/jquery-2.1.4.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/login.js"></script>

	<script type="text/javascript">
		console.log('${param.toLog}');
	</script>


</body>
</html>
