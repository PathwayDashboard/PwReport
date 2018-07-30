<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
			Crea X sessioni random per l'utente specificato e nel periodo selezionato
		</h1>
	</div>
</div>


<div class="row">
	<div class="col-lg-12">
		<span>${msgToShow}</span>
	</div>
</div>


<div class="row">
	<div class="col-lg-12">
		<form action="createSesions.html" method="post" id="formCreation">
			<div class="row">
				<div class="col-md-12">
				
				 <input type="text" placeholder="User name" class="input-field" required name="username"/> 
				<input type="password"  placeholder="Password" class="input-field" required name="password"/> 

						<div class="input-daterange input-group" id="datepicker" data-date-end-date="0d">
							<input id="from" type="text" class="input-sm form-control"  placeholder="FROM"
								name="from" 
								/>
						</div>
					
						<div class="input-daterange input-group" id="datepicker" data-date-end-date="0d">
							<input id="to" type="text" class="input-sm form-control" placeholder="TO"
								name="to" 
								/>
						</div>
					
					<div class="col-md-2" style="padding-top: 3px;">
						<button type="submit" class="btn btn-primary btn-sm" id="create">
						<span>Crea sessioni</span>
						</button>
					</div>

				</div>
			</div>
		</form>
	</div>
</div>


