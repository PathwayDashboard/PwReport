<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
			<spring:message code="diet" />
		</h1>
		<img class="img-responsive img-rounded center-block"
			alt=<spring:message code="diet" />
			src="http://trackmy.fit/wp-content/uploads/2015/05/cheap-healthy-foods.jpg"
			width="80%" height="80%"> <br>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">
			<div class="panel panel-success">
				<div class="panel-heading" role="tab" id="headingOne">
					<h4 class="panel-title">
						<a role="button" data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne" aria-expanded="true"
							aria-controls="collapseOne"> <!-- 							<img alt="" height="16" width="16" src="resources/images/png/glyphicons-592-person-running.png"/> -->
							<spring:message code="healthy.recom" /></a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse in"
					role="tabpanel" aria-labelledby="headingOne">
					<div class="panel-body">
<%-- 					<%@ include file="resources/../../static/staticDietR.html" %> --%>
						${recomm}
						
						<div class="row">
							<div class="col-lg-12">
								<button type="button" class="btn btn-info btn-xs" data-toggle="modal" 
								data-target="#imgModal"><spring:message code="lifestyle.eating.plate" /></button>
								
								<button type="button" class="btn btn-info btn-xs" data-toggle="modal" 
								data-target="#imgModal2"><spring:message code="lifestyle.eating.portions" /></button>

								<button type="button" class="btn btn-info btn-xs" data-toggle="modal" 
								data-target="#imgModal3"><spring:message code="lifestyle.eating.fats" /></button>
							</div>
						</div>
						
						<c:choose>
							<c:when test="${role=='admin'}">
								<div align="right">
									<form action="edit.html" method="post">
										<input type="hidden" name="id" value=${recommId}>
										<button type="submit" class="btn btn-primary btn-xs">
											<spring:message code="edit" />
										</button>
									</form>
								</div>
						</c:when>
						</c:choose>
					</div>

				</div>
			</div>
		</div>
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">
			<div class="panel panel-info">
				<div class="panel-heading" role="tab" id="headingTips">
					<h4 class="panel-title">
						<a role="button" data-toggle="collapse" data-parent="#accordion"
							href="#collapseTips" aria-expanded="true"
							aria-controls="collapseOne"> <!-- 							<img alt="" height="16" width="16" src="resources/images/png/glyphicons-592-person-running.png"/> -->
							<spring:message code="healthy.tips" /></a>
					</h4>
				</div>
				<div id="collapseTips" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingTips">
					<div class="panel-body">
<%-- 					<%@ include file="resources/../../static/staticDietT.html" %> --%>
						${tips}
						<c:choose>
							<c:when test="${role=='admin'}">
								<div align="right">
									<form action="edit.html" method="post">
										<input type="hidden" name="id" value=${tipsId}>
										<button type="submit" class="btn btn-primary btn-xs">
											<spring:message code="edit" />
										</button>
									</form>
								</div>
						</c:when>
						</c:choose>
					</div>

				</div>
			</div>
		</div>
		
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">
			<div class="panel panel-info">
				<div class="panel-heading" role="tab" id="headingInfo">
					<h4 class="panel-title">
						<a role="button" data-toggle="collapse" data-parent="#accordion"
							href="#collapseInfo" aria-expanded="true"
							aria-controls="collapseOne"> 
							<spring:message code="healthy.info" /></a>
					</h4>
				</div>
				<div id="collapseInfo" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingInfo">
					<div class="panel-body">
<%-- 								<%@ include file="resources/../../static/infos.html" %> --%>
						${other}
						<c:choose>
							<c:when test="${role=='admin'}">
								<div align="right">
									<form action="edit.html" method="post">
										<input type="hidden" name="id" value=${otherId}>
										<button type="submit" class="btn btn-primary btn-xs">
											<spring:message code="edit" />
										</button>
									</form>
								</div>
							</c:when>
						</c:choose>
					</div>

				</div>
			</div>
		</div>
		
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">
			<div class="panel panel-danger">
				<div class="panel-heading" role="tab" id="headingRecipes">
					<h4 class="panel-title">
						<a role="button" data-toggle="collapse" data-parent="#accordion"
							href="#collapseRecipes" aria-expanded="true"
							aria-controls="collapseOne"> 
							<spring:message code="healthy.recipes" /></a>
					</h4>
				</div>
				<div id="collapseRecipes" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingRecipes">
					<div class="panel-body">
