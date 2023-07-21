<%-- 
    Document   : RContra
    Created on : 20 jul. 2023, 23:47:13
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperar</title>
    </head>
    <jsp:include page="includes/header.jsp"></jsp:include>
    <body>
        <div class="container">
		<div class="card w-50 mx-auto my-5">
                    <div class="card-header text-center"><h4>Restablecer Contraseña</h4></div>
                    <div class="card-body">
                        <form action="ServletValida" method="post">
                            <div class="form-group">
                                <label style="color: #4c3d3d">Revise su bandeja de entrada de correo</label> <br>
                                <label style="color: #4c3d3d">Ingrese codigo</label> 
                                <input type="text" name="clave" class="form-control" placeholder="Clave">
                            </div>
                            <div class="form-group">
                                <label style="color: #4c3d3d">Ingrese nueva contraseña</label> 
                                <input type="password" name="txtcontrasena" class="form-control" placeholder="Nueva Contraseña">
                            </div>
                            <div class="text-center">
                                <button class="btn btn-success btn-block" name="metodo" value="recuperar">Restablecer</button>
                            </div>
                        </form>
                    </div>
		</div>
	</div>
    </body>
    <jsp:include page="includes/footer.jsp"></jsp:include>
</html>
