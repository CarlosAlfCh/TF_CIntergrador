<%-- 
    Document   : ModAsignar
    Created on : 13 jul. 2023, 21:07:54
    Author     : LENOVO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asignacion</title>
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
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
                                    
            <p class="mb-4">
                    Elija a un tecnico
            </p>
            
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Base Datos Tecnicos</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombre del Tecnico</th>
                                    <th>Especialidad</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" items="${tecnicos}" varStatus="status">
                                    <c:if test="${user.rol == 3}"> 
                                        <tr>
                                            <td>${user.codigo}</td>
                                            <td>${user.nombres} ${user.apepat} ${user.apemat}</td>
                                            <td>
                                                <c:if test="${user.idespecialidad == 1}">                        
                                                    Masajista
                                                </c:if>
                                                <c:if test="${user.idespecialidad == 2}">                        
                                                    Esteticistas
                                                </c:if>
                                                <c:if test="${user.idespecialidad == 3}">                        
                                                    Terapeuta
                                                </c:if>
                                                <c:if test="${user.idespecialidad == 4}">                        
                                                    Fisioterapeuta
                                                </c:if>
                                            </td>
                                            <td>
                                                <a href="ServletCitas?menu=asigna&accion=agregar&idres=${select.getIdcita()}&idtec=${user.codigo}" class="btn btn-info btn-circle">
                                                    <i class="fas fa-check"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    </body>
    <jsp:include page="includes/sidebarfoot.jsp"></jsp:include>
</html>