<%-- 								<%@ include file="resources/../../static/infos.html" %> --%>
<%-- 						${recipe} --%>
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${role=='admin'}"> --%>
<!-- 								<div align="right"> -->
<!-- 									<form action="edit.html" method="post"> -->
<!-- 										<input type="hidden" name="id" value=${recipeId}> -->
<!-- 										<button type="submit" class="btn btn-primary btn-xs"> -->
<%-- 											<spring:message code="edit" /> --%>
<!-- 										</button> -->
<!-- 									</form> -->
<!-- 								</div> -->
<%-- 							</c:when> --%>
<%-- 						</c:choose> --%>


							<h4>
							<spring:message code="lifestyle.download" />
							</h4>
							
							<div class="list-group">
							<c:forEach items="${docs}" var="current">
								<div class="row">
									<div class="col-lg-4">
										<a class="list-group-item" href="downloadDoc/${current.id}"
											target="_blank"><i class="fa fa-file-text-o fa-2x" aria-hidden="true"></i>  ${current.label}</a>
									</div>
								</div>
							</c:forEach>
						</div>
						<c:choose>
							<c:when test="${role=='admin'}">
						<div align="left">
							<button type="submit" class="btn btn-primary btn-xs"
								id="pdfEditing" data-toggle="modal" data-target="#pdfContentModal">
								<spring:message code="edit" />
							</button>
						</div>
						</c:when>
						</c:choose>
							
						
					</div>

				</div>
			</div>
		</div>

	</div>

</div>


<!-- VIDEO ROW -->
<div class="row">
	<div class="col-lg-6">
		<div class="panel panel-info">
			<div class="panel-heading" align="center">
				<spring:message code="healthy.peers" />
			</div>
			<div class="panel-footer" align="center">
				<!-- 		Video Carousel -->
				<div id="carousel-1" class="carousel slide" data-ride="carousel"
					data-interval="false">
					<ol class="carousel-indicators">
						<c:set var="i" value="0" scope="page" />
								<c:forEach items="${Peers}" var="current">
								<c:choose>
									<c:when test="${i > 0}">
										<li data-target="#carousel-1" data-slide-to="${i}"></li>
									</c:when>
									<c:otherwise>
										<li data-target="#carousel-1" data-slide-to="${i}" class="active"></li>
									</c:otherwise>
								</c:choose>
								<c:set var="i" value="${i + 1}" scope="page" />
						</c:forEach>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
					
						<c:set var="count" value="0" scope="page" />
							<c:forEach items="${Peers}" var="current">
							<c:choose>
								<c:when test="${count > 0}">
									<div class="item ">
								</c:when>
								<c:otherwise>
									<div class="item active">
								</c:otherwise>
							</c:choose>
							<div align="center">
								<div class="embed-responsive embed-responsive-16by9">
									<iframe class="embed-responsive-item" allowfullscreen 
										src="${current.url}"
										frameborder="0"></iframe>
								</div>
							</div>
							<div class="carousel-caption">
								<p />
								<p></p>
							</div>
						</div>
							<c:set var="count" value="${count + 1}" scope="page" />
							</c:forEach>
					

						<a class="left carousel-control" href="#carousel-1" role="button"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#carousel-1"
							role="button" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-6">
		<div class="panel panel-success">
			<div class="panel-heading" align="center">
				<spring:message code="healthy.expert" />
			</div>
			<div class="panel-footer" align="center">
				<!-- 		Video Carousel -->
				<div id="carousel-2" class="carousel slide" data-ride="carousel"
					data-interval="false">
					<ol class="carousel-indicators">
						<c:set var="i" value="0" scope="page" />
								<c:forEach items="${Expert}" var="current">
								<c:choose>
									<c:when test="${i > 0}">
										<li data-target="#carousel-2" data-slide-to="${i}"></li>
									</c:when>
									<c:otherwise>
										<li data-target="#carousel-2" data-slide-to="${i}" class="active"></li>
									</c:otherwise>
								</c:choose>
								<c:set var="i" value="${i + 1}" scope="page" />
						</c:forEach>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<c:set var="count" value="0" scope="page" />
							<c:forEach items="${Expert}" var="current">
							<c:choose>
								<c:when test="${count > 0}">
									<div class="item ">
								</c:when>
								<c:otherwise>
									<div class="item active">
								</c:otherwise>
							</c:choose>
							<div align="center">
								<div class="embed-responsive embed-responsive-16by9">
									<iframe class="embed-responsive-item" allowfullscreen 
										src="${current.url}"
										frameborder="0"></iframe>
								</div>
							</div>
							<div class="carousel-caption">
								<p />
								<p></p>
							</div>
						</div>
							<c:set var="count" value="${count + 1}" scope="page" />
							</c:forEach>
						<a class="left carousel-control" href="#carousel-2" role="button"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#carousel-2"
							role="button" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<c:choose>
							<c:when test="${role=='admin'}">
								<div align="right">
											<button type="submit" class="btn btn-primary btn-xs" id="videoLinkEditing" data-toggle="modal"	data-target="#videoUrlModal">
												<spring:message code="edit" />
											</button>
									</div>
								</c:when>
								</c:choose>

