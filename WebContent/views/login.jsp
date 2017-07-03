<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" href='<c:url value="/assets/css/normalize.css" />' type="text/css" />
	<link rel="stylesheet" href='<c:url value="/assets/css/login.css" />' type="text/css" />
	
	<title>Información Docente - Login</title>
</head>

<body style="background-image: url('assets/img/bg.jpg')">

	<div class="bg-content">

		<div class="login-content"
			style="background-image: url('assets/img/bg.jpg')">

			<div class="login-content-color">

				<h1>Inicia sesión</h1>
				<p>Información Docente</p>

				<form action='<c:url value="/?accion=loginUser" />' method="post" id="form-login">
					<input type="text" name="user" id="user" placeholder="NOMBRE DE USUARIO" required />
					<input type="password" name="password" id="password" placeholder="CONTRASEÑA" required />
					<input type="submit" value="Enviar" />
				</form>
				
				<c:if test="${requestScope.message != null }">
					<div class="error-login">
						<c:out value="${requestScope.message }" />
					</div>
				</c:if>
				
			</div>

		</div>

		<div class="footer-company">
			<a href="#0">
				<span class="thin-left"> </span>
				<span class="text-left">Grupo: 5TIC3</span>
			</a>
		</div>

	</div>

</body>

</html>