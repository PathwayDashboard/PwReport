<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<h3>
You are editing the language: ${contentLocale}
</h3>

 
        <form action="save.html" method="post">
            <textarea name="modified" id="modified" rows="10" cols="80"  >
<%--                <%@ include file="resources/../../static/staticAlcoholR.html" %> --%>
					 ${contentToModify} 
            </textarea>
            <script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'modified' );
            </script>
            
            <button type="submit" class="btn">Save</button>
            
        </form>
