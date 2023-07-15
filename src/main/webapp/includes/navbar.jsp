<%-- 
    Document   : navbar
    Created on : 22 jun. 2023, 20:41:20
    Author     : LENOVO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Page Header Start -->
<c:if test="${codpago == null || codpago==0}">
    <div class="page-header">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h3>¡BIENVENIDO ${cliente.getNombres()}!</h3>                                                    
                </div>
            </div>
        </div>
    </div>
</c:if>        
<!-- Page Header End -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Prepara tu reserva</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <c:if test="${cliente.estado != null}"> 
                    <c:if test="${cart == null}"> 
                        <li class="nav-item">
                            <a class="nav-link" href="ServletGeneral?menu=carrito&accion=ver">Reserva
                                <i class="fas fa-calendar-check fa-fw" style="color: #4c3d3d"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-info badge-counter">${cont}</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${codpago == 0}">
                        <c:if test="${cart != null}"> 
                            <li class="nav-item"><a class="nav-link" href="ServletGeneral?menu=carrito&accion=volver">Seguir Reserva <i class="fas fa-calendar-plus" style="color: mediumseagreen"></i></a></li>
                                </c:if>
                            </c:if>
                    <li class="nav-item"><a class="nav-link" href="ServletGeneral?menu=usuario&accion=logout">Cerrar Sesion</a></li>
                    </c:if> 
            </ul>
        </div>
    </div>
</nav>
