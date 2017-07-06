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
      	
      	<div class="modal fade" id="modal-nuevo-usuario" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Nuevo Usuario</h4>
		      </div>
		      <div class="modal-body">
		        ...
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>

    </jsp:attribute>

	<jsp:body>
    
    	<div class="container-fluid">
		   <div class="row">
		       <div class="col-md-12">
		           <div class="card">
		               <div class="header">
		                   <h4 class="title"><c:out value="${usuario.contacto.nombre}"/> <c:out value="${usuario.contacto.apPaterno}"/> <c:out value="${usuario.contacto.apMaterno}"/></h4>
		                   <p class="category">Información del usuario</p>
		               </div>
		               
		               <div>
		               
		               <h1>Cuenta</h1>
		               
		               <c:if test="${requestScope.isModificable == 1 }">
							<a href="#" class="btn btn-primary">Modificar cuenta</a>
						</c:if>
						
						
						<h1>Contacto</h1>
		               
		               <c:if test="${requestScope.isModificable == 1 }">
							<a href="#" class="btn btn-primary">Modificar contacto</a>
						</c:if>
		               		
		               </div>
		               
		           </div>
		        </div>
		   </div>
		</div>

	</jsp:body>
	
</t:admin_layout>