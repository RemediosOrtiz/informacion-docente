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
    
    <jsp:invoke fragment="extracss" />
    
</head>
<body>

<div class="wrapper">
    <div class="sidebar" data-color=blue data-image="assets/img/sidebar-4.jpg">

    <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="#" class="simple-text">
                    <jsp:invoke fragment="viewuserrol" />
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href='<c:url value="/admin?accion=dashboard" />'>
                        <i class="pe-7s-graph"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li>
                    <a href="user.html">
                        <i class="pe-7s-user"></i>
                        <p>Perfil de Usuario</p>
                    </a>
                </li>
                <li>
                    <a href='<c:url value="/admin?accion=usuarios" />'>
                        <i class="pe-7s-users"></i>
                        <p>Usuarios</p>
                    </a>
                </li>
                <li>
                    <a href="typography.html">
                        <i class="pe-7s-news-paper"></i>
                        <p>Typography</p>
                    </a>
                </li>
                <li>
                    <a href="icons.html">
                        <i class="pe-7s-science"></i>
                        <p>Icons</p>
                    </a>
                </li>
                <li>
                    <a href="maps.html">
                        <i class="pe-7s-map-marker"></i>
                        <p>Maps</p>
                    </a>
                </li>
                <li>
                    <a href="notifications.html">
                        <i class="pe-7s-bell"></i>
                        <p>Notifications</p>
                    </a>
                </li>
				<li class="active-pro">
                    <a href="upgrade.html">
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
                           <a href="">
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

	<jsp:invoke fragment="hideforms" />
	
    <script src='<c:url value="assets/js/jquery-1.10.2.js"></c:url>' type="text/javascript"></script>
	<script src='<c:url value="assets/js/bootstrap.min.js"></c:url>' type="text/javascript"></script>
	<script src='<c:url value="assets/js/bootstrap-checkbox-radio-switch.js"></c:url>'></script>
	<script src='<c:url value="assets/js/chartist.min.js"></c:url>'></script>
    <script src='<c:url value="assets/js/bootstrap-notify.js"></c:url>'></script>
	<script src='<c:url value="assets/js/light-bootstrap-dashboard.js"></c:url>'></script>
	<script src='<c:url value="assets/js/demo.js"></c:url>'></script>
	
	<jsp:invoke fragment="extrajs" />


</html>