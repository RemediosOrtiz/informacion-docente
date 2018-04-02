<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:admin_layout>
	<jsp:attribute name="viewtitlename">
     	<title>Admin - Dashboard</title>
    </jsp:attribute>

	<jsp:attribute name="viewuserrol">
     	Administrador
    </jsp:attribute>

	<jsp:attribute name="viewtitleseccion">
     	Dashboard
    </jsp:attribute>

	<jsp:attribute name="extracss"> </jsp:attribute>

	<jsp:attribute name="extrajs">
      	<!-- <script>$(function() { $('#to-atm-int').addClass("active-section"); });</script> -->
    </jsp:attribute>

	<jsp:body>
   	<h1 class="modal-title">
    <br>
    
   				<center>
				<b>¡Bienvenido al “Sistema de información Docente” creado por SystemLink!</b>
				</center>
	
    </h1>
   	            
	</jsp:body>

</t:admin_layout>