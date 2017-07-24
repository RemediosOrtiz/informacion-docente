<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="titlename" fragment="true"%>
<%@attribute name="extracss" fragment="true"%>
<%@attribute name="hideforms" fragment="true" %>
<%@attribute name="extrajs" fragment="true"%>
<%@attribute name="viewtitlename" fragment="true"%>
<%@attribute name="viewuserrol" fragment="true"%>
<%@attribute name="viewtitleseccion" fragment="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<jsp:invoke fragment="viewtitlename" />
	
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <link href='<c:url value="assets/css/bootstrap.min.css"></c:url>' rel="stylesheet" />
    <link href='<c:url value="assets/css/animate.min.css"></c:url>' rel="stylesheet"/>
    <link href='<c:url value="assets/css/light-bootstrap-dashboard.css"></c:url>' rel="stylesheet"/>
    <link href='<c:url value="assets/css/demo.css"></c:url>' rel="stylesheet" />
    <link href='<c:url value="assets/font-awesome-4.7.0/css/font-awesome.min.css"></c:url>' rel="stylesheet">
    <link href='<c:url value="assets/css/pe-icon-7-stroke.css"></c:url>' rel="stylesheet" />
    <link href='<c:url value="assets/css/jquery-ui.css"></c:url>' rel="stylesheet" />
    
    <jsp:invoke fragment="extracss" />
    
</head>
<body>

<c:url value="/directivo" var="urlModificarMyUsuario">
    <c:param name="accion" value="modificar-usuario" />
    <c:param name="id-usuario" value="${sessionScope.id_usuario}" />
</c:url>

<div class="wrapper">
    <div class="sidebar" data-color=azure data-image="assets/img/sidebar-4.jpg">

    <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="#" class="simple-text">
                    <jsp:invoke fragment="viewuserrol" />
                </a>
            </div>

            <ul class="nav">
            	 <li>
                    <a href='<c:url value="/directivo?accion=dashboard" />'>
                        <i class="pe-7s-graph"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li>
                    <a href="${urlModificarMyUsuario}">
                        <i class="pe-7s-user"></i>
                        <p>Perfil de Usuario</p>
                    </a>
                </li>
                <li>
                    <a href="#!">
                        <i class="pe-7s-bell"></i>
                        <p>Notifications</p>
                    </a>
                </li>
				<li class="active-pro">
                    <a href="#!">
                        <i class="pe-7s-rocket"></i>
                        <p>Upgrade to PRO</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>

    <div class="main-panel">
		<nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">
                    	<jsp:invoke fragment="viewtitleseccion" />
                    </a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-dashboard"></i>
								<p class="hidden-lg hidden-md">Dashboard</p>
                            </a>
                        </li>
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-globe"></i>
                                    <b class="caret hidden-sm hidden-xs"></b>
                                    <span class="notification hidden-sm hidden-xs">5</span>
									<p class="hidden-lg hidden-md">
										5 Notifications
										<b class="caret"></b>
									</p>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                              </ul>
                        </li>
                        <li>
                           <a href="">
                                <i class="fa fa-search"></i>
								<p class="hidden-lg hidden-md">Search</p>
                            </a>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li>
                           <a href="${urlModificarMyUsuario}">
                               <p><c:out value="${sessionScope.nombre }"/></p>
                            </a>
                        </li>
                        <li>
                            <a href='<c:url value="/login?accion=logout"></c:url>'>
                                <p>Salir</p>
                            </a>
                        </li>
						<li class="separator hidden-lg hidden-md"></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="content">
        	<jsp:doBody />
        </div>

        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>
                        <li>
                            <a href="#">
                                Home
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Company
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Portfolio
                            </a>
                        </li>
                        <li>
                            <a href="#">
                               Blog
                            </a>
                        </li>
                    </ul>
                </nav>
                <p class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script> <a href="http://www.creative-tim.com">Creative Tim</a>, made with love for a better web
                </p>
            </div>
        </footer>


    </div>
