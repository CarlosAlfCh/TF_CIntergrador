<%-- 
    Document   : VMPagos
    Created on : 13 jul. 2023, 15:54:28
    Author     : LENOVO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagos</title>
    </head>
    <jsp:include page="includes/sidebarhead.jsp"></jsp:include>
    <body>
    <div class="container-fluid">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Base Datos Usuarios</h6>
            </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            
                            <thead>
                                <tr>
                                    <th>Cliente</th>
                                    <th>Correo</th>
                                    <th>Id</th>
                                    <th>Metodo</th>
                                    <th>Codigo</th>
                                    <th>Fecha</th>
                                    <th>Estado</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="p" items="${pagos}" varStatus="status">
                                    <tr>
                                        <td>${p.nombres} ${p.apepat} ${p.apemat}</td>
                                        <td>${p.correo}</td>
                                        <td>00000${p.idpago}</td>
                                        <td>${p.metodo}</td>
                                        <td>${p.codigo}</td>
                                        <td>${p.fechapago}</td>
                                        <td>
                                            <c:if test="${p.valido == 1}">                        
                                                Verificado
                                            </c:if>
                                            <c:if test="${p.valido == 0}"> 
                                                Pendiente
                                            </c:if>
                                        </td>
                                        <td>
                                            <c:if test="${p.valido == 1}">  
                                                <a href="ServletCitas?menu=error&idpago=${p.idpago}" class="btn btn-success btn-circle">
                                                    <i class="fas fa-check-double"></i>
                                                </a>
                                                <a href="ServletCitas?menu=pay&correo=${p.correo}&id=${p.idpago}&metodo=${p.metodo}&fecha=${p.fechapago}" class="btn btn-warning btn-circle">
                                                    <i class="fas fa-envelope"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${p.valido == 0}"> 
                                                <a href="ServletCitas?menu=vb&idpago=${p.idpago}" class="btn btn-info btn-circle">
                                                    <i class="fas fa-clock"></i>
                                                </a>
                                            </c:if>
                                            
                                        </td>
                                    </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    </body>
    <jsp:include page="includes/sidebarfoot.jsp"></jsp:include>
</html>
