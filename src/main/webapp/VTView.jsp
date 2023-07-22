<%-- 
    Document   : VTView
    Created on : 14 jul. 2023, 18:59:26
    Author     : LENOVO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalles</title>
    </head>
    <jsp:include page="includes/sidebarhead.jsp"></jsp:include>
        <body>
            <div class="container-fluid">    
                <h1 class="h3 mb-2 text-gray-800">
                    Codigo de la Reserva: 00000${select.getIdcita()}
            </h1>

            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Detalle de la Cita</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Nombre del Servicio</th>
                                    <th>Descripcion</th>
                                    <th>Precio</th>
                                    <th>N° Personas</th>
                                    <th>Subtotal</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="det" items="${detalles}" varStatus="status">
                                    <tr>
                                        <td>${det.nomserv}</td>
                                        <td>${det.descripcion}</td>
                                        <td>S/ ${det.subtotal}0</td>
                                        <td>${det.npersonas}</td>
                                        <td>S/ ${det.total}0</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Fecha: ${select.getFecha()}</th>
                                    <th></th>
                                    <th></th>
                                    <th>Monto total:</th>
                                    <th>S/ ${select.getMonto()}0</th>
                                </tr>
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th>
                                        <c:if test="${usuario.getRol() != 3}">
                                            <a href="VMAsignar.jsp" class="btn btn-info btn-circle">
                                                <i class="fas fa-arrow-left"></i>
                                            </a>
                                        </c:if>
                                        <c:if test="${usuario.getRol() == 3}">
                                            <a href="ServletCitas?menu=asigna&accion=ver&idtecnic=${usuario.getCodigo()}" class="btn btn-info btn-circle">
                                                <i class="fas fa-arrow-left"></i>
                                            </a>
                                        </c:if>
                                    </th>
                                </tr> 
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
    </body>
    <jsp:include page="includes/sidebarfoot.jsp"></jsp:include>
</html>
