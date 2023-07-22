<%-- 
    Document   : principal
    Created on : 10 jun. 2023, 11:14:19
    Author     : LENOVO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  
<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asignaciones</title>
    </head>
    <jsp:include page="includes/sidebarhead.jsp"></jsp:include>
    <body>    
        <div class="container-fluid">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Programa tus actividades ${usuario.getNombres()}</h1>

            <p class="mb-4">
                A continuación se presenta las reserva a las que fue asignado
            </p>
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Reservas</h6>
                </div>
                <div class="card-body">
                    
                    <div class="table-responsive">
                        
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>ID Reserva</th>
                                    <th>Codigo de pago</th>
                                    <th>Cliente</th>
                                    <th>Fecha</th>
                                    <th>Monto</th>
                                    <th>Estado</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="vr" items="${veres}" varStatus="status">
                                <tr>
                                <c:if test="${vr.estado == 0}"> 
                                    <td>${vr.idcita}</td>
                                    <td>00000${vr.idpago}</td>
                                    <td>${vr.nombres} ${vr.apepat} ${vr.apemat}</td>
                                    <td>${vr.fecha}</td>
                                    <td>${vr.monto}</td>
                                    <td>Pendiente</td>
                                    <td>
                                        <a href="ServletCitas?menu=asigna&accion=info&id=${vr.idcita}" class="btn btn-info btn-circle">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="ServletCitas?menu=asigna&accion=realizado&idtecnic=${usuario.getCodigo()}&id=${vr.idcita}" class="btn btn-success btn-circle">
                                            <i class="fas fa-check"></i>
                                        </a>
                                    </td>
                                </c:if>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="includes/sidebarfoot.jsp"></jsp:include>
</html>
