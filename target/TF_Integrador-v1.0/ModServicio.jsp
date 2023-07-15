<%-- 
    Document   : ModServicio
    Created on : 21 jun. 2023, 20:21:44
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar</title>
    </head>
    <jsp:include page="includes/sidebarhead.jsp"></jsp:include>
    <body>
        <form action="Controlador?menu=servicio" method="POST">
                <input type="hidden" name="txtid" value="${modif.getIdservicio()}">
                <div class="modal-body" role="document">
                    <div class="modal-content">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Mantenimiento de Servicios</h6>
                        </div>
                        <div class="modal-body">
                            <table class="table table-light"  width="100%" cellspacing="0">
                                <tr>
                                    <td>Nombre:<input class="form-control" type="text" name="txtnombre" required="" value="${modif.getNomserv()}"></td>
                                    <td>Duracion:<input class="form-control" type="time" name="txtduracion" required="" ></td>
                                    <td>Precio:<input class="form-control" type="number" min="1" step="any" name="txtprecio" required="" value="${modif.getPrecio()}"></td>
                                </tr>
                                <tr>
                                    <td>Nombre de la imagen:<input class="form-control" type="text" name="txtimg" required="" value="${modif.getImagen()}"></td>
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
                            <textarea class="form-control" name="txtdescripcion" rows="5" cols="10">${modif.getDescripcion()}</textarea></br>
                            <button class="btn btn-warning btn-icon-split" type="submit" name="accion" value="modificar">
                                <span class="icon text-white-50">
                                    <i class="fas fa-wrench"></i>
                                </span>
                                <span class="text">Modificar</span>
                            </button>
                            <a href="Controlador?menu=servicio&accion=listar" class="btn btn-secondary btn-icon-split">
                                <span class="icon text-white-50">
                                    <i class="fas fa-arrow-right"></i>
                                </span>
                                <span class="text">Cancelar</span>    
                            </a>
                        </div>                       
                    </div>
                </div>            
            </form>
    </body>
    <jsp:include page="includes/sidebarfoot.jsp"></jsp:include>
</html>
