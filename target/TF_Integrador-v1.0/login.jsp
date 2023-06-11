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
    <jsp:include page="header.jsp"></jsp:include>
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
                        <input type="email" class="input" name="txtcorreo" placeholder="Correo" />
                        <input type="password" class="input" name="txtcontrasena" placeholder="Contraseña" />
                    </div>
                    <button class="submit-btn" name="metodo" value="loguear">Iniciar</button>
                </div> 
            </form>
            <form action="ServletValida" method="POST" class="login slide-up">              
                <div class="center">
                    <h2 class="form-title" id="login">Registrate</h2>
                    <div class="form-holder">
                        <input type="text" class="input" name="txtnombres" placeholder="Nombres" />
                        <input type="text" class="input" name="txtapelpat" placeholder="Apellido Paterno" />
                        <input type="text" class="input" name="txtapelmat" placeholder="Apellido Materno" />
                        <input type="email" class="input" name="txtcorreo" placeholder="Correo" />
                        <input type="password" class="input" name="txtcontrasena" placeholder="Contraseña" />
                    </div>
                    <button class="submit-btn" name="metodo" value="registrar">Registrar</button>
                </div>
            </form>
        </div>
    <!-- Login End --> 
    </body>
    <jsp:include page="footer.jsp"></jsp:include>
</html>
