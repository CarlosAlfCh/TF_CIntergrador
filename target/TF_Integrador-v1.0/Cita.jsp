<%-- 
    Document   : Cita
    Created on : 9 jul. 2023, 23:26:06
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <jsp:include page="includes/header.jsp"></jsp:include>
    <body>
    <!-- Page Header Start -->
        <c:if test="${cliente.estado != null}"> 
            <jsp:include page="includes/navbar.jsp"></jsp:include>
        </c:if>    
    <!-- Page Header End --> 
    
        <div class="container mt-4">
            <h3>Mi Reserva</h3>
            <div class="row">
                <div class="col-sm-8">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Item</th>
                                <th>Nombres</th>
                                <th>Descripcion</th>
                                <th>Precio</th>
                                <th>N Personas</th>
                                <th>Subtotal</th>
                                <th>Opciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="car" items="${cart}">
                            <tr>
                                <td>${car.getItem()}</td>
                                <td>${car.getNombre()}</td>
                                <td>${car.getDescripcion()}</td>
                                <td>${car.getSubtotal()/car.getNpersonas()}</td>
                                <td>
                                    <a href="ServletGeneral?menu=carrito&accion=agregar&id=${car.getIdservicio()}"><input type="button" name="cantidad" value="${car.getNpersonas()}" class="form-control text-center" min="1" max="10"></a>
                                </td>
                                <td>${car.getSubtotal()}</td>
                                <td>
                                    <a href="ServletGeneral?menu=carrito&accion=eliminar&idserv=${car.getIdservicio()}">eliminar</a>
                                    <a href="#"></a>
                                </td>                                
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-header">
                            <h3>Generar compra</h3>
                        </div>
                        <div class="card-body">
                            <label>Subtotal</label>
                            <input type="text" name="name" value="S/ ${totalpagar}0" readonly="" class="form-control">
                            <label>Descuento</label>
                            <input type="text" name="name" value="S/ 0.00"readonly="" class="form-control">
                            <label>Total a pagar</label>
                            <input type="text" name="name" value="S/ ${totalpagar}0" readonly="" class="form-control">
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-info btn-block">Realizar Pago</a>
                            <a href="#" class="btn btn-danger btn-block">Realizar Pago</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    </body>
    <jsp:include page="includes/footer.jsp"></jsp:include>
</html>
