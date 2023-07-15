<%-- 
    Document   : Panel
    Created on : 16 jun. 2023, 22:39:12
    Author     : LENOVO
--%>

<%@page import="com.utp.entidad.Cita"%>
<%@page import="com.utp.modelo.ReservaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.utp.entidad.Pago"%>
<%@page import="java.util.List"%>
<%@page import="com.utp.modelo.PagoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atención</title>
        <!-- Custom fonts for this template-->
        <link href="src/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="src/css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />

        <!-- Custom styles for this page -->
        <link href="src/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    </head>    
    <body>
        <div id="wrapper">
            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="VMInicio.jsp">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">
                        <c:if test="${usuario.getRol() == 1}">
                            Administrador
                        </c:if>
                        <c:if test="${usuario.getRol() == 2}">
                            Encargado
                        </c:if>
                        <c:if test="${usuario.getRol() == 3}">
                            Tecnico
                        </c:if>
                    </div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="VMInicio.jsp">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Panel</span></a>
                </li>
                <c:if test="${usuario.getRol() != 3}">
                    <!-- Divider -->
                    <hr class="sidebar-divider">

                    <!-- Heading -->
                    <div class="sidebar-heading">
                        Opciones
                    </div>

                    <!-- Enlaces para agregar -->
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                           aria-expanded="true" aria-controls="collapseTwo">
                            <i class="fas fa-fw fa-cog"></i>
                            <span>Mantenimientos</span>
                        </a>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <h6 class="collapse-header">Elija opción:</h6>
                                <a class="collapse-item" href="Controlador?menu=cliente&accion=listar">Cliente</a>
                                <a class="collapse-item" href="Controlador?menu=usuario&accion=listar">Usuario</a>
                                <a class="collapse-item" href="Controlador?menu=servicio&accion=listar">Servicio</a>
                            </div>
                        </div>
                    </li>

                    <!-- Enlaces para modifcar -->
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                           aria-expanded="true" aria-controls="collapseUtilities">
                            <i class="fas fa-fw fa-calendar"></i>
                            <span>Programación</span>
                        </a>
                        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                             data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <h6 class="collapse-header">Elija opción:</h6>
                                <a class="collapse-item" href="ServletCitas?menu=listar">Pagos</a>
                                <a class="collapse-item" href="VMAsignar.jsp">Asignar</a>
                            </div>
                        </div>
                    </li>
                    <!-- Divider -->
                    <hr class="sidebar-divider">

                    <!-- Heading -->
                    <div class="sidebar-heading">
                        Funciones
                    </div>

                    <!-- Nav Item - Pages Collapse Menu -->
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                           aria-expanded="true" aria-controls="collapsePages">
                            <i class="fas fa-fw fa-folder"></i>
                            <span>Informes</span>
                        </a>
                        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <h6 class="collapse-header">Reportes:</h6>
                                <a class="collapse-item" href="#">Actividades</a>
                                <a class="collapse-item" href="#">Ventas</a>
                                <div class="collapse-divider"></div>
                                <h6 class="collapse-header">Pagos:</h6>
                                <a class="collapse-item" href="#">Metodo de Pago</a>
                            </div>
                        </div>
                    </li>
                </c:if>
                <c:if test="${usuario.getRol() == 3}">
                    <!-- Nav Item - Charts -->
                    <li class="nav-item">
                        <a class="nav-link" href="ServletCitas?menu=asigna&accion=ver&idtecnic=${usuario.getCodigo()}">
                            <i class="fas fa-fw fa-calendar-week"></i>
                            <span>Asignaciones</span>
                        </a>
                    </li>
                </c:if>
                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

                <!-- Sidebar Message -->
                <div class="sidebar-card d-none d-lg-flex">
                    <img class="sidebar-card-illustration mb-2" src="src/img/undraw_rocket.svg" alt="...">
                    <a class="btn btn-success btn-sm" href="#">Nueva Cita</a>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!--                     Topbar Search 
                                            <form
                                                class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                                                <div class="input-group">
                                                    <input type="text" class="form-control bg-light border-0 small" placeholder="Buscar por..."
                                                        aria-label="Search" aria-describedby="basic-addon2">
                                                    <div class="input-group-append">
                                                        <button class="btn btn-primary" type="button">
                                                            <i class="fas fa-search fa-sm"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>-->

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">
                            <%
                                PagoDAO dao = new PagoDAO();
                                List<Pago> lista = dao.entrante();
                            %>
                            <!-- Nav Item - Alerts -->
                            <c:if test="${usuario.getRol() != 3}">
                                <li class="nav-item dropdown no-arrow mx-1">
                                    <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-bell fa-fw"></i>
                                        <!-- Counter - Alerts -->
                                        <span class="badge badge-danger badge-counter"><%= lista.size()%></span>
                                    </a>
                                    <!-- Dropdown - Alerts -->

                                    <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                         aria-labelledby="alertsDropdown">
                                        <h6 class="dropdown-header">
                                            Pagos
                                        </h6>
                                        <%
                                            if (lista != null) {
                                                for (Pago p : lista) {
                                                    if (p.getValido() == 0) {

                                        %>
                                        <div class="dropdown-item d-flex align-items-center">
                                            <div class="mr-3">
                                                <a class="icon-circle bg-success" href="ServletCitas?menu=vb&idpago=<%= p.getIdpago()%>"> 
                                                    <i class="fas fa-check text-white"></i>
                                                </a>
                                            </div>
                                            <div>
                                                <div class="small text-gray-500"><%= p.getFechapago()%></div>
                                                <span class="font-weight-bold">Pago por: <%= p.getMetodo()%><br>
                                                    N° de operacion: <%= p.getCodigo()%><br>
                                                    Codigo: 00000<%= p.getIdpago()%>
                                                </span>
                                            </div>
                                        </div>
                                        <%          }
                                                }
                                            }
                                        %>
                                    </div>
                                </li>
                            </c:if>
                            <c:if test="${usuario.getRol() == 3}">
                                <!-- Nav Item - Messages -->
                                <li class="nav-item dropdown no-arrow mx-1">
                                    <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-envelope fa-fw"></i>
                                        <!-- Counter - Messages -->
                                        <span class="badge badge-danger badge-counter">${msj}</span>
                                    </a>
                                    <!-- Dropdown - Messages -->
                                    <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                         aria-labelledby="messagesDropdown">
                                        <h6 class="dropdown-header">
                                            Mensajes entrantes
                                        </h6>
                                        <c:forEach var="a" items="${asig}" varStatus="status">
                                            <c:if test="${a.estado == 0}">
                                                <div class="dropdown-item d-flex align-items-center">
                                                    <div class="dropdown-list-image mr-3">
                                                        <img class="rounded-circle" src="src/img/login.jpg"
                                                             alt="...">
                                                        <div class="status-indicator bg-success"></div>
                                                    </div>
                                                    <div>
                                                        <div class="text-truncate"><i class="fas fa-envelope-open fa-fw"></i> Nueva asignacion !!</div>
                                                        <div class="small text-gray-500">Codigo: 000${a.idpago} · Fecha: ${a.fecha}</div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                        <a class="dropdown-item text-center small text-gray-500" href="ServletCitas?menu=asigna&accion=ver&idtecnic=${usuario.getCodigo()}">Ir a asignaciones</a>
                                    </div>
                                </li>
                            </c:if>
                            <c:if test="${usuario.getRol() != 3}">
                                <!-- Nav Item - Messages -->
                                <li class="nav-item dropdown no-arrow mx-1">
                                    <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-envelope fa-fw"></i>
                                        <!-- Counter - Messages -->
                                        <span class="badge badge-danger badge-counter">.</span>
                                    </a>
                                    <!-- Dropdown - Messages -->
                                    <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                         aria-labelledby="messagesDropdown">
                                        <h6 class="dropdown-header">
                                            Estado de asignaciones
                                        </h6>
                                        <div class="dropdown-item d-flex align-items-center">
                                            <div class="dropdown-list-image mr-3">
                                                <img class="rounded-circle" src="src/img/login.jpg"
                                                     alt="...">
                                                <div class="status-indicator bg-success"></div>
                                            </div>
                                            <div>
                                                <div class="text-truncate"><i class="fas fa-check-double fa-fw"></i>Reservas realizadas</div>
                                                <div class="small text-gray-500"></div>
                                            </div>
                                        </div>
                                        <a class="dropdown-item text-center small text-gray-500" href="VMAsignar.jsp">Verificar asignaciones</a>
                                    </div>
                                </li>
                            </c:if>

                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">${usuario.getNombres()}</span>
                                    <img class="img-profile rounded-circle"
                                         src="src/img/login.jpg">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" >
                                        <i class="fas fa-envelope fa-sm fa-fw mr-2 text-gray-400"></i>
                                        ${usuario.getCorreo()}
                                    </a>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Salir
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
