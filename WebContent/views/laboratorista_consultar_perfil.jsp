<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<t:LaboratoristaLayout>
	<jsp:attribute name="viewtitlename">
     	<title>Laboratorista - Consultar Usuario</title>
    </jsp:attribute>

	<jsp:attribute name="viewuserrol">
     	Laboratorista
    </jsp:attribute>

	<jsp:attribute name="viewtitleseccion">
     	Usuario
    </jsp:attribute>

	<jsp:attribute name="extracss"> </jsp:attribute>
	
	<jsp:attribute name="extrajs">

	<!-- Script AJAX para actualizar la cuenta -->
	<script src='<c:url value="assets/js/cuenta.js"></c:url>'></script>
	
	<!-- Script AJAX para actualizar el contacto -->
	<script src='<c:url value="assets/js/contacto.js"></c:url>'></script>
	
	<!-- Scrip AJAX para actualizar direccion -->
	<script src='<c:url value="assets/js/direccion.js"></c:url>'></script>
	
	<!-- Scrip AJAX para actualizar direccion -->
	<script src='<c:url value="assets/js/docente-laboral.js"></c:url>'></script>
	
	
    
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
						
							<div class="form-group" style="display: none;">
								<label>Rol de usuario</label>
								<select name="id-usuario-rol" class="id-usuario-rol form-control" required>
									<c:forEach items="${usuariosRolCatalogo}" var="usuarioRolCatalogo">
										<option value="${usuarioRolCatalogo.idUsuarioRol}">${usuarioRolCatalogo.descRol}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group" style="display: none;">
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
							
							<div class="form-group" style="display: none;">
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




