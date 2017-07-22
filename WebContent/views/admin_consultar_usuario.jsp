<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<t:admin_layout>
	<jsp:attribute name="viewtitlename">
     	<title>Admin - Consultar Usuario</title>
    </jsp:attribute>

	<jsp:attribute name="viewuserrol">
     	Administrador
    </jsp:attribute>

	<jsp:attribute name="viewtitleseccion">
     	Consultar Usuario
    </jsp:attribute>

	<jsp:attribute name="extracss"> </jsp:attribute>
	
	<jsp:attribute name="extrajs">

	<!-- Script AJAX para actualizar la cuenta -->
	<script src='<c:url value="assets/js/cuenta.js"></c:url>'></script>
	
	<!-- Script AJAX para actualizar el contacto -->
	<script src='<c:url value="assets/js/contacto.js"></c:url>'></script>
	
	<!-- Scrip AJAX para actualizar direccion -->
	<script src='<c:url value="assets/js/direccion.js"></c:url>'></script>
	
	
    
    <!-- MODAL PARA ACTUALIZAR CUENTA -->  	
    <div class="modal fade" id="modal-cuenta" tabindex="-1" role="dialog" aria-labelledby="modal-cuenta">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">
				<b>DATOS DE LA CUENTA</b>
				</h4>
			</div>
			
			<form action='<c:url value="/cuenta-ajax?accion=actualizar-usuario" />' method="POST" id="form-usuario" name="form-usuario">
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
						
						<input type="hidden" name="id_usuario" value="${usuario.idUsuario}">
						
							<div class="form-group">
								<label>Rol de usuario</label>
								<select name="id-usuario-rol" class="id-usuario-rol form-control" required>
									<c:forEach items="${usuariosRolCatalogo}" var="usuarioRolCatalogo">
										<option value="${usuarioRolCatalogo.idUsuarioRol}">${usuarioRolCatalogo.descRol}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label>Matricula</label>
								<input type="text" name="matricula" class="matricula form-control" placeholder="Ingrea la matricula unica del usuario" minlength="10" required/>
							</div>
							<div class="form-group">
								<label>Contraseña</label>
								<input type="password" name="password" class="password form-control" placeholder="Ingresa la contraseña" minlength="8" maxlength="12" required/>
							</div>
							<div class="form-group">
								<label>Confirmar contraseña</label>
								<input type="password" name="password-confirmar" class="password-confirmar form-control" placeholder="Ingresa nuevamente la contraseña" minlength="8" required/>
							</div>
							
							<div class="form-group">
								<label>Estatus del usuario</label>
								<select name="estatus" class="estatus form-control" required>
									<option value="1">Activo</option>
									<option value="0">Inactivo</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="cerrar-form-usuario" class="btn btn-default" data-dismiss="modal">Cerrar</button>
					<button type="button" id="guardar-form-usuario" class="btn btn-primary">Guardar</button>
				</div>
			</form>
		</div>
	</div>
</div> <!-- FIN MODAL PARA ACTUALIZAR CUENTA -->


<!-- MODAL PARA ACTUALIZAR CONTACTO -->
<div class="modal fade" id="modal-contacto" tabindex="-1" role="dialog" aria-labelledby="modal-contacto">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">
				<b>DATOS DEL CONTACTO</b>
				</h4>
			</div>
			<form action='<c:url value="/cuenta-ajax?accion=actualizar-contacto" />' method="POST" id="form-contacto" name="form-contacto">
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
						
						<input type="hidden" name="id_contacto" class="id_contacto" value="${usuario.contacto.idContacto}">

							<div class="form-group">
								<label>Nombre</label>
								<input type="text" name="nombre" class="nombre form-control" placeholder="Ingresa el nombre del contacto" />
							</div>
							<div class="form-group">
								<label>Apellido Paterno</label>
								<input type="text" name="apPaterno" class="apPaterno form-control" placeholder="Ingresa el apellido paterno" />
							</div>
							<div class="form-group">
								<label>Apellido Materno</label>
								<input type="text" name="apMaterno" class="apMaterno form-control" placeholder="Ingresa el apellido materno" />
							</div>
							
							<div class="form-group">
								<label>Fecha de nacimiento</label>
							      <input type="text" name="fNacimiento" id="fNacimientoContacto" class="fNacimiento form-control" placeholder="Ingresa la fecha de nacimiento" readonly="readonly">
						    </div>
							
							<div class="form-group">
								<label>Sexo</label>
								<select name="sexo" class="sexo form-control" required>
									<option value="Hombre">Hombre</option>
									<option value="Mujer">Mujer</option>
								</select>
							</div>
							
							<div class="form-group">
							  <label for="comment">Discapacidad</label>
							  <textarea name="discapacidad" class="discapacidad form-control" rows="5" placeholder="Si tienes una discapacidad, por favor ingresala."></textarea>
							</div>
							
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="cerrar-form-contacto" class="btn btn-default" data-dismiss="modal">Cerrar</button>
					<button type="button" id="guardar-form-contacto" class="btn btn-primary">Guardar</button>
				</div>
			</form>
		</div>
	</div>
