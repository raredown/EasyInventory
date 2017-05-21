<%-- 
    Document   : panel
    Created on : 20-may-2017, 18:21:19
    Author     : rafa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../../vista/includes/head.jsp" />
        <script src="js/rootingAdmin.js"></script>
        <script src="js/datatable.js"></script>
        <script src="js//controladores/crtlMarca.js"></script>
        <link href="css/datatable.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body ng-app="myApp" class="container-fluid">

        <jsp:include page="../../vista/includes/cabecera.jsp" />
        <h1>Hello World!</h1>

        <div id="panelMenu">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a  class="dropdown-toggle" data-toggle="dropdown"><c:out value="${sessionScope.usuario.username}"/><span class="glyphicon glyphicon-user pull-right"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#/">Cambio en la cuenta <span class="glyphicon glyphicon-cog pull-right"></span></a></li>
                        <li class="divider"></li>
                        <li><a href="#red">Control de usuario <span class="glyphicon glyphicon-stats pull-right"></span></a></li>
                        <li class="divider"></li>
                        <li><a href="#green">Incidencia <span class="badge pull-right"> 42 </span></a></li>
                        <li class="divider"></li>
                        <li><a href="#equipo">Administrar equipos<span class="glyphicon glyphicon-heart pull-right"></span></a></li>
                        <li class="divider"></li>
                        <li><a href="#marca">Administrar marcas<span class="glyphicon glyphicon-heart pull-right"></span></a></li>
                          <li class="divider"></li>
                        <li><a href="#categoria">Administrar categorias<span class="glyphicon glyphicon-heart pull-right"></span></a></li>
                        <li class="divider"></li>
                        <li><a href="#">Desconectar <span class="glyphicon glyphicon-log-out pull-right"></span></a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="row">
            <div ng-view class="col-md-12"></div>
        </div>
       
        <jsp:include page="../../vista/includes/footer.jsp" />
    </body>
</html>