<!-- MODAL PARA INFORMACION DOCENTE -->
<div class="modal fade" id="modal-info-docente" tabindex="-1" role="dialog" aria-labelledby="modal-direccion">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">
				<b>INFORMACIÓN DOCENTE</b>
				</h4>
			</div>
			<form action='<c:url value="/cuenta-ajax?accion=" />' method="POST" id="form-info-docente" name="form-info-docente">
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
						
						<input type="hidden" name="idUsuario" class="idUsuario">
						<input type="hidden" name="alertOpcionActializar" class="alertOpcionActializar" value="0">
						
							<div class="form-group">
								<label>Carrera:</label>
								<select name="idCarreraC" class="idCarreraC form-control" required>
									<c:forEach items="${carreraCatalogo}" var="carreraCatalogo">
										<option value="${carreraCatalogo.idCarreraC}">${carreraCatalogo.acronimoCarrera} - ${carreraCatalogo.nombreCarrera}</option>
									</c:forEach>
								</select>
							</div>
							
							
							<!-- especialidadDesc -->
							<div class="form-group">
								<label>Nivel de Estudios:</label>
								<select name="idNivelEstudio" class="idNivelEstudio form-control" required>
									<c:forEach items="${nivelEstudioCatalogo}" var="nivelEstudioCatalogo">
										<option value="${nivelEstudioCatalogo.idNivelEstudioC}">${nivelEstudioCatalogo.descNivelEstudio}</option>
									</c:forEach>
								</select>
							</div>
							
							<div class="form-group idNivelEstudio-div" style="display: none">
								<label>Nombre especialidad:</label>
								<input type="text" name="especialidadDesc" class="especialidadDesc form-control" placeholder="Nombre de la especialidad" />
							</div>


							<!-- reconocimientoPerfilPromepSep -->
							<div class="form-group">
								<label>Reconocimiento Perfil PROMEP-SEP:</label>
								<select name="reconocimientoPerfilPromepSep" class="reconocimientoPerfilPromepSep form-control" required>
									<option value="0">No</option>
									<option value="1">Si</option>
								</select>
							</div>
							
							<div class="form-group reconocimientoPerfilPromepSep-div" style="display: none">
								<label>Ingresar PROMEP-SEP:</label>
								<input type="text" name="reconocimientoPerfilPromepSepDesc" class="reconocimientoPerfilPromepSepDesc form-control" placeholder="Ingresa Reconocimiento Perfil PROMEP-SEP" />
							</div>
							
							
							<!-- perteneceCA -->
							<div class="form-group">
								<label>Pertenece a CA:</label>
								<select name="perteneceCA" class="perteneceCA form-control" required>
									<option value="0">No</option>
									<option value="1">Si</option>
								</select>
							</div>
							
							<div class="form-group perteneceCA-div" style="display: none">
								<label>Ingresar CA:</label>
								<input type="text" name="perteneceCADesc" class="perteneceCADesc form-control" placeholder="Ingresa CA" />
							</div>
							
							
							<!-- innovadoraConocimiento -->
							<div class="form-group">
								<label>Líneas de generación o Aplicación innovadora del conocimiento:</label>
								<select name="innovadoraConocimiento" class="innovadoraConocimiento form-control" required>
									<option value="0">No</option>
									<option value="1">Si</option>
								</select>
							</div>
							
							<div class="form-group innovadoraConocimiento-div" style="display: none">
								<label>Ingresar Línea de generación o Aplicación Innovadora del conocimiento:</label>
								<input type="text" name="innovadoraConocimientoDesc" class="innovadoraConocimientoDesc form-control" placeholder="Ingresa Nombre de Línea de generación o Aplicación Innovadora del conocimiento" />
							</div>
							
							
							
							
							<!-- ptcRegistradoSNI -->
							<div class="form-group">
								<label>PTC registrados en el SNI:</label>
								<select name="ptcRegistradoSNI" class="ptcRegistradoSNI form-control" required>
									<option value="0">No</option>
									<option value="1">Si</option>
								</select>
							</div>
							
							<div class="form-group ptcRegistradoSNI-div" style="display: none">
								<label>Ingresar PTC registrados en el SNI:</label>
								<input type="text" name="ptcRegistradoSNIDesc" class="ptcRegistradoSNIDesc form-control" placeholder="Ingresar PTC registrados en el SNI" />
							</div>
							
							<!-- continuidadEstudios -->
							<div class="form-group">
								<label>¿Continuidad de estudios?:</label>
								<select name="continuidadEstudios" class="continuidadEstudios form-control" required>
									<option value="0">No</option>
									<option value="1">Si</option>
								</select>
							</div>
							
							<div class="form-group continuidadEstudios-div" style="display: none">
								<label>¿Qué estudia?:</label>
								<input type="text" name="continuidadEstudiosQueEstudio" class="continuidadEstudiosQueEstudio form-control" placeholder="Ingresr lo que está estudiando" />
							</div>
							
							<div class="form-group continuidadEstudios-div" style="display: none">
								<label>Lugar dónde estudia:</label>
								<input type="text" name="continuidadEstudiosLugar" class="continuidadEstudiosLugar form-control" placeholder="Ingresar lugar donde estudia" />
							</div>
							
							<div class="form-group continuidadEstudios-div" style="display: none">
								<label>¿Está Becado?:</label>
								<select name="continuidadEstudiosTieneBeca" class="continuidadEstudiosTieneBeca form-control" required>
									<option value="0">No</option>
									<option value="1">Si</option>
								</select>
							</div>
							
							<div class="form-group continuidadEstudiosTieneBeca-div" style="display: none">
								<label>Especificar Beca:</label>
								<input type="text" name="continuidadEstudiosTieneBecaDesc" class="continuidadEstudiosTieneBecaDesc form-control" placeholder="Especificar Beca" />
							</div>
							
							
							
							<!-- imparteLicOtroPe -->
							<div class="form-group">
								<label>Imparte otras licenciaturas en otros PE:</label>
								<select name="imparteLicOtroPe" class="imparteLicOtroPe form-control" required>
									<option value="0">No</option>
									<option value="1">Si</option>
								</select>
							</div>
							
							<div class="form-group imparteLicOtroPe-div" style="display: none">
								<label>Especificar PE:</label>
								<input type="text" name="imparteLicOtroPeDesc" class="imparteLicOtroPeDesc form-control" placeholder="Ingresar PE" />
							</div>
							
							
							<!-- fIngreso -->
							<div class="form-group">
								<label>Fecha de ingreso a la universidad:</label>
								<input type="text" name="fIngreso" id="fIngreso" class="fIngreso form-control" placeholder="Ingresar fecha de ingreso a la Univesridad" readonly="readonly" />
							</div>
							
							
							
							<!-- experienciaLaboral -->
							<div class="form-group">
								<label>Años de experiencia laboral:</label>
								<select name="experienciaLaboral" class="experienciaLaboral form-control" required>
								<c:forEach var = "i" begin = "0" end = "90">
							    	<c:choose>
										<c:when test="${i == 0}">
											<option value="${i}">Sin experiencia laboral</option>
										</c:when>
										<c:when test="${i == 1}">
											<option value="${i}">${i} Año</option>
										</c:when>
										<c:otherwise>
											<option value="${i}">${i} Años</option>
										</c:otherwise>
									</c:choose>
						    	</c:forEach>
						    	</select>
							</div>
							
							
							<!-- experienciaDocente -->
							<div class="form-group">
								<label>Años de experiencia como docente:</label>
								<select name="experienciaDocente" class="experienciaDocente form-control" required>
								<c:forEach var = "i" begin = "0" end = "90">
							    	<c:choose>
										<c:when test="${i == 0}">
											<option value="${i}">Sin experiencia como docente</option>
										</c:when>
										<c:when test="${i == 1}">
											<option value="${i}">${i} Año</option>
										</c:when>
										<c:otherwise>
											<option value="${i}">${i} Años</option>
										</c:otherwise>
									</c:choose>
						    	</c:forEach>
						    	</select>
							</div>
						
							
							
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="cerrar-form-info-docente" class="btn btn-default" data-dismiss="modal">Cerrar</button>
					<button type="button" id="guardar-form-info-docente" class="btn btn-primary">Guardar</button>
					<button type="button" id="actualizar-form-info-docente" class="btn btn-primary">Actualizar</button>
				</div>
			</form>
		</div>
	</div>
