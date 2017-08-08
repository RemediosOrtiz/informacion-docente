<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<t:admin_layout>
	<jsp:attribute name="viewtitlename">
     	<title>Admin - R. Nombramiento</title>
    </jsp:attribute>

	<jsp:attribute name="viewuserrol">
     	Administrador
    </jsp:attribute>

	<jsp:attribute name="viewtitleseccion">
     	Reportes
    </jsp:attribute>

	<jsp:attribute name="extracss"> </jsp:attribute>

	<jsp:attribute name="extrajs">
	
		<c:if test="${sessionScope.mensaje-estatus == 1}">
			<script>
				$.notify({
					message: 'Creado correctamente' 
				},{
					type: 'success'
				});
			</script>
		</c:if>
		
    </jsp:attribute>

	
	<jsp:body>
    
    <div class="container-fluid">
		   <div class="row">
		       <div class="col-md-12">
		       
    <div>
	    <ul class="nav nav-tabs" id="myTabs" role="tablist">
		    <li role="presentation" class="active">
		    	<a href="#reporte1-tab-x" id="tab-reporte1" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">R. Horas de Contratación</a>
		    </li>
		    <li role="presentation" class="">
		    	<a href="#reporte2-tab-x" role="tab" id="tab-reporte2" data-toggle="tab" aria-controls="direc-tab-x" aria-expanded="false">Reporte 2</a>
		    </li>
	    </ul>
	    
    
	    <!-- Tab panes -->
		  <div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="reporte1-tab-x">
				<div class="card">
	               <div class="header">
	               </div>
		               
		           <div class="header">
		           
		           	<div style="text-align: center;">
		           		<h5 style="padding: 0px; margin: 0px; font-weight: bold;">SOLICITUD DE HORAS DE CONTRATACIÓN</h5>
		               <h5 style="padding: 0px; margin: 8px 0px; font-weight: bold;">DIVISIÓN DE TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓN</h5>
		               <h5 style="padding: 0px; margin: 0px; font-weight: bold;">PERIODO CUATRIMESTRAL MAYO - AGOSTO 2017</h5>
		           	</div>
		               
	               <div class="content table-responsive table-full-width">
	               		<table class="table table-bordered">
	               		
						   <thead style="background-color: #C0C0C0;">
						      <tr>
						      	<th style="color: #000;">#</th>
						        <th style="color: #000;">NOMBRE DEL DOCENTE</th>
						        <th style="color: #000;">PUESTO/NOMBRAMIENTO</th>
						        <th style="color: #000;">HRS. GRUPO</th>
						        <th style="color: #000;">HRS. APOYO</th>
						        <th style="color: #000;">HRS. TOTALES</th>
						      </tr>
						   </thead>
						   <tbody>
						   
							<c:forEach items="${ReporteHorasContratacion}" var="ReporteHorasContratacion">
						        
								<tr>
							   		<td></td>
							   		<td>${ReporteHorasContratacion.nombre} ${ReporteHorasContratacion.apPaterno} ${ReporteHorasContratacion.apMaterno}</td>
							   		<td>${ReporteHorasContratacion.descNombramiento}</td>
							   		<td>${ReporteHorasContratacion.hrsGrupo}</td>
							   		<td>${ReporteHorasContratacion.hrsApoyo}</td>
							   		<td>${ReporteHorasContratacion.hrsTotal}</td>
							   </tr>
								
							</c:forEach>
							
								<tr>
							   		<td></td>
							   		<td></td>
							   		<td style="font-weight: bold;">TOTALES:</td>
							   		<td style="font-weight: bold;"><c:out value="${totalHrsGrupo}"/></td>
							   		<td style="font-weight: bold;"><c:out value="${totalHrsApoyo}"/></td>
							   		<td style="font-weight: bold;"><c:out value="${totalHrsGeneral}"/></td>
							   </tr>
							</tbody>
						</table>
		               </div>
		           </div>
		           </div>
			</div>
			
			
			<div role="tabpanel" class="tab-pane" id="reporte2-tab-x">
				<div class="card">
		               <div class="header">
		                   <h5 class="title"><b>CÁLCULO DE TOTAL DE HORAS / SEMANA FRENTE A GRUPO, CLASIFICADOS POR TIPO DE PUESTO</b></h5>
		                   <p class="category">REPORTE 2</p>
		               </div>
		               
		               <div class="header">
		               <div class="content table-responsive table-full-width">
							<c:forEach items="${reportes2}" var="reportes2">
						        <table style="margin-bottom: 5px;">
									<tr style="margin-top: 10px; margin-bottom: 5px; border-top: solid 1px #E5E5E5">
										<td width="200px">
											<h6>${reportes2.descNombramiento}</h6>
										</td>
										<td width="20px" style="text-align: right;"><c:out value="${reportes2.clave}"></c:out></td>
										<td width="200px" style="text-align: right;">${reportes2.nombreGrupo}: </td>
										<td width="200px" style="text-align: right;"><c:out value="${reportes2.horas}"></c:out> Horas totales</td>
									</tr>
								</table>
							</c:forEach>
		               </div>
		           </div>
		           </div>
			</div>
			
			<!-- AQUI LAS DEMÀS TABS -->
			
		  </div>
    </div>
    
    </div>
		  </div>
    </div>
</jsp:body>
	
</t:admin_layout>