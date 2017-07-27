<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<t:admin_layout>
	<jsp:attribute name="viewtitlename">
     	<title>Administrativo - Profesores</title>
    </jsp:attribute>

	<jsp:attribute name="viewuserrol">
     	Administrativo
    </jsp:attribute>

	<jsp:attribute name="viewtitleseccion">
     	Profesores
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
		
      	<!-- Modal de formulario para dar de alta a un Usuario -->
      	<div class="modal fade" id="modal-nuevo-usuario" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog modal-md" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        
		        <h4 class="modal-title" id="myModalLabel">
		        	<i class="pe-7s-add-user" style="font-size: 30px; font-weight: bolder; margin-top: -10px;"></i>
			        <b> NUEVO USUARIO</b>
		        </h4>
		      </div>
		      
		      <form action='<c:url value="/admin?accion=nueva-cuenta" />' method="POST">
		      <div class="modal-body">
		      
		      		<div class="content">
                                
                            <div class="row">
                                <div class="col-md-6">
                                
                                	<h5 style="margin-top: 0px;"><b>DATOS DE LA CUENTA</b></h5>
                                	
                                	<div class="form-group">
                                        <label for="id_usuario_rol">Rol de usuario</label>
                                        <select id="id_usuario_rol" name="id_usuario_rol" class="form-control" required>
										  <c:forEach items="${usuariosRolCatalogo}" var="usuarioRolCatalogo">
											<option value="${usuarioRolCatalogo.idUsuarioRol}">${usuarioRolCatalogo.descRol}</option>
										</c:forEach>
										</select>
                                    </div>

                                    <div class="form-group">
                                        <label for="matricula">Matricula</label>
                                        <input type="number" id="matricula" name="matricula" class="form-control" placeholder="Ingrea la matricula unica del usuario" minlength="10" required/>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Contraseña</label>
                                        <input type="password" id="password" name="password" class="form-control" placeholder="Ingresa la contraseña" minlength="8" maxlength="12" required/>
                                    </div>
                                    <div class="form-group">
                                        <label for="password-confirmar">Confirmar contraseña</label>
                                        <input type="password" id="password-confirmar" name="password-confirmar" class="form-control" placeholder="Ingresa nuevamente la contraseña" minlength="8" required/>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="estatus">Estatus del usuario</label>
                                        <select id="estatus" name="estatus" class="form-control" required>
									  <option value="1">Activo</option>
									  <option value="0">Inactivo</option>
									</select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                	
                                	<h5 style="margin-top: 0px;"><b>DATOS DEL USUARIO</b></h5>
                                	
                                    <div class="form-group">
                                        <label for="nombre">Nombre</label>
                                        <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Nombre del usuario" required/>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="apPaterno">Apellido Paterno</label>
                                        <input type="text" id="apPaterno" name="apPaterno" class="form-control" placeholder="Apellido paterno del usuario" required/>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="apMaterno">Apellido Materno</label>
                                        <input type="text" id="apMaterno" name="apMaterno" class="form-control" placeholder="Apellido materno del usuario"/>
                                    </div>
                                    
                                     <div class="form-group">
                                        <label for="sexo">Sexo</label>
                                        <select id="sexo" name="sexo" class="form-control" required>
										  <option value="Hombre">Hombre</option>
										  <option value="Mujer">Mujer</option>
										</select>
                                    </div>
                                    
                                </div>
                            </div>
                        
                    </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
		        <button type="submit" class="btn btn-primary">Crear usuario</button>
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
		    
		    <li role="presentation" class="">
		    	<a href="#docen-tab-x" role="tab" id="profile-tab" data-toggle="tab" aria-controls="docen-tab-x" aria-expanded="true">Docente</a>
		    </li>
	    </ul>
    
	    <!-- Tab panes -->
		  <div class="tab-content">
			<div role="tabpanel" class="tab-pane" id="admin-tab-x">
				<div class="card">
		               <div class="header">
		                   <h4 class="title"><b>ADMINISTRADORES</b></h4>
		                   <p class="category">Usuarios Administradores</p>
		               </div>
		               <div class="content table-responsive table-full-width">
		                   <table class="table table-hover table-striped">
		                       <thead>
		                           <tr>
								        <th>No</th>
				                       	<th>Matricula</th>
				                       	<th>Nombre</th>
				                       	<th>Apellidos</th>
				                       	<th>Rol</th>
				                       	<th></th>
			                       </tr>
					               </thead>
			                       <tbody>
			                       
			                       <c:set var="contadorAdmin" scope="session" value="${0}"/>
			                       	<c:forEach var="usuario" items="${usuarios}">
				                       	<c:if test="${usuario.idUsuarioRol == 1}">
				                       		<tr>
					                           	<td><c:out value = "${contadorAdmin+1}"/></td>
					                           	<td><c:out value="${usuario.matricula}"/></td>
					                           	<td><c:out value="${usuario.contacto.nombre}"/></td>
					                           	<td><c:out value="${usuario.contacto.apPaterno}"/> <c:out value="${usuario.contacto.apMaterno}"/></td>
					                           	<td><c:out value="${usuario.usuarioRol.descRol}"/></td>
					                           	<td>
													<c:url value="/admin" var="urlModificarUsuario">
					                           			<c:param name="accion" value="modificar-usuario" />
													    <c:param name="id-usuario" value="${usuario.idUsuario}" />
													</c:url>
													<a href="${urlModificarUsuario}" class="btn btn-sm btn-primary">Consultar / Modificar</a>
					                           	</td>
				                           </tr>
				                       	</c:if>
			                       	</c:forEach>
			                       	
		                       </tbody>
		                   </table>
		               </div>
		           </div>
			</div>
			<div role="tabpanel" class="tab-pane" id="administrativo-tab-x">
				<div class="card">
		               <div class="header">
		                   <h4 class="title"><b>ADMINISTRATIVO</b></h4>
		                   <p class="category">Usuarios Administrativo</p>
		               </div>
		               <div class="content table-responsive table-full-width">
		                   <table class="table table-hover table-striped">
		                       <thead>
		                           <tr>
								        <th>No</th>
				                       	<th>Matricula</th>
				                       	<th>Nombre</th>
				                       	<th>Apellidos</th>
				                       	<th>Rol</th>
				                       	<th></th>
			                       </tr>
					               </thead>
			                       <tbody>
			                       
			                       <c:set var="contadorAdmin" scope="session" value="${0}"/>
			                       	<c:forEach var="usuario" items="${usuarios}">
				                       	<c:if test="${usuario.idUsuarioRol == 6}">
				                       		<tr>
					                           	<td><c:out value = "${contadorAdmin+1}"/></td>
					                           	<td><c:out value="${usuario.matricula}"/></td>
					                           	<td><c:out value="${usuario.contacto.nombre}"/></td>
					                           	<td><c:out value="${usuario.contacto.apPaterno}"/> <c:out value="${usuario.contacto.apMaterno}"/></td>
					                           	<td><c:out value="${usuario.usuarioRol.descRol}"/></td>
					                           	<td>
													<c:url value="/admin" var="urlModificarUsuario">
					                           			<c:param name="accion" value="modificar-usuario" />
													    <c:param name="id-usuario" value="${usuario.idUsuario}" />
													</c:url>
													<a href="${urlModificarUsuario}" class="btn btn-sm btn-primary">Consultar / Modificar</a>
					                           	</td>
				                           </tr>
				                       	</c:if>
			                       	</c:forEach>
			                       	
		                       </tbody>
		                   </table>
		               </div>
		           </div>
			</div>
			<div role="tabpanel" class="tab-pane" id="direc-tab-x">
				<div class="card">
		               <div class="header">
		                   <h4 class="title"><b>DIRECTIVOS</b></h4>
		                   <p class="category">Usuarios Directivos</p>
		               </div>
		               <div class="content table-responsive table-full-width">
		                    <table class="table table-hover table-striped">
		                       <thead>
		                           <tr>
								        <th>No</th>
				                       	<th>Matricula</th>
				                       	<th>Nombre</th>
				                       	<th>Apellidos</th>
				                       	<th>Rol</th>
				                       	<th></th>
			                       </tr>
					               </thead>
			                       <tbody>
			                       
			                       <c:set var="contadorDirectivo" scope="session" value="${0}"/>
			                       	<c:forEach var="usuario" items="${usuarios}">
				                       	<c:if test="${usuario.idUsuarioRol == 2}">
				                       		<tr>
					                           	<td><c:out value = "${contadorDirectivo+1}"/></td>
					                           	<td><c:out value="${usuario.matricula}"/></td>
					                           	<td><c:out value="${usuario.contacto.nombre}"/></td>
					                           	<td><c:out value="${usuario.contacto.apPaterno}"/> <c:out value="${usuario.contacto.apMaterno}"/></td>
					                           	<td><c:out value="${usuario.usuarioRol.descRol}"/></td>
					                           	<td>
													<c:url value="/admin" var="urlModificarUsuario">
					                           			<c:param name="accion" value="modificar-usuario" />
													    <c:param name="id-usuario" value="${usuario.idUsuario}" />
													</c:url>
													<a href="${urlModificarUsuario}" class="btn btn-sm btn-primary">Consultar / Modificar</a>
					                           	</td>
				                           </tr>
				                       	</c:if>
			                       	</c:forEach>
			                       	
		                       </tbody>
		                   </table>
		
		               </div>
		           </div>
			</div>
			<div role="tabpanel" class="tab-pane" id="secreta-tab-x">
				<div class="card">
		               <div class="header">
		                   <h4 class="title"><b>SECRETARIAS</b></h4>
		                   <p class="category">Usuarios Secretarias</p>
		               </div>
		               <div class="content table-responsive table-full-width">
		                    <table class="table table-hover table-striped">
		                       <thead>
		                           <tr>
								        <th>No</th>
				                       	<th>Matricula</th>
				                       	<th>Nombre</th>
				                       	<th>Apellidos</th>
				                       	<th>Rol</th>
				                       	<th></th>
			                       </tr>
					               </thead>
			                       <tbody>
			                       
			                       <c:set var="contadorSecretarias" scope="session" value="${0}"/>
			                       	<c:forEach var="usuario" items="${usuarios}">
				                       	<c:if test="${usuario.idUsuarioRol == 3}">
				                       		<tr>
					                           	<td><c:out value = "${contadorSecretarias+1}"/></td>
					                           	<td><c:out value="${usuario.matricula}"/></td>
					                           	<td><c:out value="${usuario.contacto.nombre}"/></td>
					                           	<td><c:out value="${usuario.contacto.apPaterno}"/> <c:out value="${usuario.contacto.apMaterno}"/></td>
					                           	<td><c:out value="${usuario.usuarioRol.descRol}"/></td>
					                           	<td>
													<c:url value="/admin" var="urlModificarUsuario">
					                           			<c:param name="accion" value="modificar-usuario" />
													    <c:param name="id-usuario" value="${usuario.idUsuario}" />
													</c:url>
													<a href="${urlModificarUsuario}" class="btn btn-sm btn-primary">Consultar / Modificar</a>
					                           	</td>
				                           </tr>
				                       	</c:if>
			                       	</c:forEach>
			                       	
		                       </tbody>
		                   </table>
		
		               </div>
		           </div>
			</div>
			<div role="tabpanel" class="tab-pane active" id="docen-tab-x">
				<div class="card">
		               <div class="header">
		                   <h4 class="title"><b>DOCENTES</b></h4>
		                   <p class="category">Usuarios Docentes</p>
		               </div>
		               <div class="content table-responsive table-full-width">
		                    <table class="table table-hover table-striped">
		                       <thead>
		                           <tr>
								        <th>No</th>
				                       	<th>Matricula</th>
				                       	<th>Nombre</th>
				                       	<th>Apellidos</th>
				                       	<th>Rol</th>
				                       	<th></th>
			                       </tr>
					               </thead>
			                       <tbody>
			                       
			                       <c:set var="contadorDocentes" scope="session" value="${0}"/>
			                       	<c:forEach var="usuario" items="${usuarios}">
				                       	<c:if test="${usuario.idUsuarioRol == 4}">
				                       		<tr>
					                           	<td><c:out value = "${contadorDocentes+1}"/></td>
					                           	<td><c:out value="${usuario.matricula}"/></td>
					                           	<td><c:out value="${usuario.contacto.nombre}"/></td>
					                           	<td><c:out value="${usuario.contacto.apPaterno}"/> <c:out value="${usuario.contacto.apMaterno}"/></td>
					                           	<td><c:out value="${usuario.usuarioRol.descRol}"/></td>
					                           	<td>
													<c:url value="/admin" var="urlModificarUsuario">
					                           			<c:param name="accion" value="consultar-usuario" />
													    <c:param name="id-usuario" value="${usuario.idUsuario}" />
													</c:url>
													<a href="${urlModificarUsuario}" class="btn btn-sm btn-primary">Consultar</a>
					                           	</td>
				                           </tr>
				                       	</c:if>
			                       	</c:forEach>
			                       	
		                       </tbody>
		                   </table>
		
		               </div>
		           </div>
			</div>
			<div role="tabpanel" class="tab-pane" id="labora-tab-x">
				<div class="card">
		               <div class="header">
		                   <h4 class="title"><b>LABORATORISTAS</b></h4>
		                   <p class="category">Usuarios Administradores</p>
		               </div>
		               <div class="content table-responsive table-full-width">
		                    <table class="table table-hover table-striped">
		                       <thead>
		                           <tr>
								        <th>No</th>
				                       	<th>Matricula</th>
				                       	<th>Nombre</th>
				                       	<th>Apellidos</th>
				                       	<th>Rol</th>
				                       	<th></th>
			                       </tr>
					               </thead>
			                       <tbody>
			                       
			                       <c:set var="contadorLaboratoristas" scope="session" value="${0}"/>
			                       	<c:forEach var="usuario" items="${usuarios}">
				                       	<c:if test="${usuario.idUsuarioRol == 5}">
				                       		<tr>
					                           	<td><c:out value = "${contadorLaboratoristas+1}"/></td>
					                           	<td><c:out value="${usuario.matricula}"/></td>
					                           	<td><c:out value="${usuario.contacto.nombre}"/></td>
					                           	<td><c:out value="${usuario.contacto.apPaterno}"/> <c:out value="${usuario.contacto.apMaterno}"/></td>
					                           	<td><c:out value="${usuario.usuarioRol.descRol}"/></td>
					                           	<td>
													<c:url value="/admin" var="urlModificarUsuario">
					                           			<c:param name="accion" value="modificar-usuario" />
													    <c:param name="id-usuario" value="${usuario.idUsuario}" />
													</c:url>
													<a href="${urlModificarUsuario}" class="btn btn-sm btn-primary">Consultar / Modificar</a>
					                           	</td>
				                           </tr>
				                       	</c:if>
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