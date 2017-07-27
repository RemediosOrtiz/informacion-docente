<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<t:admin_layout>
	<jsp:attribute name="viewtitlename">
     	<title>Admin - Materias</title>
    </jsp:attribute>

	<jsp:attribute name="viewuserrol">
     	Administrador
    </jsp:attribute>

	<jsp:attribute name="viewtitleseccion">
     	Materias
    </jsp:attribute>

	<jsp:attribute name="extracss"> </jsp:attribute>

	<jsp:attribute name="extrajs">
		
      	<!-- Modal de formulario para dar de alta a un Usuario -->
      	<div class="modal fade" id="modal-nueva-materia" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog modal-sm" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Asignar materia al grupo: ${grupo.nombreGrupo}</h4>
		      </div>
		      
		      <form action='<c:url value="/admin?accion=nueva-materia" />' method="POST">
		      <div class="modal-body">
		      
		      	<div class="row">
                    <div class="col-md-12">
                    
                       <input type="hidden" name="idMateria" class="idMateria" value="0" required/>
                       <input type="hidden" name="idGrupo" class="idGrupo" value="${grupo.idGrupo }" required/>
                       
						<div class="form-group">
							<label>Materia:</label>
							<select name="idMateriaC" class="idMateriaC form-control" required>
							
								<c:forEach items="${materiaCatalogo}" var="materiaCatalogo">
										<option value="${materiaCatalogo.idMateriaC}">${materiaCatalogo.nombreMateria}</option>
								</c:forEach>
							</select>
						</div>
						
						
						<div class="form-group">
							<label>Profesor de la materia:</label>
							<select name="idUsuario" class="idUsuario form-control" required>
								<c:forEach items="${usuarios}" var="usuario">
									<c:if test="${usuario.estatus == 1}">
										<c:if test="${usuario.idUsuarioRol == 4}">
											<option value="${usuario.idUsuario}">${usuario.contacto.nombre} ${usuario.contacto.apPaterno} ${usuario.contacto.apMaterno}</option>
										</c:if>
									</c:if>
								</c:forEach>
							</select>
						</div>
						
							
						<div class="form-group">
							<label>Horas a la Semana de la meteria:</label>
							<select name="horasGeneral" class="horasGeneral form-control" required>
							<c:forEach var = "i" begin = "0" end = "90">
						    	<c:choose>
									<c:when test="${i == 0}">
										<option value="${i}">Cero horas a la semana</option>
									</c:when>
									<c:when test="${i == 1}">
										<option value="${i}">${i} Hora</option>
									</c:when>
									<c:otherwise>
										<option value="${i}">${i} Horas</option>
									</c:otherwise>
								</c:choose>
					    	</c:forEach>
					    	</select>
						</div>
						
						<div class="form-group">
							<label>Horas a la Semana de apoyo:</label>
							<select name="horasApoyo" class="horasApoyo form-control" required>
							<c:forEach var = "i" begin = "0" end = "90">
						    	<c:choose>
									<c:when test="${i == 0}">
										<option value="${i}">Cero horas a la semana</option>
									</c:when>
									<c:when test="${i == 1}">
										<option value="${i}">${i} Hora</option>
									</c:when>
									<c:otherwise>
										<option value="${i}">${i} Horas</option>
									</c:otherwise>
								</c:choose>
					    	</c:forEach>
					    	</select>
						</div>
						
                  </div>
		      </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
		        <button type="submit" class="btn btn-primary">Crear materia</button>
		      </div>
		      </form>
		      
		      
		    </div>
		  </div>
		</div>

    </jsp:attribute>

	
	<jsp:body>
    
    <div class="container-fluid">
		   <div class="row">
		       <div class="col-md-12">
		       
    <div>
	    <ul class="nav nav-tabs" id="myTabs" role="tablist">
		    <li role="presentation" class="active">
		    	<a href="#admin-tab-x" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Materias</a>
		    </li>
		    <li role="presentation">
				<button type="button" class="btn btn-sm btn-link" data-toggle="modal" data-target="#modal-nueva-materia">Asignar Materia</button>
	    	</li>
	    </ul>
    
	    <!-- Tab panes -->
		  <div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="admin-tab-x">
				<div class="card">
		               <div class="header">
		                   <h4 class="title"><b>GRUPO: ${grupo.nombreGrupo}</b></h4></br>
		                   <h5 class="title"><b>Asesor:</b></h5>
		                   <p class="category"><b>
		                   	<c:forEach items="${usuarios}" var="usuario">
									<c:if test="${usuario.idUsuario == grupo.idUsuario}">
										${usuario.contacto.nombre} ${usuario.contacto.apPaterno} ${usuario.contacto.apMaterno}
									</c:if>
								</c:forEach>
		                   </b></p>
		                   <h5 class="title"><b>Carrera:</b></h5>
		                   <p class="category"><b>
		                   		<c:forEach items="${carreraCatalogo}" var="carreraCatalogo">
	                           		<c:if test="${carreraCatalogo.idCarreraC == grupo.idCarreraC}">
										${carreraCatalogo.nombreCarrera}
									</c:if>
								</c:forEach>
		                   </b></p>
		               </div>
		               <div class="content table-responsive table-full-width">
		                   <table class="table table-hover table-striped">
		                       <thead>
		                           <tr>
								        <th>No</th>
				                       	<th>Materia</th>
				                       	<th>Profesor asignado</th>
				                       	<th>Horas a la semana</th>
				                       	<th>Horas a la semana de apoyo</th>
			                       </tr>
					               </thead>
			                       <tbody>
			                       
			                       <c:set var="contadorGrupo" value="${0}"/>
			                       	<c:forEach var="materias" items="${materias}">
				                       		<tr>
					                           	<td><c:out value="${contadorGrupo+1}"/></td>
					                           	<td>
													<c:forEach items="${materiaCatalogo}" var="materiaCatalogo">
															<c:if test="${materias.idMateriaC == materiaCatalogo.idMateriaC}">
																<c:out value="${materiaCatalogo.nombreMateria}"/>
															</c:if>
													</c:forEach>
					                           	</td>
					                           	<td>
					                           		<c:forEach items="${usuarios}" var="usuario">
														<c:if test="${usuario.idUsuario == materias.idUsuario}">
															${usuario.contacto.nombre} ${usuario.contacto.apPaterno} ${usuario.contacto.apMaterno}
														</c:if>
													</c:forEach>
					                           	</td>
					                           	<td><c:out value="${materias.horasGeneral}"/> horas
					                           	</td>
					                           	<td><c:out value="${materias.horasApoyo}"/> horas
					                           	</td>
				                           </tr>
			                       	</c:forEach>
			                       	
		                       </tbody>
		                   </table>
		               </div>
		           </div>
			</div>
		  </div>
    </div>
    
    </div>
		  </div>
    </div>
</jsp:body>
	
</t:admin_layout>