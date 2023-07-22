<%-- 
    Document   : VMInicio
    Created on : 17 jun. 2023, 10:34:59
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.utp.entidad.Usuario"%>
<%@page import="com.utp.entidad.Servicio"%>
<%@page import="com.utp.modelo.UsuarioDAO"%>
<%@page import="com.utp.modelo.ServicioDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>        
    </head>
    <jsp:include page="includes/sidebarhead.jsp"></jsp:include>
    <body>
        <div class="container-fluid">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Bienvenido ${usuario.getNombres()}</h1>

            <p class="mb-4">
                A continuación se presentara la información manejada por el sistema web
            </p>
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Base Datos Usuarios/Clientes</h6>
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
                                    <th>Rol</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%  UsuarioDAO dao = new UsuarioDAO();
                                List<Usuario> lista = dao.listar();
                                if(lista != null)
                                {
                                    for(Usuario user :lista)
                                    {
                                        
                            %>
                                <tr>
                                    <td><%= user.getCodigo() %></td>
                                    <td><%= user.getNombres() %></td>
                                    <td><%= user.getApepat()%> <%= user.getApemat()%></td>
                                    <td><%= user.getDni()%></td>
                                    <td><%= user.getCorreo()%></td>
                                    <td><%if(user.getRol()==1){%>                        
                                            Administrador
                                        <%}else{
                                            if(user.getRol()==2){%>
                                                Encargado
                                        <%  }else{
                                                if(user.getRol()==3){%>
                                                    Tecnico
                                        <%      }else{%>
                                                    Cliente
                            <% 
                                                }
                                            }
                                        }
                            %>
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
        </div>        
    
    </body>
    <jsp:include page="includes/sidebarfoot.jsp"></jsp:include>
</html>