</div>



</body>


	<style>
		.alertas-contenedor {
			position: fixed;
			top: 0;
			right: 0;
			max-width: 530px;
			height: auto;
			max-width: 100%;
			z-index: 10000000;
			padding: 15px;
			background-color: transparent;
			overflow: auto;
		}
		
		.alertas-contenedor h5 {
			font-size: 14px;
			color: #FFF;
			padding: 12px 14px 7px 12px;
			font-weight: bold;
			margin: 0;
			width: 100%;
			border-bottom: solid 1px rgba(0,0,0, 0.1);
		}
		
		.cerrar-alerta {
			position: absolute;
			top: 8px;
			right: 8px;
			background-color: #FFF;
			color: #4A4A4A;
			font-size: 10px;
			border: solid 1px #FFF;
			border-radius: 10px;
			
		}
		
		.cerrar-alerta:focus {
			outline: none;
		}
		
		.cerrar-alerta:hover {
			color: red;
		}
	
		.alerta {
			position: relative;
			min-width: 300px;
			max-width: 500px;
			height: auto;
			corlo: #fff;
			background: #4A4A4A;
			box-shadow: 0 11px 21px 0 rgba(0,0,0,0.27);
			border-radius: 12px;
			margin-bottom: 14px;
			
		}
		
		.alerta-negro {
			background-color: #4A4A4A;
		}
		
		.alerta-rojo {
			background-color: #FC404B;
		}
		
		.alerta-verde {
			background-color: #23B131;
		}
		
		.alerta-azul {
			background-color: #2662AE;
		}
		
		.alerta p {
			color: #FFF;
			padding: 7px 14px 7px 12px;
			font-size: 13px;
		}
		
		
		.alerta ul {
			padding: 0;
			margin: 0;
			color: #FFF !important;
			text-decoration: none;
			padding: 7px 14px 7px 12px;
			margin-left: 10px;
		}
		
		.alerta ul li {
			padding: 0;
			margin: 0;
			color: #FFF !important;
			text-decoration: none;
			margin-left: 10px;
		}
		
		.alerta a {
		
			text-decoration: none;
			background: #FFF;
			padding: 4px 8px;
			text-align: center;
			color: #000;
			font-weight: bold;
			border-radius: 5px;
			margin: 0 10px 10px 10px;
			width: calc(100% - 20px);
			display: inline-block;
		}
		
	</style>
	
	
	<div class="alertas-contenedor">
	<!--  
		<div class="alerta alerta-azul">
			<button class="cerrar-alerta">Cerrar</button>
			<h5 class="titulo">Error</h5>
			<p>
				Para ver los cambios por favor recargue la pagina:
			</p>
			<a href="#!">Recargar Página</a>
		</div>
		-->
	</div>
	

	<jsp:invoke fragment="hideforms" />
	
    <script src='<c:url value="assets/js/jquery-1.10.2.js"></c:url>' type="text/javascript"></script>
	<script src='<c:url value="assets/js/bootstrap.min.js"></c:url>' type="text/javascript"></script>
	<script src='<c:url value="assets/js/bootstrap-checkbox-radio-switch.js"></c:url>'></script>
	<script src='<c:url value="assets/js/chartist.min.js"></c:url>'></script>
    <script src='<c:url value="assets/js/bootstrap-notify.js"></c:url>'></script>
	<script src='<c:url value="assets/js/light-bootstrap-dashboard.js"></c:url>'></script>
	<script src='<c:url value="assets/js/jquery-ui.min.js"></c:url>'></script>
	
	<script src='<c:url value="assets/js/demo.js"></c:url>'></script>
	
	<script src='<c:url value="assets/js/validador.js"></c:url>'></script>
	<script src='<c:url value="assets/js/alertas.js"></c:url>'></script>
	
	
	<jsp:invoke fragment="extrajs" />
	

</html>