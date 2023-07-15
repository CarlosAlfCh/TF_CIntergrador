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
    </body>
    <jsp:include page="includes/footer.jsp"></jsp:include>
</html>
