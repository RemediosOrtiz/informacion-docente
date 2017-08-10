<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<t:SecretariaLayout>
	<jsp:attribute name="viewtitlename">
     	<title>Secretaria - Reportes</title>
    </jsp:attribute>

	<jsp:attribute name="viewuserrol">
     	Secretaria
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
		    	<a href="#reporte2-tab-x" role="tab" id="tab-reporte2" data-toggle="tab" aria-controls="direc-tab-x" aria-expanded="false">R. General</a>
		    </li>
	    </ul>
	    
    
	    <!-- Tab panes -->
		  <div class="tab-content">
			<div role="tabpanel" class="tab-pane" id="reporte1-tab-x">
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
			
			<div role="tabpanel" class="tab-pane active" id="reporte2-tab-x">
				<div class="card">
	               	<div class="header">
	                   <p class="category">REPORTE GENERAL</p>
	               	</div>
	               	
	               	<style>
               			.header-reporte tr th {
						    text-align: center;
						    font-size: 10px !important;
						    font-weight: bold !important;
						}
						
						.separador-normal {
							text-align: center;
							font-size: 11px !important;
							background-color: #FFF !important; 
						} 
						
						.fila-separadora {
							border-bottom: solid 2px #000 !important;
						}
						
						.fila-totales {
							background-color: #C0C0C0;
						}
						
						.fila-totales-final {
							background-color: #F8FF00;
							font-weight: bold !important;
						}
	               	</style>

	               	<div class="header">
	              		<table class="table table-bordered ">
	               		
						   <thead class="header-reporte" style="background-color: #C0C0C0; text-aling: center;">
						      <tr>
						      	<th rowspan="3" style="color: #000;">PUESTO</th>
						        <th rowspan="3" style="color: #000;">CATEGORIAS</th>
						        <th colspan="2" style="color: #000;">No. DE PROFESORES QUE IMPARTEN TSU</th>
						        <th rowspan="3" style="color: #000;">TOTAL PROFESORES QUE IMPARTEN TSU</th>
						        
						        <th rowspan="3" style="color: #000;">TOTAL HORAS TSU</th>
						        <th rowspan="3" style="color: #000;">EN CASO DE NO CUMPLIR LOS PTC CON LAS 40HRS, ANOTAR EN ESTA CELDA LAS HORAS REALES ASIGNADAS (realizar actividades administrativas)</th>
						      	<th rowspan="3" style="color: #000;">INDICAR EL POR QUE NO ESTAN CUMPLIENDO CON SUS 40 HORAS O POR QUE SE PASAN DE LAS 40 HRS ASIGNADAS</th>
						      	<th colspan="10" style="color: #000;">GRADOS DE ESTUDIOS</th>
						      	
						      	<th colspan="4" style="color: #000;">EXPERIENCIA DOCENTE</th>
						      	
						      	<th colspan="4" style="color: #000;">EXPERIENCIA LABORAL</th>
						      	
						      	<th colspan="2" style="color: #000;">PARTICIPA EN:</th>
						      	
						      	<th rowspan="3" style="background-color: red; color: #000;">PTC REGISTRADOS EN EL SISTEMA NACIONAL DE INVESTIGADORES (SNI)</th>
						      	
						      	<th rowspan="3" style="color: #000;">CON PERFIL RECONOCIDO POR EL PROMEP</th>
						      	
						      </tr>
						      <tr style="background-color: #C0C0C0;">
						      	<th rowspan="2" style="background-color: #3CCCFF; color: #FFF;">H</th>
						      	<th rowspan="2" style="background-color: #3CCCFF; color: #FFF;">M</th>
						      	<th rowspan="2" style="color: #000;">OTRO</th>
						      	<th rowspan="2" style="color: #000;">ESPECIFICAR</th>
						      	<th rowspan="2" style="color: #000;">TSU</th>
						      	<th colspan="2" style="color: #000;">LICENCIATURA</th>
						      	<th rowspan="2" style="color: #000;">ESPECIALIDAD</th>
						      	<th colspan="2" style="color: #000;">MAESTRÍA</th>
						      	<th colspan="2" style="color: #000;">DOCTORADO</th>
						      	
						      	<th rowspan="2" style="color: #000;">SIN EXPERIENCIA</th>
						      	<th rowspan="2" style="color: #000;">DE 1 A 4 AÑOS</th>
						      	<th rowspan="2" style="color: #000;">DE 5 A 10 AÑOS</th>
						      	<th rowspan="2" style="color: #000;">MÀS DE 10 AÑOS</th>
						      	
						      	<th rowspan="2" style="color: #000;">SIN EXPERIENCIA</th>
						      	<th rowspan="2" style="color: #000;">DE 1 A 4 AÑOS</th>
						      	<th rowspan="2" style="color: #000;">DE 5 A 10 AÑOS</th>
						      	<th rowspan="2" style="color: #000;">MÀS DE 10 AÑOS</th>
						      	
						      	<th rowspan="2" style="color: #000;">CUERPOS ACADÉMICOS</th>
						      	<th rowspan="2" style="color: #000;">LIIADT (LINEAS INNOVADORAS DE INVESTIGACIÓN APLICADA Y DESARROLLO TECNOLÓGICO)</th>
						      	
						      	
						      </tr>
						      <tr style="background-color: #3CCCFF;">
						      	<th style="color: #FFF;">SIN TÍTULO</th>
						      	<th style="color: #FFF;">CON TÍTULO</th>
						      	<th style="color: #FFF;">SIN GRADO</th>
						      	<th style="color: #FFF;">CON GRADO</th>
						      	<th style="color: #FFF;">SIN GRADO</th>
						      	<th style="color: #FFF;">CON GRADO</th>
						      </tr>
						      </thead>
						   	<tbody>
						      <tr class="separador-normal">
						      	<td rowspan="4">PTC TITULARES</td>
						      	<td>A</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombres}" var="reporteTSUHombres">
							      		<c:if test="${reporteTSUHombres.descNombramiento == '1'}">
							      			<c:out value="${reporteTSUHombres.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUMujeres}" var="reporteTSUMujeres">
							      		<c:if test="${reporteTSUMujeres.descNombramiento == '1'}">
							      			<c:out value="${reporteTSUMujeres.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '1'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '1'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total*40}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUTotalHoras}" var="reporteTSUTotalHoras">
							      		<c:if test="${reporteTSUTotalHoras.descNombramiento == '1'}">
							      			<c:out value="${reporteTSUTotalHoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTSU}" var="reporteGradoEstudioTSU">
							      		<c:if test="${reporteGradoEstudioTSU.descNombramiento == '1'}">
							      			<c:out value="${reporteGradoEstudioTSU.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioSinLicenciatura}" var="reporteGradoEstudioSinLicenciatura">
							      		<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '1'}">
							      			<c:out value="${reporteGradoEstudioSinLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioConLicenciatura}" var="reporteGradoEstudioConLicenciatura">
							      		<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '1'}">
							      			<c:out value="${reporteGradoEstudioConLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente0}" var="reporteExperienciaDocente0">
							      		<c:if test="${reporteExperienciaDocente0.descNombramiento == '1'}">
							      			<c:out value="${reporteExperienciaDocente0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente1A4}" var="reporteExperienciaDocente1A4">
							      		<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '1'}">
							      			<c:out value="${reporteExperienciaDocente1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '1'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      </tr>
						      <tr class="separador-normal">
						      	<td>B</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombres}" var="reporteTSUHombres">
							      		<c:if test="${reporteTSUHombres.descNombramiento == '2'}">
							      			<c:out value="${reporteTSUHombres.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUMujeres}" var="reporteTSUMujeres">
							      		<c:if test="${reporteTSUMujeres.descNombramiento == '2'}">
							      			<c:out value="${reporteTSUMujeres.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '2'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '2'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total*40}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUTotalHoras}" var="reporteTSUTotalHoras">
							      		<c:if test="${reporteTSUTotalHoras.descNombramiento == '2'}">
							      			<c:out value="${reporteTSUTotalHoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTSU}" var="reporteGradoEstudioTSU">
							      		<c:if test="${reporteGradoEstudioTSU.descNombramiento == '2'}">
							      			<c:out value="${reporteGradoEstudioTSU.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioSinLicenciatura}" var="reporteGradoEstudioSinLicenciatura">
							      		<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '2'}">
							      			<c:out value="${reporteGradoEstudioSinLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioConLicenciatura}" var="reporteGradoEstudioConLicenciatura">
							      		<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '2'}">
							      			<c:out value="${reporteGradoEstudioConLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente0}" var="reporteExperienciaDocente0">
							      		<c:if test="${reporteExperienciaDocente0.descNombramiento == '2'}">
							      			<c:out value="${reporteExperienciaDocente0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente1A4}" var="reporteExperienciaDocente1A4">
							      		<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '2'}">
							      			<c:out value="${reporteExperienciaDocente1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '2'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      </tr>
						      <tr class="separador-normal">
						      	<td>C</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombres}" var="reporteTSUHombres">
							      		<c:if test="${reporteTSUHombres.descNombramiento == '3'}">
							      			<c:out value="${reporteTSUHombres.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUMujeres}" var="reporteTSUMujeres">
							      		<c:if test="${reporteTSUMujeres.descNombramiento == '3'}">
							      			<c:out value="${reporteTSUMujeres.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '3'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '3'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total*40}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUTotalHoras}" var="reporteTSUTotalHoras">
							      		<c:if test="${reporteTSUTotalHoras.descNombramiento == '3'}">
							      			<c:out value="${reporteTSUTotalHoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTSU}" var="reporteGradoEstudioTSU">
							      		<c:if test="${reporteGradoEstudioTSU.descNombramiento == '3'}">
							      			<c:out value="${reporteGradoEstudioTSU.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioSinLicenciatura}" var="reporteGradoEstudioSinLicenciatura">
							      		<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '3'}">
							      			<c:out value="${reporteGradoEstudioSinLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioConLicenciatura}" var="reporteGradoEstudioConLicenciatura">
							      		<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '3'}">
							      			<c:out value="${reporteGradoEstudioConLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente0}" var="reporteExperienciaDocente0">
							      		<c:if test="${reporteExperienciaDocente0.descNombramiento == '3'}">
							      			<c:out value="${reporteExperienciaDocente0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente1A4}" var="reporteExperienciaDocente1A4">
							      		<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '3'}">
							      			<c:out value="${reporteExperienciaDocente1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '3'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      </tr>
						      <tr class="separador-normal fila-separadora">
						      	<td></td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA1" value="${0}"/>
									<c:forEach var="reporteTSUHombres" items="${reporteTSUHombres}">
										<c:if test="${reporteTSUHombres.descNombramiento == '1'}"> <c:set var="grupoA1" value="${grupoA1 + reporteTSUHombres.total}" /></c:if>
										<c:if test="${reporteTSUHombres.descNombramiento == '2'}"> <c:set var="grupoA1" value="${grupoA1 + reporteTSUHombres.total}" /></c:if>
										<c:if test="${reporteTSUHombres.descNombramiento == '3'}"> <c:set var="grupoA1" value="${grupoA1 + reporteTSUHombres.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA1}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA2" value="${0}"/>
									<c:forEach var="reporteTSUMujeres" items="${reporteTSUMujeres}">
										<c:if test="${reporteTSUMujeres.descNombramiento == '1'}"> <c:set var="grupoA2" value="${grupoA2 + reporteTSUMujeres.total}" /></c:if>
										<c:if test="${reporteTSUMujeres.descNombramiento == '2'}"> <c:set var="grupoA2" value="${grupoA2 + reporteTSUMujeres.total}" /></c:if>
										<c:if test="${reporteTSUMujeres.descNombramiento == '3'}"> <c:set var="grupoA2" value="${grupoA2 + reporteTSUMujeres.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA2}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA3" value="${0}"/>
									<c:forEach var="reporteTSUHombresMujeresTotal" items="${reporteTSUHombresMujeresTotal}">
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '1'}"> <c:set var="grupoA3" value="${grupoA3 + reporteTSUHombresMujeresTotal.total}" /></c:if>
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '2'}"> <c:set var="grupoA3" value="${grupoA3 + reporteTSUHombresMujeresTotal.total}" /></c:if>
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '3'}"> <c:set var="grupoA3" value="${grupoA3 + reporteTSUHombresMujeresTotal.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA3}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA5" value="${0}"/>
									<c:forEach var="reporteTSUHombresMujeresTotal" items="${reporteTSUHombresMujeresTotal}">
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '1'}"> <c:set var="grupoA5" value="${grupoA5 + reporteTSUHombresMujeresTotal.total}" /></c:if>
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '2'}"> <c:set var="grupoA5" value="${grupoA5 + reporteTSUHombresMujeresTotal.total}" /></c:if>
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '3'}"> <c:set var="grupoA5" value="${grupoA5 + reporteTSUHombresMujeresTotal.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA3*40}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA4" value="${0}"/>
									<c:forEach var="reporteTSUTotalHoras" items="${reporteTSUTotalHoras}">
										<c:if test="${reporteTSUTotalHoras.descNombramiento == '1'}"> <c:set var="grupoA4" value="${grupoA4 + reporteTSUTotalHoras.total}" /></c:if>
										<c:if test="${reporteTSUTotalHoras.descNombramiento == '2'}"> <c:set var="grupoA4" value="${grupoA4 + reporteTSUTotalHoras.total}" /></c:if>
										<c:if test="${reporteTSUTotalHoras.descNombramiento == '3'}"> <c:set var="grupoA4" value="${grupoA4 + reporteTSUTotalHoras.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA4}"/>
						      	</td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      </tr>
						      
						      <tr class="separador-normal">
						      	<td rowspan="4">PTC ASOCIADOS</td>
						      	<td>A</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombres}" var="reporteTSUHombres">
										<c:if test="${reporteTSUHombres.descNombramiento == '4'}">
											<c:out value="${reporteTSUHombres.total}"/>
										</c:if>
									</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUMujeres}" var="reporteTSUMujeres">
							      		<c:if test="${reporteTSUMujeres.descNombramiento == '4'}">
							      			<c:out value="${reporteTSUMujeres.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '4'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '4'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total*40}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUTotalHoras}" var="reporteTSUTotalHoras">
							      		<c:if test="${reporteTSUTotalHoras.descNombramiento == '4'}">
							      			<c:out value="${reporteTSUTotalHoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTSU}" var="reporteGradoEstudioTSU">
							      		<c:if test="${reporteGradoEstudioTSU.descNombramiento == '4'}">
							      			<c:out value="${reporteGradoEstudioTSU.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioSinLicenciatura}" var="reporteGradoEstudioSinLicenciatura">
							      		<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '4'}">
							      			<c:out value="${reporteGradoEstudioSinLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioConLicenciatura}" var="reporteGradoEstudioConLicenciatura">
							      		<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '4'}">
							      			<c:out value="${reporteGradoEstudioConLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente0}" var="reporteExperienciaDocente0">
							      		<c:if test="${reporteExperienciaDocente0.descNombramiento == '4'}">
							      			<c:out value="${reporteExperienciaDocente0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente1A4}" var="reporteExperienciaDocente1A4">
							      		<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '4'}">
							      			<c:out value="${reporteExperienciaDocente1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '4'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      </tr>
						      <tr class="separador-normal">
						      	<td>B</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombres}" var="reporteTSUHombres">
										<c:if test="${reporteTSUHombres.descNombramiento == '5'}">
											<c:out value="${reporteTSUHombres.total}"/>
										</c:if>
									</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUMujeres}" var="reporteTSUMujeres">
							      		<c:if test="${reporteTSUMujeres.descNombramiento == '5'}">
							      			<c:out value="${reporteTSUMujeres.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '5'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '5'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total*40}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUTotalHoras}" var="reporteTSUTotalHoras">
							      		<c:if test="${reporteTSUTotalHoras.descNombramiento == '5'}">
							      			<c:out value="${reporteTSUTotalHoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTSU}" var="reporteGradoEstudioTSU">
							      		<c:if test="${reporteGradoEstudioTSU.descNombramiento == '5'}">
							      			<c:out value="${reporteGradoEstudioTSU.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioSinLicenciatura}" var="reporteGradoEstudioSinLicenciatura">
							      		<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '5'}">
							      			<c:out value="${reporteGradoEstudioSinLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioConLicenciatura}" var="reporteGradoEstudioConLicenciatura">
							      		<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '5'}">
							      			<c:out value="${reporteGradoEstudioConLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente0}" var="reporteExperienciaDocente0">
							      		<c:if test="${reporteExperienciaDocente0.descNombramiento == '5'}">
							      			<c:out value="${reporteExperienciaDocente0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente1A4}" var="reporteExperienciaDocente1A4">
							      		<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '5'}">
							      			<c:out value="${reporteExperienciaDocente1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '5'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      </tr>
						      <tr class="separador-normal">
						      	<td>C</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombres}" var="reporteTSUHombres">
										<c:if test="${reporteTSUHombres.descNombramiento == '6'}">
											<c:out value="${reporteTSUHombres.total}"/>
										</c:if>
									</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUMujeres}" var="reporteTSUMujeres">
							      		<c:if test="${reporteTSUMujeres.descNombramiento == '6'}">
							      			<c:out value="${reporteTSUMujeres.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '6'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '6'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total*40}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUTotalHoras}" var="reporteTSUTotalHoras">
							      		<c:if test="${reporteTSUTotalHoras.descNombramiento == '6'}">
							      			<c:out value="${reporteTSUTotalHoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTSU}" var="reporteGradoEstudioTSU">
							      		<c:if test="${reporteGradoEstudioTSU.descNombramiento == '6'}">
							      			<c:out value="${reporteGradoEstudioTSU.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioSinLicenciatura}" var="reporteGradoEstudioSinLicenciatura">
							      		<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '6'}">
							      			<c:out value="${reporteGradoEstudioSinLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioConLicenciatura}" var="reporteGradoEstudioConLicenciatura">
							      		<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '6'}">
							      			<c:out value="${reporteGradoEstudioConLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente0}" var="reporteExperienciaDocente0">
							      		<c:if test="${reporteExperienciaDocente0.descNombramiento == '6'}">
							      			<c:out value="${reporteExperienciaDocente0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente1A4}" var="reporteExperienciaDocente1A4">
							      		<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '6'}">
							      			<c:out value="${reporteExperienciaDocente1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '6'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      </tr>
						      <tr class="separador-normal fila-separadora">
						      	<td></td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB1" value="${0}"/>
									<c:forEach var="reporteTSUHombres" items="${reporteTSUHombres}">
										<c:if test="${reporteTSUHombres.descNombramiento == '4'}"> <c:set var="grupoB1" value="${grupoB1 + reporteTSUHombres.total}" /></c:if>
										<c:if test="${reporteTSUHombres.descNombramiento == '5'}"> <c:set var="grupoB1" value="${grupoB1 + reporteTSUHombres.total}" /></c:if>
										<c:if test="${reporteTSUHombres.descNombramiento == '6'}"> <c:set var="grupoB1" value="${grupoB1 + reporteTSUHombres.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB1}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB2" value="${0}"/>
									<c:forEach var="reporteTSUMujeres" items="${reporteTSUMujeres}">
										<c:if test="${reporteTSUMujeres.descNombramiento == '4'}"> <c:set var="grupoB2" value="${grupoB2 + reporteTSUMujeres.total}" /></c:if>
										<c:if test="${reporteTSUMujeres.descNombramiento == '5'}"> <c:set var="grupoB2" value="${grupoB2 + reporteTSUMujeres.total}" /></c:if>
										<c:if test="${reporteTSUMujeres.descNombramiento == '6'}"> <c:set var="grupoB2" value="${grupoB2 + reporteTSUMujeres.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB2}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB3" value="${0}"/>
									<c:forEach var="reporteTSUHombresMujeresTotal" items="${reporteTSUHombresMujeresTotal}">
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '4'}"> <c:set var="grupoB3" value="${grupoB3 + reporteTSUHombresMujeresTotal.total}" /></c:if>
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '5'}"> <c:set var="grupoB3" value="${grupoB3 + reporteTSUHombresMujeresTotal.total}" /></c:if>
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '6'}"> <c:set var="grupoB3" value="${grupoB3 + reporteTSUHombresMujeresTotal.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB3}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB5" value="${0}"/>
									<c:forEach var="reporteTSUHombresMujeresTotal" items="${reporteTSUHombresMujeresTotal}">
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '4'}"> <c:set var="grupoB5" value="${grupoB5 + reporteTSUHombresMujeresTotal.total}" /></c:if>
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '5'}"> <c:set var="grupoB5" value="${grupoB5 + reporteTSUHombresMujeresTotal.total}" /></c:if>
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '6'}"> <c:set var="grupoB5" value="${grupoB5 + reporteTSUHombresMujeresTotal.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB5*40}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB4" value="${0}"/>
									<c:forEach var="reporteTSUTotalHoras" items="${reporteTSUTotalHoras}">
										<c:if test="${reporteTSUTotalHoras.descNombramiento == '4'}"> <c:set var="grupoB4" value="${grupoB4 + reporteTSUTotalHoras.total}" /></c:if>
										<c:if test="${reporteTSUTotalHoras.descNombramiento == '5'}"> <c:set var="grupoB4" value="${grupoB4 + reporteTSUTotalHoras.total}" /></c:if>
										<c:if test="${reporteTSUTotalHoras.descNombramiento == '6'}"> <c:set var="grupoB4" value="${grupoB4 + reporteTSUTotalHoras.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB4}"/>
						      	</td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      </tr>
						   
						   	
						   	<tr class="separador-normal">
						      	<td rowspan="4">TÈCNICOS ACADÈMICOS</td>
						      	<td>A</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombres}" var="reporteTSUHombres">
										<c:if test="${reporteTSUHombres.descNombramiento == '8'}">
											<c:out value="${reporteTSUHombres.total}"/>
										</c:if>
									</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUMujeres}" var="reporteTSUMujeres">
							      		<c:if test="${reporteTSUMujeres.descNombramiento == '8'}">
							      			<c:out value="${reporteTSUMujeres.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '8'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '8'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total*40}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUTotalHoras}" var="reporteTSUTotalHoras">
							      		<c:if test="${reporteTSUTotalHoras.descNombramiento == '8'}">
							      			<c:out value="${reporteTSUTotalHoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTSU}" var="reporteGradoEstudioTSU">
							      		<c:if test="${reporteGradoEstudioTSU.descNombramiento == '8'}">
							      			<c:out value="${reporteGradoEstudioTSU.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioSinLicenciatura}" var="reporteGradoEstudioSinLicenciatura">
							      		<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '8'}">
							      			<c:out value="${reporteGradoEstudioSinLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioConLicenciatura}" var="reporteGradoEstudioConLicenciatura">
							      		<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '8'}">
							      			<c:out value="${reporteGradoEstudioConLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente0}" var="reporteExperienciaDocente0">
							      		<c:if test="${reporteExperienciaDocente0.descNombramiento == '8'}">
							      			<c:out value="${reporteExperienciaDocente0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente1A4}" var="reporteExperienciaDocente1A4">
							      		<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '8'}">
							      			<c:out value="${reporteExperienciaDocente1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '8'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      </tr>
						      <tr class="separador-normal">
						      	<td>B</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombres}" var="reporteTSUHombres">
										<c:if test="${reporteTSUHombres.descNombramiento == '9'}">
											<c:out value="${reporteTSUHombres.total}"/>
										</c:if>
									</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUMujeres}" var="reporteTSUMujeres">
							      		<c:if test="${reporteTSUMujeres.descNombramiento == '9'}">
							      			<c:out value="${reporteTSUMujeres.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '9'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '9'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total*40}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUTotalHoras}" var="reporteTSUTotalHoras">
							      		<c:if test="${reporteTSUTotalHoras.descNombramiento == '9'}">
							      			<c:out value="${reporteTSUTotalHoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTSU}" var="reporteGradoEstudioTSU">
							      		<c:if test="${reporteGradoEstudioTSU.descNombramiento == '9'}">
							      			<c:out value="${reporteGradoEstudioTSU.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioSinLicenciatura}" var="reporteGradoEstudioSinLicenciatura">
							      		<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '9'}">
							      			<c:out value="${reporteGradoEstudioSinLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioConLicenciatura}" var="reporteGradoEstudioConLicenciatura">
							      		<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '9'}">
							      			<c:out value="${reporteGradoEstudioConLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente0}" var="reporteExperienciaDocente0">
							      		<c:if test="${reporteExperienciaDocente0.descNombramiento == '9'}">
							      			<c:out value="${reporteExperienciaDocente0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente1A4}" var="reporteExperienciaDocente1A4">
							      		<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '9'}">
							      			<c:out value="${reporteExperienciaDocente1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '9'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      </tr>
						      <tr class="separador-normal">
						      	<td>C</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombres}" var="reporteTSUHombres">
										<c:if test="${reporteTSUHombres.descNombramiento == '10'}">
											<c:out value="${reporteTSUHombres.total}"/>
										</c:if>
									</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUMujeres}" var="reporteTSUMujeres">
							      		<c:if test="${reporteTSUMujeres.descNombramiento == '10'}">
							      			<c:out value="${reporteTSUMujeres.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '10'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '10'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total*40}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUTotalHoras}" var="reporteTSUTotalHoras">
							      		<c:if test="${reporteTSUTotalHoras.descNombramiento == '10'}">
							      			<c:out value="${reporteTSUTotalHoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTSU}" var="reporteGradoEstudioTSU">
							      		<c:if test="${reporteGradoEstudioTSU.descNombramiento == '10'}">
							      			<c:out value="${reporteGradoEstudioTSU.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioSinLicenciatura}" var="reporteGradoEstudioSinLicenciatura">
							      		<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '10'}">
							      			<c:out value="${reporteGradoEstudioSinLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioConLicenciatura}" var="reporteGradoEstudioConLicenciatura">
							      		<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '10'}">
							      			<c:out value="${reporteGradoEstudioConLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente0}" var="reporteExperienciaDocente0">
							      		<c:if test="${reporteExperienciaDocente0.descNombramiento == '10'}">
							      			<c:out value="${reporteExperienciaDocente0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente1A4}" var="reporteExperienciaDocente1A4">
							      		<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '10'}">
							      			<c:out value="${reporteExperienciaDocente1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '10'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      </tr>
						      <tr class="separador-normal fila-separadora">
						      	<td></td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC1" value="${0}"/>
									<c:forEach var="reporteTSUHombres" items="${reporteTSUHombres}">
										<c:if test="${reporteTSUHombres.descNombramiento == '8'}"> <c:set var="grupoC1" value="${grupoC1 + reporteTSUHombres.total}" /></c:if>
										<c:if test="${reporteTSUHombres.descNombramiento == '9'}"> <c:set var="grupoC1" value="${grupoC1 + reporteTSUHombres.total}" /></c:if>
										<c:if test="${reporteTSUHombres.descNombramiento == '10'}"> <c:set var="grupoC1" value="${grupoC1 + reporteTSUHombres.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC1}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC2" value="${0}"/>
									<c:forEach var="reporteTSUMujeres" items="${reporteTSUMujeres}">
										<c:if test="${reporteTSUMujeres.descNombramiento == '8'}"> <c:set var="grupoC2" value="${grupoC2 + reporteTSUMujeres.total}" /></c:if>
										<c:if test="${reporteTSUMujeres.descNombramiento == '9'}"> <c:set var="grupoC2" value="${grupoC2 + reporteTSUMujeres.total}" /></c:if>
										<c:if test="${reporteTSUMujeres.descNombramiento == '10'}"> <c:set var="grupoC2" value="${grupoC2 + reporteTSUMujeres.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC2}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC3" value="${0}"/>
									<c:forEach var="reporteTSUHombresMujeresTotal" items="${reporteTSUHombresMujeresTotal}">
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '8'}"> <c:set var="grupoC3" value="${grupoC3 + reporteTSUHombresMujeresTotal.total}" /></c:if>
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '9'}"> <c:set var="grupoC3" value="${grupoC3 + reporteTSUHombresMujeresTotal.total}" /></c:if>
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '10'}"> <c:set var="grupoC3" value="${grupoC3 + reporteTSUHombresMujeresTotal.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC3}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC5" value="${0}"/>
									<c:forEach var="reporteTSUHombresMujeresTotal" items="${reporteTSUHombresMujeresTotal}">
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '8'}"> <c:set var="grupoC5" value="${grupoC5 + reporteTSUHombresMujeresTotal.total}" /></c:if>
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '9'}"> <c:set var="grupoC5" value="${grupoC5 + reporteTSUHombresMujeresTotal.total}" /></c:if>
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '10'}"> <c:set var="grupoC5" value="${grupoC5 + reporteTSUHombresMujeresTotal.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC5*40}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC4" value="${0}"/>
									<c:forEach var="reporteTSUTotalHoras" items="${reporteTSUTotalHoras}">
										<c:if test="${reporteTSUTotalHoras.descNombramiento == '8'}"> <c:set var="grupoC4" value="${grupoC4 + reporteTSUTotalHoras.total}" /></c:if>
										<c:if test="${reporteTSUTotalHoras.descNombramiento == '9'}"> <c:set var="grupoC4" value="${grupoC4 + reporteTSUTotalHoras.total}" /></c:if>
										<c:if test="${reporteTSUTotalHoras.descNombramiento == '10'}"> <c:set var="grupoC4" value="${grupoC4 + reporteTSUTotalHoras.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC4}"/>
						      	</td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      </tr>
						      
						      
						      
						      <tr class="separador-normal">
						      	<td rowspan="2">PA</td>
						      	<td>B</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombres}" var="reporteTSUHombres">
										<c:if test="${reporteTSUHombres.descNombramiento == '7'}">
											<c:out value="${reporteTSUHombres.total}"/>
										</c:if>
									</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUMujeres}" var="reporteTSUMujeres">
							      		<c:if test="${reporteTSUMujeres.descNombramiento == '7'}">
							      			<c:out value="${reporteTSUMujeres.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '7'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUHombresMujeresTotal}" var="reporteTSUHombresMujeresTotal">
							      		<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '7'}">
							      			<c:out value="${reporteTSUHombresMujeresTotal.total*40}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteTSUTotalHoras}" var="reporteTSUTotalHoras">
							      		<c:if test="${reporteTSUTotalHoras.descNombramiento == '7'}">
							      			<c:out value="${reporteTSUTotalHoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTSU}" var="reporteGradoEstudioTSU">
							      		<c:if test="${reporteGradoEstudioTSU.descNombramiento == '7'}">
							      			<c:out value="${reporteGradoEstudioTSU.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioSinLicenciatura}" var="reporteGradoEstudioSinLicenciatura">
							      		<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '7'}">
							      			<c:out value="${reporteGradoEstudioSinLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioConLicenciatura}" var="reporteGradoEstudioConLicenciatura">
							      		<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '7'}">
							      			<c:out value="${reporteGradoEstudioConLicenciatura.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente0}" var="reporteExperienciaDocente0">
							      		<c:if test="${reporteExperienciaDocente0.descNombramiento == '7'}">
							      			<c:out value="${reporteExperienciaDocente0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente1A4}" var="reporteExperienciaDocente1A4">
							      		<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '7'}">
							      			<c:out value="${reporteExperienciaDocente1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '7'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      </tr>
						      <tr class="separador-normal fila-separadora">
						      	<td></td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD1" value="${0}"/>
									<c:forEach var="reporteTSUHombres" items="${reporteTSUHombres}">
										<c:if test="${reporteTSUHombres.descNombramiento == '7'}"> <c:set var="grupoD1" value="${grupoD1 + reporteTSUHombres.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD1}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD2" value="${0}"/>
									<c:forEach var="reporteTSUMujeres" items="${reporteTSUMujeres}">
										<c:if test="${reporteTSUMujeres.descNombramiento == '7'}"> <c:set var="grupoD2" value="${grupoD2 + reporteTSUMujeres.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD2}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD3" value="${0}"/>
									<c:forEach var="reporteTSUHombresMujeresTotal" items="${reporteTSUHombresMujeresTotal}">
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '7'}"> <c:set var="grupoD3" value="${grupoD3 + reporteTSUHombresMujeresTotal.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD3}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD5" value="${0}"/>
									<c:forEach var="reporteTSUHombresMujeresTotal" items="${reporteTSUHombresMujeresTotal}">
										<c:if test="${reporteTSUHombresMujeresTotal.descNombramiento == '7'}"> <c:set var="grupoD5" value="${grupoD5 + reporteTSUHombresMujeresTotal.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD5*40}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD4" value="${0}"/>
									<c:forEach var="reporteTSUTotalHoras" items="${reporteTSUTotalHoras}">
										<c:if test="${reporteTSUTotalHoras.descNombramiento == '7'}"> <c:set var="grupoD4" value="${grupoD4 + reporteTSUTotalHoras.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD4}"/>
						      	</td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      </tr>
						      
						      
						      <tr class="separador-normal fila-separadora">
						      	<td class="fila-totales">TOTAL</td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal1" value="${0}"/>
									<c:forEach var="reporteTSUHombres" items="${reporteTSUHombres}">
										<c:set var="grupoTotal1" value="${grupoTotal1 + reporteTSUHombres.total}" />
									</c:forEach>
									<c:out value="${grupoTotal1}"/>
						      	</td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal2" value="${0}"/>
									<c:forEach var="reporteTSUMujeres" items="${reporteTSUMujeres}">
										<c:set var="grupoTotal2" value="${grupoTotal2 + reporteTSUMujeres.total}" />
									</c:forEach>
									<c:out value="${grupoTotal2}"/>
						      	</td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal3" value="${0}"/>
									<c:forEach var="reporteTSUHombresMujeresTotal" items="${reporteTSUHombresMujeresTotal}">
										<c:set var="grupoTotal3" value="${grupoTotal3 + reporteTSUHombresMujeresTotal.total}" />
									</c:forEach>
									<c:out value="${grupoTotal3}"/>
						      	</td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal5" value="${0}"/>
									<c:forEach var="reporteTSUHombresMujeresTotal" items="${reporteTSUHombresMujeresTotal}">
										<c:set var="grupoTotal5" value="${grupoTotal5 + reporteTSUHombresMujeresTotal.total}" />
									</c:forEach>
									<c:out value="${grupoTotal5*40}"/>
						      	</td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal4" value="${0}"/>
									<c:forEach var="reporteTSUTotalHoras" items="${reporteTSUTotalHoras}">
										<c:set var="grupoTotal4" value="${grupoTotal4 + reporteTSUTotalHoras.total}" />
									</c:forEach>
									<c:out value="${grupoTotal4}"/>
						      	</td>
						      	<td class="fila-totales-final"></td>
						      	<td class="fila-totales-final"></td>
						      	<td class="fila-totales-final"></td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal9" value="${0}"/>
									<c:forEach var="reporteGradoEstudioTSU" items="${reporteGradoEstudioTSU}">
										<c:set var="grupoTotal9" value="${grupoTotal9 + reporteGradoEstudioTSU.total}" />
									</c:forEach>
									<c:out value="${grupoTotal9}"/>
						      	</td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal10" value="${0}"/>
									<c:forEach var="reporteGradoEstudioSinLicenciatura" items="${reporteGradoEstudioSinLicenciatura}">
										<c:set var="grupoTotal10" value="${grupoTotal10 + reporteGradoEstudioSinLicenciatura.total}" />
									</c:forEach>
									<c:out value="${grupoTotal10}"/>
						      	</td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal11" value="${0}"/>
									<c:forEach var="reporteGradoEstudioConLicenciatura" items="${reporteGradoEstudioConLicenciatura}">
										<c:set var="grupoTotal11" value="${grupoTotal11 + reporteGradoEstudioConLicenciatura.total}" />
									</c:forEach>
									<c:out value="${grupoTotal11}"/>
						      	</td>
						      	<td class="fila-totales-final"></td>
						      	<td class="fila-totales-final"></td>
						      	<td class="fila-totales-final"></td>
						      	<td class="fila-totales-final"></td>
						      	<td class="fila-totales-final"></td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal17" value="${0}"/>
									<c:forEach var="reporteExperienciaDocente0" items="${reporteExperienciaDocente0}">
										<c:set var="grupoTotal17" value="${grupoTotal17 + reporteExperienciaDocente0.total}" />
									</c:forEach>
									<c:out value="${grupoTotal17}"/>
						      	</td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal18" value="${0}"/>
									<c:forEach var="reporteExperienciaDocente1A4" items="${reporteExperienciaDocente1A4}">
										<c:set var="grupoTotal18" value="${grupoTotal18 + reporteExperienciaDocente1A4.total}" />
									</c:forEach>
									<c:out value="${grupoTotal18}"/>
						      	</td>
						      	<td class="fila-totales-final"></td>
						      	<td class="fila-totales-final"></td>
						      	<td class="fila-totales-final"></td>
						      	<td class="fila-totales-final"></td>
						      	<td class="fila-totales-final"></td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal24" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboralMayorA10" items="${reporteExperienciaLaboralMayorA10}">
										<c:set var="grupoTotal24" value="${grupoTotal24 + reporteExperienciaLaboralMayorA10.total}" />
									</c:forEach>
									<c:out value="${grupoTotal24}"/>
						      	</td>
						      	<td class="fila-totales-final"></td>
						      	<td class="fila-totales-final"></td>
						      	<td class="fila-totales-final"></td>
						      	<td class="fila-totales-final"></td>
						      </tr>
						      
	              			</tbody>
						</table>
						
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
	
</t:SecretariaLayout>