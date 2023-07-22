<%-- 
    Document   : login
    Created on : 10 jun. 2023, 10:32:27
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <jsp:include page="includes/header.jsp"></jsp:include>
        <body>
            <!-- Nav Bar Start -->
            <div class="nav-bar">
                <div class="container-fluid">
                    <nav class="navbar navbar-expand-lg bg-dark navbar-dark">
                        <a href="#" class="navbar-brand">MENU</a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="ml-auto">
                                <a class="btn" href="index.jsp">Volver al inicio</a>
                            </div>
                        </div>
                    </nav>
                </div>
            </div> 
            <!-- Nav Bar End -->

            <!-- Login Start -->
            <div class="form-structor">
                <form action="ServletValida" method="POST" class="signup"> 
                    <div class="form-group" >
                        <h2 class="form-title" id="signup">Iniciar Sesión</h2>
                        <div class="form-holder">
                            <input type="email" class="input" name="txtcorreo" placeholder="Correo" required=""/>
                            <input type="password" class="input" name="txtcontrasena" placeholder="Contraseña" required=""/>
                        </div>
                        <button class="submit-btn" name="metodo" value="loguear">Iniciar</button>
                        <a href="#" data-toggle="modal" data-target="#pagos">Olvido su contraseña</a>
                    </div> 
                </form>
                <form action="ServletValida" method="POST" class="login slide-up">              
                    <div class="center">
                        <h4 class="form-title" id="login">Registrate</h4>
                        <div class="form-holder">                         
                            <input type="text" class="input" name="txtnombres" placeholder="Nombres" required=""/>
                            <input type="text" class="input" name="txtapelpat" placeholder="Apellido Paterno" required=""/>
                            <input type="text" class="input" name="txtapelmat" placeholder="Apellido Materno" />
                            <input type="text" class="input" name="txtdni" placeholder="DNI" required=""/>
                            <input type="text" class="input" name="txttelefono" placeholder="Telefono" required=""/>
                            <input type="date" class="input" name="txtfecha" placeholder="Fecha Nacimiento" required=""/>
                            <input type="text" class="input" name="txtdireccion" placeholder="Direccion" required=""/>
                            <select name="txtdistrito" class="input"> 
                                <option value="NULL" selected>Seleccione Distrito</option>
                                <option value="Cayma">Cayma</option>
                                <option value="Cercado">Cercado</option>
                                <option value="Yanahuara">Yanahuara</option>
                                <option value="Selva Alegre">Selva Alegre</option>
                                <option value="Mariano Melgar">Mariano Melgar</option>
                                <option value="Hunter">Hunter</option>
                                <option value="Cerro Colorado">Cerro Colorado</option>
                            </select> 
                            <input type="email" class="input" name="txtcorreo" placeholder="Correo" required=""/>
                            <input type="password" class="input" name="txtcontrasena" placeholder="Contraseña" required=""/>                        
                        </div>
                        <button class="submit-btn" name="metodo" value="registrar">Registrar</button>
                    </div>
                </form>
            </div>
            <!-- Login End --> 
            
            <!-- Pagos Modal-->
            <div class="modal fade" id="pagos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Restablecer</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <form action="ServletValida" method="post">                                    
                            <div class="modal-body">
                                <div class="card-header">
                                    <label style="color: #4c3d3d">
                                        Ingrese correo con el que se registro<br> 
                                        Se le enviara un correo con una clave 
                                    </label>                                          
                                </div>
                                <div class="card-body">
                                    <label style="color: #4c3d3d">Ingrese su correo</label>
                                    <input type="text" name="correo" class="form-control">                                    
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <button class="btn btn-primary" name="metodo" value="enviar">Enviar</button>
                            </div>  
                        </form>
                    </div>
                </div>
            </div>
        </body>
    <jsp:include page="includes/footer.jsp"></jsp:include>
</html>