</div>



<div id="imgModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					<spring:message code="diet" />
				</h4>
			</div>
			<div class="modal-body">
				<img class="img-responsive img-rounded center-block"
					alt=<spring:message code="diet" />
					src="resources/images/jpg/dietPlate.jpg" width="100%" height="100%">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>


<div id="imgModal2" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					<spring:message code="diet" />
				</h4>
			</div>
			<div class="modal-body">
				<img class="img-responsive img-rounded center-block"
					alt=<spring:message code="diet" />
					src="resources/images/jpg/portions.png" width="100%" height="100%">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>


<div id="imgModal3" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					<spring:message code="diet" />
				</h4>
			</div>
			<div class="modal-body">
				<!-- 				<img class="img-responsive img-rounded center-block" -->
				<!-- 					alt=<spring:message code="diet" /> -->
				<!-- 					src="resources/images/jpg/fats.png" width="100%" height="100%"> -->

				<table>
					<tbody>
						<tr>
							<td style="padding: 10px;">
								<h2>Type of fats</h2>
							</td>
							<td style="padding: 10px;">&nbsp;</td>
							<td style="padding: 10px;">
								<h2>Found in</h2>
							</td>
						</tr>
						<tr>
							<td style="padding: 10px;">
								<h3>
									<span style="color: #00b050;">Monounsaturated</span>
								</h3>Have these in small amounts. They can help to maintain healthy
								cholesterol levels.&nbsp;
							</td>
							<td style="padding: 10px;">&nbsp;<img alt="" height="137"
								width="111"
								src="https://www.bhf.org.uk/~/media/images/heart-health/preventing-heart-disease/healthy-eating/monounsaturated-fats2.jpg?la=en&amp;h=137&amp;w=111"
								style="height: 137px; width: 111px;"></td>
							<td style="padding: 10px;">Avocados, olives, olive oil,
								rapeseed oil. Almonds, cashews, hazelnuts, peanuts, pistachios
								and spreads made from these nuts.</td>
						</tr>
						<tr>
							<td style="padding: 10px;">
								<h3>
									<span style="color: #00b050;">Polyunsaturated</span>
								</h3>Have these in small amounts.&nbsp;Polyunsaturated fats help to
								maintain healthy cholesterol levels and provide essential fatty
								acids.<br>
							</td>
							<td style="padding: 10px;"><img alt="" height="137"
								width="111"
								src="https://www.bhf.org.uk/~/media/images/heart-health/preventing-heart-disease/healthy-eating/polunsaturated-fats2.jpg?la=en&amp;h=137&amp;w=111"
								style="height: 137px; width: 111px;"></td>
							<td style="padding: 10px;">Oily fish, corn oil, sesame oil,
								soya oil, and spreads made from those oils. Flaxseed, pine nuts,
								sesame seeds, sunflower seeds, and walnuts.&nbsp;</td>
						</tr>
						<tr>
							<td style="padding: 10px;">
								<h3>
									<span style="color: #e36c09;">Saturated</span>
								</h3>Swap these for unsaturated fats. Eating too much saturated fat
								increases the amount of cholesterol in your blood.<br />
							</td>
							<td style="padding: 10px;"><img alt=""
								src="https://www.bhf.org.uk/~/media/images/heart-health/preventing-heart-disease/healthy-eating/saturated-fats2.jpg?la=en&amp;h=137&amp;w=111"
								style="height: 137px; width: 111px;"></td>
							<td style="padding: 10px;">Processed meats like sausages,
								ham, burgers. Fatty meat. Hard cheeses including cheddar. Whole
								milk and cream. Butter, lard, ghee, suet, palm oil and coconut
								oil.</td>
						</tr>
						<tr>
							<td style="padding: 10px;">
								<h3>
									<span style="color: #ff0000;">Trans</span>
								</h3>Avoid wherever possible. They can increase cholesterol in your
								blood. Foods with hydrogenated oils or fats in them likely
								contain trans fats.&nbsp;<br>
							</td>
							<td style="padding: 10px;"><img alt=""
								src="https://www.bhf.org.uk/~/media/images/heart-health/preventing-heart-disease/healthy-eating/trans-fats2.jpg?la=en&amp;h=137&amp;w=111"
								style="height: 137px; width: 111px;"></td>
							<td style="padding: 10px;">Fried foods, takeaways, snacks
								like biscuits, cakes or pastries. Hard margarines.</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>

