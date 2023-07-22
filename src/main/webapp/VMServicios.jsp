<%-- 
    Document   : VMServicios
    Created on : 10 jun. 2023, 22:52:13
    Author     : LENOVO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.utp.entidad.Servicio"%>
<%@page import="com.utp.modelo.ServicioDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Servicios</title>
    </head>
    <jsp:include page="includes/sidebarhead.jsp"></jsp:include>
    <body>
        <div class="container-fluid">
            <form action="Controlador?menu=servicio" method="POST">
                <div class="modal-body" role="document">
                    <div class="modal-content">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Mantenimiento de Servicios</h6>
                        </div>
                        <div class="modal-body">
                            <table class="table table-light"  width="100%" cellspacing="0">
                                <tr>
                                    <td>Nombre:<input class="form-control" type="text" name="txtnombre" required=""></td>
                                    <td>Duracion:<input class="form-control" type="time" name="txtduracion" required=""></td>
                                    <td>Precio:<input class="form-control" type="number" min="1" step="any" name="txtprecio" required=""></td>
                                </tr>
                                <tr>
                                    <td>Nombre de la imagen:<input class="form-control" type="text" name="txtimg" required=""></td>
                                    <td>Turno:
                                        <select name="txtturno" class="form-control" required=""> 
                                            <option value="NULL" selected>Seleccione Turno</option>
                                            <option value="mañana">Mañana</option>
                                            <option value="tarde">Tarde</option>
                                            <option value="noche">Noche</option>
                                        </select>
                                    </td>
                                    <td>Tipo:
                                        <select name="txtidtipo" class="form-control"> 
                                            <option value="0" selected>Seleccione tipo de servicio</option>
                                            <option value="1">Masaje</option>
                                            <option value="2">Exfoliación</option>
                                            <option value="3">Mascarilla</option>
                                            <option value="4">Terapia</option>
                                        </select>                                     
                                    </td>  
                                </tr>
                            </table>
                            <p>&nbsp;&nbsp;&nbsp;Descripción</p>
                            <textarea class="form-control" name="txtdescripcion" rows="5" cols="10"></textarea></br>
                            <button class="btn btn-success btn-icon-split" type="submit" name="accion" value="agregar">
                                <span class="icon text-white-50">
                                    <i class="fas fa-check"></i>
                                </span>
                                <span class="text">Agregar</span>
                            </button>
                        </div>                       
                    </div>
                </div>            
            </form>
        
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Base Datos Servicios</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombre</th>
                                    <th>Descripcion</th>
                                    <th>Turno</th>
                                    <th>Precio</th>
                                    <th>Duracion</th>
                                    <th>Estado</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="serv" items="${servicios}" varStatus="status">
                                <tr>
                                    <td>${serv.idservicio}</td>
                                    <td>${serv.nomserv}</td>
                                    <td>${serv.descripcion}</td>
                                    <td>${serv.turno}</td>
                                    <td>${serv.precio}</td>
                                    <td>${serv.duracion}</td>
                                    <td><c:if test="${serv.estadoserv == 1}"> 
                                            Activo
                                        </c:if>
                                        <c:if test="${serv.estadoserv == 0}"> 
                                            Inactivo
                                        </c:if>
                                    </td>
                                    <td>
                                        <a href="Controlador?menu=servicio&accion=seleciona&ser=${serv.idservicio}">
                                            <button class="btn btn-warning btn-circle" href="#" data-toggle="modal" data-target="">
                                                <i class="fas fa-wrench"></i>
                                            </button>
                                        </a>
                                        <c:if test="${serv.estadoserv == 1}">  
                                            <a href="Controlador?menu=servicio&accion=eliminar&delete=${serv.idservicio}">
                                                <button class="btn btn-danger btn-circle" href="#" data-toggle="modal" data-target="">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </a>
                                        </c:if>
                                        <c:if test="${serv.estadoserv == 0}"> 
                                            <a href="Controlador?menu=servicio&accion=activar&active=${serv.idservicio}">
                                                <button class="btn btn-info btn-circle" href="#" data-toggle="modal" data-target="">
                                                    <i class="fas fa-check"></i>
                                                </button>
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