</div><!-- FIN MODAL PARA ACTUALIZAR CONTACTO -->




<!-- MODAL PARA DIRECCIONES -->
<div class="modal fade" id="modal-direccion" tabindex="-1" role="dialog" aria-labelledby="modal-direccion">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">
				<b>DATOS DE LA DIRECCIÓN</b>
				</h4>
			</div>
			<form action='<c:url value="/cuenta-ajax?accion=" />' method="POST" id="form-direccion" name="form-direccion">
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
						
						<input type="hidden" name="idDireccion" class="idDireccion">
						<input type="hidden" name="idContacto" class="idContacto">
						
							<div class="form-group">
								<label>Tipo de dirección</label>
								<select name="idTipoLugar" class="idTipoLugar form-control" required>
									<c:forEach items="${tipoLugarCatalogo}" var="tipoLugarCatalogo">
										<option value="${tipoLugarCatalogo.idTipoLugar}">${tipoLugarCatalogo.descLugar}</option>
									</c:forEach>
								</select>
							</div>
							
							<div class="form-group">
								<label>Calle</label>
								<input type="text" name="calle" class="calle form-control" placeholder="Ingresa el nombre de la calle" />
							</div>

							<div class="form-group">
								<label>Número</label>
								<input type="text" name="numero" class="numero form-control" placeholder="Ingresa el número de la calle" />
							</div>
							
							<div class="form-group">
								<label>Código Postal</label>
								<input type="text" name="cp" class="cp form-control" placeholder="Ingresa el código postal" />
							</div>
							
							
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="cerrar-form-direccion" class="btn btn-default" data-dismiss="modal">Cerrar</button>
					<button type="button" id="guardar-form-direccion" class="btn btn-primary">Guardar</button>
					<button type="button" id="actualizar-form-direccion" class="btn btn-primary">Actualizar</button>
				</div>
			</form>
		</div>
	</div>
</div><!-- FIN MODAL PARA DIRECCIONES -->
	
</jsp:attribute>



