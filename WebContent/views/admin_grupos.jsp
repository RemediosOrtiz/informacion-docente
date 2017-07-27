<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<t:admin_layout>
	<jsp:attribute name="viewtitlename">
     	<title>Admin - Grupos</title>
    </jsp:attribute>

	<jsp:attribute name="viewuserrol">
     	Administrador
    </jsp:attribute>

	<jsp:attribute name="viewtitleseccion">
     	Grupos
    </jsp:attribute>

	<jsp:attribute name="extracss"> </jsp:attribute>

	<jsp:attribute name="extrajs">
		
      	<!-- Modal de formulario para dar de alta a un Usuario -->
      	<div class="modal fade" id="modal-nuevo-grupo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog modal-sm" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">GRUPO</h4>
		      </div>
		      
		      <form action='<c:url value="/admin?accion=nuevo-grupo" />' method="POST">
		      <div class="modal-body">
		      
		      	<div class="row">
                    <div class="col-md-12">
                       
                       <input type="hidden" name="idGrupo" class="idGrupo" value="0" required/>
                       <input type="hidden" name="nombreGrupo" class="nombreGrupo" value="0" required/>
                       
		               <div class="form-group">
							<label>Número Cuatrimestre:</label>
							<select name="idCuatriC" class="idCuatriC form-control" required>
								<c:forEach items="${cuatriCatalogo}" var="cuatriCatalogo">
									<option value="${cuatriCatalogo.idCuatriC}">${cuatriCatalogo.idCuatriC}</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="form-group">
							<label>Carrera:</label>
							<select name="idCarreraC" class="idCarreraC form-control" required>
								<c:forEach items="${carreraCatalogo}" var="carreraCatalogo">
									<option value="${carreraCatalogo.idCarreraC}">${carreraCatalogo.acronimoCarrera} - ${carreraCatalogo.nombreCarrera} - ${carreraCatalogo.nivelEstudio}</option>
								</c:forEach>
							</select>
						</div>
						
						
						<div class="form-group">
							<label>Número del grupo:</label>
							<select name="idGrupoC" class="idGrupoC form-control" required>
								<c:forEach items="${grupoCatalogo}" var="grupoCatalogo">
									<option value="${grupoCatalogo.idGrupoC}">${grupoCatalogo.idGrupoC}</option>
								</c:forEach>
							</select>
						</div>
						
						
						<div class="form-group">
							<label>Asesor del grupo:</label>
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
						
                  </div>
		      </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
		        <button type="submit" class="btn btn-primary">Crear grupo</button>
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
		    	<a href="#admin-tab-x" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Grupos</a>
		    </li>
		    <li role="presentation">
				<button type="button" class="btn btn-sm btn-link" data-toggle="modal" data-target="#modal-nuevo-grupo">Nuevo Grupo</button>
	    	</li>
	    </ul>
    
	    <!-- Tab panes -->
		  <div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="admin-tab-x">
				<div class="card">
		               <div class="header">
		                   <h4 class="title"><b>GRUPOS</b></h4>
		                   <p class="category">Todos los grupos</p>
		               </div>
		               <div class="content table-responsive table-full-width">
		                   <table class="table table-hover table-striped">
		                       <thead>
		                           <tr>
								        <th>No</th>
				                       	<th>Grupo</th>
				                       	<th>Asesor</th>
				                       	<th>Carrera</th>
				                       	<th></th>
			                       </tr>
					               </thead>
			                       <tbody>
			                       
			                       <c:set var="contadorGrupo" value="${0}"/>
			                       	<c:forEach var="grupo" items="${grupos}">
				                       		<tr>
					                           	<td><c:out value="${contadorGrupo+1}"/></td>
					                           	<td><c:out value="${grupo.nombreGrupo}"/></td>
					                           	<td>
					                           		<c:forEach items="${usuarios}" var="usuario">
														<c:if test="${usuario.idUsuario == grupo.idUsuario}">
															${usuario.contacto.nombre} ${usuario.contacto.apPaterno} ${usuario.contacto.apMaterno}
														</c:if>
													</c:forEach>
					                           	</td>
					                           	<td>
						                           	<c:forEach items="${carreraCatalogo}" var="carreraCatalogo">
						                           		<c:if test="${carreraCatalogo.idCarreraC == grupo.idCarreraC}">
															${carreraCatalogo.nombreCarrera}
														</c:if>
													</c:forEach>
					                           	</td>
					                           	<td>
													<c:url value="/admin" var="urlConsultarGrupo">
					                           			<c:param name="accion" value="consultar-grupo" />
													    <c:param name="id-grupo" value="${grupo.idGrupo}" />
													</c:url>
													<a href="${urlConsultarGrupo}" class="btn btn-sm btn-primary">Consultar grupo</a>
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