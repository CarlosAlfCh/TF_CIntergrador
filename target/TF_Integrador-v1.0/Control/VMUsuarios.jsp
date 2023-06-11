<%-- 
    Document   : VMUsuarios
    Created on : 10 jun. 2023, 22:51:50
    Author     : LENOVO
--%>


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
    <jsp:include page="sidebarhead.jsp"></jsp:include>
    <body>
        <div class="container-fluid">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Modificar</h1>

            <p class="mb-4">
                A continuación se presentara la información manejada por el sistema web
            </p>
        <form action="ServletValidar" method="POST">
            <div class="form-group" >
                <h2 class="form-title" id="signup">Agregar Usuario</h2>
                <div class="form-holder">
                    <input type="text" class="input" name="txtnombres" placeholder="Nombres" />
                    <input type="text" class="input" name="txtapelpat" placeholder="Apellido Paterno" />
                    <input type="text" class="input" name="txtapelmat" placeholder="Apellido Materno" />
                    <input type="text" class="input" name="txtdni" placeholder="Dni" />
                    <input type="text" class="input" name="txttelefono" placeholder="Telefono" />
                    <input type="text" class="input" name="txtrol" placeholder="Rol" />
                    <input type="text" class="input" name="txtdireccion" placeholder="Dirección" />
                    <input type="text" class="input" name="txtdistrito" placeholder="Distrito" />
                    <input type="text" class="input" name="txtturno" placeholder="Turno" />
                    <input type="text" class="input" name="txthorario" placeholder="Horario" />
                    <input type="text" class="input" name="txtespecial" placeholder="Especialidad" />
                    <input type="email" class="input" name="txtcorreo" placeholder="Correo" />
                    <input type="password" class="input" name="txtcontrasena" placeholder="Contraseña" />
                </div>                
                <button class="submit-btn" name="metodo" value="adduser">Agregar</button>
            </div>            
        </form>
            
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Base Datos Usuarios</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombres</th>
                                    <th>Apellidos</th>
                                    <th>Dni</th>
                                    <th>Correo</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%  UsuarioDAO dao = new UsuarioDAO();
                                List<Usuario> lista = dao.listar();
                                if(lista != null)
                                {
                                    for(Usuario user :lista)
                                    {
                                        if(user.getRol()!=4){
                            %>
                                <tr>
                                    <td><%= user.getCodigo() %></td>
                                    <td><%= user.getNombres() %></td>
                                    <td><%= user.getApepat()%> <%= user.getApemat()%></td>
                                    <td><%= user.getDni()%></td>
                                    <td><%= user.getCorreo()%></td>
                                    <td><%if(user.getEstado()==1){%>                        
                                            Activo
                                        <%}else{%>
                                            Inactivo
                                        <%}%>
                                        </td>
                                </tr>
                            <%          }
                                    }
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