<c:choose>
	<c:when test="${goals != null}">
		<div class="row">
			<div class="col-lg-12">
				<h3>
					<spring:message code="healthy.goal" />
				</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div>
					<c:set var="i" value="0" scope="page" />
					<c:forEach items="${goals}" var="current">
						<div class="row">
							<div class="col-lg-12">
								<i class="fa fa-circle" aria-hidden="true" style="color: #CCC"
									id="img_${i}"></i> <span>${current}</span>
							</div>
						</div>
						<c:set var="i" value="${i + 1}" scope="page" />
					</c:forEach>
				</div>
			</div>
		</div>


		<div class="row" style="margin-top: 2%">
			<!--  ci sono problemi strani con dimensione x superiore al 1057px -->
			<div class="col-lg-12">
				<!-- Responsive calendar - START -->
				<div id='calendar'></div>
				<!-- Responsive calendar - END -->
			</div>
		</div>
	</c:when>
</c:choose>


<!--   MODAL INPUT -->
  <div id="input" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				
				<div class="col-lg-12 col-md-12">
            		<div class="panel panel-default">
	            		<div class="panel-heading">
							<h4 class="modal-title" style="text-align: center">
								<span id="day"></span>
							</h4>
	                    </div>
            		</div>
            	</div>
				
				<div id="goalsSummary">
				<c:forEach items="${goals}" var="current">
						<div class="row">
							<div class="col-lg-12">
								<span>${current}</span>
							</div>
						</div>
					</c:forEach>
				</div>
			
			</div>
			<div class="modal-body">