</div><!-- FIN MODAL PARA INFORMACION DOCENTE -->
	
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
				
				<c:if test="${usuario.idUsuarioRol == 4}">
				
				<!-- Datos como docente laboral -->
				<div class="header">
					<h5 class="title" style="font-weight: bolder;">INFORMACIÓN DOCENTE</h5>
				</div>
				
				<div class="content contenedor-info-docente-base">
				
					<c:choose>
						<c:when test="${docenteLaboral.idUsuario > 0 }">
							<div class="contenedor-direccion" style="border-bottom: solid 1px #E3E3E5; padding-bottom: 10px; margin-bottom: 10px;">
								<table>
									<tr>
										<td style="font-weight: bolder; padding-right: 20px;">Carrera:</td>
										<td>
											<c:forEach items="${carreraCatalogo}" var="carreraCatalogo">
												<c:if test="${docenteLaboral.idCarreraC == carreraCatalogo.idCarreraC }">
													<c:out value="${carreraCatalogo.nombreCarrera}"></c:out> - <c:out value="${carreraCatalogo.acronimoCarrera}"></c:out>
												</c:if>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<td style="font-weight: bolder; padding-right: 20px;">Nivel de estudios:</td>
										<td>
											<c:forEach items="${nivelEstudioCatalogo}" var="nivelEstudioCatalogo">
												<c:if test="${docenteLaboral.idNivelEstudio == nivelEstudioCatalogo.idNivelEstudioC }">
													<c:out value="${nivelEstudioCatalogo.descNivelEstudio}"></c:out>
													
													<c:if test="${docenteLaboral.idNivelEstudio == 4 }">
														- <c:out value="${docenteLaboral.especialidadDesc}"></c:out>
													</c:if>
												</c:if>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<td style="font-weight: bolder; padding-right: 20px;">Reconocimiento Perfil PROMEP-SEP:</td>
										<td>
											<c:choose>
												<c:when test="${docenteLaboral.reconocimientoPerfilPromepSep == 1 }">
													SI - <c:out value="${docenteLaboral.reconocimientoPerfilPromepSepDesc}"></c:out>
												</c:when>
												<c:otherwise>
												NO
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<td style="font-weight: bolder; padding-right: 20px;">Pertenece a CA:</td>
										<td>
											<c:choose>
												<c:when test="${docenteLaboral.perteneceCA == 1 }">
													SI - <c:out value="${docenteLaboral.perteneceCADesc}"></c:out>
												</c:when>
												<c:otherwise>
												NO
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<td style="font-weight: bolder; padding-right: 20px;">Líneas de generación o Aplicación innovadora del conocimiento:</td>
										<td>
											<c:choose>
												<c:when test="${docenteLaboral.innovadoraConocimiento == 1 }">
													SI - <c:out value="${docenteLaboral.innovadoraConocimientoDesc}"></c:out>
												</c:when>
												<c:otherwise>
												NO
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<td style="font-weight: bolder; padding-right: 20px;">PTC registrados en el SNI:</td>
										<td>
											<c:choose>
												<c:when test="${docenteLaboral.ptcRegistradoSNI == 1 }">
													SI - <c:out value="${docenteLaboral.ptcRegistradoSNIDesc}"></c:out>
												</c:when>
												<c:otherwise>
												NO
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<td style="font-weight: bolder; padding-right: 20px;">Continuidad de estudios:</td>
										<td>
											<c:choose>
												<c:when test="${docenteLaboral.continuidadEstudios == 1 }">
													SI
													<br/><span style="font-weight: bold;">¿Qué estudia?: </span> <c:out value="${docenteLaboral.continuidadEstudiosQueEstudio}"></c:out>
													<br/><span style="font-weight: bold;">¿Qué Lugar?: </span> <c:out value="${docenteLaboral.continuidadEstudiosLugar}"></c:out>
													<br/><span style="font-weight: bold;">¿Tiene Beca?: </span> 
													<c:choose>
														<c:when test="${docenteLaboral.continuidadEstudiosTieneBeca == 1 }">
															SI - <c:out value="${docenteLaboral.continuidadEstudiosTieneBecaDesc}"></c:out>
														</c:when>
														<c:otherwise>
														NO
														</c:otherwise>
													</c:choose>
											
												</c:when>
												<c:otherwise>
												NO
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<td style="font-weight: bolder; padding-right: 20px;">Imparte otras licenciaturas en otros PE:</td>
										<td>
											<c:choose>
												<c:when test="${docenteLaboral.imparteLicOtroPe == 1 }">
													SI - <c:out value="${docenteLaboral.imparteLicOtroPeDesc}"></c:out>
												</c:when>
												<c:otherwise>
												NO
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<td style="font-weight: bolder; padding-right: 20px;">Fecha de ingreso a la universidad:</td>
										<td><c:out value="${docenteLaboral.fIngreso}"></c:out></td>
									</tr>
									
									<tr>
										<td style="font-weight: bolder; padding-right: 20px;">Años de experiencia laboral:</td>
										<td><c:out value="${docenteLaboral.experienciaLaboral}"></c:out> Años</td>
									</tr>
									
									<tr>
										<td style="font-weight: bolder; padding-right: 20px;">Años de experiencia como docente:</td>
										<td><c:out value="${docenteLaboral.experienciaDocente}"></c:out> Años</td>
									</tr>
								</table>
						
							<c:if test="${requestScope.isModificable == 1 }">
								<div style="width100%; text-align: right;">
									<a href="#!" class="btn btn-sm btn-primary btn-modificar-docente-laboral"" data-toggle="modal" data-target="#modal-info-docente" data-id-usuario="${usuario.contacto.idUsuario}">Modificar Inf. laboral</a>
								</div>
							</c:if>
						</div>
						</c:when>
						
						<c:otherwise>
							<p>El usuario no tiene datos como docente laboral</p>
							<c:if test="${requestScope.isModificable == 1 }">
								<br/>
								<div style="width100%; text-align: right;">
									<a href="#" class="btn btn-sm btn-primary btn-crear-docente-laboral" data-toggle="modal" data-target="#modal-info-docente" data-id-usuario="${usuario.contacto.idUsuario}">Agregar Info. Laboral</a>
								</div>
							</c:if>
						</c:otherwise>
					</c:choose>
					
				</div>
				
				</c:if>
				
				
			</div>
		</div>
	</div>
</div>

</jsp:body>

</t:LaboratoristaLayout>