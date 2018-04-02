<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<t:DirectivoLayout>
	<jsp:attribute name="viewtitlename">
     	<title>Directivo - Reportes</title>
    </jsp:attribute>

	<jsp:attribute name="viewuserrol">
     	Directivo
    </jsp:attribute>

	<jsp:attribute name="viewtitleseccion">
     	Reportes
    </jsp:attribute>

	<jsp:attribute name="extracss"> </jsp:attribute>

	<jsp:attribute name="extrajs">
	
		<script src='<c:url value="assets/js/print-this/printThis.js"></c:url>'></script>
		
		<script>
		$(document).ready(function() {
			
			$(".btn-imprimir-reporte-1").click(function() {
				$('.imprimir-reporte-1').printThis({
					importCSS: false,
				    importStyle: "<style>table {border-collapse: collapse;} table, th, td {border: 1px solid black;}</style>",
					header: "<h1>REPORTE HORAS</h1>"
				});
			});
			
			$(".btn-imprimir-reporte-2").click(function() {
				$('.imprimir-reporte-2').printThis({
					importCSS: false,
				    importStyle: "<style>table {border-collapse: collapse;} table, th, td {border: 1px solid black;}</style>",
					header: "<h1>REPORTE GENERAL DE DOCENTES</h1>"
				});
			});
		});
		</script>
	
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
		    	<a href="#reporte2-tab-x" role="tab" id="tab-reporte2" data-toggle="tab" aria-controls="direc-tab-x" aria-expanded="false">R. General</a>
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
	               		<table class="table table-bordered imprimir-reporte-1">
	               		
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
						
						<button class="btn btn-primary btn-sm btn-imprimir-reporte-1">Imprimir reporte</button>
		               </div>
		           </div>
		           </div>
			</div>
			
			
			<div role="tabpanel" class="tab-pane" id="reporte2-tab-x">
				<div class="card">
	               	<div class="header">
	                   <p class="category">REPORTE GENERAL - <button class="btn btn-primary btn-sm btn-imprimir-reporte-2">Imprimir reporte</button></p>
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
	              		<table class="table table-bordered imprimir-reporte-2">
	               		
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
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTeacher}" var="reporteGradoEstudioTeacher">
							      		<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '1'}">
							      			<c:out value="${reporteGradoEstudioTeacher.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioEspecialidad}" var="reporteGradoEstudioEspecialidad">
								      		<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '1'}">
								      			<c:out value="${reporteGradoEstudioEspecialidad.total}"/>
								      		</c:if>
							      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinMastria}" var="reporteGradoEstudioSinMastria">
									      		<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '1'}">
									      			<c:out value="${reporteGradoEstudioSinMastria.total}"/>
									      		</c:if>
								      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConMastria}" var="reporteGradoEstudioConMastria">
										      		<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '1'}">
										      			<c:out value="${reporteGradoEstudioConMastria.total}"/>
										      		</c:if>
									      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinDoctorado}" var="reporteGradoEstudioSinDoctorado">
											      		<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '1'}">
											      			<c:out value="${reporteGradoEstudioSinDoctorado.total}"/>
											      		</c:if>
										      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConDoctorado}" var="reporteGradoEstudioConDoctorado">
												      		<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '1'}">
												      			<c:out value="${reporteGradoEstudioConDoctorado.total}"/>
												      		</c:if>
											      		</c:forEach>
						      	</td>
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
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente5A10}" var="reporteExperienciaDocente5A10">
							      		<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '1'}">
							      			<c:out value="${reporteExperienciaDocente5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocenteMayorA10}" var="reporteExperienciaDocenteMayorA10">
							      		<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '1'}">
							      			<c:out value="${reporteExperienciaDocenteMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral0}" var="reporteExperienciaLaboral0">
							      		<c:if test="${reporteExperienciaLaboral0.descNombramiento == '1'}">
							      			<c:out value="${reporteExperienciaLaboral0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral1A4}" var="reporteExperienciaLaboral1A4">
							      		<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '1'}">
							      			<c:out value="${reporteExperienciaLaboral1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral5A10}" var="reporteExperienciaLaboral5A10">
							      		<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '1'}">
							      			<c:out value="${reporteExperienciaLaboral5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '1'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteParticipaEnCA}" var="reporteDocenteParticipaEnCA">
							      		<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '1'}">
							      			<c:out value="${reporteDocenteParticipaEnCA.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocentePerteneceEnLineasInnovadoras}" var="reporteDocentePerteneceEnLineasInnovadoras">
							      		<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '1'}">
							      			<c:out value="${reporteDocentePerteneceEnLineasInnovadoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      		<td>
						      		<c:forEach items="${reporteDocenteCuentaConPTC}" var="reporteDocenteCuentaConPTC">
							      		<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '1'}">
							      			<c:out value="${reporteDocenteCuentaConPTC.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteCuentaConPROMEP}" var="reporteDocenteCuentaConPROMEP">
							      		<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '1'}">
							      			<c:out value="${reporteDocenteCuentaConPROMEP.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTeacher}" var="reporteGradoEstudioTeacher">
							      		<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '2'}">
							      			<c:out value="${reporteGradoEstudioTeacher.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioEspecialidad}" var="reporteGradoEstudioEspecialidad">
							      		<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '2'}">
							      			<c:out value="${reporteGradoEstudioEspecialidad.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinMastria}" var="reporteGradoEstudioSinMastria">
							      		<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '2'}">
							      			<c:out value="${reporteGradoEstudioSinMastria.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConMastria}" var="reporteGradoEstudioConMastria">
							      		<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '2'}">
							      			<c:out value="${reporteGradoEstudioConMastria.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinDoctorado}" var="reporteGradoEstudioSinDoctorado">
							      		<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '2'}">
							      			<c:out value="${reporteGradoEstudioSinDoctorado.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConDoctorado}" var="reporteGradoEstudioConDoctorado">
							      		<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '2'}">
							      			<c:out value="${reporteGradoEstudioConDoctorado.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente5A10}" var="reporteExperienciaDocente5A10">
							      		<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '2'}">
							      			<c:out value="${reporteExperienciaDocente5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocenteMayorA10}" var="reporteExperienciaDocenteMayorA10">
							      		<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '2'}">
							      			<c:out value="${reporteExperienciaDocenteMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral0}" var="reporteExperienciaLaboral0">
							      		<c:if test="${reporteExperienciaLaboral0.descNombramiento == '2'}">
							      			<c:out value="${reporteExperienciaLaboral0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral1A4}" var="reporteExperienciaLaboral1A4">
							      		<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '2'}">
							      			<c:out value="${reporteExperienciaLaboral1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral5A10}" var="reporteExperienciaLaboral5A10">
							      		<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '2'}">
							      			<c:out value="${reporteExperienciaLaboral5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '2'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteParticipaEnCA}" var="reporteDocenteParticipaEnCA">
							      		<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '2'}">
							      			<c:out value="${reporteDocenteParticipaEnCA.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocentePerteneceEnLineasInnovadoras}" var="reporteDocentePerteneceEnLineasInnovadoras">
							      		<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '2'}">
							      			<c:out value="${reporteDocentePerteneceEnLineasInnovadoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      		<td>
						      		<c:forEach items="${reporteDocenteCuentaConPTC}" var="reporteDocenteCuentaConPTC">
							      		<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '2'}">
							      			<c:out value="${reporteDocenteCuentaConPTC.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteCuentaConPROMEP}" var="reporteDocenteCuentaConPROMEP">
							      		<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '2'}">
							      			<c:out value="${reporteDocenteCuentaConPROMEP.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTeacher}" var="reporteGradoEstudioTeacher">
							      		<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '3'}">
							      			<c:out value="${reporteGradoEstudioTeacher.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioEspecialidad}" var="reporteGradoEstudioEspecialidad">
							      		<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '3'}">
							      			<c:out value="${reporteGradoEstudioEspecialidad.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinMastria}" var="reporteGradoEstudioSinMastria">
							      		<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '3'}">
							      			<c:out value="${reporteGradoEstudioSinMastria.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConMastria}" var="reporteGradoEstudioConMastria">
							      		<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '3'}">
							      			<c:out value="${reporteGradoEstudioConMastria.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinDoctorado}" var="reporteGradoEstudioSinDoctorado">
							      		<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '3'}">
							      			<c:out value="${reporteGradoEstudioSinDoctorado.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConDoctorado}" var="reporteGradoEstudioConDoctorado">
							      		<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '3'}">
							      			<c:out value="${reporteGradoEstudioConDoctorado.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente5A10}" var="reporteExperienciaDocente5A10">
							      		<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '3'}">
							      			<c:out value="${reporteExperienciaDocente5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocenteMayorA10}" var="reporteExperienciaDocenteMayorA10">
							      		<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '3'}">
							      			<c:out value="${reporteExperienciaDocenteMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral0}" var="reporteExperienciaLaboral0">
							      		<c:if test="${reporteExperienciaLaboral0.descNombramiento == '3'}">
							      			<c:out value="${reporteExperienciaLaboral0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral1A4}" var="reporteExperienciaLaboral1A4">
							      		<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '3'}">
							      			<c:out value="${reporteExperienciaLaboral1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral5A10}" var="reporteExperienciaLaboral5A10">
							      		<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '3'}">
							      			<c:out value="${reporteExperienciaLaboral5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '3'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteParticipaEnCA}" var="reporteDocenteParticipaEnCA">
							      		<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '3'}">
							      			<c:out value="${reporteDocenteParticipaEnCA.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocentePerteneceEnLineasInnovadoras}" var="reporteDocentePerteneceEnLineasInnovadoras">
							      		<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '3'}">
							      			<c:out value="${reporteDocentePerteneceEnLineasInnovadoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      		<td>
						      		<c:forEach items="${reporteDocenteCuentaConPTC}" var="reporteDocenteCuentaConPTC">
							      		<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '3'}">
							      			<c:out value="${reporteDocenteCuentaConPTC.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteCuentaConPROMEP}" var="reporteDocenteCuentaConPROMEP">
							      		<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '3'}">
							      			<c:out value="${reporteDocenteCuentaConPROMEP.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td class="fila-totales">
						      		<c:set var="grupoA7" value="${0}"/>
									<c:forEach var="reporteGradoEstudioTeacher" items="${reporteGradoEstudioTeacher}">
										<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '1'}"> <c:set var="grupoA7" value="${grupoA7 + reporteGradoEstudioTeacher.total}" /></c:if>
										<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '2'}"> <c:set var="grupoA7" value="${grupoA7 + reporteGradoEstudioTeacher.total}" /></c:if>
										<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '3'}"> <c:set var="grupoA7" value="${grupoA7 + reporteGradoEstudioTeacher.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA7}"/>
						      	</td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA9" value="${0}"/>
									<c:forEach var="reporteGradoEstudioTSU" items="${reporteGradoEstudioTSU}">
										<c:if test="${reporteGradoEstudioTSU.descNombramiento == '1'}"> <c:set var="grupoA9" value="${grupoA9 + reporteGradoEstudioTSU.total}" /></c:if>
										<c:if test="${reporteGradoEstudioTSU.descNombramiento == '2'}"> <c:set var="grupoA9" value="${grupoA9 + reporteGradoEstudioTSU.total}" /></c:if>
										<c:if test="${reporteGradoEstudioTSU.descNombramiento == '3'}"> <c:set var="grupoA9" value="${grupoA9 + reporteGradoEstudioTSU.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA9}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA10" value="${0}"/>
									<c:forEach var="reporteGradoEstudioSinLicenciatura" items="${reporteGradoEstudioSinLicenciatura}">
										<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '1'}"> <c:set var="grupoA10" value="${grupoA10 + reporteGradoEstudioSinLicenciatura.total}" /></c:if>
										<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '2'}"> <c:set var="grupoA10" value="${grupoA10 + reporteGradoEstudioSinLicenciatura.total}" /></c:if>
										<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '3'}"> <c:set var="grupoA10" value="${grupoA10 + reporteGradoEstudioSinLicenciatura.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA10}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA11" value="${0}"/>
									<c:forEach var="reporteGradoEstudioConLicenciatura" items="${reporteGradoEstudioConLicenciatura}">
										<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '1'}"> <c:set var="grupoA11" value="${grupoA11 + reporteGradoEstudioConLicenciatura.total}" /></c:if>
										<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '2'}"> <c:set var="grupoA11" value="${grupoA11 + reporteGradoEstudioConLicenciatura.total}" /></c:if>
										<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '3'}"> <c:set var="grupoA11" value="${grupoA11 + reporteGradoEstudioConLicenciatura.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA11}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA12" value="${0}"/>
									<c:forEach var="reporteGradoEstudioEspecialidad" items="${reporteGradoEstudioEspecialidad}">
										<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '1'}"> <c:set var="grupoA12" value="${grupoA12 + reporteGradoEstudioEspecialidad.total}" /></c:if>
										<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '2'}"> <c:set var="grupoA12" value="${grupoA12 + reporteGradoEstudioEspecialidad.total}" /></c:if>
										<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '3'}"> <c:set var="grupoA12" value="${grupoA12 + reporteGradoEstudioEspecialidad.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA12}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA13" value="${0}"/>
									<c:forEach var="reporteGradoEstudioSinMastria" items="${reporteGradoEstudioSinMastria}">
										<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '1'}"> <c:set var="grupoA13" value="${grupoA13 + reporteGradoEstudioSinMastria.total}" /></c:if>
										<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '2'}"> <c:set var="grupoA13" value="${grupoA13 + reporteGradoEstudioSinMastria.total}" /></c:if>
										<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '3'}"> <c:set var="grupoA13" value="${grupoA13 + reporteGradoEstudioSinMastria.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA13}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA14" value="${0}"/>
									<c:forEach var="reporteGradoEstudioConMastria" items="${reporteGradoEstudioConMastria}">
										<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '1'}"> <c:set var="grupoA14" value="${grupoA14 + reporteGradoEstudioConMastria.total}" /></c:if>
										<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '2'}"> <c:set var="grupoA14" value="${grupoA14 + reporteGradoEstudioConMastria.total}" /></c:if>
										<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '3'}"> <c:set var="grupoA14" value="${grupoA14 + reporteGradoEstudioConMastria.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA14}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA15" value="${0}"/>
									<c:forEach var="reporteGradoEstudioSinDoctorado" items="${reporteGradoEstudioSinDoctorado}">
										<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '1'}"> <c:set var="grupoA15" value="${grupoA15 + reporteGradoEstudioSinDoctorado.total}" /></c:if>
										<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '2'}"> <c:set var="grupoA15" value="${grupoA15 + reporteGradoEstudioSinDoctorado.total}" /></c:if>
										<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '3'}"> <c:set var="grupoA15" value="${grupoA15 + reporteGradoEstudioSinDoctorado.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA15}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA16" value="${0}"/>
									<c:forEach var="reporteGradoEstudioConDoctorado" items="${reporteGradoEstudioConDoctorado}">
										<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '1'}"> <c:set var="grupoA16" value="${grupoA16 + reporteGradoEstudioConDoctorado.total}" /></c:if>
										<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '2'}"> <c:set var="grupoA16" value="${grupoA16 + reporteGradoEstudioConDoctorado.total}" /></c:if>
										<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '3'}"> <c:set var="grupoA16" value="${grupoA16 + reporteGradoEstudioConDoctorado.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA16}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA17" value="${0}"/>
									<c:forEach var="reporteExperienciaDocente0" items="${reporteExperienciaDocente0}">
										<c:if test="${reporteExperienciaDocente0.descNombramiento == '1'}"> <c:set var="grupoA17" value="${grupoA17 + reporteExperienciaDocente0.total}" /></c:if>
										<c:if test="${reporteExperienciaDocente0.descNombramiento == '2'}"> <c:set var="grupoA17" value="${grupoA17 + reporteExperienciaDocente0.total}" /></c:if>
										<c:if test="${reporteExperienciaDocente0.descNombramiento == '3'}"> <c:set var="grupoA17" value="${grupoA17 + reporteExperienciaDocente0.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA17}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA18" value="${0}"/>
									<c:forEach var="reporteExperienciaDocente1A4" items="${reporteExperienciaDocente1A4}">
										<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '1'}"> <c:set var="grupoA18" value="${grupoA18 + reporteExperienciaDocente1A4.total}" /></c:if>
										<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '2'}"> <c:set var="grupoA18" value="${grupoA18 + reporteExperienciaDocente1A4.total}" /></c:if>
										<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '3'}"> <c:set var="grupoA18" value="${grupoA18 + reporteExperienciaDocente1A4.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA18}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA19" value="${0}"/>
									<c:forEach var="reporteExperienciaDocente5A10" items="${reporteExperienciaDocente5A10}">
										<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '1'}"> <c:set var="grupoA19" value="${grupoA19 + reporteExperienciaDocente5A10.total}" /></c:if>
										<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '2'}"> <c:set var="grupoA19" value="${grupoA19 + reporteExperienciaDocente5A10.total}" /></c:if>
										<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '3'}"> <c:set var="grupoA19" value="${grupoA19 + reporteExperienciaDocente5A10.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA19}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA20" value="${0}"/>
									<c:forEach var="reporteExperienciaDocenteMayorA10" items="${reporteExperienciaDocenteMayorA10}">
										<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '1'}"> <c:set var="grupoA20" value="${grupoA20 + reporteExperienciaDocenteMayorA10.total}" /></c:if>
										<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '2'}"> <c:set var="grupoA20" value="${grupoA20 + reporteExperienciaDocenteMayorA10.total}" /></c:if>
										<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '3'}"> <c:set var="grupoA20" value="${grupoA20 + reporteExperienciaDocenteMayorA10.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA20}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA21" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboral0" items="${reporteExperienciaLaboral0}">
										<c:if test="${reporteExperienciaLaboral0.descNombramiento == '1'}"> <c:set var="grupoA21" value="${grupoA21 + reporteExperienciaLaboral0.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboral0.descNombramiento == '2'}"> <c:set var="grupoA21" value="${grupoA21 + reporteExperienciaLaboral0.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboral0.descNombramiento == '3'}"> <c:set var="grupoA21" value="${grupoA21 + reporteExperienciaLaboral0.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA21}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA22" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboral1A4" items="${reporteExperienciaLaboral1A4}">
										<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '1'}"> <c:set var="grupoA22" value="${grupoA22 + reporteExperienciaLaboral1A4.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '2'}"> <c:set var="grupoA22" value="${grupoA22 + reporteExperienciaLaboral1A4.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '3'}"> <c:set var="grupoA22" value="${grupoA22 + reporteExperienciaLaboral1A4.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA22}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA23" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboral5A10" items="${reporteExperienciaLaboral5A10}">
										<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '1'}"> <c:set var="grupoA23" value="${grupoA23 + reporteExperienciaLaboral5A10.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '2'}"> <c:set var="grupoA23" value="${grupoA23 + reporteExperienciaLaboral5A10.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '3'}"> <c:set var="grupoA23" value="${grupoA23 + reporteExperienciaLaboral5A10.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA23}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA24" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboralMayorA10" items="${reporteExperienciaLaboralMayorA10}">
										<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '1'}"> <c:set var="grupoA24" value="${grupoA24 + reporteExperienciaLaboralMayorA10.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '2'}"> <c:set var="grupoA24" value="${grupoA24 + reporteExperienciaLaboralMayorA10.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '3'}"> <c:set var="grupoA24" value="${grupoA24 + reporteExperienciaLaboralMayorA10.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA24}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA25" value="${0}"/>
									<c:forEach var="reporteDocenteParticipaEnCA" items="${reporteDocenteParticipaEnCA}">
										<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '1'}"> <c:set var="grupoA25" value="${grupoA25 + reporteDocenteParticipaEnCA.total}" /></c:if>
										<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '2'}"> <c:set var="grupoA25" value="${grupoA25 + reporteDocenteParticipaEnCA.total}" /></c:if>
										<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '3'}"> <c:set var="grupoA25" value="${grupoA25 + reporteDocenteParticipaEnCA.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA25}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA26" value="${0}"/>
									<c:forEach var="reporteDocentePerteneceEnLineasInnovadoras" items="${reporteDocentePerteneceEnLineasInnovadoras}">
										<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '1'}"> <c:set var="grupoA26" value="${grupoA26 + reporteDocentePerteneceEnLineasInnovadoras.total}" /></c:if>
										<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '2'}"> <c:set var="grupoA26" value="${grupoA26 + reporteDocentePerteneceEnLineasInnovadoras.total}" /></c:if>
										<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '3'}"> <c:set var="grupoA26" value="${grupoA26 + reporteDocentePerteneceEnLineasInnovadoras.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA26}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA27" value="${0}"/>
									<c:forEach var="reporteDocenteCuentaConPTC" items="${reporteDocenteCuentaConPTC}">
										<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '1'}"> <c:set var="grupoA27" value="${grupoA27 + reporteDocenteCuentaConPTC.total}" /></c:if>
										<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '2'}"> <c:set var="grupoA27" value="${grupoA27 + reporteDocenteCuentaConPTC.total}" /></c:if>
										<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '3'}"> <c:set var="grupoA27" value="${grupoA27 + reporteDocenteCuentaConPTC.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA27}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoA28" value="${0}"/>
									<c:forEach var="reporteDocenteCuentaConPROMEP" items="${reporteDocenteCuentaConPROMEP}">
										<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '1'}"> <c:set var="grupoA28" value="${grupoA28 + reporteDocenteCuentaConPROMEP.total}" /></c:if>
										<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '2'}"> <c:set var="grupoA28" value="${grupoA28 + reporteDocenteCuentaConPROMEP.total}" /></c:if>
										<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '3'}"> <c:set var="grupoA28" value="${grupoA28 + reporteDocenteCuentaConPROMEP.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoA28}"/>
						      	</td>
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
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTeacher}" var="reporteGradoEstudioTeacher">
							      		<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '4'}">
							      			<c:out value="${reporteGradoEstudioTeacher.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioEspecialidad}" var="reporteGradoEstudioEspecialidad">
							      		<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '4'}">
							      			<c:out value="${reporteGradoEstudioEspecialidad.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinMastria}" var="reporteGradoEstudioSinMastria">
							      		<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '4'}">
							      			<c:out value="${reporteGradoEstudioSinMastria.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConMastria}" var="reporteGradoEstudioConMastria">
							      		<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '4'}">
							      			<c:out value="${reporteGradoEstudioConMastria.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinDoctorado}" var="reporteGradoEstudioSinDoctorado">
							      		<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '4'}">
							      			<c:out value="${reporteGradoEstudioSinDoctorado.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConDoctorado}" var="reporteGradoEstudioConDoctorado">
							      		<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '4'}">
							      			<c:out value="${reporteGradoEstudioConDoctorado.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente5A10}" var="reporteExperienciaDocente5A10">
							      		<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '4'}">
							      			<c:out value="${reporteExperienciaDocente5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocenteMayorA10}" var="reporteExperienciaDocenteMayorA10">
							      		<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '4'}">
							      			<c:out value="${reporteExperienciaDocenteMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral0}" var="reporteExperienciaLaboral0">
							      		<c:if test="${reporteExperienciaLaboral0.descNombramiento == '4'}">
							      			<c:out value="${reporteExperienciaLaboral0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral1A4}" var="reporteExperienciaLaboral1A4">
							      		<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '4'}">
							      			<c:out value="${reporteExperienciaLaboral1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral5A10}" var="reporteExperienciaLaboral5A10">
							      		<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '4'}">
							      			<c:out value="${reporteExperienciaLaboral5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '4'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteParticipaEnCA}" var="reporteDocenteParticipaEnCA">
							      		<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '4'}">
							      			<c:out value="${reporteDocenteParticipaEnCA.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocentePerteneceEnLineasInnovadoras}" var="reporteDocentePerteneceEnLineasInnovadoras">
							      		<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '4'}">
							      			<c:out value="${reporteDocentePerteneceEnLineasInnovadoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      		<td>
						      		<c:forEach items="${reporteDocenteCuentaConPTC}" var="reporteDocenteCuentaConPTC">
							      		<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '4'}">
							      			<c:out value="${reporteDocenteCuentaConPTC.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteCuentaConPROMEP}" var="reporteDocenteCuentaConPROMEP">
							      		<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '4'}">
							      			<c:out value="${reporteDocenteCuentaConPROMEP.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTeacher}" var="reporteGradoEstudioTeacher">
							      		<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '5'}">
							      			<c:out value="${reporteGradoEstudioTeacher.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioEspecialidad}" var="reporteGradoEstudioEspecialidad">
							      		<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '5'}">
							      			<c:out value="${reporteGradoEstudioEspecialidad.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinMastria}" var="reporteGradoEstudioSinMastria">
							      		<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '5'}">
							      			<c:out value="${reporteGradoEstudioSinMastria.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConMastria}" var="reporteGradoEstudioConMastria">
							      		<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '5'}">
							      			<c:out value="${reporteGradoEstudioConMastria.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinDoctorado}" var="reporteGradoEstudioSinDoctorado">
							      		<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '5'}">
							      			<c:out value="${reporteGradoEstudioSinDoctorado.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConDoctorado}" var="reporteGradoEstudioConDoctorado">
							      		<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '5'}">
							      			<c:out value="${reporteGradoEstudioConDoctorado.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente5A10}" var="reporteExperienciaDocente5A10">
							      		<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '5'}">
							      			<c:out value="${reporteExperienciaDocente5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocenteMayorA10}" var="reporteExperienciaDocenteMayorA10">
							      		<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '5'}">
							      			<c:out value="${reporteExperienciaDocenteMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral0}" var="reporteExperienciaLaboral0">
							      		<c:if test="${reporteExperienciaLaboral0.descNombramiento == '5'}">
							      			<c:out value="${reporteExperienciaLaboral0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral1A4}" var="reporteExperienciaLaboral1A4">
							      		<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '5'}">
							      			<c:out value="${reporteExperienciaLaboral1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral5A10}" var="reporteExperienciaLaboral5A10">
							      		<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '5'}">
							      			<c:out value="${reporteExperienciaLaboral5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '5'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteParticipaEnCA}" var="reporteDocenteParticipaEnCA">
							      		<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '5'}">
							      			<c:out value="${reporteDocenteParticipaEnCA.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocentePerteneceEnLineasInnovadoras}" var="reporteDocentePerteneceEnLineasInnovadoras">
							      		<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '5'}">
							      			<c:out value="${reporteDocentePerteneceEnLineasInnovadoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      		<td>
						      		<c:forEach items="${reporteDocenteCuentaConPTC}" var="reporteDocenteCuentaConPTC">
							      		<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '5'}">
							      			<c:out value="${reporteDocenteCuentaConPTC.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteCuentaConPROMEP}" var="reporteDocenteCuentaConPROMEP">
							      		<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '5'}">
							      			<c:out value="${reporteDocenteCuentaConPROMEP.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTeacher}" var="reporteGradoEstudioTeacher">
							      		<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '6'}">
							      			<c:out value="${reporteGradoEstudioTeacher.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioEspecialidad}" var="reporteGradoEstudioEspecialidad">
							      		<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '6'}">
							      			<c:out value="${reporteGradoEstudioEspecialidad.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinMastria}" var="reporteGradoEstudioSinMastria">
							      		<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '6'}">
							      			<c:out value="${reporteGradoEstudioSinMastria.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConMastria}" var="reporteGradoEstudioConMastria">
							      		<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '6'}">
							      			<c:out value="${reporteGradoEstudioConMastria.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinDoctorado}" var="reporteGradoEstudioSinDoctorado">
							      		<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '6'}">
							      			<c:out value="${reporteGradoEstudioSinDoctorado.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConDoctorado}" var="reporteGradoEstudioConDoctorado">
							      		<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '6'}">
							      			<c:out value="${reporteGradoEstudioConDoctorado.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente5A10}" var="reporteExperienciaDocente5A10">
							      		<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '6'}">
							      			<c:out value="${reporteExperienciaDocente5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocenteMayorA10}" var="reporteExperienciaDocenteMayorA10">
							      		<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '6'}">
							      			<c:out value="${reporteExperienciaDocenteMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral0}" var="reporteExperienciaLaboral0">
							      		<c:if test="${reporteExperienciaLaboral0.descNombramiento == '6'}">
							      			<c:out value="${reporteExperienciaLaboral0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral1A4}" var="reporteExperienciaLaboral1A4">
							      		<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '6'}">
							      			<c:out value="${reporteExperienciaLaboral1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral5A10}" var="reporteExperienciaLaboral5A10">
							      		<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '6'}">
							      			<c:out value="${reporteExperienciaLaboral5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '6'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteParticipaEnCA}" var="reporteDocenteParticipaEnCA">
							      		<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '6'}">
							      			<c:out value="${reporteDocenteParticipaEnCA.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocentePerteneceEnLineasInnovadoras}" var="reporteDocentePerteneceEnLineasInnovadoras">
							      		<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '6'}">
							      			<c:out value="${reporteDocentePerteneceEnLineasInnovadoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      		<td>
						      		<c:forEach items="${reporteDocenteCuentaConPTC}" var="reporteDocenteCuentaConPTC">
							      		<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '6'}">
							      			<c:out value="${reporteDocenteCuentaConPTC.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteCuentaConPROMEP}" var="reporteDocenteCuentaConPROMEP">
							      		<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '6'}">
							      			<c:out value="${reporteDocenteCuentaConPROMEP.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td class="fila-totales">
						      		<c:set var="grupoB7" value="${0}"/>
									<c:forEach var="reporteGradoEstudioTeacher" items="${reporteGradoEstudioTeacher}">
										<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '4'}"> <c:set var="grupoB7" value="${grupoB7 + reporteGradoEstudioTeacher.total}" /></c:if>
										<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '5'}"> <c:set var="grupoB7" value="${grupoB7 + reporteGradoEstudioTeacher.total}" /></c:if>
										<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '6'}"> <c:set var="grupoB7" value="${grupoB7 + reporteGradoEstudioTeacher.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB7}"/>
						      	</td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB9" value="${0}"/>
									<c:forEach var="reporteGradoEstudioTSU" items="${reporteGradoEstudioTSU}">
										<c:if test="${reporteGradoEstudioTSU.descNombramiento == '4'}"> <c:set var="grupoB9" value="${grupoB9 + reporteGradoEstudioTSU.total}" /></c:if>
										<c:if test="${reporteGradoEstudioTSU.descNombramiento == '5'}"> <c:set var="grupoB9" value="${grupoB9 + reporteGradoEstudioTSU.total}" /></c:if>
										<c:if test="${reporteGradoEstudioTSU.descNombramiento == '6'}"> <c:set var="grupoB9" value="${grupoB9 + reporteGradoEstudioTSU.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB9}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB10" value="${0}"/>
									<c:forEach var="reporteGradoEstudioSinLicenciatura" items="${reporteGradoEstudioSinLicenciatura}">
										<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '4'}"> <c:set var="grupoB10" value="${grupoB10 + reporteGradoEstudioSinLicenciatura.total}" /></c:if>
										<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '5'}"> <c:set var="grupoB10" value="${grupoB10 + reporteGradoEstudioSinLicenciatura.total}" /></c:if>
										<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '6'}"> <c:set var="grupoB10" value="${grupoB10 + reporteGradoEstudioSinLicenciatura.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB10}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB11" value="${0}"/>
									<c:forEach var="reporteGradoEstudioConLicenciatura" items="${reporteGradoEstudioConLicenciatura}">
										<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '4'}"> <c:set var="grupoB11" value="${grupoB11 + reporteGradoEstudioConLicenciatura.total}" /></c:if>
										<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '5'}"> <c:set var="grupoB11" value="${grupoB11 + reporteGradoEstudioConLicenciatura.total}" /></c:if>
										<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '6'}"> <c:set var="grupoB11" value="${grupoB11 + reporteGradoEstudioConLicenciatura.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB11}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB12" value="${0}"/>
									<c:forEach var="reporteGradoEstudioEspecialidad" items="${reporteGradoEstudioEspecialidad}">
										<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '4'}"> <c:set var="grupoB12" value="${grupoB12 + reporteGradoEstudioEspecialidad.total}" /></c:if>
										<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '5'}"> <c:set var="grupoB12" value="${grupoB12 + reporteGradoEstudioEspecialidad.total}" /></c:if>
										<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '6'}"> <c:set var="grupoB12" value="${grupoB12 + reporteGradoEstudioEspecialidad.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB12}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB13" value="${0}"/>
									<c:forEach var="reporteGradoEstudioSinMastria" items="${reporteGradoEstudioSinMastria}">
										<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '4'}"> <c:set var="grupoB13" value="${grupoB13 + reporteGradoEstudioSinMastria.total}" /></c:if>
										<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '5'}"> <c:set var="grupoB13" value="${grupoB13 + reporteGradoEstudioSinMastria.total}" /></c:if>
										<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '6'}"> <c:set var="grupoB13" value="${grupoB13 + reporteGradoEstudioSinMastria.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB13}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB14" value="${0}"/>
									<c:forEach var="reporteGradoEstudioConMastria" items="${reporteGradoEstudioConMastria}">
										<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '4'}"> <c:set var="grupoB14" value="${grupoB14 + reporteGradoEstudioConMastria.total}" /></c:if>
										<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '5'}"> <c:set var="grupoB14" value="${grupoB14 + reporteGradoEstudioConMastria.total}" /></c:if>
										<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '6'}"> <c:set var="grupoB14" value="${grupoB14 + reporteGradoEstudioConMastria.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB14}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB15" value="${0}"/>
									<c:forEach var="reporteGradoEstudioSinDoctorado" items="${reporteGradoEstudioSinDoctorado}">
										<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '4'}"> <c:set var="grupoB15" value="${grupoB15 + reporteGradoEstudioSinDoctorado.total}" /></c:if>
										<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '5'}"> <c:set var="grupoB15" value="${grupoB15 + reporteGradoEstudioSinDoctorado.total}" /></c:if>
										<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '6'}"> <c:set var="grupoB15" value="${grupoB15 + reporteGradoEstudioSinDoctorado.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB15}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB16" value="${0}"/>
									<c:forEach var="reporteGradoEstudioConDoctorado" items="${reporteGradoEstudioConDoctorado}">
										<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '4'}"> <c:set var="grupoB16" value="${grupoB16 + reporteGradoEstudioConDoctorado.total}" /></c:if>
										<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '5'}"> <c:set var="grupoB16" value="${grupoB16 + reporteGradoEstudioConDoctorado.total}" /></c:if>
										<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '6'}"> <c:set var="grupoB16" value="${grupoB16 + reporteGradoEstudioConDoctorado.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB16}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB17" value="${0}"/>
									<c:forEach var="reporteExperienciaDocente0" items="${reporteExperienciaDocente0}">
										<c:if test="${reporteExperienciaDocente0.descNombramiento == '4'}"> <c:set var="grupoB17" value="${grupoB17 + reporteExperienciaDocente0.total}" /></c:if>
										<c:if test="${reporteExperienciaDocente0.descNombramiento == '5'}"> <c:set var="grupoB17" value="${grupoB17 + reporteExperienciaDocente0.total}" /></c:if>
										<c:if test="${reporteExperienciaDocente0.descNombramiento == '6'}"> <c:set var="grupoB17" value="${grupoB17 + reporteExperienciaDocente0.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB17}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB18" value="${0}"/>
									<c:forEach var="reporteExperienciaDocente1A4" items="${reporteExperienciaDocente1A4}">
										<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '4'}"> <c:set var="grupoB18" value="${grupoB18 + reporteExperienciaDocente1A4.total}" /></c:if>
										<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '5'}"> <c:set var="grupoB18" value="${grupoB18 + reporteExperienciaDocente1A4.total}" /></c:if>
										<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '6'}"> <c:set var="grupoB18" value="${grupoB18 + reporteExperienciaDocente1A4.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB18}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB19" value="${0}"/>
									<c:forEach var="reporteExperienciaDocente5A10" items="${reporteExperienciaDocente5A10}">
										<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '4'}"> <c:set var="grupoB19" value="${grupoB19 + reporteExperienciaDocente5A10.total}" /></c:if>
										<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '5'}"> <c:set var="grupoB19" value="${grupoB19 + reporteExperienciaDocente5A10.total}" /></c:if>
										<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '6'}"> <c:set var="grupoB19" value="${grupoB19 + reporteExperienciaDocente5A10.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB19}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB20" value="${0}"/>
									<c:forEach var="reporteExperienciaDocenteMayorA10" items="${reporteExperienciaDocenteMayorA10}">
										<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '4'}"> <c:set var="grupoB20" value="${grupoB20 + reporteExperienciaDocenteMayorA10.total}" /></c:if>
										<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '5'}"> <c:set var="grupoB20" value="${grupoB20 + reporteExperienciaDocenteMayorA10.total}" /></c:if>
										<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '6'}"> <c:set var="grupoB20" value="${grupoB20 + reporteExperienciaDocenteMayorA10.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB20}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB21" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboral0" items="${reporteExperienciaLaboral0}">
										<c:if test="${reporteExperienciaLaboral0.descNombramiento == '4'}"> <c:set var="grupoB21" value="${grupoB21 + reporteExperienciaLaboral0.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboral0.descNombramiento == '5'}"> <c:set var="grupoB21" value="${grupoB21 + reporteExperienciaLaboral0.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboral0.descNombramiento == '6'}"> <c:set var="grupoB21" value="${grupoB21 + reporteExperienciaLaboral0.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB21}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB22" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboral1A4" items="${reporteExperienciaLaboral1A4}">
										<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '4'}"> <c:set var="grupoB22" value="${grupoB22 + reporteExperienciaLaboral1A4.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '5'}"> <c:set var="grupoB22" value="${grupoB22 + reporteExperienciaLaboral1A4.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '6'}"> <c:set var="grupoB22" value="${grupoB22 + reporteExperienciaLaboral1A4.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB22}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB23" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboral5A10" items="${reporteExperienciaLaboral5A10}">
										<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '4'}"> <c:set var="grupoB23" value="${grupoB23 + reporteExperienciaLaboral5A10.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '5'}"> <c:set var="grupoB23" value="${grupoB23 + reporteExperienciaLaboral5A10.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '6'}"> <c:set var="grupoB23" value="${grupoB23 + reporteExperienciaLaboral5A10.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB23}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB24" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboralMayorA10" items="${reporteExperienciaLaboralMayorA10}">
										<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '4'}"> <c:set var="grupoB24" value="${grupoB24 + reporteExperienciaLaboralMayorA10.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '5'}"> <c:set var="grupoB24" value="${grupoB24 + reporteExperienciaLaboralMayorA10.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '6'}"> <c:set var="grupoB24" value="${grupoB24 + reporteExperienciaLaboralMayorA10.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB24}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB25" value="${0}"/>
									<c:forEach var="reporteDocenteParticipaEnCA" items="${reporteDocenteParticipaEnCA}">
										<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '4'}"> <c:set var="grupoB25" value="${grupoB25 + reporteDocenteParticipaEnCA.total}" /></c:if>
										<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '5'}"> <c:set var="grupoB25" value="${grupoB25 + reporteDocenteParticipaEnCA.total}" /></c:if>
										<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '6'}"> <c:set var="grupoB25" value="${grupoB25 + reporteDocenteParticipaEnCA.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB25}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB26" value="${0}"/>
									<c:forEach var="reporteDocentePerteneceEnLineasInnovadoras" items="${reporteDocentePerteneceEnLineasInnovadoras}">
										<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '4'}"> <c:set var="grupoB26" value="${grupoB26 + reporteDocentePerteneceEnLineasInnovadoras.total}" /></c:if>
										<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '5'}"> <c:set var="grupoB26" value="${grupoB26 + reporteDocentePerteneceEnLineasInnovadoras.total}" /></c:if>
										<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '6'}"> <c:set var="grupoB26" value="${grupoB26 + reporteDocentePerteneceEnLineasInnovadoras.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB26}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB27" value="${0}"/>
									<c:forEach var="reporteDocenteCuentaConPTC" items="${reporteDocenteCuentaConPTC}">
										<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '4'}"> <c:set var="grupoB27" value="${grupoB27 + reporteDocenteCuentaConPTC.total}" /></c:if>
										<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '5'}"> <c:set var="grupoB27" value="${grupoB27 + reporteDocenteCuentaConPTC.total}" /></c:if>
										<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '6'}"> <c:set var="grupoB27" value="${grupoB27 + reporteDocenteCuentaConPTC.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB27}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoB28" value="${0}"/>
									<c:forEach var="reporteDocenteCuentaConPROMEP" items="${reporteDocenteCuentaConPROMEP}">
										<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '4'}"> <c:set var="grupoB28" value="${grupoB28 + reporteDocenteCuentaConPROMEP.total}" /></c:if>
										<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '5'}"> <c:set var="grupoB28" value="${grupoB28 + reporteDocenteCuentaConPROMEP.total}" /></c:if>
										<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '6'}"> <c:set var="grupoB28" value="${grupoB28 + reporteDocenteCuentaConPROMEP.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoB28}"/>
						      	</td>
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
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTeacher}" var="reporteGradoEstudioTeacher">
							      		<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '8'}">
							      			<c:out value="${reporteGradoEstudioTeacher.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioEspecialidad}" var="reporteGradoEstudioEspecialidad">
							      		<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '8'}">
							      			<c:out value="${reporteGradoEstudioEspecialidad.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinMastria}" var="reporteGradoEstudioSinMastria">
							      		<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '8'}">
							      			<c:out value="${reporteGradoEstudioSinMastria.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConMastria}" var="reporteGradoEstudioConMastria">
							      		<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '8'}">
							      			<c:out value="${reporteGradoEstudioConMastria.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinDoctorado}" var="reporteGradoEstudioSinDoctorado">
							      		<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '8'}">
							      			<c:out value="${reporteGradoEstudioSinDoctorado.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConDoctorado}" var="reporteGradoEstudioConDoctorado">
							      		<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '8'}">
							      			<c:out value="${reporteGradoEstudioConDoctorado.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente5A10}" var="reporteExperienciaDocente5A10">
							      		<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '8'}">
							      			<c:out value="${reporteExperienciaDocente5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocenteMayorA10}" var="reporteExperienciaDocenteMayorA10">
							      		<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '8'}">
							      			<c:out value="${reporteExperienciaDocenteMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral0}" var="reporteExperienciaLaboral0">
							      		<c:if test="${reporteExperienciaLaboral0.descNombramiento == '8'}">
							      			<c:out value="${reporteExperienciaLaboral0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral1A4}" var="reporteExperienciaLaboral1A4">
							      		<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '8'}">
							      			<c:out value="${reporteExperienciaLaboral1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral5A10}" var="reporteExperienciaLaboral5A10">
							      		<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '8'}">
							      			<c:out value="${reporteExperienciaLaboral5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '8'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteParticipaEnCA}" var="reporteDocenteParticipaEnCA">
							      		<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '8'}">
							      			<c:out value="${reporteDocenteParticipaEnCA.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocentePerteneceEnLineasInnovadoras}" var="reporteDocentePerteneceEnLineasInnovadoras">
							      		<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '8'}">
							      			<c:out value="${reporteDocentePerteneceEnLineasInnovadoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      		<td>
						      		<c:forEach items="${reporteDocenteCuentaConPTC}" var="reporteDocenteCuentaConPTC">
							      		<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '8'}">
							      			<c:out value="${reporteDocenteCuentaConPTC.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteCuentaConPROMEP}" var="reporteDocenteCuentaConPROMEP">
							      		<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '8'}">
							      			<c:out value="${reporteDocenteCuentaConPROMEP.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTeacher}" var="reporteGradoEstudioTeacher">
							      		<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '9'}">
							      			<c:out value="${reporteGradoEstudioTeacher.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioEspecialidad}" var="reporteGradoEstudioEspecialidad">
							      		<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '9'}">
							      			<c:out value="${reporteGradoEstudioEspecialidad.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinMastria}" var="reporteGradoEstudioSinMastria">
							      		<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '9'}">
							      			<c:out value="${reporteGradoEstudioSinMastria.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConMastria}" var="reporteGradoEstudioConMastria">
							      		<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '9'}">
							      			<c:out value="${reporteGradoEstudioConMastria.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinDoctorado}" var="reporteGradoEstudioSinDoctorado">
							      		<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '9'}">
							      			<c:out value="${reporteGradoEstudioSinDoctorado.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConDoctorado}" var="reporteGradoEstudioConDoctorado">
							      		<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '9'}">
							      			<c:out value="${reporteGradoEstudioConDoctorado.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente5A10}" var="reporteExperienciaDocente5A10">
							      		<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '9'}">
							      			<c:out value="${reporteExperienciaDocente5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocenteMayorA10}" var="reporteExperienciaDocenteMayorA10">
							      		<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '9'}">
							      			<c:out value="${reporteExperienciaDocenteMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral0}" var="reporteExperienciaLaboral0">
							      		<c:if test="${reporteExperienciaLaboral0.descNombramiento == '9'}">
							      			<c:out value="${reporteExperienciaLaboral0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral1A4}" var="reporteExperienciaLaboral1A4">
							      		<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '9'}">
							      			<c:out value="${reporteExperienciaLaboral1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral5A10}" var="reporteExperienciaLaboral5A10">
							      		<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '9'}">
							      			<c:out value="${reporteExperienciaLaboral5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '9'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteParticipaEnCA}" var="reporteDocenteParticipaEnCA">
							      		<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '9'}">
							      			<c:out value="${reporteDocenteParticipaEnCA.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocentePerteneceEnLineasInnovadoras}" var="reporteDocentePerteneceEnLineasInnovadoras">
							      		<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '9'}">
							      			<c:out value="${reporteDocentePerteneceEnLineasInnovadoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      		<td>
						      		<c:forEach items="${reporteDocenteCuentaConPTC}" var="reporteDocenteCuentaConPTC">
							      		<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '9'}">
							      			<c:out value="${reporteDocenteCuentaConPTC.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteCuentaConPROMEP}" var="reporteDocenteCuentaConPROMEP">
							      		<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '9'}">
							      			<c:out value="${reporteDocenteCuentaConPROMEP.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTeacher}" var="reporteGradoEstudioTeacher">
							      		<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '10'}">
							      			<c:out value="${reporteGradoEstudioTeacher.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioEspecialidad}" var="reporteGradoEstudioEspecialidad">
							      		<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '10'}">
							      			<c:out value="${reporteGradoEstudioEspecialidad.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinMastria}" var="reporteGradoEstudioSinMastria">
							      		<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '10'}">
							      			<c:out value="${reporteGradoEstudioSinMastria.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConMastria}" var="reporteGradoEstudioConMastria">
							      		<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '10'}">
							      			<c:out value="${reporteGradoEstudioConMastria.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinDoctorado}" var="reporteGradoEstudioSinDoctorado">
							      		<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '10'}">
							      			<c:out value="${reporteGradoEstudioSinDoctorado.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConDoctorado}" var="reporteGradoEstudioConDoctorado">
							      		<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '10'}">
							      			<c:out value="${reporteGradoEstudioConDoctorado.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente5A10}" var="reporteExperienciaDocente5A10">
							      		<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '10'}">
							      			<c:out value="${reporteExperienciaDocente5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocenteMayorA10}" var="reporteExperienciaDocenteMayorA10">
							      		<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '10'}">
							      			<c:out value="${reporteExperienciaDocenteMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral0}" var="reporteExperienciaLaboral0">
							      		<c:if test="${reporteExperienciaLaboral0.descNombramiento == '10'}">
							      			<c:out value="${reporteExperienciaLaboral0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral1A4}" var="reporteExperienciaLaboral1A4">
							      		<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '10'}">
							      			<c:out value="${reporteExperienciaLaboral1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral5A10}" var="reporteExperienciaLaboral5A10">
							      		<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '10'}">
							      			<c:out value="${reporteExperienciaLaboral5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '10'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteParticipaEnCA}" var="reporteDocenteParticipaEnCA">
							      		<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '10'}">
							      			<c:out value="${reporteDocenteParticipaEnCA.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocentePerteneceEnLineasInnovadoras}" var="reporteDocentePerteneceEnLineasInnovadoras">
							      		<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '10'}">
							      			<c:out value="${reporteDocentePerteneceEnLineasInnovadoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      		<td>
						      		<c:forEach items="${reporteDocenteCuentaConPTC}" var="reporteDocenteCuentaConPTC">
							      		<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '10'}">
							      			<c:out value="${reporteDocenteCuentaConPTC.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteCuentaConPROMEP}" var="reporteDocenteCuentaConPROMEP">
							      		<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '10'}">
							      			<c:out value="${reporteDocenteCuentaConPROMEP.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td class="fila-totales">
						      		<c:set var="grupoC7" value="${0}"/>
									<c:forEach var="reporteGradoEstudioTeacher" items="${reporteGradoEstudioTeacher}">
										<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '8'}"> <c:set var="grupoC7" value="${grupoC7 + reporteGradoEstudioTeacher.total}" /></c:if>
										<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '9'}"> <c:set var="grupoC7" value="${grupoC7 + reporteGradoEstudioTeacher.total}" /></c:if>
										<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '10'}"> <c:set var="grupoC7" value="${grupoC7 + reporteGradoEstudioTeacher.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC7}"/>
						      	</td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC9" value="${0}"/>
									<c:forEach var="reporteGradoEstudioTSU" items="${reporteGradoEstudioTSU}">
										<c:if test="${reporteGradoEstudioTSU.descNombramiento == '8'}"> <c:set var="grupoC9" value="${grupoC9 + reporteGradoEstudioTSU.total}" /></c:if>
										<c:if test="${reporteGradoEstudioTSU.descNombramiento == '9'}"> <c:set var="grupoC9" value="${grupoC9 + reporteGradoEstudioTSU.total}" /></c:if>
										<c:if test="${reporteGradoEstudioTSU.descNombramiento == '10'}"> <c:set var="grupoC9" value="${grupoC9 + reporteGradoEstudioTSU.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC9}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC10" value="${0}"/>
									<c:forEach var="reporteGradoEstudioSinLicenciatura" items="${reporteGradoEstudioSinLicenciatura}">
										<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '8'}"> <c:set var="grupoC10" value="${grupoC10 + reporteGradoEstudioSinLicenciatura.total}" /></c:if>
										<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '9'}"> <c:set var="grupoC10" value="${grupoC10 + reporteGradoEstudioSinLicenciatura.total}" /></c:if>
										<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '10'}"> <c:set var="grupoC10" value="${grupoC10 + reporteGradoEstudioSinLicenciatura.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC10}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC11" value="${0}"/>
									<c:forEach var="reporteGradoEstudioConLicenciatura" items="${reporteGradoEstudioConLicenciatura}">
										<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '8'}"> <c:set var="grupoC11" value="${grupoC11 + reporteGradoEstudioConLicenciatura.total}" /></c:if>
										<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '9'}"> <c:set var="grupoC11" value="${grupoC11 + reporteGradoEstudioConLicenciatura.total}" /></c:if>
										<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '10'}"> <c:set var="grupoC11" value="${grupoC11 + reporteGradoEstudioConLicenciatura.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC11}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC12" value="${0}"/>
									<c:forEach var="reporteGradoEstudioEspecialidad" items="${reporteGradoEstudioEspecialidad}">
										<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '8'}"> <c:set var="grupoC12" value="${grupoC12 + reporteGradoEstudioEspecialidad.total}" /></c:if>
										<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '9'}"> <c:set var="grupoC12" value="${grupoC12 + reporteGradoEstudioEspecialidad.total}" /></c:if>
										<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '10'}"> <c:set var="grupoC12" value="${grupoC12 + reporteGradoEstudioEspecialidad.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC12}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC13" value="${0}"/>
									<c:forEach var="reporteGradoEstudioSinMastria" items="${reporteGradoEstudioSinMastria}">
										<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '8'}"> <c:set var="grupoC13" value="${grupoC13 + reporteGradoEstudioSinMastria.total}" /></c:if>
										<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '9'}"> <c:set var="grupoC13" value="${grupoC13 + reporteGradoEstudioSinMastria.total}" /></c:if>
										<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '10'}"> <c:set var="grupoC13" value="${grupoC13 + reporteGradoEstudioSinMastria.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC13}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC14" value="${0}"/>
									<c:forEach var="reporteGradoEstudioConMastria" items="${reporteGradoEstudioConMastria}">
										<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '8'}"> <c:set var="grupoC14" value="${grupoC14 + reporteGradoEstudioConMastria.total}" /></c:if>
										<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '9'}"> <c:set var="grupoC14" value="${grupoC14 + reporteGradoEstudioConMastria.total}" /></c:if>
										<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '10'}"> <c:set var="grupoC14" value="${grupoC14 + reporteGradoEstudioConMastria.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC14}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC15" value="${0}"/>
									<c:forEach var="reporteGradoEstudioSinDoctorado" items="${reporteGradoEstudioSinDoctorado}">
										<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '8'}"> <c:set var="grupoC15" value="${grupoC15 + reporteGradoEstudioSinDoctorado.total}" /></c:if>
										<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '9'}"> <c:set var="grupoC15" value="${grupoC15 + reporteGradoEstudioSinDoctorado.total}" /></c:if>
										<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '10'}"> <c:set var="grupoC15" value="${grupoC15 + reporteGradoEstudioSinDoctorado.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC15}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC16" value="${0}"/>
									<c:forEach var="reporteGradoEstudioConDoctorado" items="${reporteGradoEstudioConDoctorado}">
										<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '8'}"> <c:set var="grupoC16" value="${grupoC16 + reporteGradoEstudioConDoctorado.total}" /></c:if>
										<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '9'}"> <c:set var="grupoC16" value="${grupoC16 + reporteGradoEstudioConDoctorado.total}" /></c:if>
										<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '10'}"> <c:set var="grupoC16" value="${grupoC16 + reporteGradoEstudioConDoctorado.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC16}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC17" value="${0}"/>
									<c:forEach var="reporteExperienciaDocente0" items="${reporteExperienciaDocente0}">
										<c:if test="${reporteExperienciaDocente0.descNombramiento == '8'}"> <c:set var="grupoC17" value="${grupoC17 + reporteExperienciaDocente0.total}" /></c:if>
										<c:if test="${reporteExperienciaDocente0.descNombramiento == '9'}"> <c:set var="grupoC17" value="${grupoC17 + reporteExperienciaDocente0.total}" /></c:if>
										<c:if test="${reporteExperienciaDocente0.descNombramiento == '10'}"> <c:set var="grupoC17" value="${grupoC17 + reporteExperienciaDocente0.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC17}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC18" value="${0}"/>
									<c:forEach var="reporteExperienciaDocente1A4" items="${reporteExperienciaDocente1A4}">
										<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '8'}"> <c:set var="grupoC18" value="${grupoC18 + reporteExperienciaDocente1A4.total}" /></c:if>
										<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '9'}"> <c:set var="grupoC18" value="${grupoC18 + reporteExperienciaDocente1A4.total}" /></c:if>
										<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '10'}"> <c:set var="grupoC18" value="${grupoC18 + reporteExperienciaDocente1A4.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC18}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC19" value="${0}"/>
									<c:forEach var="reporteExperienciaDocente5A10" items="${reporteExperienciaDocente5A10}">
										<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '8'}"> <c:set var="grupoC19" value="${grupoC19 + reporteExperienciaDocente5A10.total}" /></c:if>
										<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '9'}"> <c:set var="grupoC19" value="${grupoC19 + reporteExperienciaDocente5A10.total}" /></c:if>
										<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '10'}"> <c:set var="grupoC19" value="${grupoC19 + reporteExperienciaDocente5A10.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC19}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC20" value="${0}"/>
									<c:forEach var="reporteExperienciaDocenteMayorA10" items="${reporteExperienciaDocenteMayorA10}">
										<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '8'}"> <c:set var="grupoC20" value="${grupoC20 + reporteExperienciaDocenteMayorA10.total}" /></c:if>
										<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '9'}"> <c:set var="grupoC20" value="${grupoC20 + reporteExperienciaDocenteMayorA10.total}" /></c:if>
										<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '10'}"> <c:set var="grupoC20" value="${grupoC20 + reporteExperienciaDocenteMayorA10.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC20}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC21" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboral0" items="${reporteExperienciaLaboral0}">
										<c:if test="${reporteExperienciaLaboral0.descNombramiento == '8'}"> <c:set var="grupoC21" value="${grupoC21 + reporteExperienciaLaboral0.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboral0.descNombramiento == '9'}"> <c:set var="grupoC21" value="${grupoC21 + reporteExperienciaLaboral0.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboral0.descNombramiento == '10'}"> <c:set var="grupoC21" value="${grupoC21 + reporteExperienciaLaboral0.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC21}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC22" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboral1A4" items="${reporteExperienciaLaboral1A4}">
										<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '8'}"> <c:set var="grupoC22" value="${grupoC22 + reporteExperienciaLaboral1A4.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '9'}"> <c:set var="grupoC22" value="${grupoC22 + reporteExperienciaLaboral1A4.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '10'}"> <c:set var="grupoC22" value="${grupoC22 + reporteExperienciaLaboral1A4.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC22}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC23" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboral5A10" items="${reporteExperienciaLaboral5A10}">
										<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '8'}"> <c:set var="grupoC23" value="${grupoC23 + reporteExperienciaLaboral5A10.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '9'}"> <c:set var="grupoC23" value="${grupoC23 + reporteExperienciaLaboral5A10.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '10'}"> <c:set var="grupoC23" value="${grupoC23 + reporteExperienciaLaboral5A10.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC23}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC24" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboralMayorA10" items="${reporteExperienciaLaboralMayorA10}">
										<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '8'}"> <c:set var="grupoC24" value="${grupoC24 + reporteExperienciaLaboralMayorA10.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '9'}"> <c:set var="grupoC24" value="${grupoC24 + reporteExperienciaLaboralMayorA10.total}" /></c:if>
										<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '10'}"> <c:set var="grupoC24" value="${grupoC24 + reporteExperienciaLaboralMayorA10.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC24}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC25" value="${0}"/>
									<c:forEach var="reporteDocenteParticipaEnCA" items="${reporteDocenteParticipaEnCA}">
										<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '8'}"> <c:set var="grupoC25" value="${grupoC25 + reporteDocenteParticipaEnCA.total}" /></c:if>
										<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '9'}"> <c:set var="grupoC25" value="${grupoC25 + reporteDocenteParticipaEnCA.total}" /></c:if>
										<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '10'}"> <c:set var="grupoC25" value="${grupoC25 + reporteDocenteParticipaEnCA.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC25}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC26" value="${0}"/>
									<c:forEach var="reporteDocentePerteneceEnLineasInnovadoras" items="${reporteDocentePerteneceEnLineasInnovadoras}">
										<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '8'}"> <c:set var="grupoC26" value="${grupoC26 + reporteDocentePerteneceEnLineasInnovadoras.total}" /></c:if>
										<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '9'}"> <c:set var="grupoC26" value="${grupoC26 + reporteDocentePerteneceEnLineasInnovadoras.total}" /></c:if>
										<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '10'}"> <c:set var="grupoC26" value="${grupoC26 + reporteDocentePerteneceEnLineasInnovadoras.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC26}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC27" value="${0}"/>
									<c:forEach var="reporteDocenteCuentaConPTC" items="${reporteDocenteCuentaConPTC}">
										<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '8'}"> <c:set var="grupoB27" value="${grupoC27 + reporteDocenteCuentaConPTC.total}" /></c:if>
										<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '9'}"> <c:set var="grupoB27" value="${grupoC27 + reporteDocenteCuentaConPTC.total}" /></c:if>
										<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '10'}"> <c:set var="grupoB27" value="${grupoC27 + reporteDocenteCuentaConPTC.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC27}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoC28" value="${0}"/>
									<c:forEach var="reporteDocenteCuentaConPROMEP" items="${reporteDocenteCuentaConPROMEP}">
										<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '8'}"> <c:set var="grupoC28" value="${grupoC28 + reporteDocenteCuentaConPROMEP.total}" /></c:if>
										<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '9'}"> <c:set var="grupoC28" value="${grupoC28 + reporteDocenteCuentaConPROMEP.total}" /></c:if>
										<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '10'}"> <c:set var="grupoC28" value="${grupoC28 + reporteDocenteCuentaConPROMEP.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoC28}"/>
						      	</td>
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
						      	<td>
						      		<c:forEach items="${reporteGradoEstudioTeacher}" var="reporteGradoEstudioTeacher">
							      		<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '7'}">
							      			<c:out value="${reporteGradoEstudioTeacher.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioEspecialidad}" var="reporteGradoEstudioEspecialidad">
							      		<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '7'}">
							      			<c:out value="${reporteGradoEstudioEspecialidad.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinMastria}" var="reporteGradoEstudioSinMastria">
							      		<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '7'}">
							      			<c:out value="${reporteGradoEstudioSinMastria.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConMastria}" var="reporteGradoEstudioConMastria">
							      		<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '7'}">
							      			<c:out value="${reporteGradoEstudioConMastria.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioSinDoctorado}" var="reporteGradoEstudioSinDoctorado">
							      		<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '7'}">
							      			<c:out value="${reporteGradoEstudioSinDoctorado.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
							      	<c:forEach items="${reporteGradoEstudioConDoctorado}" var="reporteGradoEstudioConDoctorado">
							      		<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '7'}">
							      			<c:out value="${reporteGradoEstudioConDoctorado.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocente5A10}" var="reporteExperienciaDocente5A10">
							      		<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '7'}">
							      			<c:out value="${reporteExperienciaDocente5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaDocenteMayorA10}" var="reporteExperienciaDocenteMayorA10">
							      		<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '7'}">
							      			<c:out value="${reporteExperienciaDocenteMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral0}" var="reporteExperienciaLaboral0">
							      		<c:if test="${reporteExperienciaLaboral0.descNombramiento == '7'}">
							      			<c:out value="${reporteExperienciaLaboral0.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral1A4}" var="reporteExperienciaLaboral1A4">
							      		<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '7'}">
							      			<c:out value="${reporteExperienciaLaboral1A4.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboral5A10}" var="reporteExperienciaLaboral5A10">
							      		<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '7'}">
							      			<c:out value="${reporteExperienciaLaboral5A10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteExperienciaLaboralMayorA10}" var="reporteExperienciaLaboralMayorA10">
							      		<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '7'}">
							      			<c:out value="${reporteExperienciaLaboralMayorA10.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteParticipaEnCA}" var="reporteDocenteParticipaEnCA">
							      		<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '7'}">
							      			<c:out value="${reporteDocenteParticipaEnCA.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocentePerteneceEnLineasInnovadoras}" var="reporteDocentePerteneceEnLineasInnovadoras">
							      		<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '7'}">
							      			<c:out value="${reporteDocentePerteneceEnLineasInnovadoras.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      		<td>
						      		<c:forEach items="${reporteDocenteCuentaConPTC}" var="reporteDocenteCuentaConPTC">
							      		<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '7'}">
							      			<c:out value="${reporteDocenteCuentaConPTC.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
						      	<td>
						      		<c:forEach items="${reporteDocenteCuentaConPROMEP}" var="reporteDocenteCuentaConPROMEP">
							      		<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '7'}">
							      			<c:out value="${reporteDocenteCuentaConPROMEP.total}"/>
							      		</c:if>
						      		</c:forEach>
						      	</td>
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
						      	<td class="fila-totales">
						      		<c:set var="grupoD7" value="${0}"/>
									<c:forEach var="reporteGradoEstudioTeacher" items="${reporteGradoEstudioTeacher}">
										<c:if test="${reporteGradoEstudioTeacher.descNombramiento == '7'}"> <c:set var="grupoD7" value="${grupoD7 + reporteGradoEstudioTeacher.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD7}"/>
						      	</td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD9" value="${0}"/>
									<c:forEach var="reporteGradoEstudioTSU" items="${reporteGradoEstudioTSU}">
										<c:if test="${reporteGradoEstudioTSU.descNombramiento == '7'}"> <c:set var="grupoD9" value="${grupoD9 + reporteGradoEstudioTSU.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD9}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD10" value="${0}"/>
									<c:forEach var="reporteGradoEstudioSinLicenciatura" items="${reporteGradoEstudioSinLicenciatura}">
										<c:if test="${reporteGradoEstudioSinLicenciatura.descNombramiento == '7'}"> <c:set var="grupoD10" value="${grupoD10 + reporteGradoEstudioSinLicenciatura.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD10}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD11" value="${0}"/>
									<c:forEach var="reporteGradoEstudioConLicenciatura" items="${reporteGradoEstudioConLicenciatura}">
										<c:if test="${reporteGradoEstudioConLicenciatura.descNombramiento == '7'}"> <c:set var="grupoD11" value="${grupoC11 + reporteGradoEstudioConLicenciatura.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD11}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD12" value="${0}"/>
									<c:forEach var="reporteGradoEstudioEspecialidad" items="${reporteGradoEstudioEspecialidad}">
										<c:if test="${reporteGradoEstudioEspecialidad.descNombramiento == '7'}"> <c:set var="grupoD12" value="${grupoD12 + reporteGradoEstudioEspecialidad.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD12}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD13" value="${0}"/>
									<c:forEach var="reporteGradoEstudioSinMastria" items="${reporteGradoEstudioSinMastria}">
										<c:if test="${reporteGradoEstudioSinMastria.descNombramiento == '7'}"> <c:set var="grupoD13" value="${grupoD13 + reporteGradoEstudioSinMastria.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD13}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD14" value="${0}"/>
									<c:forEach var="reporteGradoEstudioConMastria" items="${reporteGradoEstudioConMastria}">
										<c:if test="${reporteGradoEstudioConMastria.descNombramiento == '7'}"> <c:set var="grupoD14" value="${grupoD14 + reporteGradoEstudioConMastria.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD14}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD15" value="${0}"/>
									<c:forEach var="reporteGradoEstudioSinDoctorado" items="${reporteGradoEstudioSinDoctorado}">
										<c:if test="${reporteGradoEstudioSinDoctorado.descNombramiento == '7'}"> <c:set var="grupoD15" value="${grupoD15 + reporteGradoEstudioSinDoctorado.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD15}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD16" value="${0}"/>
									<c:forEach var="reporteGradoEstudioConDoctorado" items="${reporteGradoEstudioConDoctorado}">
										<c:if test="${reporteGradoEstudioConDoctorado.descNombramiento == '7'}"> <c:set var="grupoD16" value="${grupoD16 + reporteGradoEstudioConDoctorado.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD16}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD17" value="${0}"/>
									<c:forEach var="reporteExperienciaDocente0" items="${reporteExperienciaDocente0}">
										<c:if test="${reporteExperienciaDocente0.descNombramiento == '7'}"> <c:set var="grupoD17" value="${grupoD17 + reporteExperienciaDocente0.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD17}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD18" value="${0}"/>
									<c:forEach var="reporteExperienciaDocente1A4" items="${reporteExperienciaDocente1A4}">
										<c:if test="${reporteExperienciaDocente1A4.descNombramiento == '7'}"> <c:set var="grupoD18" value="${grupoD18 + reporteExperienciaDocente1A4.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD18}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD19" value="${0}"/>
									<c:forEach var="reporteExperienciaDocente5A10" items="${reporteExperienciaDocente5A10}">
										<c:if test="${reporteExperienciaDocente5A10.descNombramiento == '7'}"> <c:set var="grupoD19" value="${grupoD19 + reporteExperienciaDocente5A10.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD19}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD20" value="${0}"/>
									<c:forEach var="reporteExperienciaDocenteMayorA10" items="${reporteExperienciaDocenteMayorA10}">
										<c:if test="${reporteExperienciaDocenteMayorA10.descNombramiento == '7'}"> <c:set var="grupoD20" value="${grupoD20 + reporteExperienciaDocenteMayorA10.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD20}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD21" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboral0" items="${reporteExperienciaLaboral0}">
										<c:if test="${reporteExperienciaLaboral0.descNombramiento == '7'}"> <c:set var="grupoD21" value="${grupoD21 + reporteExperienciaLaboral0.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD21}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD22" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboral1A4" items="${reporteExperienciaLaboral1A4}">
										<c:if test="${reporteExperienciaLaboral1A4.descNombramiento == '7'}"> <c:set var="grupoD22" value="${grupoD22 + reporteExperienciaLaboral1A4.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD22}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD23" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboral5A10" items="${reporteExperienciaLaboral5A10}">
										<c:if test="${reporteExperienciaLaboral5A10.descNombramiento == '7'}"> <c:set var="grupoD23" value="${grupoD23 + reporteExperienciaLaboral5A10.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD23}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD24" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboralMayorA10" items="${reporteExperienciaLaboralMayorA10}">
										<c:if test="${reporteExperienciaLaboralMayorA10.descNombramiento == '7'}"> <c:set var="grupoD24" value="${grupoD24 + reporteExperienciaLaboralMayorA10.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD24}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD25" value="${0}"/>
									<c:forEach var="reporteDocenteParticipaEnCA" items="${reporteDocenteParticipaEnCA}">
										<c:if test="${reporteDocenteParticipaEnCA.descNombramiento == '7'}"> <c:set var="grupoD25" value="${grupoD25 + reporteDocenteParticipaEnCA.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD25}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD26" value="${0}"/>
									<c:forEach var="reporteDocentePerteneceEnLineasInnovadoras" items="${reporteDocentePerteneceEnLineasInnovadoras}">
										<c:if test="${reporteDocentePerteneceEnLineasInnovadoras.descNombramiento == '7'}"> <c:set var="grupoD26" value="${grupoD26 + reporteDocentePerteneceEnLineasInnovadoras.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD26}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD27" value="${0}"/>
									<c:forEach var="reporteDocenteCuentaConPTC" items="${reporteDocenteCuentaConPTC}">
										<c:if test="${reporteDocenteCuentaConPTC.descNombramiento == '7'}"> <c:set var="grupoD27" value="${grupoD27 + reporteDocenteCuentaConPTC.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD27}"/>
						      	</td>
						      	<td class="fila-totales">
						      		<c:set var="grupoD28" value="${0}"/>
									<c:forEach var="reporteDocenteCuentaConPROMEP" items="${reporteDocenteCuentaConPROMEP}">
										<c:if test="${reporteDocenteCuentaConPROMEP.descNombramiento == '7'}"> <c:set var="grupoD28" value="${grupoD28 + reporteDocenteCuentaConPROMEP.total}" /></c:if>
									</c:forEach>
									<c:out value="${grupoD28}"/>
						      	</td>
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
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal7" value="${0}"/>
									<c:forEach var="reporteGradoEstudioTeacher" items="${reporteGradoEstudioTeacher}">
										<c:set var="grupoTotal7" value="${grupoTotal7 + reporteGradoEstudioTeacher.total}" />
									</c:forEach>
									<c:out value="${grupoTotal7}"/>
						      	</td>
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
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal12" value="${0}"/>
									<c:forEach var="reporteGradoEstudioEspecialidad" items="${reporteGradoEstudioEspecialidad}">
										<c:set var="grupoTotal12" value="${grupoTotal12 + reporteGradoEstudioEspecialidad.total}" />
									</c:forEach>
									<c:out value="${grupoTotal12}"/>
						      	</td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal13" value="${0}"/>
									<c:forEach var="reporteGradoEstudioSinMastria" items="${reporteGradoEstudioSinMastria}">
										<c:set var="grupoTotal13" value="${grupoTotal13 + reporteGradoEstudioSinMastria.total}" />
									</c:forEach>
									<c:out value="${grupoTotal13}"/>
						      	</td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal14" value="${0}"/>
									<c:forEach var="reporteGradoEstudioConMastria" items="${reporteGradoEstudioConMastria}">
										<c:set var="grupoTotal14" value="${grupoTotal14 + reporteGradoEstudioConMastria.total}" />
									</c:forEach>
									<c:out value="${grupoTotal14}"/>
						      	</td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal15" value="${0}"/>
									<c:forEach var="reporteGradoEstudioSinDoctorado" items="${reporteGradoEstudioSinDoctorado}">
										<c:set var="grupoTotal15" value="${grupoTotal15 + reporteGradoEstudioSinDoctorado.total}" />
									</c:forEach>
									<c:out value="${grupoTotal15}"/>
						      	</td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal16" value="${0}"/>
									<c:forEach var="reporteGradoEstudioConDoctorado" items="${reporteGradoEstudioConDoctorado}">
										<c:set var="grupoTotal16" value="${grupoTotal16 + reporteGradoEstudioConDoctorado.total}" />
									</c:forEach>
									<c:out value="${grupoTotal16}"/>
						      	</td>
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
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal19" value="${0}"/>
									<c:forEach var="reporteExperienciaDocente5A10" items="${reporteExperienciaDocente5A10}">
										<c:set var="grupoTotal19" value="${grupoTotal19 + reporteExperienciaDocente5A10.total}" />
									</c:forEach>
									<c:out value="${grupoTotal19}"/>
						      	</td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTota20" value="${0}"/>
									<c:forEach var="reporteExperienciaDocenteMayorA10" items="${reporteExperienciaDocenteMayorA10}">
										<c:set var="grupoTota20" value="${grupoTota20 + reporteExperienciaDocenteMayorA10.total}" />
									</c:forEach>
									<c:out value="${grupoTota20}"/>
						      	</td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTota21" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboral0" items="${reporteExperienciaLaboral0}">
										<c:set var="grupoTota21" value="${grupoTota21 + reporteExperienciaLaboral0.total}" />
									</c:forEach>
									<c:out value="${grupoTota21}"/>
						      	</td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTota22" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboral1A4" items="${reporteExperienciaLaboral1A4}">
										<c:set var="grupoTota22" value="${grupoTota22 + reporteExperienciaLaboral1A4.total}" />
									</c:forEach>
									<c:out value="${grupoTota22}"/>
						      	</td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTota23" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboral5A10" items="${reporteExperienciaLaboral5A10}">
										<c:set var="grupoTota23" value="${grupoTota23 + reporteExperienciaLaboral5A10.total}" />
									</c:forEach>
									<c:out value="${grupoTota22}"/>
						      	</td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal24" value="${0}"/>
									<c:forEach var="reporteExperienciaLaboralMayorA10" items="${reporteExperienciaLaboralMayorA10}">
										<c:set var="grupoTotal24" value="${grupoTotal24 + reporteExperienciaLaboralMayorA10.total}" />
									</c:forEach>
									<c:out value="${grupoTotal24}"/>
						      	</td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal25" value="${0}"/>
									<c:forEach var="reporteDocenteParticipaEnCA" items="${reporteDocenteParticipaEnCA}">
										<c:set var="grupoTotal25" value="${grupoTotal25 + reporteDocenteParticipaEnCA.total}" />
									</c:forEach>
									<c:out value="${grupoTotal25}"/>
						      	</td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal26" value="${0}"/>
									<c:forEach var="reporteDocentePerteneceEnLineasInnovadoras" items="${reporteDocentePerteneceEnLineasInnovadoras}">
										<c:set var="grupoTotal26" value="${grupoTotal25 + reporteDocentePerteneceEnLineasInnovadoras.total}" />
									</c:forEach>
									<c:out value="${grupoTotal26}"/>
						      	</td>
						        <td class="fila-totales-final">
						      		<c:set var="grupoTotal27" value="${0}"/>
									<c:forEach var="reporteDocenteCuentaConPTC" items="${reporteDocenteCuentaConPTC}">
										<c:set var="grupoTotal27" value="${grupoTotal27 + reporteDocenteCuentaConPTC.total}" />
									</c:forEach>
									<c:out value="${grupoTotal27}"/>
						      	</td>
						      	<td class="fila-totales-final">
						      		<c:set var="grupoTotal28" value="${0}"/>
									<c:forEach var="reporteDocenteCuentaConPROMEP" items="${reporteDocenteCuentaConPROMEP}">
										<c:set var="grupoTotal28" value="${grupoTotal28 + reporteDocenteCuentaConPROMEP.total}" />
									</c:forEach>
									<c:out value="${grupoTotal28}"/>
						      	</td>
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
	
</t:DirectivoLayout>