<!-- 				<div class="row"> -->
<!-- 					<div class="col-lg-12"> -->
<!-- 						<div class="col-lg-8"> -->
<!-- 								<span>How many portions of <b>vegetables and fruits</b> did you eat today?</span> -->
<!-- 						</div> -->
<!-- 						<div class="col-lg-4"> -->
<!-- 								<input type="number" class="form-control"  -->
<!-- 											id="vegs"> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-lg-12"> -->
<!-- 						<div class="col-lg-8"> -->
<!-- 								<span>How many meals containing <b>saturated fats</b> had you today?</span> -->
<!-- 						</div> -->
<!-- 						<div class="col-lg-4"> -->
<!-- 								<input type="text" class="form-control"  -->
<!-- 											id="fat"> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-lg-12"> -->
<!-- 						<div class="col-lg-8"> -->
<!-- 								<span>How many teaspoon of <b>salt</b> did you use today?</span> -->
<!-- 						</div> -->
<!-- 						<div class="col-lg-4"> -->
<!-- 								<input type="text" class="form-control"  -->
<!-- 											id="salt"> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 					<div class="col-lg-12"> -->
<!-- 						<div class="alert alert-success alert-dismissible" role="alert" -->
<!-- 							id="alert_modal"> -->
<!-- 							<button type="button" class="close" data-dismiss="alert" -->
<!-- 								aria-label="Close"> -->
<!-- 								<span aria-hidden="true">&times;</span> -->
<!-- 							</button> -->
<%-- 							<strong><spring:message code="msg.welldone"  htmlEscape="false"/></strong> --%>
<%-- 							<spring:message code="msg.saved"  htmlEscape="false"/> --%>
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 				</div> -->
				
<!-- 				VERSIONE FUNZIONANTE -->
<!-- 				<div class="row"> -->
<%-- 					<c:set var="count" value="0" scope="page" /> --%>
<%-- 					<c:forEach items="${goalsQuestions}" var="current"> --%>
<!-- 					<div class="row"> -->
<!-- 						<div class="col-lg-12"> -->
<!-- 							<div class="col-lg-8"> -->
<%-- 									<span>${current}</span> --%>
<!-- 							</div> -->
<!-- 							<div class="col-lg-4"> -->
<!-- 								<input type="number" class="form-control"  -->
<%-- 											id="goal_${count}"> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
				
<%-- 					<c:set var="count" value="${count + 1}" scope="page" /> --%>
<%-- 					</c:forEach> --%>
<!-- 				</div> -->
				
				<div class="row">
					<c:set var="count" value="0" scope="page" />
					<c:forEach items="${completeGoals}" var="current">
					<div class="row">
						<div class="col-lg-12">
							<div class="col-lg-8">
									<span>${current.text}</span>
							</div>
							<div class="col-lg-4">
								<input type="number" class="form-control" 
											id="goal_${count}" min="0">
							</div>
						</div>
					</div>
				
					<c:set var="count" value="${count + 1}" scope="page" />
					</c:forEach>
				</div>

			</div>
			<div class="modal-footer">

				<button type="button" class="btn btn-success" id="saveGoals">
					<spring:message code="outdoor.save.monitored.tagged"  htmlEscape="false"/>
				</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">
					<spring:message code="close" />
				</button>

			</div>
		</div>
	</div>
</div>

