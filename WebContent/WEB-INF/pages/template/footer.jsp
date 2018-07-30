
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="date" class="java.util.Date" />
<hr />
<div class="row" style="margin-left: 10px;margin-right: 10px;margin-bottom: 10px">
	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="margin-bottom:15px">
		<a style="text-align: center" href="https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=1200408420&mt=8">
			<img src="resources/images/appStore.svg" />
		</a>
	</div>
	<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
		<p style="text-align: right">
			© Copyright 2015-
			<fmt:formatDate value="${date}" pattern="yyyy" />
			Engineering Ingegneria Informatica S.p.A.
		</p>
	</div>
	
</div>

<!-- style="text-align: right; display: block;" -->