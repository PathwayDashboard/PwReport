<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
    <link rel="shortcut icon" href="resources/images/logo_trasparente.png"> 
    
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    
    <!-- Custom styles for this template -->
   <link href="resources/css/login.css" rel="stylesheet" id="fordemo">
    
    
    <link href="resources/css/animation.css" rel="stylesheet"> 
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
			       <div class="page-icon-shadow animated bounceInDown" > </div>
			       <div class="login-box clearfix animated flipInY">
			       		<div class="page-icon animated bounceInDown">
			       			 <i class="glyphicon glyphicon-user"></i>
			       		</div>
			        	<div class="login-logo">
			        		<a href="#"><img height="136" src="resources/images/logo_trasparente.png" alt="Company Logo" /></a>
			        	</div> 
			        	<hr />
			        	<div class="login-form">
			        		<!-- Start Error box -->
						<c:choose>
							<c:when test="${not empty msg}">
      							 <div class="alert alert-danger">
							</c:when>
							<c:otherwise>
      							 <div class="alert alert-danger hide">
							</c:otherwise>
						</c:choose>

						<button type="button" class="close" data-dismiss="alert"> &times;</button>
								  <h4>Error!</h4>
								 ${msg}
							</div> <!-- End Error box -->
			        		<form action="contentManagerLogin.html" method="post"  >
						   		 <input type="text" placeholder="User name" class="input-field" required name="username"/> 
						   		 <input type="password"  placeholder="Password" class="input-field" required name="password"/> 
						   		 <button type="submit" class="btn btn-login">Login</button> 
							</form>	
<!-- 							<div class="login-links">  -->
<!-- 					            <a href="forgot-password.html"> -->
<!-- 					          	   Forgot password? -->
<!-- 					            </a> -->
<!-- 					            <br /> -->
<!-- 					            <a href="sign-up.html"> -->
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
     		<p id="footer-text"><small>Copyright &copy; 2016 Engineering Ingegneria Informatica</a></small></p>
     		
     		<div>
				<a
					href="itms-services://?action=download-manifest&url=https://wellness.esl.eng.it/PwReport/manifest.plist">
					<img height="57"
					src="http://casualgamerevolution.com/sites/default/files/images/apple_badge.png" />
				</a>
			</div>
     		
     	</footer>
	
		<script src="resources/js/jquery-2.1.4.js"></script>
		<script src="resources/js/bootstrap.js"></script>
		<script src="resources/js/login.js"></script>
		
</body>
</html>