<!-- Modale per gestione video -->
<div id="videoUrlModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					<spring:message code="edit" /> [Language: ${pageContext.response.locale}]
				</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-lg-12">
						<table>
						<tr>
									<td style="padding: 5px" width="20%">
										<spring:message code="videoUrl.type" />
									</td>
									<td style="padding: 5px" width="40%">
										<spring:message code="videoUrl.url" />
									</td>
									<td style="padding: 5px" width="40%">
										<spring:message code="videoUrl.remove" />
									</td>
						</tr>
							<c:forEach items="${Peers}" var="current">
								<tr id="${current.id}">
									<td style="padding: 5px">
										<h5>${current.type}</h5>
									</td>
									<td style="padding: 5px"><a href="#"
										data-url="updateVideoUrl" data-type="text"
										data-pk="${current.id}" class="editable editable-click"
										data-original-title="" title="">${current.url}</a></td>
									<td style="padding: 5px">
										<span><i id="first_${current.id}" class="fa fa-chain-broken doubleclick" aria-hidden="true"></i></span>
										<span id="remove_${current.id}" hidden=true class="remove" style="color: red"><i class="fa fa-trash" aria-hidden="true"></i> <h5><spring:message code="videoUrl.trash" /></h5></span>
									</td>
								</tr>
							</c:forEach>
							<c:forEach items="${Expert}" var="current">
								<tr id="${current.id}">
									<td style="padding: 5px">
										<h5>${current.type}</h5>
									</td>
									<td style="padding: 5px"><a href="#"
										data-url="updateVideoUrl" data-type="text"
										data-pk="${current.id}" class="editable editable-click"
										data-original-title="" title="">${current.url}</a></td>
									<td style="padding: 5px">
										<span><i id="first_${current.id}" class="fa fa-chain-broken doubleclick" aria-hidden="true"></i></span>
										<span id="remove_${current.id}" hidden=true class="remove" style="color: red"><i class="fa fa-trash" aria-hidden="true"></i> <h5><spring:message code="videoUrl.trash" /></h5></span>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>

				<div class="row" id="addNew">
					<div class="col-lg-12">
						<div class="alert alert-success alert-dismissible" role="alert"
							id="alert_modal_nt">
							<table>
								<tr>
									<td style="padding: 5px">
										<h5>
											<spring:message code="videoUrl.type" />
										</h5>
									</td>
									<td><select class="form-control" id="newType">
											<option value="peers"><spring:message
													code="healthy.peers" /></option>
											<option value="expert"><spring:message
													code="healthy.expert" /></option>
									</select></td>
								</tr>
								<tr>
									<td style="padding: 5px">
										<h5>
											<spring:message code="videoUrl.url" />
										</h5>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" id="newUrl"/>
										</div>
									</td>
								</tr>
							</table>
							<div align="right">
								<button type="button" class="btn btn-success" id="saveNewUrl">
									<spring:message code="videoUrl.save" htmlEscape="false" />
								</button>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="modal-footer">

				<button type="button" class="btn btn-success" id="addNewUrl">
					<spring:message code="videoUrl.add"  htmlEscape="false"/>
				</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal" id="closeModal">
					<spring:message code="close" />
				</button>

			</div>
		</div>
	</div>
</div>




<!-- Modale per gestione documenti -->
<div id="pdfContentModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					<spring:message code="edit" /> [Language: ${pageContext.response.locale}]
				</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-lg-12">
						<table>
						<tr>
									<td style="padding: 5px" width="50%">
										<spring:message code="content.label" />
									</td>
									<td style="padding: 5px">
										<spring:message code="videoUrl.remove" />
									</td>
						</tr>
							<c:forEach items="${docs}" var="current">
								<tr id="D${current.id}">
									<td style="padding: 5px" width="50%">${current.label}</td>
									<td style="padding: 5px">
										<span><i id="firstD_${current.id}" class="fa fa-times doubleclickDoc" aria-hidden="true"></i></span>
										<span id="removeD_${current.id}" hidden=true class="removeDoc" style="color: red"><i class="fa fa-trash" aria-hidden="true"></i> <spring:message code="videoUrl.trash" /></span>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>



<form method="POST" enctype="multipart/form-data" action="saveDoc.html">

				<div class="row" id="addNewDoc">
					<div class="col-lg-12">
						<div class="alert alert-success alert-dismissible" role="alert"
							id="alert_modal_nt">
							<table><tr>
									<td style="padding: 5px">
										<h5>
											<spring:message code="content.label" />
										</h5>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" id="label" name="label"/>
										</div>
									</td>
								</tr>
								<tr>
									<td style="padding: 5px">
										<h5>
											<spring:message code="content.fileToUpload" />
										</h5>
									</td>
									<td>
										<div>
											<input type="file" name="file" />
										</div>
									</td>
								</tr>
							</table>
							<div align="right">
								<button type="submit" class="btn btn-success" id="saveNewUrl">
									<spring:message code="content.button.upload" htmlEscape="false" />
								</button>
							</div>
						</div>
					</div>
				</div>
					</form>

				<div class="modal-footer">
	
					<button type="button" class="btn btn-success" id="showAddNewDoc">
						<spring:message code="content.button.add"  htmlEscape="false"/>
					</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal" id="closeModalDoc">
						<spring:message code="close" />
					</button>
	
				</div>
			
		
		</div>
	</div>
</div>
</div>