<jsp:body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="header">
					<h4 class="title" style="font-weight: bolder;">
					<img class="avatar border-gray" src="assets/img/faces/1-hombre.png" alt="...">
					Información del usuario <c:out value="${usuario.contacto.nombre}"/> <c:out value="${usuario.contacto.apPaterno}"/> <c:out value="${usuario.contacto.apMaterno}"/>
					</h4>
					
				</div>
				
				
				<div class="header">
					<h5 class="title" style="font-weight: bolder;">CUENTA</h5>
				</div>
				<div class="content">
					
					<div class="contenedor-cuenta">
						<table>
							<tr>
								<td style="font-weight: bolder; padding-right: 20px;">Tipo Usuario: </td>
								<td>
									<c:forEach var="usuarioRolCatalogo" items="${usuariosRolCatalogo}">
									<c:if test="${usuario.idUsuarioRol == usuarioRolCatalogo.idUsuarioRol}">
									<c:out value="${usuarioRolCatalogo.descRol}"></c:out>
									</c:if>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td style="font-weight: bolder; padding-right: 20px;">Matricula:</td>
								<td class="matricula"><c:out value="${usuario.matricula}"></c:out></td>
							</tr>
							<tr>
								<td style="font-weight: bolder; padding-right: 20px;">Password:</td>
								<td>**********</td>
							</tr>
							<tr>
								<td style="font-weight: bolder; padding-right: 20px;">Estatus:</td>
								<td>
									<c:choose>
									<c:when test="${usuario.estatus == 1}">Activo</c:when>
									<c:otherwise>Inactivo</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</table>
						
					</div>
					
					
					<c:if test="${requestScope.isModificable == 1 }">
						<div style="width100%; text-align: right;">
							<a href="#" class="btn-get-cuenta-x btn btn-sm btn-primary" data-toggle="modal" data-target="#modal-cuenta">Modificar cuenta</a>
						</div>
					</c:if>
				</div>
				
				
				<!-- CONTACTO -->
				<div class="header">
					<h5 class="title" style="font-weight: bolder;">CONTACTO</h5>
				</div>
				<div class="content">
					
					<div class="contenedor-cuenta">
						<table>
							<tr>
								<td style="font-weight: bolder; padding-right: 20px;">Nombre:</td>
								<td class="nombre"><c:out value="${usuario.contacto.nombre}"></c:out></td>
							</tr>
							<tr>
								<td style="font-weight: bolder; padding-right: 20px;">Apellido Paterno:</td>
								<td class="apPaterno"><c:out value="${usuario.contacto.apPaterno}"></c:out></td>
							</tr>
							<tr>
								<td style="font-weight: bolder; padding-right: 20px;">Apellido Materno:</td>
								<td class="apMaterno"><c:out value="${usuario.contacto.apMaterno}"></c:out></td>
							</tr>
							<tr>
								<td style="font-weight: bolder; padding-right: 20px;">Sexo:</td>
								<td class="sexo"><c:out value="${usuario.contacto.sexo}"></c:out></td>
							</tr>
							<tr>
								<td style="font-weight: bolder; padding-right: 20px;">Fecha de nacimiento:</td>
								<td class="fNacimiento"><c:out value="${usuario.contacto.fNacimiento}"></c:out></td>
							</tr>
							<tr>
								<td style="font-weight: bolder; padding-right: 20px;">Discapacidad:</td>
								<td class="discapacidad">
								
									<c:choose>
									    <c:when test="${usuario.contacto.discapacidad == null}">
									        El Usuario no tiene niguna discapacidad 
									    </c:when>
									    <c:when test="${usuario.contacto.discapacidad == ''}">
									        El Usuario no tiene niguna discapacidad 
									    </c:when>
									    <c:otherwise>
									        <c:out value="${usuario.contacto.discapacidad}"></c:out>
									    </c:otherwise>
									</c:choose>
								</td>
							</tr>
						</table>
					</div>
					
					<c:if test="${requestScope.isModificable == 1 }">
						<div style="width100%; text-align: right;">
							<a href="#" class="btn-get-contacto-x btn btn-sm btn-primary" data-toggle="modal" data-target="#modal-contacto">Modificar contacto</a>
						</div>
					</c:if>
				</div>
				
				<!-- DIRECCION -->
				<div class="header">
					<h5 class="title" style="font-weight: bolder;">DIRECCIÓN</h5>
				</div>
				
				<div class="content contenedor-direccion-base">
				
					<c:choose>
						<c:when test="${fn:length(direcciones) gt 0}">
							<c:forEach items="${direcciones}" var="direcciones">
							<div class="contenedor-direccion" style="border-bottom: solid 1px #E3E3E5; padding-bottom: 10px; margin-bottom: 10px;">
								<table>
									<tr>
										<td style="font-weight: bolder; padding-right: 20px;">Lugar:</td>
										<td class="lugar">
											<c:forEach items="${tipoLugarCatalogo}" var="tipoLugarCatalogo">
												<c:if test="${tipoLugarCatalogo.idTipoLugar == direcciones.idTipoLugar }">
													<c:out value="${tipoLugarCatalogo.descLugar}"></c:out>
												</c:if>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<td style="font-weight: bolder; padding-right: 20px;">Calle:</td>
										<td class="calle"><c:out value="${direcciones.calle}"></c:out></td>
									</tr>
									<tr>
										<td style="font-weight: bolder; padding-right: 20px;">Número:</td>
										<td class="numero"><c:out value="${direcciones.numero}"></c:out></td>
									</tr>
									<tr>
										<td style="font-weight: bolder; padding-right: 20px;">CP:</td>
										<td class="cp"><c:out value="${direcciones.cp}"></c:out></td>
									</tr>
								</table>
						
							<c:if test="${requestScope.isModificable == 1 }">
								<div style="width100%; text-align: right;">
									<a href="#!" class="btn-get-direccion-actualizar btn btn-sm btn-primary btn-modificar-direccion"" data-toggle="modal" data-target="#modal-direccion" data-id-direccion="${direcciones.idDireccion}">Modificar</a>
									<a href="#!" class="btn-get-direccion-eliminar btn btn-sm btn-danger" data-id-direccion="${direcciones.idDireccion}">Eliminar</a>
								</div>
							</c:if>
					</div>
									
							</c:forEach>
						</c:when>
						<c:otherwise>
							<p>El usuario no tiene aún direcciones registradas</p>
						</c:otherwise>
					</c:choose>
					
					<c:if test="${requestScope.isModificable == 1 }">
						<br/>
						<div style="width100%; text-align: right;">
							<a href="#" class="btn btn-sm btn-primary btn-crear-direccion" data-toggle="modal" data-target="#modal-direccion" data-id-contacto="${usuario.contacto.idContacto}">Nueva dirección</a>
						</div>
					</c:if>
					
				</div>
				
			</div>
		</div>
	</div>
</div>

</jsp:body>

</t:admin_layout>