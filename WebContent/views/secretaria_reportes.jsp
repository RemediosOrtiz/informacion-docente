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
						      	<td></td>
						      	<td></td>
						      	<td>0</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      </tr>
						      <tr class="separador-normal">
						      	<td>B</td>
						      	<td>3</td>
						      	<td>0</td>
						      	<td>3</td>
						      	<td>120</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>0</td>
						      	<td>0</td>
						      	<td>0</td>
						      	<td>1</td>
						      	<td>1</td>
						      	<td>1</td>
						      	<td>0</td>
						      	<td>0</td>
						      	<td>0</td>
						      	<td>0</td>
						      	<td>0</td>
						      	<td>3</td>
						      	<td>0</td>
						      	<td>0</td>
						      	<td>0</td>
						      	<td>0</td>
						      	<td>3</td>
						      	<td>1</td>
						      	<td>0</td>
						      	<td>1</td>
						      </tr>
						      <tr class="separador-normal">
						      	<td>C</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      </tr>
						      <tr class="separador-normal fila-separadora">
						      	<td></td>
						      	<td class="fila-totales">3</td>
						      	<td class="fila-totales">0</td>
						      	<td class="fila-totales">3</td>
						      	<td class="fila-totales">120</td>
						      	<td class="fila-totales">0</td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales">0</td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales">0</td>
						      	<td class="fila-totales">0</td>
						      	<td class="fila-totales">0</td>
						      	<td class="fila-totales">1</td>
						      	<td class="fila-totales">1</td>
						      	<td class="fila-totales">1</td>
						      	<td class="fila-totales">0</td>
						      	<td class="fila-totales">0</td>
						      	<td class="fila-totales">0</td>
						      	<td class="fila-totales">0</td>
						      	<td class="fila-totales">0</td>
						      	<td class="fila-totales">3</td>
						      	<td class="fila-totales">0</td>
						      	<td class="fila-totales">0</td>
						      	<td class="fila-totales">0</td>
						      	<td class="fila-totales">3</td>
						      	<td class="fila-totales">1</td>
						      	<td class="fila-totales">1</td>
						      	<td class="fila-totales">0</td>
						      	<td class="fila-totales">1</td>
						      </tr>
						      
						      <tr class="separador-normal">
						      	<td rowspan="4">PTC ASOCIADOS</td>
						      	<td>A</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      </tr>
						      <tr class="separador-normal">
						      	<td>B</td>
						      	<td>6</td>
						      	<td>6</td>
						      	<td>12</td>
						      	<td>480</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td>0</td>
						      	<td>0</td>
						      	<td>2</td>
						      	<td>5</td>
						      	<td>2</td>
						      	<td>3</td>
						      	<td>0</td>
						      	<td>0</td>
						      	<td>0</td>
						      	<td>0</td>
						      	<td>7</td>
						      	<td>5</td>
						      	<td>0</td>
						      	<td>0</td>
						      	<td>3</td>
						      	<td>9</td>
						      	<td>1</td>
						      	<td>1</td>
						      	<td>0</td>
						      	<td>1</td>
						      </tr>
						      <tr class="separador-normal">
						      	<td>C</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      </tr>
						      <tr class="separador-normal fila-separadora">
						      	<td></td>
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
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      </tr>
						   
						   	
						   	<tr class="separador-normal">
						      	<td rowspan="4">TÈCNICOS ACADÈMICOS</td>
						      	<td>A</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      </tr>
						      <tr class="separador-normal">
						      	<td>B</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      </tr>
						      <tr class="separador-normal">
						      	<td>C</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      </tr>
						      <tr class="separador-normal fila-separadora">
						      	<td></td>
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
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      </tr>
						      
						      
						      
						      <tr class="separador-normal">
						      	<td rowspan="2">PA</td>
						      	<td>B</td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      	<td></td>
						      </tr>
						      <tr class="separador-normal fila-separadora">
						      	<td></td>
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
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales"></td>
						      </tr>
						      
						      
						      <tr class="separador-normal fila-separadora">
						      	<td class="fila-totales">TOTAL</td>
						      	<td class="fila-totales"></td>
						      	<td class="fila-totales-final">21</td>
						      	<td class="fila-totales-final">23</td>
						      	<td class="fila-totales-final">44</td>
						      	<td class="fila-totales-final">1477</td>
						      	<td class="fila-totales-final">0</td>
						      	<td class="fila-totales-final"></td>
						      	<td class="fila-totales-final">0</td>
						      	<td class="fila-totales-final"></td>
						      	<td class="fila-totales-final">5</td>
						      	<td class="fila-totales-final">3</td>
						      	<td class="fila-totales-final">18</td>
						      	<td class="fila-totales-final">7</td>
						      	<td class="fila-totales-final">4</td>
						      	<td class="fila-totales-final">7</td>
						      	<td class="fila-totales-final">0</td>
						      	<td class="fila-totales-final">0</td>
						      	<td class="fila-totales-final">9</td>
						      	<td class="fila-totales-final">12</td>
						      	<td class="fila-totales-final">12</td>
						      	<td class="fila-totales-final">11</td>
						      	<td class="fila-totales-final">0</td>
						      	<td class="fila-totales-final">13</td>
						      	<td class="fila-totales-final">12</td>
						      	<td class="fila-totales-final">19</td>
						      	<td class="fila-totales-final">2</td>
						      	<td class="fila-totales-final">2</td>
						      	<td class="fila-totales-final">0</td>
						      	<td class="fila-totales-final">2</td>
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