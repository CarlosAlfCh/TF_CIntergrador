<%-- 
    Document   : VMServicios
    Created on : 10 jun. 2023, 22:52:13
    Author     : LENOVO
--%>

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
    <jsp:include page="sidebarhead.jsp"></jsp:include>
    <body>
        <div class="container-fluid">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Modificar</h1>

            <p class="mb-4">
                A continuación se presentara la información manejada por el sistema web
            </p>
        
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Base Datos Servicios</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombre</th>
                                    <th>Descripcion</th>
                                    <th>Turno</th>
                                    <th>Precio</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%  ServicioDAO serdao = new ServicioDAO();
                                List<Servicio> listser = serdao.listar();
                                if(listser != null)
                                {
                                    for(Servicio servicio :listser)
                                    {
                            %>
                                <tr>
                                    <td><%= servicio.getIdservicio()%></td>
                                    <td><%= servicio.getNomserv() %></td>
                                    <td><%= servicio.getDescripcion()%></td>
                                    <td><%= servicio.getTurno()%></td>
                                    <td><%= servicio.getPrecio()%></td>
                                    <td><%if(servicio.getEstadoserv()==1){%>
                                            Activo
                                        <%}else{%>
                                            Inactivo
                                        <%}%>
                                    </td>
                                </tr>
                            <%      }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    </body>
    <jsp:include page="sidebarfoot.jsp"></jsp:include>
</html>
