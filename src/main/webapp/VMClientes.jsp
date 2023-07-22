<%-- 
    Document   : VMClientes
    Created on : 10 jun. 2023, 22:52:03
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.utp.entidad.Cliente"%>
<%@page import="com.utp.modelo.ClienteDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
    </head>
    <jsp:include page="includes/sidebarhead.jsp"></jsp:include>
    <body>
        <div class="container-fluid">
            
        <form action="Controlador?menu=cliente" method="POST">
            <div class="modal-body" role="document">
                <div class="modal-content">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Mantenimiento de Clientes</h6>
                    </div>
                    <div class="modal-body">
                        <table class="table table-light"  width="100%" cellspacing="0">
                            <tr>
                                <td>Nombres:<input class="form-control" type="text" name="txtnombres" required=""></td>
                                <td>Apellido Paterno:<input class="form-control" type="text" name="txtapelpat" required=""></td>
                                <td>Apellido Materno:<input class="form-control" type="text" name="txtapelmat" required=""></td>
                                <td>DNI:<input class="form-control" type="number" name="txtdni" required=""></td>
                            </tr>
                            <tr>
                                <td>Fecha Nacimiento:
                                    <input type="date" class="form-control" name="txtfecha"/>
                                </td>
                                <td>Telefono:<input class="form-control" type="tel" name="txttelefono" required=""></td>
                                <!-- mientras -->
                                
                                <td>Dirección:
                                    <input class="form-control" type="text" name="txtdireccion">                                      
                                </td>
                                <td>Distrito:
                                    <select name="txtdistrito" class="form-control"> 
                                        <option value="NULL" selected>Seleccione Distrito</option>
                                        <option value="Cayma">Cayma</option>
                                        <option value="Cercado">Cercado</option>
                                        <option value="Yanahuara">Yanahuara</option>
                                        <option value="Selva Alegre">Selva Alegre</option>
                                        <option value="Mariano Melgar">Mariano Melgar</option>
                                        <option value="Hunter">Hunter</option>
                                        <option value="Cerro Colorado">Cerro Colorado</option>
                                    </select> 
                                </td>  
                                
                                <!-- cambiar --> 
                            </tr>
                            <tr>
                                <td>Correo:
                                    <input class="form-control" type="email" name="txtcorreo" required="">
                                </td>
                                <td>Contraseña:
                                    <input class="form-control" type="password" name="txtcontrasena" required="">
                                </td>
                                <td align="center">
                                    <p> </p>
                                    <button class="btn btn-success btn-icon-split" type="submit" name="accion" value="agregar">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-check"></i>
                                        </span>
                                        <span class="text">Agregar</span>
                                    </button>
                                </td>
                            </tr>
                        </table>                        
                    </div>                       
                </div>
            </div>            
        </form>
        
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Base Datos Clientes</h6>
            </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombres</th>
                                    <th>Apellidos</th>
                                    <th>Dni</th>
                                    <th>Correo</th>
                                    <th>Estado</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="cl" items="${clientes}" varStatus="status">
                                <c:if test="${cl.rol == 4}"> 
                                <tr>
                                    <td>${cl.codigo}</td>
                                    <td>${cl.nombres}</td>
                                    <td>${cl.apepat} ${cl.apemat}</td>
                                    <td>${cl.dni}</td>
                                    <td>${cl.correo}</td>
                                    <td>
                                        <c:if test="${cl.estado == 1}">                        
                                            Activo
                                        </c:if>
                                        <c:if test="${cl.estado == 0}"> 
                                            Inactivo
                                        </c:if>
                                    </td>
                                    <td>
                                        <a href="Controlador?menu=cliente&accion=seleciona&cli=${cl.codigo}" class="btn btn-warning btn-circle">
                                            <i class="fas fa-wrench"></i>
                                        </a>
                                        <c:if test="${cl.estado == 1}">  
                                            <a href="Controlador?menu=cliente&accion=eliminar&delete=${cl.codigo}" class="btn btn-danger btn-circle">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </c:if>
                                        <c:if test="${cl.estado == 0}"> 
                                            <a href="Controlador?menu=cliente&accion=activar&active=${cl.codigo}" class="btn btn-info btn-circle">
                                                <i class="fas fa-check"></i>
                                            </a>
                                        </c:if>
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
