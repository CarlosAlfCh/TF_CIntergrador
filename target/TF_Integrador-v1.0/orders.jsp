<%-- 
    Document   : orders
    Created on : 22 jun. 2023, 20:15:45
    Author     : LENOVO
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reserva</title>
        <%@include file="includes/header.jsp"%>        
    </head>
 
    <%@include file="includes/navbar.jsp"%>
    <body>
        <%-- Obtener la fecha actual --%>
        <% Date fechaActual = new Date(); %>

        <%-- Formatear la fecha --%> 
        <% SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy"); %>
        <% String fechaFormateada = formatoFecha.format(fechaActual);%>

        <div class="container">
            <div class="row g-0">  
                <div class="col-1">  
                    <div class="p-3"></div>
                </div>  
                <div class="col-7">
                    <div class="p-3"><h3>Reserva SPAUTP</h3></div> 
                </div>
                <div class="col-3"> 
                    <div class="p-3"><c:if test="${codpago > 0}"><h3><label style="color: #000000">00000000${codpago}</label></h3></c:if></div>
                    </div>
                </div>            
                <div class="row g-0">
                    <div class="col-1">
                        <div class="p-3"></div>
                    </div>
                    <div class="col-7">
                        <div class="p-3">
                            <label style="color: #4c3d3d">
                                Cliente: ${cliente.getNombres()} ${cliente.getApepat()} ${cliente.getApemat()} <br>
                                Codigo: ${cliente.getCodigo()}
                        </label>
                    </div>
                </div>
                <div class="col-3">
                    <div class="p-3"><label style="color: #000000">Fecha: <%= fechaFormateada%></label></div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-8">
                        <table class="table" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Servicio</th>
                                    <th>Descripcion</th>
                                    <th>Precio</th>
                                    <c:if test="${codpago == 0}"> 
                                    <th></th> 
                                    </c:if>
                                <th>Personas</th>
                                    <c:if test="${codpago == 0}">
                                    <th></th>
                                    </c:if>
                                <th>Subtotal</th>
                                    <c:if test="${codpago == 0}">
                                    <th>Opciones</th>
                                    </c:if>
                            </tr>
                        </thead>
                        <tbody> 
                            <c:forEach var="car" items="${cart}">
                                <tr>
                                    <td>${car.getNombre()}</td>
                                    <td><textarea class="form-control" name="txtdescripcion" rows="3" cols="40" readonly="">${car.getDescripcion()}</textarea></td>
                                    <td>S/${car.getSubtotal()}0</td>
                                    <c:if test="${codpago==0}"> 
                                        <td style="text-align: center;">
                                            <c:if test="${car.getNpersonas() != 1}"> 
                                                <a href="ServletGeneral?menu=carrito&accion=quita&id=${car.getIdservicio()}"><h5><i class="fas fa-minus-circle" style="color: orange"></i></h5></a>
                                            </c:if>
                                        </td>
                                    </c:if>
                                    <td>
                                        <input type="text" name="cantidad" value="${car.getNpersonas()}" class="form-control" readonly="">
                                    </td>
                                    <c:if test="${codpago == null|| codpago==0}"> 
                                        <td style="text-align: center;">
                                            <a href="ServletGeneral?menu=carrito&accion=add&id=${car.getIdservicio()}"><h5><i class="fas fa-plus-circle" style="color: orange"></i></h5></a>
                                        </td>
                                    </c:if>
                                    <td>S/${car.getTotal()}0</td>
                                    <c:if test="${codpago == 0}"> 
                                        <td style="text-align: center;"> 
                                            <a href="ServletGeneral?menu=carrito&accion=eliminar&idserv=${car.getIdservicio()}"><h3><i class="fas fa-trash" style="color: red"></i></h3></a>
                                            <a href="#"></a>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
                <div class="col-sm-4">
                    <div class="card">
                        <!-- Pagos Modal-->
                        <div class="modal fade" id="pagos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Pagar</h5>
                                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                    </div>
                                    <form action="ServletGeneral" method="post">                                    
                                        <div class="modal-body">
                                            <div class="card-header">
                                                <label style="color: #4c3d3d">Fecha: <%= fechaFormateada%><br>
                                                    Ingrese codigo y metodo usado para el pago<br> 
                                                    N° de cuenta: 00000000000000000000000<br>
                                                    N° telefono deposito: +51 000 000 000  
                                                </label>                                          
                                            </div>
                                            <div class="card-body">
                                                <label style="color: #4c3d3d">Metodos de pago</label>
                                                <select name="forma" class="form-control" required=""> 
                                                    <option value="Efectivo" selected>Seleccione medoto de pago</option>
                                                    <option value="Efectivo">Pago en efectivo</option>
                                                    <option value="Yape">Yape</option>
                                                    <option value="Plin">Plin</option>
                                                    <option value="Transferencia">Transaccion Bancaria</option>
                                                </select> 
                                                <br><label style="color: #4c3d3d">Digite el N° de Operacion o Deposito</label>
                                                <input type="text" name="codi" placeholder="Si es pago en efectivo deje vacio" class="form-control">
                                                <input type="hidden" name="factual" value="<%= fechaFormateada%>">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                            <button class="btn btn-primary" name="menu" value="pay">Pagar</button>
                                        </div>  
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="card-header">
                            <h3>Costo de la Cita</h3>
                        </div>
                        <form action="ServletGeneral" method="post">
                            <div class="card-body">
                                <input type="hidden" name="code" value="${cliente.getCodigo()}">
                                <label style="color: #4c3d3d">Subtotal</label>
                                <input type="text" name="name" value="S/ ${totalpagar}0" readonly="" class="form-control"><br>
                                <label style="color: #4c3d3d">Descuento</label>
                                <input type="text" name="name" value="S/ 0.00" readonly="" class="form-control"><br>
                                <label style="color: #4c3d3d">Total a pagar</label>
                                <input type="text" name="name" value="S/ ${totalpagar}0" readonly="" class="form-control">
                            </div>


                            <div class="card-footer">
                                <c:if test="${codpago == 0}"> 
                                    <a href="#" class="btn btn-secondary btn-block" data-toggle="modal" data-target="#pagos">Agendar Cita</a><br>
                                    <label style="color: #4c3d3d">* Primero realize el pago <br>* Luego elija la fecha</label>
                                    </c:if>
                                    <c:if test="${codpago > 0}"> 
                                    <label style="color: #4c3d3d">Fecha de la cita:</label>
                                    <input type="date" name="txtfecha" class="form-control" required=""/>
                                    <button class="btn btn-primary btn-block" name="menu" value="buy" onclick="print()">Procesar Reserva</button>
                                </c:if>                                
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <%@include file="includes/footer.jsp"%>
</html>
