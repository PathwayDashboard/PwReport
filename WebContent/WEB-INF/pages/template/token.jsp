<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<form action="test.html" method="post">
	<input type="text" placeholder="token" class="input-field" 
		name="token" /> 
		<input type="text" placeholder="refresh"
		class="input-field" name="refresh" />
	<button type="submit">Submit</button>
</form>

${patient}
