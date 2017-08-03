<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<t:DirectivoLayout>
	<jsp:attribute name="viewtitlename">
     	<title>Directivo - R. Nombramiento</title>
    </jsp:attribute>

	<jsp:attribute name="viewuserrol">
     	Directivo
    </jsp:attribute>

	<jsp:attribute name="viewtitleseccion">
     	R. Nombramiento
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
		    	<a href="#reporte1-tab-x" id="tab-reporte1" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Reporte 1</a>
		    </li>
		    <li role="presentation" class="">
		    	<a href="#reporte2-tab-x" role="tab" id="tab-reporte2" data-toggle="tab" aria-controls="direc-tab-x" aria-expanded="false">Reporte 2</a>
		    </li>
		    <li role="presentation" class="">
		    	<a href="#reporte3-tab-x" role="tab" id="tab-reporte3" data-toggle="tab" aria-controls="secreta-tab-x" aria-expanded="false">Reporte 3</a>
		    </li>
		    <li role="presentation" class="">
		    	<a href="#reporte4-tab-x" role="tab" id="tab-reporte4" data-toggle="tab" aria-controls="docen-tab-x" aria-expanded="false">Reporte 4</a>
		    </li>
		    <li role="presentation" class="">
		    	<a href="#reporte5-tab-x" role="tab" id="tab-reporte5" data-toggle="tab" aria-controls="labora-tab-x" aria-expanded="false">Reporte 5</a>
		    </li>
		    <li role="presentation" class="">
		    	<a href="#reporte6-tab-x" role="tab" id="tab-reporte6" data-toggle="tab" aria-controls="administrativo-tab-x" aria-expanded="false">Reporte 6</a>
		    </li>
		    <li role="presentation" class="">
		    	<a href="#reporte7-tab-x" role="tab" id="tab-reporte7" data-toggle="tab" aria-controls="administrativo-tab-x" aria-expanded="false">Reporte 7</a>
		    </li>
		    <li role="presentation" class="">
		    	<a href="#reporte8-tab-x" role="tab" id="tab-reporte8" data-toggle="tab" aria-controls="administrativo-tab-x" aria-expanded="false">Reporte 8</a>
		    </li>
		    <li role="presentation" class="">
		    	<a href="#reporte9-tab-x" role="tab" id="tab-reporte9" data-toggle="tab" aria-controls="administrativo-tab-x" aria-expanded="false">Reporte 9</a>
		    </li>
	    </ul>
	    
    
	    <!-- Tab panes -->
		  <div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="reporte1-tab-x">
				<div class="card">
		               <div class="header">
		                   <h5 class="title"><b>CÁLCULO DE TOTAL DE PROFESORES HOMBRES Y MUJERES, CLASIFICADOS POR TIPO DE PUESTO</b></h5>
		                   <p class="category">REPORTE 1</p>
		               </div>
		               
		               <div class="header">
		               <div class="content table-responsive table-full-width">
							<c:forEach items="${reportes1}" var="reportes1">
						        <table style="margin-bottom: 5px;">
									<tr style="margin-top: 10px; margin-bottom: 5px; border-top: solid 1px #E5E5E5">
										<td width="200px">
											<h6>${reportes1.nombramiento}</h6>
										</td>
										<td width="200px" style="text-align: right;">${reportes1.sexoH}: </td>
										<td width="20px" style="text-align: right;"><c:out value="${reportes1.sexoHTotal}"></c:out></td>
										<td width="200px" style="text-align: right;">${reportes1.sexoM}: </td>
										<td width="20px" style="text-align: right;"><c:out value="${reportes1.sexoMTotal}"></c:out></td>
										<td width="200px" style="text-align: right;">TOTAL: </td>
										<td width="20px" style="text-align: right;"><c:out value="${reportes1.total}"></c:out></td>
									</tr>
								</table>
							</c:forEach>
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
			
			
			<div role="tabpanel" class="tab-pane" id="reporte3-tab-x">
				<div class="card">
		               <div class="header">
		                   <h5 class="title"><b>CÁLCULO DE TOTAL DE PROFESORES CLASIFICADOS POR SU GRADO DE ESTUDIOS Y POR TIPO DE PUESTO.</b></h5>
		                   <p class="category">REPORTE 3</p>
		               </div>
		               
		               <div class="header">
		               <div class="content table-responsive table-full-width">
							
		               </div>
		           </div>
		           </div>
			</div>
			
			
			<div role="tabpanel" class="tab-pane" id="reporte4-tab-x">
				<div class="card">
		               <div class="header">
		                   <h5 class="title"><b>CÁLCULO DE TOTAL DE PROFESORES CLASIFICADOS POR SU EXPERIENCIA DOCENTE Y POR TIPO DE PUESTO.</b></h5>
		                   <p class="category">REPORTE 4</p>
		               </div>
		               
		               <div class="header">
		               <div class="content table-responsive table-full-width">
							<c:forEach items="${reportes4}" var="reportes4">
						        <table style="margin-bottom: 5px;">
									<tr style="margin-top: 10px; margin-bottom: 5px; border-top: solid 1px #E5E5E5">
										<td width="200px">
											<h6>${reportes4.descNombramiento}</h6>
										</td>
										<td width="20px" style="text-align: right;"><c:out value="${reportes4.sexo}"> </c:out></td>
										<td width="20px" style="text-align: center;"></td>
										<td width="200px" style="text-align: left;"> ${reportes4.nombre} ${reportes4.apPaterno} ${reportes4.apMaterno} </td>
										<td width="200px" style="text-align: right;"><c:out value="${reportes4.anios}"></c:out> Años de experiencia docente</td>
									</tr>
								</table>
							</c:forEach>
		               </div>
		           </div>
		           </div>
			</div>
			
			
			<div role="tabpanel" class="tab-pane" id="reporte5-tab-x">
				<div class="card">
		               <div class="header">
		                   <h5 class="title"><b>CÁLCULO DE TOTAL DE PROFESORES CLASIFICADOS POR SU EXPERIENCIA LABORAL Y POR TIPO DE PUESTO.</b></h5>
		                   <p class="category">REPORTE 5</p>
		               </div>
		               
		               <div class="header">
		               <div class="content table-responsive table-full-width">
							<c:forEach items="${reportes4}" var="reportes4">
						        <table style="margin-bottom: 5px;">
									<tr style="margin-top: 10px; margin-bottom: 5px; border-top: solid 1px #E5E5E5">
										<td width="200px">
											<h6>${reportes4.descNombramiento}</h6>
										</td>
										<td width="20px" style="text-align: center;"><c:out value="${reportes4.idUsuaerio}"> </c:out></td>
										<td width="20px" style="text-align: center;"></td>
										<td width="20px" style="text-align: right;"><c:out value="${reportes4.sexo}"> </c:out></td>
										<td width="20px" style="text-align: center;"></td>
										<td width="200px" style="text-align: left;"> ${reportes4.nombre} ${reportes4.apPaterno} ${reportes4.apMaterno} </td>
										<td width="200px" style="text-align: right;"><c:out value="${reportes4.anios}"></c:out> Años experiencia laboral</td>
									</tr>
								</table>
							</c:forEach>
		               </div>
		           </div>
		           </div>
			</div>
			
			<div role="tabpanel" class="tab-pane" id="reporte6-tab-x">
				<div class="card">
		               <div class="header">
		                   <h5 class="title"><b>CÁLCULO DE TOTAL DE PROFESORES QUE PARTICIPAN EN CA, CLASIFICADOS POR TIPO DE PUESTO</b></h5>
		                   <p class="category">REPORTE 6</p>
		               </div>
		               
		               <div class="header">
		               <div class="content table-responsive table-full-width">
		               
		               	<h5 class="title"><b>DOCENTES CON CA</b></h5><br>
		               	
		               		<table style="margin-bottom: 5px;">
		               		
		               			<tr style="margin-top: 10px; margin-bottom: 15px; border-bottom: solid 1px #E5E5E5">
										<td width="200px">
											<h4>TIPO DE PUESTO</h4>
										</td>
										<td width="200px" style="text-align: right;"><h4>TOTAL CON CA</h4></td>
									</tr>
									
							<c:forEach items="${reportes6}" var="reportes6">
						        
									<tr style="margin-top: 10px; margin-bottom: 5px; border-top: solid 1px #E5E5E5">
										<td width="200px">
											<h6>${reportes6.descNombramiento}</h6>
										</td>
										<td width="200px" style="text-align: right;"><c:out value="${reportes6.total}"> </c:out></td>
									</tr>
								
							</c:forEach>
							</table>
		               </div>
		           </div>
		           </div>
			</div>
			
			
			<div role="tabpanel" class="tab-pane" id="reporte7-tab-x">
				<div class="card">
		               <div class="header">
		                   <h5 class="title"><b>CÁLCULO DE TOTAL DE PROFESORES QUE PARTICIPAN EN LINEAS DE GENERACIÓN O APLICACIÓN INNOVADORA DEL CONOCIMIENTO, CLASIFICADOS POR TIPO DE PUESTO.</b></h5>
		                   <p class="category">REPORTE 7</p>
		               </div>
		               
		               <div class="header">
		               <div class="content table-responsive table-full-width">
		               
		               	<h5 class="title"><b>DOCENTES CON LINEAS DE GENERACIÓN O APLICACIÓN INNOVADORA DEL CONOCIMIENTO</b></h5><br>
		               	
		               		<table style="margin-bottom: 5px;">
		               		
		               			<tr style="margin-top: 10px; margin-bottom: 15px; border-bottom: solid 1px #E5E5E5">
										<td width="200px">
											<h4>TIPO DE PUESTO</h4>
										</td>
										<td width="200px" style="text-align: right;"><h4>TOTAL</h4></td>
									</tr>
									
							<c:forEach items="${reportes7}" var="reportes7">
						        
									<tr style="margin-top: 10px; margin-bottom: 5px; border-top: solid 1px #E5E5E5">
										<td width="200px">
											<h6>${reportes7.descNombramiento}</h6>
										</td>
										<td width="200px" style="text-align: right;"><c:out value="${reportes7.total}"> </c:out></td>
									</tr>
								
							</c:forEach>
							</table>
		               </div>
		           </div>
		           </div>
			</div>
			
			
			<div role="tabpanel" class="tab-pane" id="reporte8-tab-x">
				<div class="card">
		               <div class="header">
		                   <h5 class="title"><b>CÁLCULO DE TOTAL DE PROFESORES REGISTRADOS EN EL SNI, CLASIFICADOS POR TIPO DE PUESTO.</b></h5>
		                   <p class="category">REPORTE 8</p>
		               </div>
		               
		               <div class="header">
		               <div class="content table-responsive table-full-width">
		               
		               	<h5 class="title"><b>DOCENTES CON REGISTRO SNI</b></h5><br>
		               	
		               		<table style="margin-bottom: 5px;">
		               		
		               			<tr style="margin-top: 10px; margin-bottom: 15px; border-bottom: solid 1px #E5E5E5">
										<td width="200px">
											<h4>TIPO DE PUESTO</h4>
										</td>
										<td width="200px" style="text-align: right;"><h4>TOTAL CON SNI</h4></td>
									</tr>
									
							<c:forEach items="${reportes8}" var="reportes8">
						        
									<tr style="margin-top: 10px; margin-bottom: 5px; border-top: solid 1px #E5E5E5">
										<td width="200px">
											<h6>${reportes8.descNombramiento}</h6>
										</td>
										<td width="200px" style="text-align: right;"><c:out value="${reportes8.total}"> </c:out></td>
									</tr>
								
							</c:forEach>
							</table>
		               </div>
		           </div>
		           </div>
			</div>
			
			<div role="tabpanel" class="tab-pane" id="reporte9-tab-x">
				<div class="card">
		               <div class="header">
		                   <h5 class="title"><b>CÁLCULO DE TOTAL DE PROFESORES CON PERFIL PROMEP, CLASIFICADOS POR TIPO DE PUESTO.</b></h5>
		                   <p class="category">REPORTE 9</p>
		               </div>
		               
		               <div class="header">
		               <div class="content table-responsive table-full-width">
		               
		               	<h5 class="title"><b>ROFESORES CON PERFIL PROMEP</b></h5><br>
		               	
		               		<table style="margin-bottom: 5px;">
		               		
		               			<tr style="margin-top: 10px; margin-bottom: 15px; border-bottom: solid 1px #E5E5E5">
										<td width="200px">
											<h4>TIPO DE PUESTO</h4>
										</td>
										<td width="200px" style="text-align: right;"><h4>TOTAL CON PERFIL PROMEP</h4></td>
									</tr>
									
							<c:forEach items="${reportes9}" var="reportes9">
						        
									<tr style="margin-top: 10px; margin-bottom: 5px; border-top: solid 1px #E5E5E5">
										<td width="200px">
											<h6>${reportes9.descNombramiento}</h6>
										</td>
										<td width="200px" style="text-align: right;"><c:out value="${reportes9.total}"> </c:out></td>
									</tr>
								
							</c:forEach>
							</table>
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
	
</t:DirectivoLayout>