<%-- 
    Document   : VMAsignar
    Created on : 13 jul. 2023, 18:48:58
    Author     : LENOVO
--%>
<%@page import="com.utp.entidad.Usuario"%>
<%@page import="com.utp.modelo.UsuarioDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.utp.entidad.Cita"%>
<%@page import="com.utp.modelo.ReservaDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asignar</title>
    </head>
    <jsp:include page="includes/sidebarhead.jsp"></jsp:include>
        <body>
            <div class="container-fluid">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Base Datos Usuarios</h6>
                    </div>
                <%
                    ReservaDAO dao = new ReservaDAO();
                    UsuarioDAO udao = new UsuarioDAO();
                    List<Cita> lista = dao.listares();
                %>
                <div class="card-body">
                    <div class="form-group">
                        <form target="_blank" action="../ServletCitas" id="frmReporte" method="post">
                            <input type="hidden" name="accion" id="accion">
                            <button onclick="reporte('exportarReporteCitas')" type="button" class="btn btn-sm btn-outline-primary"><i class="fas fa-file-pdf"></i>Exportar PDF</button>
                            <input type="hidden" name="lista" id="lista">
                        </form>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Codigo del Pago</th>
                                    <th>Cliente</th>
                                    <th>Tecnico Asignado</th>
                                    <th>Fecha</th>
                                    <th>Monto</th>
                                    <th>Estado</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (lista != null) {
                                        for (Cita c : lista) {
                                            Usuario clie = new Usuario();
                                            Usuario tecn = new Usuario();
                                            clie = udao.seleccionado(c.getIdcliente());
                                            tecn = udao.seleccionado(c.getIdtecnico());
                                %>
                                <tr>
                                    <td><%= c.getIdcita()%></td>
                                    <td>00000<%= c.getIdpago()%></td>
                                    <td><%= clie.getNombres()%> <%= clie.getApepat()%></td>
                                    <td>
                                        <% if (c.getIdtecnico() != 0) {%>
                                        <%= tecn.getNombres()%> <%= tecn.getApepat()%>
                                        <% } else { %>
                                        Pendiente
                                        <% }%>
                                    </td>
                                    <td><%= c.getFecha()%></td>
                                    <td>S/ <%= c.getMonto()%>0</td>
                                    <td>
                                        <% if (c.getEstado() != 0) {%>
                                        Realizado
                                        <% } else { %>
                                        Pendiente
                                        <% } %>
                                    </td>
                                    <td>
                                        <% if (c.getEstado() != 0) {%>
                                        <a href="ServletCitas?menu=asigna&accion=info&id=<%= c.getIdcita()%>" class="btn btn-secondary btn-circle">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <% } else {%>
                                            <% if (c.getIdtecnico() != 0) {%>
                                            <a href="ServletCitas?menu=asigna&accion=borrar&id=<%= c.getIdcita()%>" class="btn btn-warning btn-circle">
                                                <i class="fas fa-eraser"></i>
                                            </a>
                                            <% } else {%>
                                            <a href="ServletCitas?menu=asigna&accion=select&id=<%= c.getIdcita()%>" class="btn btn-info btn-circle">
                                                <i class="fas fa-calendar"></i>
                                            </a>
                                            <% } %>
                                        <% } %>
                                    </td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    </body>
    <jsp:include page="includes/sidebarfoot.jsp"></jsp:include>
</html>
