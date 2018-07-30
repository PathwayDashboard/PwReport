<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<form method="POST" enctype="multipart/form-data" action="saveDoc.html">
	<table>
		<tr>
			<td>File to upload:</td>
			<td><input type="file" name="file" /></td>
		</tr>
		<tr>
			<td>Dimension</td>
			<td><input type="text" name="dimension" /></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Upload" /></td>
		</tr>
	</table>

</form>


<h4>
	<spring:message code="lifestyle.download" />
</h4>

<div class="list-group">
	<c:forEach items="${docs}" var="current">
	 <div class="row">
                <div class="col-lg-4">
					<a class="list-group-item" href="downloadDoc/${current.id}"	target="_blank">${current.filename}</a>
				</div>  
				<div class="col-lg-4">
					<a href="removeDoc?documentId=${current.id}" class="btn btn-danger"> <i class="fa fa-trash-o" aria-hidden="true"></i></a>
				</div> 
	</div>
	</c:forEach>
</div>


<div align="left">
	<button type="submit" class="btn btn-primary btn-xs"
		id="videoLinkEditing" data-toggle="modal" data-target="#pdfContentModal">
		<spring:message code="edit" />
	</button>
</div>

<div id="pdfContentModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					<spring:message code="edit" />
				</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-lg-12">
						<table>
						<tr>
									<td style="padding: 5px">
										<spring:message code="content.type" />
									</td>
									<td style="padding: 5px">
										<spring:message code="content.label" />
									</td>
									<td style="padding: 5px">
										<spring:message code="videoUrl.remove" />
									</td>
						</tr>
							<c:forEach items="${docs}" var="current">
								<tr id="D${current.id}">
									<td style="padding: 5px">
										<h5>${current.dimension}</h5>
									</td>
									<td style="padding: 5px">${current.label}</td>
									<td style="padding: 5px">
										<span><i id="firstD_${current.id}" class="fa fa-times doubleclickDoc" aria-hidden="true"></i></span>
										<span id="removeD_${current.id}" hidden=true class="removeDoc" style="color: red"><i class="fa fa-trash" aria-hidden="true"></i> <h5><spring:message code="videoUrl.trash" /></h5></span>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>



<form method="POST" enctype="multipart/form-data" action="saveDoc.html">

				<div class="row" id="addNew">
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
	
					<button type="button" class="btn btn-success" id="addNewDoc">
						<spring:message code="content.button.add"  htmlEscape="false"/>
					</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal" id="closeModal">
						<spring:message code="close" />
					</button>
	
				</div>
			
		
		</div>
	</div>
</div>
