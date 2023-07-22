<%-- 
    Document   : VMUsuarios
    Created on : 10 jun. 2023, 22:51:50
    Author     : LENOVO
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.utp.entidad.Usuario"%>
<%@page import="com.utp.modelo.UsuarioDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>        
    </head>
    <jsp:include page="includes/sidebarhead.jsp"></jsp:include>
    <body>
        <div class="container-fluid">
        <form action="Controlador?menu=usuario" method="POST">
            <div class="modal-body" role="document">
                <div class="modal-content">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Mantenimiento de Usuarios</h6>
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
                                <td>Turno:
                                    <select name="txtturno" class="form-control" required=""> 
                                        <option value="NULL" selected>Seleccione Turno</option>
                                        <option value="mañana">Mañana</option>
                                        <option value="tarde">Tarde</option>
                                        <option value="noche">Noche</option>
                                    </select>
                                </td>                                
                                <td>Horario:<input class="form-control" type="text" name="txthorario" required=""></td>
                                <!-- cambiar --> 
                            </tr>
                            <tr>
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
                                <td>Rol:
                                    <select name="txtrol" class="form-control"> 
                                        <option value="0" selected>Seleccione Rol</option>
                                        <option value="1">Administrador</option>
                                        <option value="2">Encargado</option>
                                        <option value="3">Tecnico</option>
                                    </select>                                     
                                </td>
                                <td>Especialidad:
                                    <select name="txtespecial" class="form-control"> 
                                        <option value="0" selected>Seleccione Especialidad</option>
                                        <option value="1">Masajista</option>
                                        <option value="2">Esteticista</option>
                                        <option value="3">Terapeuta</option>
                                        <option value="4">Fisioterapeuta</option>
                                    </select>                                     
                                </td>
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
                <h6 class="m-0 font-weight-bold text-primary">Base Datos Usuarios</h6>
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
                            <c:forEach var="user" items="${usuarios}" varStatus="status">
                                <c:if test="${user.rol < 4}"> 
                                    <tr>
                                        <td>${user.codigo}</td>
                                        <td>${user.nombres}</td>
                                        <td>${user.apepat} ${user.apemat}</td>
                                        <td>${user.dni}</td>
                                        <td>${user.correo}</td>
                                        <td><c:if test="${user.estado == 1}">                        
                                                Activo
                                            </c:if>
                                            <c:if test="${user.estado == 0}"> 
                                                Inactivo
                                            </c:if>
                                        </td>
                                        <td>
                                            <a href="Controlador?menu=usuario&accion=seleciona&us=${user.codigo}">
                                                <button class="btn btn-warning btn-circle" href="#" data-toggle="modal" data-target="">
                                                    <i class="fas fa-wrench"></i>
                                                </button>
                                            </a>
                                            <c:if test="${user.estado == 1}">  
                                                <a href="Controlador?menu=usuario&accion=eliminar&delete=${user.codigo}">
                                                    <button class="btn btn-danger btn-circle" href="#" data-toggle="modal" data-target="">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </a>
                                            </c:if>
                                            <c:if test="${user.estado == 0}"> 
                                                <a href="Controlador?menu=usuario&accion=activar&active=${user.codigo}">
                                                    <button class="btn btn-info btn-circle" href="#" data-toggle="modal" data-target="">
                                                        <i class="fas fa-check"></i>
                                                    </button>
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
                            
            <!-- Modifica Modal-->
            <div class="modal fade" id="ModModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Modificar</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">Seleciona "Aceptar" para modficar.</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                            <a class="btn btn-primary" href="login.jsp">Aceptar</a>  
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Eliminar Modal-->
            <div class="modal fade" id="DelModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Eliminar</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">Seleciona "Aceptar" para eliminar.</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                            <a class="btn btn-primary" href="login.jsp">Aceptar</a>  
                        </div>
                    </div>
                </div>
            </div>           
    
    </body>
    <jsp:include page="includes/sidebarfoot.jsp"></jsp:include>
</html>
